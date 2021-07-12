using DTO;
using System;

namespace Services.Interfaces
{
    public interface ISupplierUserService
    {
        SupplierUserDTO SupplierLogin(string user, string password);
        bool checkExists(string userName);


    }
}
