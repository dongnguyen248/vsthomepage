using DTO;

namespace HomePageVST.Models
{
    public class SupplierInfoViewModels
    {
        public SupplierDTO Owner { get; set; }
        public SupplierDTO LoggedInUser { get; set; }
    }
}