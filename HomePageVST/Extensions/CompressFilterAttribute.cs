﻿using System.IO.Compression;
using System.Web;
using System.Web.Mvc;
using Utilities;

namespace HomePageVST.Filters
{
    public class CompressFilterAttribute : ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            bool.TryParse(ConfigHelper.Read("Compression"), out bool allowCompression);

            if (allowCompression)
            {
                HttpRequestBase request = filterContext.HttpContext.Request;
                string acceptEncoding = request.Headers["Accept-Encoding"];
                if (string.IsNullOrEmpty(acceptEncoding))
                {
                    return;
                }
                acceptEncoding = acceptEncoding.ToUpperInvariant();
                HttpResponseBase response = filterContext.HttpContext.Response;
                if (response.Filter != null)
                {
                    if (acceptEncoding.Contains("GZIP"))
                    {
                        response.AppendHeader("Content-encoding", "gzip");
                        response.Filter = new GZipStream(response.Filter, CompressionMode.Compress);
                    }
                    else if (acceptEncoding.Contains("DEFLATE"))
                    {
                        response.AppendHeader("Content-encoding", "deflate");
                        response.Filter = new DeflateStream(response.Filter, CompressionMode.Compress);
                    }
                }
            }
        }
    }
}