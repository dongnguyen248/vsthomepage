using Data;
using Repositories.Interfaces;
using System;

namespace Repositories
{
    public class UnitOfWork : IUnitOfWork, IDisposable
    {
        public IGenericRepository<HeaderDetail> HeaderDetailRepository { get; private set; }
        public IGenericRepository<UserLogin> UserLoginRepository { get; private set; }
        public IGenericRepository<Customer> CustomerRepository { get; private set; }
        public IGenericRepository<Document> DocumentRepository { get; private set; }
        public IGenericRepository<Recruitment> RecruitmentRepository { get; private set; }
        public IGenericRepository<Image> ImageRepository { get; private set; }
        public IGenericRepository<CoporateCitizenCategory> CoporateCitizenCategoryRepository { get; private set; }
        public IGenericRepository<CoporateCitizenContent> CoporateCitizenContentRepository { get; private set; }

        public IGenericRepository<Supplier> SupplierRepository { get; private set; }
        public IGenericRepository<SupplierCertificate> SupplierCertificateRepository { get; private set; }
        public IGenericRepository<Conversation> ConversationRepository { get; private set; }
        public IGenericRepository<SupplierUser> SupplierUserRepository { get; private set; }
        public IGenericRepository<SuplierReport> SupplierReportRepository { get; private set; }

        private readonly HomePageVSTEntities _dbContext;
        private bool _disposed;

        public UnitOfWork(HomePageVSTEntities dbContext)
        {
            _dbContext = dbContext;

            HeaderDetailRepository = new GenericRepository<HeaderDetail>(_dbContext);
            UserLoginRepository = new GenericRepository<UserLogin>(_dbContext);
            CustomerRepository = new GenericRepository<Customer>(_dbContext);
            DocumentRepository = new GenericRepository<Document>(_dbContext);
            RecruitmentRepository = new GenericRepository<Recruitment>(_dbContext);
            ImageRepository = new GenericRepository<Image>(_dbContext);
            CoporateCitizenCategoryRepository = new GenericRepository<CoporateCitizenCategory>(_dbContext);
            CoporateCitizenContentRepository = new GenericRepository<CoporateCitizenContent>(_dbContext);
            SupplierRepository = new GenericRepository<Supplier>(_dbContext);
            SupplierCertificateRepository = new GenericRepository<SupplierCertificate>(_dbContext);
            ConversationRepository = new GenericRepository<Conversation>(_dbContext);
            SupplierUserRepository = new GenericRepository<SupplierUser>(_dbContext);
            SupplierReportRepository = new GenericRepository<SuplierReport>(_dbContext);

        }

        public void Commit(bool? validateOnSaveEnabled = null)
        {
            if (validateOnSaveEnabled != null)
            {
                _dbContext.Configuration.ValidateOnSaveEnabled = (bool)validateOnSaveEnabled;
            }
            _dbContext.SaveChanges();
        }

        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                if (disposing)
                {
                    _dbContext.Dispose();
                }
            }
            _disposed = true;
        }

        ~UnitOfWork()
        {
            Dispose();
        }
    }
}