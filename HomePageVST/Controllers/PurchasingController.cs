using HomePageVST.Controllers.Core;
using System.Web.Mvc;
using DTO;
using Services.Interfaces;
using System;
using System.Web;
using Newtonsoft.Json;
using System.Collections.Generic;
using HomePageVST.Models;
using System.Linq;

namespace HomePageVST.Controllers
{
    public class PurchasingController : ControllerCore
    {
        private readonly ISupplierService _supplierService;
        private readonly ISuplierReportService _supplierReportService;
        private readonly ISupplierUserService _supplierUserService;
        private readonly IQuestionService _questionService;
        //private readonly ISupplierCertificateService _supplierCerticateService;

        public PurchasingController(ISupplierService supplierService, ISupplierUserService supplierUserInfo, IQuestionService questionService, ISuplierReportService suplierReport)
        {
            _supplierService = supplierService;
            _supplierUserService = supplierUserInfo;
            _questionService = questionService;
            _supplierReportService = suplierReport;
            //_supplierCerticateService = supplierCertificateService;
        }
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult PurchaseStandard()
        {
            return View();
        }
        public ActionResult DetailReport(int id)
        {
            var res = _supplierReportService.GetDetailReport(id);
            return View(res);
        }

        public ActionResult SupplierRegiter()
        {
            return View();
        }
        public ActionResult SupplierEthic()
        {
            return View();
        }

        public ActionResult SupplierInfo(Guid ownerId, Guid loggedInId)
        {
            var owner = _supplierService.GetSupplier(ownerId);
            var loggedInUser = _supplierService.GetSupplier(loggedInId);
            var supplierVM = new SupplierInfoViewModels { Owner = owner, LoggedInUser = loggedInUser };
            return View(supplierVM);
        }

        [HttpGet]
        public JsonResult GetSupplier()
        {
            int idx = 1;
            var result = new List<SupplierViewModels>();

            var suppliers = _supplierService.GetAll();
            foreach (var item in suppliers)
            {
                var sup = new SupplierViewModels
                {
                    IdUser = item.SupplierUser.SupplierId,
                    Seq = idx,
                    NameCompany = item.NameCompany,
                    CreateDate = item.Conversations.Where(x => x.ParentId == null).FirstOrDefault().CreatedDate,
                    Writer = item.SupplierUser.Name,
                    Status = item.Conversations.Where(x => x.ParentId == null).FirstOrDefault().Status
                };
                result.Add(sup);
                idx++;
            }
            return Json(new { result }, JsonRequestBehavior.AllowGet);
        }



        [HttpPost]
        public ActionResult CheckSupplier(SupplierUserDTO supllierLogin)
        {
            var result = _supplierUserService.SupplierLogin(supllierLogin.Name, supllierLogin.password);
            if (result != null)
            {
                return Json(new { id = result.SupplierId, roleId = result.RoleId });
            }
            else
            {
                return Json(new { mes = "User name or password is not correct" });
            }
        }

        [HttpPost]
        public JsonResult AddSupplier(SupplierDTO supllierIfo)
        {
            try
            {
                var isExists = _supplierUserService.checkExists(supllierIfo.SupplierUser.Name);
                if (!isExists)
                {
                    var isCreateSuccess = _supplierService.CreateSupplier(supllierIfo);

                    return Json(new { id = isCreateSuccess.Id, roleId = isCreateSuccess.SupplierUser.RoleId, isExists }, JsonRequestBehavior.AllowGet);

                }
                else
                {
                    return Json(new { mes = "User name already use please choose another user name", isExists });
                }



            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpPost]
        public JsonResult AddQuestion(ConversationDTO conversation)
        {
            var question = _questionService.CreateQuestion(conversation);

            return Json(new { mes = "success" });
        }
        [HttpPost]
        public JsonResult AddReport(SupplierReportDTO supplierReport)
        {
            var report = _supplierReportService.CreateReport(supplierReport);

            return Json(report);
        }
        [HttpPost]
        public ActionResult ChangeStatus(Guid id)
        {
            var status = _questionService.ChangeStatus(id);
            return Json(status);
        }
        [HttpGet]
        public ActionResult getReportSupplier()
        {
            var result = new List<SupplierReportViewModels>();
            var reports = _supplierReportService.GetAll();
            int idx = 1;
            foreach (var item in reports)
            {
                var report = new SupplierReportViewModels() {Id=item.Id, Seq = idx, Name = item.Name, TitleReport = item.TitleReport };
                result.Add(report);
                idx++;
            }
            return Json(new { reports = result }, JsonRequestBehavior.AllowGet);
        }
    }
}