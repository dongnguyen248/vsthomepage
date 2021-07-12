using HomePageVST.Controllers.Core;
using System.Web.Mvc;
using DTO;
using Services.Interfaces;
using System;
using System.Web;
using System.IO;
using Utilities;
using Newtonsoft.Json;
using System.Collections.Generic;
using HomePageVST.Models;
using System.Linq;

namespace HomePageVST.Controllers
{
    public class PurchasingController : ControllerCore
    {
        private readonly ISupplierService _supplierService;
        private readonly ISupplierCertificateService _supplierCerticateService;
        public PurchasingController()
        {

        }

        public PurchasingController(ISupplierService supplierService, ISupplierCertificateService supplierCertificateService)
        {
            _supplierService = supplierService;
            _supplierCerticateService = supplierCertificateService;
        }

        public ActionResult Index()
        {

            return View();
        }
        [HttpPost]
        public JsonResult AddSupplier(SupplierDTO supplierIfo)
        {
            try
            {
                var response = _supplierService.CreateSupplier(supplierIfo);
                return Json(new { response, isExists = false }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        [HttpPost]
        public ActionResult AddNewFile()
        {
            string supplierId = Request["supllierId"];
            HttpFileCollectionBase files = Request.Files;

            if (files.Count > 0)
            {
                int result = _supplierCerticateService.SaveFile(files, int.Parse(supplierId));

                if (result == 1)
                    return Json("File upload success!");
                else
                    return Json("File upload error!");
            }
            else
                return Json("No files selected.");
        }

        [HttpGet]
        public JsonResult GetSupplierQuestion()
        {        
            var data = _supplierService.GetQuestionBySupplier();
            int idx = 1;
            var results = new List<SupplierViewModel>();
            foreach(var item in data)
            {
                var supplier = new SupplierViewModel
                {
                    Seq = idx,
                    NameCompany = item.NameCompany,
                    CreatedDate = item.SupplierUsers.FirstOrDefault().Questions.Where(x => x.ParentId == null).FirstOrDefault().CreatedDate,
                    Writer = item.SupplierUsers.FirstOrDefault().Name,
                    Status = item.SupplierUsers.FirstOrDefault().Questions.Where(x => x.ParentId == null).FirstOrDefault().Status,
                };
                results.Add(supplier);
                idx++;
            }
            //var json = JsonConvert.SerializeObject(results, Formatting.Indented, new JsonSerializerSettings
            //{
            //    ReferenceLoopHandling = ReferenceLoopHandling.Ignore
            //});

            return Json(new { results }, JsonRequestBehavior.AllowGet);

        }

    }
}