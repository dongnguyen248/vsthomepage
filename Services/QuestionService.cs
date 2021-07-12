using System;
using System.Collections.Generic;
using AutoMapper;
using Data;
using DTO;
using Repositories.Interfaces;
using Services.Interfaces;

namespace Services
{
    public class QuestionService : IQuestionService
    {
        private readonly IUnitOfWork _unitOfWork;
        private readonly IGenericRepository<Conversation> _conversationRepository;
        private readonly IMapper _mapper;

        public QuestionService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            _unitOfWork = unitOfWork;
            _conversationRepository = _unitOfWork.ConversationRepository;
            _mapper = mapper;
        }
        public IEnumerable<ConversationDTO> GetAll()
        {
            var questions = _conversationRepository.GetAll();

            return _mapper.Map<IEnumerable<ConversationDTO>>(questions);
        }
        public ConversationDTO CreateQuestion(ConversationDTO questionContent)
        {
            try
            {
                var question = _conversationRepository.Add(_mapper.Map<Conversation>(questionContent));
                _unitOfWork.Commit();
                return _mapper.Map<ConversationDTO>(question);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public int ChangeStatus(Guid id)
        {
            var Conver = _conversationRepository.GetSingle(x => x.OwnerId == id);
            Conver.Status = true;
            _conversationRepository.Update(Conver);
            _unitOfWork.Commit();
            return 1;
        }
    }
}

