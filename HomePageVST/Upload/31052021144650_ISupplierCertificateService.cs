using DTO;
using System.Web;

namespace Services.Interfaces
{
    public interface ISupplierCertificateService
    {
        SupplierCertificateDTO AddNewFile(SupplierCertificateDTO fileInfo);
        int SaveFile(HttpFileCollectionBase file, int supplierId);
        void SaveSupplierCertificate(string fileName, string path, int suplierId);
    }
}
