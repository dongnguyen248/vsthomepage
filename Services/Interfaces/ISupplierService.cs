using DTO;
using System;
using System.Collections.Generic;

namespace Services.Interfaces
{
    public interface ISupplierService
    {
        SupplierDTO GetSupplier(Guid id);
        IEnumerable<SupplierDTO> GetAll();
        SupplierDTO CreateSupplier(SupplierDTO supplierInfo);

    }
}
