
using DTO;
using System;
using System.Collections.Generic;

namespace Services.Interfaces
{
    public interface IQuestionService
    {
        IEnumerable<ConversationDTO> GetAll();
        ConversationDTO CreateQuestion(ConversationDTO questionContent);
        int ChangeStatus(Guid id);

    }
}
