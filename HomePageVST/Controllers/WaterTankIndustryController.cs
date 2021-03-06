using HomePageVST.Controllers.Core;
using Services.Interfaces;
using System.Web.Mvc;
using Utilities;

namespace HomePageVST.Controllers
{
    public class WaterTankIndustryController : ControllerCore
    {
        private readonly IDocumentService _documentService;

        public WaterTankIndustryController(IDocumentService documentService)
        {
            _documentService = documentService;
        }

        public ActionResult Index()
        {
            var listDocumentDTO = _documentService.GetListActivedDocumentByCategoryId(CommonConstants.WTI_CATEGORY_ID);
            return View(listDocumentDTO);
        }
    }
}