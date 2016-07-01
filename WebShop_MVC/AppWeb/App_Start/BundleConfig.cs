using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace AppWeb
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/bundles/jqueryval").Include(
                        "~/Scripts/jquery.validate*"));

            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap.min.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/alertify.min.js"
                      ));

            bundles.Add(new ScriptBundle("~/bundles/app").Include(
                "~/Scripts/app/app.js",
                "~/Scripts/app/services/RestService.js",
                "~/Scripts/app/services/ShopService.js",
                "~/Scripts/app/utils.js"
                ));

            bundles.Add(new ScriptBundle("~/bundles/angular").Include(
                "~/Scripts/angular.min.js",
                "~/Scripts/angular-ui.min.js",
                "~/Scripts/angular-loader.min.js",
                "~/Scripts/loading-bar.min.js",
                "~/Scripts/ngStorage.js"
                ));

            

            bundles.Add(new StyleBundle("~/Content/css").Include(
                      "~/Content/bootstrap.min.css",
                      "~/Content/bootstrap-responsive.min.css",
                      "~/Content/alertify.min.css",
                      "~/Content/themes/bootstrap.min.css",
                      "~/Content/loading-bar.min.css",
                      "~/Content/css/Site.css",
                      "~/Content/css/fonts.css",
                      "~/Content/css/footer.css",
                      "~/Content/css/header.css",
                      "~/Content/css/pnotify.css",
                      "~/Content/css/shopbar.css",
                      "~/Content/css/slider.css"));
        }
    }
}
 