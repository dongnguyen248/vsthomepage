using AutoMapper;
using Data;
using DTO;
using Repositories.Interfaces;
using Services.Interfaces;
using System;
using System.Collections.Generic;

namespace Services
{
    public class SuplierReportService : ISuplierReportService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IGenericRepository<SuplierReport> _supplierReportRepository;
        private readonly IMapper _mapper;

        public SuplierReportService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _supplierReportRepository = _unitOfWork.SupplierReportRepository;
            _mapper = mapper;
        }

        public SupplierReportDTO CreateReport(SupplierReportDTO supplierReport)
        {

            var res = _supplierReportRepository.Add(_mapper.Map<SuplierReport>(supplierReport));
            _unitOfWork.Commit();
            return _mapper.Map<SupplierReportDTO>(res);
        }

        public IEnumerable<SupplierReportDTO> GetAll()
        {
            return _mapper.Map<IEnumerable<SupplierReportDTO>>(_supplierReportRepository.GetAll());
        }

        public SupplierReportDTO GetDetailReport(int id)
        {
            return _mapper.Map<SupplierReportDTO>(_supplierReportRepository.GetSingleById(id));
        }
    }
}
