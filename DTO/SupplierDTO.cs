using AutoMapper;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Web;

namespace DTO
{
    public class SupplierDTO
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        public string NameCompany { get; set; }

        public DateTime DayoIncor { get; set; }

        public string Representative { get; set; }

        public string MainProduct { get; set; }

        public string MainCustomer { get; set; }

        public string Contact { get; set; }

        public virtual ICollection<ConversationDTO> Conversations { get; set; }

        public virtual ICollection<ConversationDTO> Senders { get; set; }

        public virtual ICollection<SupplierCertificateDTO> SupplierCertificates { get; set; }

        public virtual SupplierUserDTO SupplierUser { get; set; }
    }
}
