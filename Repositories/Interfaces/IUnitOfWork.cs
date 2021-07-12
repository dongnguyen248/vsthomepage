using Data;

namespace Repositories.Interfaces
{
    public interface IUnitOfWork
    {
        IGenericRepository<HeaderDetail> HeaderDetailRepository { get; }
        IGenericRepository<UserLogin> UserLoginRepository { get; }
        IGenericRepository<Customer> CustomerRepository { get; }
        IGenericRepository<Document> DocumentRepository { get; }
        IGenericRepository<Recruitment> RecruitmentRepository { get; }
        IGenericRepository<Image> ImageRepository { get; }
        IGenericRepository<CoporateCitizenCategory> CoporateCitizenCategoryRepository { get; }
        IGenericRepository<CoporateCitizenContent> CoporateCitizenContentRepository { get; }
        IGenericRepository<Supplier> SupplierRepository { get; }
        IGenericRepository<SupplierCertificate> SupplierCertificateRepository { get; }
        IGenericRepository<Conversation> ConversationRepository { get; }
        IGenericRepository<SupplierUser> SupplierUserRepository { get; }
        IGenericRepository<SuplierReport> SupplierReportRepository { get; }

        void Commit(bool? validateOnSaveEnabled = null);
    }
}