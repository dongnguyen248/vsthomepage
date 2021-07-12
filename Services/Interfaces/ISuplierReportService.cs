using DTO;
using System.Collections.Generic;

namespace Services.Interfaces
{
    public interface ISuplierReportService
    {
        IEnumerable<SupplierReportDTO> GetAll();
        SupplierReportDTO GetDetailReport(int id);
        SupplierReportDTO CreateReport(SupplierReportDTO supplierReport);
    }
}
