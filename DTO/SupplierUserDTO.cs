using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    public class SupplierUserDTO
    {
        public Guid SupplierId { get; set; }
        [Required(ErrorMessage = "Enter your username")]
        [RegularExpression("^[a-zA-Z0-9]*$", ErrorMessage = "User name invalid, enter again")]
        public string Name { get; set; }


        [Required(ErrorMessage = "Enter your password")]
        public string password { get; set; }

        public int RoleId { get; set; }



        public virtual RoleDTO Role { get; set; }

        public virtual SupplierDTO Supplier { get; set; }


    }
}
