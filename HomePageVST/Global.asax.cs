﻿using HomePageVST.App_Start;
using HomePageVST.Filters;
using Services.AutoMapperConfig;
using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Utilities;

namespace HomePageVST
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            ViewEngines.Engines.Clear();
            ViewEngines.Engines.Add(new RazorViewEngine());
            ContainerConfig.Configure();
            AutoMapperConfiguration.Config();
            GetTotalUsersFromFileConfig();
            GlobalFilters.Filters.Add(new CompressFilterAttribute());
            log4net.Config.XmlConfigurator.Configure();
        }

        protected void Application_Error()
        {
            Exception exception = Server.GetLastError();
            LogHelper.Error(exception.Message);
        }

        protected void Application_BeginRequest(object source, EventArgs e)
        {
            bool monitor = bool.Parse(ConfigHelper.Read("EnableMonitorPerRequest"));
            if (monitor)
            {
                LogHelper.Info($"Request to {HttpContext.Current.Request.Url}");
            }
        }

        private void GetTotalUsersFromFileConfig()
        {
            var jObject = JsonHelper.Read(ConfigHelper.Read("VisitorsCounterFilePath"));
            Application["TotalUser"] = (int)jObject["onlineVisitors"];
            Application["OnlineUser"] = 0;
        }

        protected void Session_Start()
        {
            Application.Lock();
            Application["TotalUser"] = (int)Application["TotalUser"] + 1;
            Application["OnlineUser"] = (int)Application["OnlineUser"] + 1;
            JsonHelper.Write(ConfigHelper.Read("VisitorsCounterFilePath"), "onlineVisitors", (int)Application["TotalUser"]);
            Application.UnLock();
            LogHelper.Info("Connected");
        }

        protected void Session_End()
        {
            Application.Lock();
            Application["OnlineUser"] = (int)Application["OnlineUser"] - 1;
            Application.UnLock();
        }
    }
}