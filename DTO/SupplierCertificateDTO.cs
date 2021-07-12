using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web;

namespace DTO
{
    public class SupplierCertificateDTO
    {
        public int Id { get; set; }

        public string FilePath { get; set; }

        public string FileName { get; set; }

        public Guid SupplierId { get; set; }

        public virtual SupplierDTO Supplier { get; set; }

        [IgnoreMap]
        public HttpPostedFileBase FileData { get; set; }

    }
}
