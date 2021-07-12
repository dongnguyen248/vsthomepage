using System;
using System.Collections.Generic;

namespace DTO
{
    public class ConversationDTO
    {
        public Guid Id { get; set; } = Guid.NewGuid();

        public string Content { get; set; }

        public Guid OwnerId { get; set; }

        public Guid SenderId { get; set; }

        public Guid? ParentId { get; set; }

        public DateTime? CreatedDate { get; set; } = DateTime.Now;

        public bool Status { get; set; } = false;

        public virtual ICollection<ConversationDTO> Childrens { get; set; }

        public virtual ConversationDTO Parent { get; set; }

        public virtual SupplierDTO Owner { get; set; }

        public virtual SupplierDTO Sender { get; set; }
    }
}
