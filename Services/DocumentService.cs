﻿using AutoMapper;
using Data;
using DTO;
using Repositories.Interfaces;
using Services.Interfaces;
using System;
using System.Collections.Generic;
using Utilities;

namespace Services
{
    public class DocumentService : IDocumentService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IGenericRepository<Document> _documentRepository;
        private readonly IMapper _mapper;

        public DocumentService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _documentRepository = _unitOfWork.DocumentRepository;
            _mapper = mapper;
        }

        public IEnumerable<DocumentDTO> GetListDocumentByCategoryId(int categoryId)
        {
            var docs = _documentRepository.GetMany(x => x.CategoryId == categoryId);
            return _mapper.Map<IEnumerable<DocumentDTO>>(docs);
        }

        public IEnumerable<DocumentDTO> GetListActivedDocumentByCategoryId(int categoryId)
        {
            var docs = _documentRepository.GetMany(x => x.CategoryId == categoryId && x.IsActive);
            return _mapper.Map<IEnumerable<DocumentDTO>>(docs);
        }

        public DocumentDTO GetDocumentById(int id)
        {
            var doc = _documentRepository.GetSingle(x => x.Id == id);
            return _mapper.Map<DocumentDTO>(doc);
        }

        public DocumentDTO GetActivedDocumentById(int id)
        {
            var doc = _documentRepository.GetSingle(x => x.Id == id && x.IsActive);
            return _mapper.Map<DocumentDTO>(doc);
        }

        public DocumentDTO Add(DocumentDTO documentDTO)
        {
            documentDTO.FileName = $"{DateTime.Now:yyyyMMddhhmmss}-{documentDTO.PdfFile.FileName}";
            documentDTO.FileName = documentDTO.FileName.ConvertToUnsignAndRemoveEmpty();
            string filePath = AppDomain.CurrentDomain.BaseDirectory + ConfigHelper.Read("Pdf.Path") + documentDTO.FileName;
            FileService.SaveFile(documentDTO.PdfFile, filePath);
            documentDTO.Description = documentDTO.Description.Trim();
            var document = _documentRepository.Add(_mapper.Map<Document>(documentDTO));
            _unitOfWork.Commit();
            return _mapper.Map<DocumentDTO>(document);
        }

        public void Edit(DocumentDTO documentDTO)
        {
            _documentRepository.Update(_mapper.Map<Document>(documentDTO));
            _unitOfWork.Commit();
        }

        public DocumentDTO Delete(int id)
        {
            var document = _documentRepository.Delete(id);
            _unitOfWork.Commit();
            return _mapper.Map<DocumentDTO>(document);
        }
    }
}