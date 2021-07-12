using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace HomePageVST.Models
{
    public class SupplierViewModels
    {
        public int Seq { get; set; }
        public Guid IdUser { get; set; }
        public string NameCompany { get; set; }

        public string Writer { get; set; }

        public DateTime? CreateDate { get; set; }
        public bool Status { get; set; }

    }
}