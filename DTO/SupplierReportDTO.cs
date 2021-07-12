using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class SupplierReportDTO
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string SecretCode { get; set; }

        public string PhoneNumber { get; set; }

        public string Email { get; set; }

        public string TitleReport { get; set; }

        public string ContentReport { get; set; }

        public DateTime? CreatedDate { get; set; } = DateTime.Now;
    }
}
