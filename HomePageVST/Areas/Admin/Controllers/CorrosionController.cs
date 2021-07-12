﻿using DTO;
using HomePageVST.Controllers.Core;
using HomePageVST.Extensions.AntiModelInjection;
using HomePageVST.Models;
using Services.Interfaces;
using System.Net;
using System.Web.Mvc;
using Utilities;

namespace HomePageVST.Areas.Admin.Controllers
{
    [Authorize]
    public class CorrosionController : ControllerCore
    {
        private readonly IDocumentService _documentService;

        public CorrosionController(IDocumentService documentService)
        {
            _documentService = documentService;
            ViewBag.Active = "corrosion";
        }

        public ActionResult Index()
        {
            var docs = _documentService.GetListDocumentByCategoryId(CommonConstants.CORROSION_CATEGORY_ID);
            return View(docs);
        }

        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DocumentViewModels document)
        {
            document.CategoryId = CommonConstants.CORROSION_CATEGORY_ID;
            ModelState["FileName"].Errors.Clear();
            ModelState["UploadedDate"].Errors.Clear();

            if (ModelState.IsValid)
            {
                _documentService.Add(document);
                return RedirectToAction("Index");
            }
            else
            {
                return View(document);
            }
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var document = _documentService.GetDocumentById((int)id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [ValidateAntiModelInjection("Id")]
        [ValidateAntiModelInjection("FileName")]
        [ValidateAntiModelInjection("CategoryId")]
        public ActionResult Edit(DocumentDTO document)
        {
            if (ModelState.IsValid)
            {
                _documentService.Edit(document);
                return RedirectToAction("Index");
            }
            else
            {
                return View(document);
            }
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            var document = _documentService.GetDocumentById((int)id);
            if (document == null)
            {
                return HttpNotFound();
            }
            return View(document);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Delete(RecruitmentDTO recruitment)
        {
            _documentService.Delete(recruitment.Id);
            return RedirectToAction("Index");
        }
    }
}