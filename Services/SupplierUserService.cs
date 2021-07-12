using AutoMapper;
using Data;
using DTO;
using Repositories.Interfaces;
using Services.Interfaces;
using System;
using System.Security.Cryptography;
using System.Text;
using Utilities;

namespace Services
{
    public class SupplierUserService : ISupplierUserService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IGenericRepository<SupplierUser> _supplierUserRepository;
        private readonly IMapper _mapper;

        public SupplierUserService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _supplierUserRepository = _unitOfWork.SupplierUserRepository;
            _mapper = mapper;
        }

        public SupplierUserDTO SupplierLogin(string userName, string password)
        {
            var f_password = password.GetMD5();
            var user = _supplierUserRepository.GetSingle(x => x.Name == userName && x.password == f_password);
            return _mapper.Map<SupplierUserDTO>(user);

        }

        public bool checkExists(string userName)
        {

            var userExists = _supplierUserRepository.GetSingle(x => x.Name == userName);
            if (userExists != null)
            {
                return true;
            }
            else
                return false;
        }
    }
}
