﻿using Data;
using DTO;
using AutoMapper;

namespace Services.AutoMapperConfig
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            CreateMap<Benefit, BenefitDTO>().ReverseMap();
            CreateMap<Candidate, CandidateDTO>().ReverseMap();
            CreateMap<Document, DocumentDTO>().ReverseMap();
            CreateMap<HeaderCategory, HeaderCategoryDTO>().ReverseMap();
            CreateMap<HeaderDetail, HeaderDetailDTO>().ReverseMap();
            CreateMap<Image, ImageDTO>().ReverseMap();
            CreateMap<JobSkill, JobSkillDTO>().ReverseMap();
            CreateMap<Recruitment, RecruitmentDTO>().ReverseMap();
            CreateMap<Role, RoleDTO>().ReverseMap();
            CreateMap<UserLogin, UserLoginDTO>().ReverseMap();
            CreateMap<Customer, CustomerDTO>().ReverseMap();
            CreateMap<CoporateCitizenCategory, CoporateCitizenCategoryDTO>().ReverseMap();
            CreateMap<CoporateCitizenContent, CoporateCitizenContentDTO>().ReverseMap();
            CreateMap<Supplier, SupplierDTO>().ReverseMap();
            CreateMap<SupplierCertificate, SupplierCertificateDTO>().ReverseMap();
            CreateMap<SupplierUser, SupplierUserDTO>().ReverseMap();
            CreateMap<Conversation, ConversationDTO>().ReverseMap();
            CreateMap<SupplierUser, SupplierUserDTO>().ReverseMap();
            CreateMap<SuplierReport, SupplierReportDTO>().ReverseMap();
        }
    }
}