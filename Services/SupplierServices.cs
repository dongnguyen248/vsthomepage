using DTO;
using Repositories.Interfaces;
using Data;
using AutoMapper;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web;
using Utilities;
using System.IO;

namespace Services
{
    public class SupplierService : ISupplierService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IGenericRepository<Supplier> _supplierRepository;
        private readonly IGenericRepository<SupplierUser> _supplierUserRepository;
        private readonly IGenericRepository<Conversation> _conversationRepository;
        private readonly IMapper _mapper;
        private readonly IGenericRepository<SupplierCertificate> _supplierCertificateRepository;

        public SupplierService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _supplierRepository = _unitOfWork.SupplierRepository;
            _supplierCertificateRepository = _unitOfWork.SupplierCertificateRepository;
            _supplierUserRepository = _unitOfWork.SupplierUserRepository;
            _conversationRepository = _unitOfWork.ConversationRepository;
            _mapper = mapper;
        }
        public IEnumerable<SupplierDTO> GetAll()
        {
            var SupplierInfo = _supplierRepository.GetMany(x => x.SupplierUser.RoleId != CommonConstants.ADMIN_ROLE, x => x.SupplierUser, x => x.Conversations);
            return _mapper.Map<IEnumerable<SupplierDTO>>(SupplierInfo);
        }
        public SupplierDTO CreateSupplier(SupplierDTO SupplierInfo)
        {
            if (SupplierInfo.SupplierCertificates.Count == 0)
            {
                throw new Exception("No selected file yet");
            }
            try
            {
                SupplierDTO supplier = new SupplierDTO
                {
                    Id = SupplierInfo.Id,
                    Contact = SupplierInfo.Contact,
                    DayoIncor = SupplierInfo.DayoIncor,
                    MainCustomer = SupplierInfo.MainCustomer,
                    MainProduct = SupplierInfo.MainProduct,
                    NameCompany = SupplierInfo.NameCompany,
                    Representative = SupplierInfo.Representative
                };
                ConversationDTO conversation = new ConversationDTO
                {
                    Content = SupplierInfo.Conversations.FirstOrDefault().Content,
                    OwnerId = SupplierInfo.Id,
                    SenderId = SupplierInfo.Id

                };
                SupplierUserDTO supplierUser = new SupplierUserDTO
                {
                    SupplierId = SupplierInfo.Id,
                    Name = SupplierInfo.SupplierUser.Name,
                    RoleId = CommonConstants.USER_ROLE,
                    password = SupplierInfo.SupplierUser.password.GetMD5()

                };

                var res = _supplierRepository.Add(_mapper.Map<Supplier>(supplier));
                _supplierUserRepository.Add(_mapper.Map<SupplierUser>(supplierUser));
                _conversationRepository.Add(_mapper.Map<Conversation>(conversation));

                var files = SupplierInfo.SupplierCertificates;
                foreach (var item in files)
                {
                    HttpPostedFileBase file = item.FileData;
                    string fname = string.Empty;
                    if (HttpContext.Current.Request.Browser.Browser.ToUpper() == "IE" || HttpContext.Current.Request.Browser.Browser.ToUpper() == "INTERNETEXPLORER")
                    {
                        string[] testfiles = file.FileName.Split(new char[] { '\\' });
                        fname = testfiles[testfiles.Length - 1];
                    }
                    else
                    {
                        fname = file.FileName;
                    }
                    fname = $"{DateTime.Now:ddMMyyyyHHmmss}_{fname}";
                    string filePath = ConfigHelper.Read("Upload.Path") + fname;
                    string saveFile = Path.Combine(HttpContext.Current.Server.MapPath(ConfigHelper.Read("Upload.Path")), fname);
                    file.SaveAs(saveFile);
                    SupplierCertificateDTO fileInfo = new SupplierCertificateDTO
                    {
                        FileName = fname,
                        FilePath = filePath,
                        SupplierId = res.Id
                    };
                    var filein = _supplierCertificateRepository.Add(_mapper.Map<SupplierCertificate>(fileInfo));


                }


                _unitOfWork.Commit();
                return _mapper.Map<SupplierDTO>(res);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public SupplierDTO GetSupplier(Guid id)
        {
            //var use = _questionUserRepository.GetSingle(s => s.SupplierUserId == id);
            return _mapper.Map<SupplierDTO>(_supplierRepository.GetSingle(s => s.Id == id, s => s.SupplierUser, s => s.Conversations, s => s.Conversations.Select(x => x.Sender.SupplierUser), s => s.SupplierCertificates));
        }
    }
}
