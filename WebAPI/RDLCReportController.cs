#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.EJ.ReportViewer;
using Syncfusion.Reports.EJ;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Collections;
using System.Data;
using System.Reflection;

namespace WebSampleBrowser
{
    public class RDLCReportController : ApiController, IReportController
    {

        public object PostReportAction(Dictionary<string, object> jsonResult)
        {
            return ReportHelper.ProcessReport(jsonResult, this);
        }

        [System.Web.Http.ActionName("GetResource")]
        [AcceptVerbs("GET")]
        public object GetResource(string key, string resourcetype, bool isPrint)
        {
            return ReportHelper.GetResource(key, resourcetype, isPrint);
        }

        public void OnInitReportOptions(ReportViewerOptions reportOption)
        {
            if (reportOption.ReportModel.IsDrillthroughReport)            
                return;
            var reportName = reportOption.ReportModel.ReportPath;
            if (reportName.Contains("Product Catalog.rdlc"))
            {
                reportOption.ReportModel.DataSources.Clear();
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "ProductCatalog", Value = ProductCatalog.GetData() });
            }
            else if (reportName.Contains("drilldown.rdlc"))
            {
                reportOption.ReportModel.DataSources.Clear();
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "Customers", Value = Customers.GetData() });
            }
            else if (reportName.Contains("Master-Details.rdlc"))
            {
                reportOption.ReportModel.DataSources.Clear();
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "DataSet2", Value = MasterDetails.GetData() });
            }
            else if (reportName.Contains("DrilThrough.rdlc"))
            {
                reportOption.ReportModel.DataSources.Clear();
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "IndividualCustomerSales", Value = CustomerSales.GetData() });
            }
            else if (reportName.Contains("Sales_by_Region_2008.rdlc"))
            {
                reportOption.ReportModel.DataSources.Clear();
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "IndividualCustomerSales", Value = CustomerSales.GetData() });
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "StoreSales", Value = StoreSales.GetData() });
            }
        }

        public void OnReportLoaded(ReportViewerOptions reportOption)
        {
            var reportName = reportOption.ReportModel.ReportPath;
            if (reportName.Contains("Region.rdlc"))
            {
                reportOption.ReportModel.DataSources.Clear();
                reportOption.ReportModel.DataSources.Add(new ReportDataSource { Name = "StoreSales", Value = StoreSales.GetData() });
            }
        }
    }

    public class ProductCatalog
    {
        public string ProdSubCat { get; set; }
        public string ProdModel { get; set; }
        public string ProdCat { get; set; }
        public string Description { get; set; }
        public string ProdName { get; set; }
        public string ProductNumber { get; set; }
        public string Color { get; set; }
        public string Size { get; set; }
        public double? Weight { get; set; }
        public double? StandardCost { get; set; }
        public string Style { get; set; }
        public string Class { get; set; }
        public double? ListPrice { get; set; }
        public static IList GetData()
        {
            List<ProductCatalog> datas = new List<ProductCatalog>();
            ProductCatalog data = null;
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Black, 58",
                ProductNumber = "FR-R92B-58",
                Color = "Black",
                Size = "58",
                Weight = 2.24,
                StandardCost = 1059.3100,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Red, 58",
                ProductNumber = "FR-R92R-58",
                Color = "Red",
                Size = "58",
                Weight = 2.24,
                StandardCost = 1059.3100,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Helmets",
                ProdModel = "Sport-100",
                ProdCat = "Accessories",
                Description = "Universal fit, well-vented, lightweight , snap-on visor.",
                ProdName = "Sport-100 Helmet, Red",
                ProductNumber = "HL-U509-R",
                Color = "Red",
                Size = "",
                Weight = null,
                StandardCost = 13.0863,
                Style = "",
                Class = "",
                ListPrice = 34.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Helmets",
                ProdModel = "Sport-100",
                ProdCat = "Accessories",
                Description = "Universal fit, well-vented, lightweight , snap-on visor.",
                ProdName = "Sport-100 Helmet, Black",
                ProductNumber = "HL-U509",
                Color = "Black",
                Size = "",
                Weight = null,
                StandardCost = 13.0863,
                Style = "",
                Class = "",
                ListPrice = 34.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Socks",
                ProdModel = "Mountain Bike Socks",
                ProdCat = "Clothing",
                Description = "Combination of natural and synthetic fibers stays dry and provides just the right cushioning.",
                ProdName = "Mountain Bike Socks, M",
                ProductNumber = "SO-B909-M",
                Color = "White",
                Size = "M",
                Weight = null,
                StandardCost = 3.3963,
                Style = "U ",
                Class = "",
                ListPrice = 9.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Socks",
                ProdModel = "Mountain Bike Socks",
                ProdCat = "Clothing",
                Description = "Combination of natural and synthetic fibers stays dry and provides just the right cushioning.",
                ProdName = "Mountain Bike Socks, L",
                ProductNumber = "SO-B909-L",
                Color = "White",
                Size = "L",
                Weight = null,
                StandardCost = 3.3963,
                Style = "U ",
                Class = "",
                ListPrice = 9.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Helmets",
                ProdModel = "Sport-100",
                ProdCat = "Accessories",
                Description = "Universal fit, well-vented, lightweight , snap-on visor.",
                ProdName = "Sport-100 Helmet, Blue",
                ProductNumber = "HL-U509-B",
                Color = "Blue",
                Size = "",
                Weight = null,
                StandardCost = 13.0863,
                Style = "",
                Class = "",
                ListPrice = 34.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Caps",
                ProdModel = "Cycling Cap",
                ProdCat = "Clothing",
                Description = "Traditional style with a flip-up brim; one-size fits all.",
                ProdName = "AWC Logo Cap",
                ProductNumber = "CA-1098",
                Color = "Multi",
                Size = "",
                Weight = null,
                StandardCost = 6.9223,
                Style = "U ",
                Class = "",
                ListPrice = 8.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Jerseys",
                ProdModel = "Long-Sleeve Logo Jersey",
                ProdCat = "Clothing",
                Description = "Unisex long-sleeve AWC logo microfiber cycling jersey",
                ProdName = "Long-Sleeve Logo Jersey, S",
                ProductNumber = "LJ-0192-S",
                Color = "Multi",
                Size = "S",
                Weight = null,
                StandardCost = 38.4923,
                Style = "U ",
                Class = "",
                ListPrice = 49.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Jerseys",
                ProdModel = "Long-Sleeve Logo Jersey",
                ProdCat = "Clothing",
                Description = "Unisex long-sleeve AWC logo microfiber cycling jersey",
                ProdName = "Long-Sleeve Logo Jersey, M",
                ProductNumber = "LJ-0192-M",
                Color = "Multi",
                Size = "M",
                Weight = null,
                StandardCost = 38.4923,
                Style = "U ",
                Class = "",
                ListPrice = 49.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Jerseys",
                ProdModel = "Long-Sleeve Logo Jersey",
                ProdCat = "Clothing",
                Description = "Unisex long-sleeve AWC logo microfiber cycling jersey",
                ProdName = "Long-Sleeve Logo Jersey, L",
                ProductNumber = "LJ-0192-L",
                Color = "Multi",
                Size = "L",
                Weight = null,
                StandardCost = 38.4923,
                Style = "U ",
                Class = "",
                ListPrice = 49.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Jerseys",
                ProdModel = "Long-Sleeve Logo Jersey",
                ProdCat = "Clothing",
                Description = "Unisex long-sleeve AWC logo microfiber cycling jersey",
                ProdName = "Long-Sleeve Logo Jersey, XL",
                ProductNumber = "LJ-0192-X",
                Color = "Multi",
                Size = "XL",
                Weight = null,
                StandardCost = 38.4923,
                Style = "U ",
                Class = "",
                ListPrice = 49.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Red, 62",
                ProductNumber = "FR-R92R-62",
                Color = "Red",
                Size = "62",
                Weight = 2.30,
                StandardCost = 868.6342,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Red, 44",
                ProductNumber = "FR-R92R-44",
                Color = "Red",
                Size = "44",
                Weight = 2.12,
                StandardCost = 868.6342,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Red, 48",
                ProductNumber = "FR-R92R-48",
                Color = "Red",
                Size = "48",
                Weight = 2.16,
                StandardCost = 868.6342,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Red, 52",
                ProductNumber = "FR-R92R-52",
                Color = "Red",
                Size = "52",
                Weight = 2.20,
                StandardCost = 868.6342,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "HL Road Frame",
                ProdCat = "Components",
                Description = "Our lightest and best quality aluminum frame made from the newest alloy; it is welded and heat-treated for strength. Our innovative design results in maximum comfort and performance.",
                ProdName = "HL Road Frame - Red, 56",
                ProductNumber = "FR-R92R-56",
                Color = "Red",
                Size = "56",
                Weight = 2.24,
                StandardCost = 868.6342,
                Style = "U ",
                Class = "H ",
                ListPrice = 1431.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Black, 58",
                ProductNumber = "FR-R38B-58",
                Color = "Black",
                Size = "58",
                Weight = 2.46,
                StandardCost = 204.6251,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Black, 60",
                ProductNumber = "FR-R38B-60",
                Color = "Black",
                Size = "60",
                Weight = 2.48,
                StandardCost = 204.6251,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Black, 62",
                ProductNumber = "FR-R38B-62",
                Color = "Black",
                Size = "62",
                Weight = 2.50,
                StandardCost = 204.6251,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Red, 44",
                ProductNumber = "FR-R38R-44",
                Color = "Red",
                Size = "44",
                Weight = 2.32,
                StandardCost = 187.1571,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Red, 48",
                ProductNumber = "FR-R38R-48",
                Color = "Red",
                Size = "48",
                Weight = 2.36,
                StandardCost = 187.1571,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Red, 52",
                ProductNumber = "FR-R38R-52",
                Color = "Red",
                Size = "52",
                Weight = 2.40,
                StandardCost = 187.1571,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Red, 58",
                ProductNumber = "FR-R38R-58",
                Color = "Red",
                Size = "58",
                Weight = 2.46,
                StandardCost = 187.1571,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Red, 60",
                ProductNumber = "FR-R38R-60",
                Color = "Red",
                Size = "60",
                Weight = 2.48,
                StandardCost = 187.1571,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Red, 62",
                ProductNumber = "FR-R38R-62",
                Color = "Red",
                Size = "62",
                Weight = 2.50,
                StandardCost = 187.1571,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "ML Road Frame",
                ProdCat = "Components",
                Description = "Made from the same aluminum alloy as our top-of-the line HL frame, the ML features a lightweight down-tube milled to the perfect diameter for optimal strength. Men's version.",
                ProdName = "ML Road Frame - Red, 44",
                ProductNumber = "FR-R72R-44",
                Color = "Red",
                Size = "44",
                Weight = 2.22,
                StandardCost = 352.1394,
                Style = "U ",
                Class = "M ",
                ListPrice = 594.8300
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "ML Road Frame",
                ProdCat = "Components",
                Description = "Made from the same aluminum alloy as our top-of-the line HL frame, the ML features a lightweight down-tube milled to the perfect diameter for optimal strength. Men's version.",
                ProdName = "ML Road Frame - Red, 48",
                ProductNumber = "FR-R72R-48",
                Color = "Red",
                Size = "48",
                Weight = 2.26,
                StandardCost = 352.1394,
                Style = "U ",
                Class = "M ",
                ListPrice = 594.8300
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "ML Road Frame",
                ProdCat = "Components",
                Description = "Made from the same aluminum alloy as our top-of-the line HL frame, the ML features a lightweight down-tube milled to the perfect diameter for optimal strength. Men's version.",
                ProdName = "ML Road Frame - Red, 52",
                ProductNumber = "FR-R72R-52",
                Color = "Red",
                Size = "52",
                Weight = 2.30,
                StandardCost = 352.1394,
                Style = "U ",
                Class = "M ",
                ListPrice = 594.8300
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "ML Road Frame",
                ProdCat = "Components",
                Description = "Made from the same aluminum alloy as our top-of-the line HL frame, the ML features a lightweight down-tube milled to the perfect diameter for optimal strength. Men's version.",
                ProdName = "ML Road Frame - Red, 58",
                ProductNumber = "FR-R72R-58",
                Color = "Red",
                Size = "58",
                Weight = 2.36,
                StandardCost = 352.1394,
                Style = "U ",
                Class = "M ",
                ListPrice = 594.8300
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "ML Road Frame",
                ProdCat = "Components",
                Description = "Made from the same aluminum alloy as our top-of-the line HL frame, the ML features a lightweight down-tube milled to the perfect diameter for optimal strength. Men's version.",
                ProdName = "ML Road Frame - Red, 60",
                ProductNumber = "FR-R72R-60",
                Color = "Red",
                Size = "60",
                Weight = 2.38,
                StandardCost = 352.1394,
                Style = "U ",
                Class = "M ",
                ListPrice = 594.8300
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Black, 44",
                ProductNumber = "FR-R38B-44",
                Color = "Black",
                Size = "44",
                Weight = 2.32,
                StandardCost = 204.6251,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Black, 48",
                ProductNumber = "FR-R38B-48",
                Color = "Black",
                Size = "48",
                Weight = 2.36,
                StandardCost = 204.6251,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Frames",
                ProdModel = "LL Road Frame",
                ProdCat = "Components",
                Description = "The LL Frame provides a safe comfortable ride, while offering superior bump absorption in a value-priced aluminum frame.",
                ProdName = "LL Road Frame - Black, 52",
                ProductNumber = "FR-R38B-52",
                Color = "Black",
                Size = "52",
                Weight = 2.40,
                StandardCost = 204.6251,
                Style = "U ",
                Class = "L ",
                ListPrice = 337.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Silver, 42",
                ProductNumber = "FR-M94S-42",
                Color = "Silver",
                Size = "42",
                Weight = 2.72,
                StandardCost = 747.2002,
                Style = "U ",
                Class = "H ",
                ListPrice = 1364.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Silver, 44",
                ProductNumber = "FR-M94S-44",
                Color = "Silver",
                Size = "44",
                Weight = 2.76,
                StandardCost = 706.8110,
                Style = "U ",
                Class = "H ",
                ListPrice = 1364.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Silver, 48",
                ProductNumber = "FR-M94S-52",
                Color = "Silver",
                Size = "48",
                Weight = 2.80,
                StandardCost = 706.8110,
                Style = "U ",
                Class = "H ",
                ListPrice = 1364.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Silver, 46",
                ProductNumber = "FR-M94S-46",
                Color = "Silver",
                Size = "46",
                Weight = 2.84,
                StandardCost = 747.2002,
                Style = "U ",
                Class = "H ",
                ListPrice = 1364.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Black, 42",
                ProductNumber = "FR-M94B-42",
                Color = "Black",
                Size = "42",
                Weight = 2.72,
                StandardCost = 739.0410,
                Style = "U ",
                Class = "H ",
                ListPrice = 1349.6000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Black, 44",
                ProductNumber = "FR-M94B-44",
                Color = "Black",
                Size = "44",
                Weight = 2.76,
                StandardCost = 699.0928,
                Style = "U ",
                Class = "H ",
                ListPrice = 1349.6000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Black, 48",
                ProductNumber = "FR-M94B-48",
                Color = "Black",
                Size = "48",
                Weight = 2.80,
                StandardCost = 699.0928,
                Style = "U ",
                Class = "H ",
                ListPrice = 1349.6000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Black, 46",
                ProductNumber = "FR-M94B-46",
                Color = "Black",
                Size = "46",
                Weight = 2.84,
                StandardCost = 739.0410,
                Style = "U ",
                Class = "H ",
                ListPrice = 1349.6000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Black, 38",
                ProductNumber = "FR-M94B-38",
                Color = "Black",
                Size = "38",
                Weight = 2.68,
                StandardCost = 739.0410,
                Style = "U ",
                Class = "H ",
                ListPrice = 1349.6000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Frames",
                ProdModel = "HL Mountain Frame",
                ProdCat = "Components",
                Description = "Each frame is hand-crafted in our Bothell facility to the optimum diameter and wall-thickness required of a premium mountain frame. The heat-treated welded aluminum frame has a larger diameter tube that absorbs the bumps.",
                ProdName = "HL Mountain Frame - Silver, 38",
                ProductNumber = "FR-M94S-38",
                Color = "Silver",
                Size = "38",
                Weight = 2.68,
                StandardCost = 747.2002,
                Style = "U ",
                Class = "H ",
                ListPrice = 1364.5000
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-150",
                ProdCat = "Bikes",
                Description = "This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.",
                ProdName = "Road-150 Red, 62",
                ProductNumber = "BK-R93R-62",
                Color = "Red",
                Size = "62",
                Weight = 15.00,
                StandardCost = 2171.2942,
                Style = "U ",
                Class = "H ",
                ListPrice = 3578.2700
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-150",
                ProdCat = "Bikes",
                Description = "This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.",
                ProdName = "Road-150 Red, 44",
                ProductNumber = "BK-R93R-44",
                Color = "Red",
                Size = "44",
                Weight = 13.77,
                StandardCost = 2171.2942,
                Style = "U ",
                Class = "H ",
                ListPrice = 3578.2700
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-150",
                ProdCat = "Bikes",
                Description = "This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.",
                ProdName = "Road-150 Red, 48",
                ProductNumber = "BK-R93R-48",
                Color = "Red",
                Size = "48",
                Weight = 14.13,
                StandardCost = 2171.2942,
                Style = "U ",
                Class = "H ",
                ListPrice = 3578.2700
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-150",
                ProdCat = "Bikes",
                Description = "This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.",
                ProdName = "Road-150 Red, 52",
                ProductNumber = "BK-R93R-52",
                Color = "Red",
                Size = "52",
                Weight = 14.42,
                StandardCost = 2171.2942,
                Style = "U ",
                Class = "H ",
                ListPrice = 3578.2700
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-150",
                ProdCat = "Bikes",
                Description = "This bike is ridden by race winners. Developed with the Adventure Works Cycles professional race team, it has a extremely light heat-treated aluminum frame, and steering that allows precision control.",
                ProdName = "Road-150 Red, 56",
                ProductNumber = "BK-R93R-56",
                Color = "Red",
                Size = "56",
                Weight = 14.68,
                StandardCost = 2171.2942,
                Style = "U ",
                Class = "H ",
                ListPrice = 3578.2700
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-450",
                ProdCat = "Bikes",
                Description = "A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.",
                ProdName = "Road-450 Red, 58",
                ProductNumber = "BK-R68R-58",
                Color = "Red",
                Size = "58",
                Weight = 17.79,
                StandardCost = 884.7083,
                Style = "U ",
                Class = "M ",
                ListPrice = 1457.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-450",
                ProdCat = "Bikes",
                Description = "A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.",
                ProdName = "Road-450 Red, 60",
                ProductNumber = "BK-R68R-60",
                Color = "Red",
                Size = "60",
                Weight = 17.90,
                StandardCost = 884.7083,
                Style = "U ",
                Class = "M ",
                ListPrice = 1457.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-450",
                ProdCat = "Bikes",
                Description = "A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.",
                ProdName = "Road-450 Red, 44",
                ProductNumber = "BK-R68R-44",
                Color = "Red",
                Size = "44",
                Weight = 16.77,
                StandardCost = 884.7083,
                Style = "U ",
                Class = "M ",
                ListPrice = 1457.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-450",
                ProdCat = "Bikes",
                Description = "A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.",
                ProdName = "Road-450 Red, 48",
                ProductNumber = "BK-R68R-48",
                Color = "Red",
                Size = "48",
                Weight = 17.13,
                StandardCost = 884.7083,
                Style = "U ",
                Class = "M ",
                ListPrice = 1457.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-450",
                ProdCat = "Bikes",
                Description = "A true multi-sport bike that offers streamlined riding and a revolutionary design. Aerodynamic design lets you ride with the pros, and the gearing will conquer hilly roads.",
                ProdName = "Road-450 Red, 52",
                ProductNumber = "BK-R68R-52",
                Color = "Red",
                Size = "52",
                Weight = 17.42,
                StandardCost = 884.7083,
                Style = "U ",
                Class = "M ",
                ListPrice = 1457.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Red, 58",
                ProductNumber = "BK-R50R-58",
                Color = "Red",
                Size = "58",
                Weight = 19.79,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Red, 60",
                ProductNumber = "BK-R50R-60",
                Color = "Red",
                Size = "60",
                Weight = 19.90,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Red, 62",
                ProductNumber = "BK-R50R-62",
                Color = "Red",
                Size = "62",
                Weight = 20.00,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Red, 44",
                ProductNumber = "BK-R50R-44",
                Color = "Red",
                Size = "44",
                Weight = 18.77,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Red, 48",
                ProductNumber = "BK-R50R-48",
                Color = "Red",
                Size = "48",
                Weight = 19.13,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Red, 52",
                ProductNumber = "BK-R50R-52",
                Color = "Red",
                Size = "52",
                Weight = 19.42,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Black, 58",
                ProductNumber = "BK-R50B-58",
                Color = "Black",
                Size = "58",
                Weight = 19.79,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Black, 60",
                ProductNumber = "BK-R50B-60",
                Color = "Black",
                Size = "60",
                Weight = 19.90,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Black, 62",
                ProductNumber = "BK-R50B-62",
                Color = "Black",
                Size = "62",
                Weight = 20.00,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Black, 44",
                ProductNumber = "BK-R50B-44",
                Color = "Black",
                Size = "44",
                Weight = 18.77,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Black, 48",
                ProductNumber = "BK-R50B-48",
                Color = "Black",
                Size = "48",
                Weight = 19.13,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-650",
                ProdCat = "Bikes",
                Description = "Value-priced bike with many features of our top-of-the-line models. Has the same light, stiff frame, and the quick acceleration we're famous for.",
                ProdName = "Road-650 Black, 52",
                ProductNumber = "BK-R50B-52",
                Color = "Black",
                Size = "52",
                Weight = 19.42,
                StandardCost = 486.7066,
                Style = "U ",
                Class = "L ",
                ListPrice = 782.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Silver, 38",
                ProductNumber = "BK-M82S-38",
                Color = "Silver",
                Size = "38",
                Weight = 20.35,
                StandardCost = 1912.1544,
                Style = "U ",
                Class = "H ",
                ListPrice = 3399.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Silver, 42",
                ProductNumber = "BK-M82S-42",
                Color = "Silver",
                Size = "42",
                Weight = 20.77,
                StandardCost = 1912.1544,
                Style = "U ",
                Class = "H ",
                ListPrice = 3399.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Silver, 44",
                ProductNumber = "BK-M82S-44",
                Color = "Silver",
                Size = "44",
                Weight = 21.13,
                StandardCost = 1912.1544,
                Style = "U ",
                Class = "H ",
                ListPrice = 3399.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Silver, 48",
                ProductNumber = "BK-M82S-48",
                Color = "Silver",
                Size = "48",
                Weight = 21.42,
                StandardCost = 1912.1544,
                Style = "U ",
                Class = "H ",
                ListPrice = 3399.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Black, 38",
                ProductNumber = "BK-M82B-38",
                Color = "Black",
                Size = "38",
                Weight = 20.35,
                StandardCost = 1898.0944,
                Style = "U ",
                Class = "H ",
                ListPrice = 3374.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Black, 42",
                ProductNumber = "BK-M82B-42",
                Color = "Black",
                Size = "42",
                Weight = 20.77,
                StandardCost = 1898.0944,
                Style = "U ",
                Class = "H ",
                ListPrice = 3374.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Black, 44",
                ProductNumber = "BK-M82B-44",
                Color = "Black",
                Size = "44",
                Weight = 21.13,
                StandardCost = 1898.0944,
                Style = "U ",
                Class = "H ",
                ListPrice = 3374.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-100",
                ProdCat = "Bikes",
                Description = "Top-of-the-line competition mountain bike. Performance-enhancing options include the innovative HL Frame, super-smooth front suspension, and traction for all terrain.",
                ProdName = "Mountain-100 Black, 48",
                ProductNumber = "BK-M82B-48",
                Color = "Black",
                Size = "48",
                Weight = 21.42,
                StandardCost = 1898.0944,
                Style = "U ",
                Class = "H ",
                ListPrice = 3374.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-200",
                ProdCat = "Bikes",
                Description = "Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.",
                ProdName = "Mountain-200 Silver, 38",
                ProductNumber = "BK-M68S-38",
                Color = "Silver",
                Size = "38",
                Weight = 23.35,
                StandardCost = 1265.6195,
                Style = "U ",
                Class = "H ",
                ListPrice = 2319.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-200",
                ProdCat = "Bikes",
                Description = "Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.",
                ProdName = "Mountain-200 Silver, 42",
                ProductNumber = "BK-M68S-42",
                Color = "Silver",
                Size = "42",
                Weight = 23.77,
                StandardCost = 1265.6195,
                Style = "U ",
                Class = "H ",
                ListPrice = 2319.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-200",
                ProdCat = "Bikes",
                Description = "Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.",
                ProdName = "Mountain-200 Silver, 46",
                ProductNumber = "BK-M68S-46",
                Color = "Silver",
                Size = "46",
                Weight = 24.13,
                StandardCost = 1265.6195,
                Style = "U ",
                Class = "H ",
                ListPrice = 2319.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-200",
                ProdCat = "Bikes",
                Description = "Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.",
                ProdName = "Mountain-200 Black, 38",
                ProductNumber = "BK-M68B-38",
                Color = "Black",
                Size = "38",
                Weight = 23.35,
                StandardCost = 1251.9813,
                Style = "U ",
                Class = "H ",
                ListPrice = 2294.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-200",
                ProdCat = "Bikes",
                Description = "Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.",
                ProdName = "Mountain-200 Black, 42",
                ProductNumber = "BK-M68B-42",
                Color = "Black",
                Size = "42",
                Weight = 23.77,
                StandardCost = 1251.9813,
                Style = "U ",
                Class = "H ",
                ListPrice = 2294.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-200",
                ProdCat = "Bikes",
                Description = "Serious back-country riding. Perfect for all levels of competition. Uses the same HL Frame as the Mountain-100.",
                ProdName = "Mountain-200 Black, 46",
                ProductNumber = "BK-M68B-46",
                Color = "Black",
                Size = "46",
                Weight = 24.13,
                StandardCost = 1251.9813,
                Style = "U ",
                Class = "H ",
                ListPrice = 2294.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-300",
                ProdCat = "Bikes",
                Description = "For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.",
                ProdName = "Mountain-300 Black, 38",
                ProductNumber = "BK-M47B-38",
                Color = "Black",
                Size = "38",
                Weight = 25.35,
                StandardCost = 598.4354,
                Style = "U ",
                Class = "M ",
                ListPrice = 1079.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-300",
                ProdCat = "Bikes",
                Description = "For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.",
                ProdName = "Mountain-300 Black, 40",
                ProductNumber = "BK-M47B-40",
                Color = "Black",
                Size = "40",
                Weight = 25.77,
                StandardCost = 598.4354,
                Style = "U ",
                Class = "M ",
                ListPrice = 1079.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-300",
                ProdCat = "Bikes",
                Description = "For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.",
                ProdName = "Mountain-300 Black, 44",
                ProductNumber = "BK-M47B-44",
                Color = "Black",
                Size = "44",
                Weight = 26.13,
                StandardCost = 598.4354,
                Style = "U ",
                Class = "M ",
                ListPrice = 1079.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Mountain Bikes",
                ProdModel = "Mountain-300",
                ProdCat = "Bikes",
                Description = "For true trail addicts.  An extremely durable bike that will go anywhere and keep you in control on challenging terrain - without breaking your budget.",
                ProdName = "Mountain-300 Black, 48",
                ProductNumber = "BK-M47B-48",
                Color = "Black",
                Size = "48",
                Weight = 26.42,
                StandardCost = 598.4354,
                Style = "U ",
                Class = "M ",
                ListPrice = 1079.9900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Red, 44",
                ProductNumber = "BK-R89R-44",
                Color = "Red",
                Size = "44",
                Weight = 14.77,
                StandardCost = 1518.7864,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Red, 48",
                ProductNumber = "BK-R89R-48",
                Color = "Red",
                Size = "48",
                Weight = 15.13,
                StandardCost = 1518.7864,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Red, 52",
                ProductNumber = "BK-R89R-52",
                Color = "Red",
                Size = "52",
                Weight = 15.42,
                StandardCost = 1518.7864,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Red, 58",
                ProductNumber = "BK-R89R-58",
                Color = "Red",
                Size = "58",
                Weight = 15.79,
                StandardCost = 1554.9479,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Black, 44",
                ProductNumber = "BK-R89B-44",
                Color = "Black",
                Size = "44",
                Weight = 14.77,
                StandardCost = 1554.9479,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Black, 48",
                ProductNumber = "BK-R89B-48",
                Color = "Black",
                Size = "48",
                Weight = 15.13,
                StandardCost = 1554.9479,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Black, 52",
                ProductNumber = "BK-R89B-52",
                Color = "Black",
                Size = "52",
                Weight = 15.42,
                StandardCost = 1554.9479,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-250",
                ProdCat = "Bikes",
                Description = "Alluminum-alloy frame provides a light, stiff ride, whether you are racing in the velodrome or on a demanding club ride on country roads.",
                ProdName = "Road-250 Black, 58",
                ProductNumber = "BK-R89B-58",
                Color = "Black",
                Size = "58",
                Weight = 15.68,
                StandardCost = 1554.9479,
                Style = "U ",
                Class = "H ",
                ListPrice = 2443.3500
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-550-W",
                ProdCat = "Bikes",
                Description = "Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.",
                ProdName = "Road-550-W Yellow, 38",
                ProductNumber = "BK-R64Y-38",
                Color = "Yellow",
                Size = "38",
                Weight = 17.35,
                StandardCost = 713.0798,
                Style = "W ",
                Class = "M ",
                ListPrice = 1120.4900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-550-W",
                ProdCat = "Bikes",
                Description = "Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.",
                ProdName = "Road-550-W Yellow, 40",
                ProductNumber = "BK-R64Y-40",
                Color = "Yellow",
                Size = "40",
                Weight = 17.77,
                StandardCost = 713.0798,
                Style = "W ",
                Class = "M ",
                ListPrice = 1120.4900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-550-W",
                ProdCat = "Bikes",
                Description = "Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.",
                ProdName = "Road-550-W Yellow, 42",
                ProductNumber = "BK-R64Y-42",
                Color = "Yellow",
                Size = "42",
                Weight = 18.13,
                StandardCost = 713.0798,
                Style = "W ",
                Class = "M ",
                ListPrice = 1120.4900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-550-W",
                ProdCat = "Bikes",
                Description = "Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.",
                ProdName = "Road-550-W Yellow, 44",
                ProductNumber = "BK-R64Y-44",
                Color = "Yellow",
                Size = "44",
                Weight = 18.42,
                StandardCost = 713.0798,
                Style = "W ",
                Class = "M ",
                ListPrice = 1120.4900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Road Bikes",
                ProdModel = "Road-550-W",
                ProdCat = "Bikes",
                Description = "Same technology as all of our Road series bikes, but the frame is sized for a woman.  Perfect all-around bike for road or racing.",
                ProdName = "Road-550-W Yellow, 48",
                ProductNumber = "BK-R64Y-48",
                Color = "Yellow",
                Size = "48",
                Weight = 18.68,
                StandardCost = 713.0798,
                Style = "W ",
                Class = "M ",
                ListPrice = 1120.4900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Forks",
                ProdModel = "LL Fork",
                ProdCat = "Components",
                Description = "Stout design absorbs shock and offers more precise steering.",
                ProdName = "LL Fork",
                ProductNumber = "FK-1639",
                Color = "",
                Size = "",
                Weight = null,
                StandardCost = 65.8097,
                Style = "",
                Class = "L ",
                ListPrice = 148.2200
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Forks",
                ProdModel = "ML Fork",
                ProdCat = "Components",
                Description = "Composite road fork with an aluminum steerer tube.",
                ProdName = "ML Fork",
                ProductNumber = "FK-5136",
                Color = "",
                Size = "",
                Weight = null,
                StandardCost = 77.9176,
                Style = "",
                Class = "M ",
                ListPrice = 175.4900
            };
            datas.Add(data);
            data = new ProductCatalog()
            {
                ProdSubCat = "Forks",
                ProdModel = "HL Fork",
                ProdCat = "Components",
                Description = "High-performance carbon road fork with curved legs.",
                ProdName = "HL Fork",
                ProductNumber = "FK-9939",
                Color = "",
                Size = "",
                Weight = null,
                StandardCost = 101.8936,
                Style = "",
                Class = "H ",
                ListPrice = 229.4900
            };
            datas.Add(data);
            return datas;
        }
    }

    public class Customers
    {
        public string SalesOrderNumber { get; set; }
        public string Store { get; set; }
        public DateTime OrderDate { get; set; }
        public string SalesFirstName { get; set; }
        public string SalesLastName { get; set; }
        public string SalesTitle { get; set; }
        public string PurchaseOrderNumber { get; set; }
        public string ShipMethod { get; set; }
        public string BillAddress1 { get; set; }
        public string BillAddress2 { get; set; }
        public string BillCity { get; set; }
        public string BillPostalCode { get; set; }
        public string BillStateProvince { get; set; }
        public string BillCountryRegion { get; set; }
        public string ShipAddress1 { get; set; }
        public string ShipAddress2 { get; set; }
        public string ShipCity { get; set; }
        public string ShipPostalCode { get; set; }
        public string ShipStateProvince { get; set; }
        public string ShipCountryRegion { get; set; }
        public string CustPhone { get; set; }
        public string CustFirstName { get; set; }
        public string CustLastName { get; set; }
        public static IList GetData()
        {
            List<Customers> datas = new List<Customers>();
            Customers data = null;
            data = new Customers()
            {
                SalesOrderNumber = "SO43666",
                Store = "Wheel Gallery",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16008173883",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "9920 Bridgepointe Parkway",
                BillAddress2 = "",
                BillCity = "San Mateo",
                BillPostalCode = "94404",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "9920 Bridgepointe Parkway",
                ShipAddress2 = "",
                ShipCity = "San Mateo",
                ShipPostalCode = "94404",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "926-555-0136",
                CustFirstName = "Abraham",
                CustLastName = "Swearengin"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43672",
                Store = "Red Bicycle Company",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO13862153537",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "99, Rue Saint-pierre",
                BillAddress2 = "",
                BillCity = "Pnot-Rouge",
                BillPostalCode = "J1E 2T7",
                BillStateProvince = "Quebec",
                BillCountryRegion = "Canada",
                ShipAddress1 = "99, Rue Saint-pierre",
                ShipAddress2 = "",
                ShipCity = "Pnot-Rouge",
                ShipPostalCode = "J1E 2T7",
                ShipStateProvince = "Quebec",
                ShipCountryRegion = "Canada",
                CustPhone = "667-555-0112",
                CustFirstName = "Phyllis",
                CustLastName = "Thomas"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43685",
                Store = "Simple Bike Parts",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO4176124783",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Silver Sands Factory Outlet",
                BillAddress2 = "",
                BillCity = "Destin",
                BillPostalCode = "32541",
                BillStateProvince = "Florida",
                BillCountryRegion = "United States",
                ShipAddress1 = "Silver Sands Factory Outlet",
                ShipAddress2 = "",
                ShipCity = "Destin",
                ShipPostalCode = "32541",
                ShipStateProvince = "Florida",
                ShipCountryRegion = "United States",
                CustPhone = "317-555-0163",
                CustFirstName = "Abe",
                CustLastName = "Tramel"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43843",
                Store = "Catalog Store",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO19923118772",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "855 East Main Avenue",
                BillAddress2 = "",
                BillCity = "Zeeland",
                BillPostalCode = "49464",
                BillStateProvince = "Michigan",
                BillCountryRegion = "United States",
                ShipAddress1 = "855 East Main Avenue",
                ShipAddress2 = "",
                ShipCity = "Zeeland",
                ShipPostalCode = "49464",
                ShipStateProvince = "Michigan",
                ShipCountryRegion = "United States",
                CustPhone = "440-555-0132",
                CustFirstName = "David",
                CustLastName = "Liu"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43844",
                Store = "Two-Wheeled Transit Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO19691138342",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "P.O. Box 44000",
                BillAddress2 = "",
                BillCity = "Winnipeg",
                BillPostalCode = "R3",
                BillStateProvince = "Manitoba",
                BillCountryRegion = "Canada",
                ShipAddress1 = "P.O. Box 44000",
                ShipAddress2 = "",
                ShipCity = "Winnipeg",
                ShipPostalCode = "R3",
                ShipStateProvince = "Manitoba",
                ShipCountryRegion = "Canada",
                CustPhone = "700-555-0155",
                CustFirstName = "Joan",
                CustLastName = "Campbell"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43845",
                Store = "New and Used Bicycles",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO19546184286",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "3990 Silas Creek Parkway",
                BillAddress2 = "",
                BillCity = "Winston-Salem",
                BillPostalCode = "27104",
                BillStateProvince = "North Carolina",
                BillCountryRegion = "United States",
                ShipAddress1 = "3990 Silas Creek Parkway",
                ShipAddress2 = "",
                ShipCity = "Winston-Salem",
                ShipPostalCode = "27104",
                ShipStateProvince = "North Carolina",
                ShipCountryRegion = "United States",
                CustPhone = "895-555-0160",
                CustFirstName = "Brannon",
                CustLastName = "Jones"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43846",
                Store = "First-Rate Outlet",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO19430112391",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25537 Hillside Avenue",
                BillAddress2 = "",
                BillCity = "Victoria",
                BillPostalCode = "V8V",
                BillStateProvince = "British Columbia",
                BillCountryRegion = "Canada",
                ShipAddress1 = "25537 Hillside Avenue",
                ShipAddress2 = "",
                ShipCity = "Victoria",
                ShipPostalCode = "V8V",
                ShipStateProvince = "British Columbia",
                ShipCountryRegion = "Canada",
                CustPhone = "277-555-0169",
                CustFirstName = "Ann",
                CustLastName = "Beebe"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43847",
                Store = "Gasless Cycle Shop",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO19227161888",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25 First Canadian Place",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V5",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "25 First Canadian Place",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V5",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "584-555-0192",
                CustFirstName = "Josh",
                CustLastName = "Barnhill"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43848",
                Store = "Suburban Cycle Shop",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "David",
                SalesLastName = "Campbell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18908190536",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "994 Sw Cherry Park Rd",
                BillAddress2 = "",
                BillCity = "Troutdale",
                BillPostalCode = "97060",
                BillStateProvince = "Oregon",
                BillCountryRegion = "United States",
                ShipAddress1 = "994 Sw Cherry Park Rd",
                ShipAddress2 = "",
                ShipCity = "Troutdale",
                ShipPostalCode = "97060",
                ShipStateProvince = "Oregon",
                ShipCountryRegion = "United States",
                CustPhone = "706-555-0140",
                CustFirstName = "Cindy",
                CustLastName = "Dodd"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43849",
                Store = "Brakes and Gears",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Stephen",
                SalesLastName = "Jiang",
                SalesTitle = "North American Sales Manager",
                PurchaseOrderNumber = "PO18676186169",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "9927 N. Main St.",
                BillAddress2 = "",
                BillCity = "Tooele",
                BillPostalCode = "84074",
                BillStateProvince = "Utah",
                BillCountryRegion = "United States",
                ShipAddress1 = "9927 N. Main St.",
                ShipAddress2 = "",
                ShipCity = "Tooele",
                ShipPostalCode = "84074",
                ShipStateProvince = "Utah",
                ShipCountryRegion = "United States",
                CustPhone = "774-555-0133",
                CustFirstName = "Roger",
                CustLastName = "Harui"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43850",
                Store = "Non-Slip Pedal Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18415143340",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "258 King Street East",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V7",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "258 King Street East",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V7",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "303-555-0117",
                CustFirstName = "Sandra",
                CustLastName = "Kitt"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43851",
                Store = "Retail Sales and Service",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18386167654",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Lake Region Factory Outlet",
                BillAddress2 = "",
                BillCity = "Tilton",
                BillPostalCode = "03276",
                BillStateProvince = "New Hampshire",
                BillCountryRegion = "United States",
                ShipAddress1 = "Lake Region Factory Outlet",
                ShipAddress2 = "",
                ShipCity = "Tilton",
                ShipPostalCode = "03276",
                ShipStateProvince = "New Hampshire",
                ShipCountryRegion = "United States",
                CustPhone = "607-555-0193",
                CustFirstName = "Michael",
                CustLastName = "Allen"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43852",
                Store = "Economy Center",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO17864179720",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "6th Floor, 25st Canadian Place",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V5",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "6th Floor, 25st Canadian Place",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V5",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "555-555-0162",
                CustFirstName = "Curtis",
                CustLastName = "Howard"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43853",
                Store = "Sharp Bikes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18270155899",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "52560 Free Street",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V7",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "52560 Free Street",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V7",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "926-555-0159",
                CustFirstName = "Katherine",
                CustLastName = "Harding"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43854",
                Store = "Professional Cyclists",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO17777139245",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "2545 King Street West",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V7",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "2545 King Street West",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V7",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "154-555-0115",
                CustFirstName = "Steve",
                CustLastName = "Masters"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43855",
                Store = "National Manufacturing",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO17748116016",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "630 University Avenue",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V7",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "630 University Avenue",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V7",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "493-555-0134",
                CustFirstName = "Linda",
                CustLastName = "Leste"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43856",
                Store = "Sixth Bike Store",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO17313123131",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Suite 25800 3401 - 10810th Avenue",
                BillAddress2 = "",
                BillCity = "Surrey",
                BillPostalCode = "V3T 4W3",
                BillStateProvince = "British Columbia",
                BillCountryRegion = "Canada",
                ShipAddress1 = "Suite 25800 3401 - 10810th Avenue",
                ShipAddress2 = "",
                ShipCity = "Surrey",
                ShipPostalCode = "V3T 4W3",
                ShipStateProvince = "British Columbia",
                ShipCountryRegion = "Canada",
                CustPhone = "428-555-0176",
                CustFirstName = "Dorothy",
                CustLastName = "Contreras"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43857",
                Store = "Tenth Bike Store",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16733124458",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Depot 80",
                BillAddress2 = "",
                BillCity = "Sillery",
                BillPostalCode = "G1T",
                BillStateProvince = "Quebec",
                BillCountryRegion = "Canada",
                ShipAddress1 = "Depot 80",
                ShipAddress2 = "",
                ShipCity = "Sillery",
                ShipPostalCode = "G1T",
                ShipStateProvince = "Quebec",
                ShipCountryRegion = "Canada",
                CustPhone = "744-555-0123",
                CustFirstName = "Yuping",
                CustLastName = "Tian"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43858",
                Store = "Exotic Bikes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16791124272",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "6900 William Richardson Ct.",
                BillAddress2 = "",
                BillCity = "South Bend",
                BillPostalCode = "46601",
                BillStateProvince = "Indiana",
                BillCountryRegion = "United States",
                ShipAddress1 = "6900 William Richardson Ct.",
                ShipAddress2 = "",
                ShipCity = "South Bend",
                ShipPostalCode = "46601",
                ShipStateProvince = "Indiana",
                ShipCountryRegion = "United States",
                CustPhone = "415-555-0147",
                CustFirstName = "John",
                CustLastName = "Long"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43859",
                Store = "Highway Bike Shop",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16762199940",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Simi @ The Plaza",
                BillAddress2 = "",
                BillCity = "Simi Valley",
                BillPostalCode = "93065",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "Simi @ The Plaza",
                ShipAddress2 = "",
                ShipCity = "Simi Valley",
                ShipPostalCode = "93065",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "199-555-0135",
                CustFirstName = "Lucio",
                CustLastName = "Iallo"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43860",
                Store = "A Bike Store",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16646146654",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "2251 Elliot Avenue",
                BillAddress2 = "",
                BillCity = "Seattle",
                BillPostalCode = "98104",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "2251 Elliot Avenue",
                ShipAddress2 = "",
                ShipCity = "Seattle",
                ShipPostalCode = "98104",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "245-555-0173",
                CustFirstName = "Orlando",
                CustLastName = "Gee"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43861",
                Store = "Qualified Sales and Repair Services",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16327172067",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Savannah Festival Outlet",
                BillAddress2 = "",
                BillCity = "Savannah",
                BillPostalCode = "31401",
                BillStateProvince = "Georgia",
                BillCountryRegion = "United States",
                ShipAddress1 = "Savannah Festival Outlet",
                ShipAddress2 = "",
                ShipCity = "Savannah",
                ShipPostalCode = "31401",
                ShipStateProvince = "Georgia",
                ShipCountryRegion = "United States",
                CustPhone = "475-555-0188",
                CustFirstName = "Hanying",
                CustLastName = "Feng"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43862",
                Store = "Unified Sports Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16211194171",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "9876 Fruitville Rd",
                BillAddress2 = "",
                BillCity = "Sarasota",
                BillPostalCode = "34236",
                BillStateProvince = "Florida",
                BillCountryRegion = "United States",
                ShipAddress1 = "9876 Fruitville Rd",
                ShipAddress2 = "",
                ShipCity = "Sarasota",
                ShipPostalCode = "34236",
                ShipStateProvince = "Florida",
                ShipCountryRegion = "United States",
                CustPhone = "296-555-0171",
                CustFirstName = "Gloria",
                CustLastName = "Lesko"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43863",
                Store = "Social Activities Club",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO15747169584",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "23025 S.W. Military Rd.",
                BillAddress2 = "",
                BillCity = "San Antonio",
                BillPostalCode = "78204",
                BillStateProvince = "Texas",
                BillCountryRegion = "United States",
                ShipAddress1 = "23025 S.W. Military Rd.",
                ShipAddress2 = "",
                ShipCity = "San Antonio",
                ShipPostalCode = "78204",
                ShipStateProvince = "Texas",
                ShipCountryRegion = "United States",
                CustPhone = "596-555-0153",
                CustFirstName = "John",
                CustLastName = "Ford"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43864",
                Store = "Sparkling Paint and Finishes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16037151094",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "San Diego Factory",
                BillAddress2 = "",
                BillCity = "San Ysidro",
                BillPostalCode = "92173",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "San Diego Factory",
                ShipAddress2 = "",
                ShipCity = "San Ysidro",
                ShipPostalCode = "92173",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "787-555-0128",
                CustFirstName = "Clarence",
                CustLastName = "Tatman"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43865",
                Store = "Totes & Baskets Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO15689147174",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "72540 Blanco Rd.",
                BillAddress2 = "",
                BillCity = "San Antonio",
                BillPostalCode = "78204",
                BillStateProvince = "Texas",
                BillCountryRegion = "United States",
                ShipAddress1 = "72540 Blanco Rd.",
                ShipAddress2 = "",
                ShipCity = "San Antonio",
                ShipPostalCode = "78204",
                ShipStateProvince = "Texas",
                ShipCountryRegion = "United States",
                CustPhone = "560-555-0171",
                CustFirstName = "Robert",
                CustLastName = "Vessa"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43866",
                Store = "Moderately-Priced Bikes Store",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14529112624",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "67 Rainer Ave S",
                BillAddress2 = "",
                BillCity = "Renton",
                BillPostalCode = "98055",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "67 Rainer Ave S",
                ShipAddress2 = "",
                ShipCity = "Renton",
                ShipPostalCode = "98055",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "763-555-0145",
                CustFirstName = "Gabriel",
                CustLastName = "Bockenkamp"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43867",
                Store = "Raw Materials Inc",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14471123403",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Bldg. 9n/99298",
                BillAddress2 = "",
                BillCity = "Redmond",
                BillPostalCode = "98052",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "Bldg. 9n/99298",
                ShipAddress2 = "",
                ShipCity = "Redmond",
                ShipPostalCode = "98052",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "962-555-0166",
                CustFirstName = "Ted",
                CustLastName = "Bremer"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43868",
                Store = "Major Cycling",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14848158712",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "46990 Viking Way",
                BillAddress2 = "",
                BillCity = "Richmond",
                BillPostalCode = "V6B 3P7",
                BillStateProvince = "British Columbia",
                BillCountryRegion = "Canada",
                ShipAddress1 = "46990 Viking Way",
                ShipAddress2 = "",
                ShipCity = "Richmond",
                ShipPostalCode = "V6B 3P7",
                ShipStateProvince = "British Columbia",
                ShipCountryRegion = "Canada",
                CustPhone = "512-555-0122",
                CustFirstName = "Ruby Sue",
                CustLastName = "Styles"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43869",
                Store = "Permanent Finish Products",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14500145975",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "62500 Neil Road",
                BillAddress2 = "",
                BillCity = "Reno",
                BillPostalCode = "89502",
                BillStateProvince = "Nevada",
                BillCountryRegion = "United States",
                ShipAddress1 = "62500 Neil Road",
                ShipAddress2 = "",
                ShipCity = "Reno",
                ShipPostalCode = "89502",
                ShipStateProvince = "Nevada",
                ShipCountryRegion = "United States",
                CustPhone = "265-555-0143",
                CustFirstName = "Margaret",
                CustLastName = "Vanderkamp"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43870",
                Store = "Wholesale Bikes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14326149236",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "58 Teed Drive",
                BillAddress2 = "",
                BillCity = "Randolph",
                BillPostalCode = "02368",
                BillStateProvince = "Massachusetts",
                BillCountryRegion = "United States",
                ShipAddress1 = "58 Teed Drive",
                ShipAddress2 = "",
                ShipCity = "Randolph",
                ShipPostalCode = "02368",
                ShipStateProvince = "Massachusetts",
                ShipCountryRegion = "United States",
                CustPhone = "652-555-0115",
                CustFirstName = "Aaron",
                CustLastName = "Con"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43871",
                Store = "Fun Times Club",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Shu",
                SalesLastName = "Ito",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO13572145817",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "8525 South Parker Road",
                BillAddress2 = "",
                BillCity = "Parker",
                BillPostalCode = "80138",
                BillStateProvince = "Colorado",
                BillCountryRegion = "United States",
                ShipAddress1 = "8525 South Parker Road",
                ShipAddress2 = "",
                ShipCity = "Parker",
                ShipPostalCode = "80138",
                ShipStateProvince = "Colorado",
                ShipCountryRegion = "United States",
                CustPhone = "847-555-0184",
                CustFirstName = "Diane",
                CustLastName = "Tibbott"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43872",
                Store = "Wire Baskets and Parts",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12557127067",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Mall Of Orange",
                BillAddress2 = "",
                BillCity = "Orange",
                BillPostalCode = "92867",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "Mall Of Orange",
                ShipAddress2 = "",
                ShipCity = "Orange",
                ShipPostalCode = "92867",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "103-555-0179",
                CustFirstName = "Jessie",
                CustLastName = "Valerio"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43873",
                Store = "Preferred Bikes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12499138177",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Incom Sports Center",
                BillAddress2 = "",
                BillCity = "Ontario",
                BillPostalCode = "91764",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "Incom Sports Center",
                ShipAddress2 = "",
                ShipCity = "Ontario",
                ShipPostalCode = "91764",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "819-555-0186",
                CustFirstName = "Stefan",
                CustLastName = "Delmarco"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43874",
                Store = "Travel Systems",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12122162917",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "2505 Gateway Drive",
                BillAddress2 = "",
                BillCity = "North Sioux City",
                BillPostalCode = "57049",
                BillStateProvince = "South Dakota",
                BillCountryRegion = "United States",
                ShipAddress1 = "2505 Gateway Drive",
                ShipAddress2 = "",
                ShipCity = "North Sioux City",
                ShipPostalCode = "57049",
                ShipStateProvince = "South Dakota",
                ShipCountryRegion = "United States",
                CustPhone = "121-555-0121",
                CustFirstName = "Linda",
                CustLastName = "Burnett"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43696",
                Store = "Retail Toy Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO9947131800",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Dadeland Mall, Space 25090",
                BillAddress2 = "",
                BillCity = "Miami",
                BillPostalCode = "33127",
                BillStateProvince = "Florida",
                BillCountryRegion = "United States",
                ShipAddress1 = "Dadeland Mall, Space 25090",
                ShipAddress2 = "",
                ShipCity = "Miami",
                ShipPostalCode = "33127",
                ShipStateProvince = "Florida",
                ShipCountryRegion = "United States",
                CustPhone = "140-555-0188",
                CustFirstName = "Barbara",
                CustLastName = "Hoffman"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43695",
                Store = "Sports Sales and Rental",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10179176559",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "100 Fifth Drive",
                BillAddress2 = "",
                BillCity = "Millington",
                BillPostalCode = "38054",
                BillStateProvince = "Tennessee",
                BillCountryRegion = "United States",
                ShipAddress1 = "100 Fifth Drive",
                ShipAddress2 = "",
                ShipCity = "Millington",
                ShipPostalCode = "38054",
                ShipStateProvince = "Tennessee",
                ShipCountryRegion = "United States",
                CustPhone = "284-555-0185",
                CustFirstName = "Run",
                CustLastName = "Liu"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43694",
                Store = "Juvenile Sports Equipment",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO9657130250",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "78025 E. Mercy Island Cswy",
                BillAddress2 = "",
                BillCity = "Merritt Island",
                BillPostalCode = "32952",
                BillStateProvince = "Florida",
                BillCountryRegion = "United States",
                ShipAddress1 = "78025 E. Mercy Island Cswy",
                ShipAddress2 = "",
                ShipCity = "Merritt Island",
                ShipPostalCode = "32952",
                ShipStateProvince = "Florida",
                ShipCountryRegion = "United States",
                CustPhone = "843-555-0175",
                CustFirstName = "Shane",
                CustLastName = "Belli"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43693",
                Store = "Clamps & Brackets Co.",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO8120182325",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Leesburg Premium Outlet Centre",
                BillAddress2 = "",
                BillCity = "Leesburg",
                BillPostalCode = "20176",
                BillStateProvince = "Virginia",
                BillCountryRegion = "United States",
                ShipAddress1 = "Leesburg Premium Outlet Centre",
                ShipAddress2 = "",
                ShipCity = "Leesburg",
                ShipPostalCode = "20176",
                ShipStateProvince = "Virginia",
                ShipCountryRegion = "United States",
                CustPhone = "107-555-0138",
                CustFirstName = "Carla",
                CustLastName = "Adams"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43692",
                Store = "Bike Dealers Association",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Shu",
                SalesLastName = "Ito",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO7859187017",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "9952 E. Lohman Ave.",
                BillAddress2 = "",
                BillCity = "Las Cruces",
                BillPostalCode = "88001",
                BillStateProvince = "New Mexico",
                BillCountryRegion = "United States",
                ShipAddress1 = "9952 E. Lohman Ave.",
                ShipAddress2 = "",
                ShipCity = "Las Cruces",
                ShipPostalCode = "88001",
                ShipStateProvince = "New Mexico",
                ShipCountryRegion = "United States",
                CustPhone = "993-555-0179",
                CustFirstName = "Sandra",
                CustLastName = "Maynard"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43691",
                Store = "Grease and Oil Products Company",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO6409111675",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "9903 Highway 6 South",
                BillAddress2 = "",
                BillCity = "Houston",
                BillPostalCode = "77003",
                BillStateProvince = "Texas",
                BillCountryRegion = "United States",
                ShipAddress1 = "9903 Highway 6 South",
                ShipAddress2 = "",
                ShipCity = "Houston",
                ShipPostalCode = "77003",
                ShipStateProvince = "Texas",
                ShipCountryRegion = "United States",
                CustPhone = "126-555-0172",
                CustFirstName = "Michael",
                CustLastName = "Blythe"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43690",
                Store = "Small Cycle Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO6235146326",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Horizon Outlet Center",
                BillAddress2 = "",
                BillCity = "Holland",
                BillPostalCode = "49423",
                BillStateProvince = "Michigan",
                BillCountryRegion = "United States",
                ShipAddress1 = "Horizon Outlet Center",
                ShipAddress2 = "",
                ShipCity = "Holland",
                ShipPostalCode = "49423",
                ShipStateProvince = "Michigan",
                ShipCountryRegion = "United States",
                CustPhone = "583-555-0130",
                CustFirstName = "Douglas",
                CustLastName = "Baldwin"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43689",
                Store = "Fitness Toy Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5626159507",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "220 Mercy Drive",
                BillAddress2 = "",
                BillCity = "Garland",
                BillPostalCode = "75040",
                BillStateProvince = "Texas",
                BillCountryRegion = "United States",
                ShipAddress1 = "220 Mercy Drive",
                ShipAddress2 = "",
                ShipCity = "Garland",
                ShipPostalCode = "75040",
                ShipStateProvince = "Texas",
                ShipCountryRegion = "United States",
                CustPhone = "351-555-0131",
                CustFirstName = "Stacey",
                CustLastName = "Cereghino"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43688",
                Store = "Weekend Tours",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5365136389",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "42522 Northrupp",
                BillAddress2 = "",
                BillCity = "Fort Wayne",
                BillPostalCode = "46807",
                BillStateProvince = "Indiana",
                BillCountryRegion = "United States",
                ShipAddress1 = "42522 Northrupp",
                ShipAddress2 = "",
                ShipCity = "Fort Wayne",
                ShipPostalCode = "46807",
                ShipStateProvince = "Indiana",
                ShipCountryRegion = "United States",
                CustPhone = "754-555-0134",
                CustFirstName = "John",
                CustLastName = "Donovan"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43687",
                Store = "Curbside Universe",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO4959110829",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25264 E. 260th",
                BillAddress2 = "",
                BillCity = "Euclid",
                BillPostalCode = "44119",
                BillStateProvince = "Ohio",
                BillCountryRegion = "United States",
                ShipAddress1 = "25264 E. 260th",
                ShipAddress2 = "",
                ShipCity = "Euclid",
                ShipPostalCode = "44119",
                ShipStateProvince = "Ohio",
                ShipCountryRegion = "United States",
                CustPhone = "131-555-0171",
                CustFirstName = "Deanna",
                CustLastName = "Buskirk"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43686",
                Store = "Fifth Bike Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "David",
                SalesLastName = "Campbell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5075125561",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "2502 Evergreen Ste E",
                BillAddress2 = "",
                BillCity = "Everett",
                BillPostalCode = "98201",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "2502 Evergreen Ste E",
                ShipAddress2 = "",
                ShipCity = "Everett",
                ShipPostalCode = "98201",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "652-555-0132",
                CustFirstName = "Karren",
                CustLastName = "Burkhardt"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43684",
                Store = "Daring Rides",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO3393188842",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Bay Area Outlet Mall",
                BillAddress2 = "",
                BillCity = "Clearwater",
                BillPostalCode = "33755",
                BillStateProvince = "Florida",
                BillCountryRegion = "United States",
                ShipAddress1 = "Bay Area Outlet Mall",
                ShipAddress2 = "",
                ShipCity = "Clearwater",
                ShipPostalCode = "33755",
                ShipStateProvince = "Florida",
                ShipCountryRegion = "United States",
                CustPhone = "871-555-0159",
                CustFirstName = "Russell",
                CustLastName = "King"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43683",
                Store = "Great Bikes ",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "David",
                SalesLastName = "Campbell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2552113807",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Eastridge Mall",
                BillAddress2 = "",
                BillCity = "Casper",
                BillPostalCode = "82601",
                BillStateProvince = "Wyoming",
                BillCountryRegion = "United States",
                ShipAddress1 = "Eastridge Mall",
                ShipAddress2 = "",
                ShipCity = "Casper",
                ShipPostalCode = "82601",
                ShipStateProvince = "Wyoming",
                ShipCountryRegion = "United States",
                CustPhone = "571-555-0128",
                CustFirstName = "François",
                CustLastName = "Ferrier"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43682",
                Store = "Convenient Bike Shop",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO1566124200",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Tree Plaza",
                BillAddress2 = "",
                BillCity = "Braintree",
                BillPostalCode = "02184",
                BillStateProvince = "Massachusetts",
                BillCountryRegion = "United States",
                ShipAddress1 = "Tree Plaza",
                ShipAddress2 = "",
                ShipCity = "Braintree",
                ShipPostalCode = "02184",
                ShipStateProvince = "Massachusetts",
                ShipCountryRegion = "United States",
                CustPhone = "721-555-0163",
                CustFirstName = "Judith",
                CustLastName = "Frazier"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43681",
                Store = "Bike Rims Company",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO1189177803",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Edgewater Mall",
                BillAddress2 = "",
                BillCity = "Biloxi",
                BillPostalCode = "39530",
                BillStateProvince = "Mississippi",
                BillCountryRegion = "United States",
                ShipAddress1 = "Edgewater Mall",
                ShipAddress2 = "",
                ShipCity = "Biloxi",
                ShipPostalCode = "39530",
                ShipStateProvince = "Mississippi",
                ShipCountryRegion = "United States",
                CustPhone = "334-555-0146",
                CustFirstName = "Charles",
                CustLastName = "Christensen"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43680",
                Store = "Area Bike Accessories",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Shu",
                SalesLastName = "Ito",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10730130087",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "6900 Sisk Road",
                BillAddress2 = "",
                BillCity = "Modesto",
                BillPostalCode = "95354",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "6900 Sisk Road",
                ShipAddress2 = "",
                ShipCity = "Modesto",
                ShipPostalCode = "95354",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "991-555-0183",
                CustFirstName = "Frances",
                CustLastName = "Adams"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43679",
                Store = "General Bike Corporation",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10527142759",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "69251 Creditview Road",
                BillAddress2 = "",
                BillCity = "Mississauga",
                BillPostalCode = "L5B 3V4",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "69251 Creditview Road",
                ShipAddress2 = "",
                ShipCity = "Mississauga",
                ShipPostalCode = "L5B 3V4",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "994-555-0194",
                CustFirstName = "Susan",
                CustLastName = "French"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43678",
                Store = "Separate Parts Corporation",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Shu",
                SalesLastName = "Ito",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10817150168",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "440 West Huntington Dr.",
                BillAddress2 = "",
                BillCity = "Monrovia",
                BillPostalCode = "91016",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "440 West Huntington Dr.",
                ShipAddress2 = "",
                ShipCity = "Monrovia",
                ShipPostalCode = "91016",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "207-555-0129",
                CustFirstName = "Jean",
                CustLastName = "Jordan"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43677",
                Store = "Superb Sales and Repair",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO11049174786",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "990th Floor 700 De La GauchetiSre Ou",
                BillAddress2 = "",
                BillCity = "Montreal",
                BillPostalCode = "H1Y 2H3",
                BillStateProvince = "Quebec",
                BillCountryRegion = "Canada",
                ShipAddress1 = "990th Floor 700 De La GauchetiSre Ou",
                ShipAddress2 = "",
                ShipCity = "Montreal",
                ShipPostalCode = "H1Y 2H3",
                ShipStateProvince = "Quebec",
                ShipCountryRegion = "Canada",
                CustPhone = "393-555-0167",
                CustFirstName = "Brenda",
                CustLastName = "Heaney"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43676",
                Store = "Trusted Catalog Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO11861165059",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "9920 Picketts Line Road",
                BillAddress2 = "",
                BillCity = "Newport News",
                BillPostalCode = "23607",
                BillStateProvince = "Virginia",
                BillCountryRegion = "United States",
                ShipAddress1 = "9920 Picketts Line Road",
                ShipAddress2 = "",
                ShipCity = "Newport News",
                ShipPostalCode = "23607",
                ShipStateProvince = "Virginia",
                ShipCountryRegion = "United States",
                CustPhone = "497-555-0147",
                CustFirstName = "Mark",
                CustLastName = "Hanson"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43675",
                Store = "First Bike Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12412186464",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Kansas City Factory Outlet",
                BillAddress2 = "",
                BillCity = "Odessa",
                BillPostalCode = "64076",
                BillStateProvince = "Missouri",
                BillCountryRegion = "United States",
                ShipAddress1 = "Kansas City Factory Outlet",
                ShipAddress2 = "",
                ShipCity = "Odessa",
                ShipPostalCode = "64076",
                ShipStateProvince = "Missouri",
                ShipCountryRegion = "United States",
                CustPhone = "859-555-0140",
                CustFirstName = "Valerie",
                CustLastName = "Hendricks"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43674",
                Store = "Requisite Part Supply",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12760141756",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "600 Slater Street",
                BillAddress2 = "",
                BillCity = "Ottawa",
                BillPostalCode = "K4B 1S2",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "600 Slater Street",
                ShipAddress2 = "",
                ShipCity = "Ottawa",
                ShipPostalCode = "K4B 1S2",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "644-555-0114",
                CustFirstName = "Eric",
                CustLastName = "Brumfield"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43673",
                Store = "Seventh Bike Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO13775141242",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Stateline Plaza",
                BillAddress2 = "",
                BillCity = "Plaistow",
                BillPostalCode = "03865",
                BillStateProvince = "New Hampshire",
                BillCountryRegion = "United States",
                ShipAddress1 = "Stateline Plaza",
                ShipAddress2 = "",
                ShipCity = "Plaistow",
                ShipPostalCode = "03865",
                ShipStateProvince = "New Hampshire",
                ShipCountryRegion = "United States",
                CustPhone = "860-555-0119",
                CustFirstName = "Nancy",
                CustLastName = "Hirota"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43671",
                Store = "Basic Bike Company",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "David",
                SalesLastName = "Campbell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO13978119376",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "15 East Main",
                BillAddress2 = "",
                BillCity = "Port Orchard",
                BillPostalCode = "98366",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "15 East Main",
                ShipAddress2 = "",
                ShipCity = "Port Orchard",
                ShipPostalCode = "98366",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "170-555-0189",
                CustFirstName = "Peggy",
                CustLastName = "Justice"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43670",
                Store = "Historic Bicycle Sales",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14384116310",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Redford Plaza",
                BillAddress2 = "",
                BillCity = "Redford",
                BillPostalCode = "48239",
                BillStateProvince = "Michigan",
                BillCountryRegion = "United States",
                ShipAddress1 = "Redford Plaza",
                ShipAddress2 = "",
                ShipCity = "Redford",
                ShipPostalCode = "48239",
                ShipStateProvince = "Michigan",
                ShipCountryRegion = "United States",
                CustPhone = "264-555-0143",
                CustFirstName = "Mae",
                CustLastName = "Black"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43669",
                Store = "The Bike Shop",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "David",
                SalesLastName = "Campbell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14123169936",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "3250 South Meridian",
                BillAddress2 = "",
                BillCity = "Puyallup",
                BillPostalCode = "98371",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "3250 South Meridian",
                ShipAddress2 = "",
                ShipCity = "Puyallup",
                ShipPostalCode = "98371",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "957-555-0125",
                CustFirstName = "Carolyn",
                CustLastName = "Farino"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43668",
                Store = "Retail Mall",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO14732180295",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "254480 River Rd",
                BillAddress2 = "",
                BillCity = "Richmond",
                BillPostalCode = "V6B 3P7",
                BillStateProvince = "British Columbia",
                BillCountryRegion = "Canada",
                ShipAddress1 = "254480 River Rd",
                ShipAddress2 = "",
                ShipCity = "Richmond",
                ShipPostalCode = "V6B 3P7",
                ShipStateProvince = "British Columbia",
                ShipCountryRegion = "Canada",
                CustPhone = "726-555-0155",
                CustFirstName = "Ryan",
                CustLastName = "Calafato"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43667",
                Store = "Yellow Bicycle Company",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO15428132599",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "St. Louis Marketplace",
                BillAddress2 = "",
                BillCity = "Saint Louis",
                BillPostalCode = "63103",
                BillStateProvince = "Missouri",
                BillCountryRegion = "United States",
                ShipAddress1 = "St. Louis Marketplace",
                ShipAddress2 = "",
                ShipCity = "Saint Louis",
                ShipPostalCode = "63103",
                ShipStateProvince = "Missouri",
                ShipCountryRegion = "United States",
                CustPhone = "470-555-0171",
                CustFirstName = "Scott",
                CustLastName = "MacDonald"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43665",
                Store = "Latest Sports Equipment",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "David",
                SalesLastName = "Campbell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16588191572",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "4251 First Avenue",
                BillAddress2 = "",
                BillCity = "Seattle",
                BillPostalCode = "98104",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "4251 First Avenue",
                ShipAddress2 = "",
                ShipCity = "Seattle",
                ShipPostalCode = "98104",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "340-555-0131",
                CustFirstName = "Richard",
                CustLastName = "Bready"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43664",
                Store = "Capable Sales and Service",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO16617121983",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "765 Delridge Way Sw",
                BillAddress2 = "",
                BillCity = "Seattle",
                BillPostalCode = "98104",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "765 Delridge Way Sw",
                ShipAddress2 = "",
                ShipCity = "Seattle",
                ShipPostalCode = "98104",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "928-555-0117",
                CustFirstName = "Sandeep",
                CustLastName = "Katyal"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43663",
                Store = "World Bike Discount Store",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18009186470",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "3065 Santa Margarita Parkway",
                BillAddress2 = "",
                BillCity = "Trabuco Canyon",
                BillPostalCode = "92679",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "3065 Santa Margarita Parkway",
                ShipAddress2 = "",
                ShipCity = "Trabuco Canyon",
                ShipPostalCode = "92679",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "992-555-0111",
                CustFirstName = "Jimmy",
                CustLastName = "Bischoff"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43662",
                Store = "Health Spa, Limited",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18444174044",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "2500 University Avenue",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V5",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "2500 University Avenue",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V5",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "431-555-0153",
                CustFirstName = "Robin",
                CustLastName = "McGuigan"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43661",
                Store = "Original Bicycle Supply Company",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18473189620",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "2573 Dufferin Street",
                BillAddress2 = "",
                BillCity = "Toronto",
                BillPostalCode = "M4B 1V5",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "2573 Dufferin Street",
                ShipAddress2 = "",
                ShipCity = "Toronto",
                ShipPostalCode = "M4B 1V5",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "185-555-0190",
                CustFirstName = "Jauna",
                CustLastName = "Elson"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43660",
                Store = "Pedals Warehouse",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO18850127500",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "6055 Shawnee Industrial Way",
                BillAddress2 = "",
                BillCity = "Suwanee",
                BillPostalCode = "30024",
                BillStateProvince = "Georgia",
                BillCountryRegion = "United States",
                ShipAddress1 = "6055 Shawnee Industrial Way",
                ShipAddress2 = "",
                ShipCity = "Suwanee",
                ShipPostalCode = "30024",
                ShipStateProvince = "Georgia",
                ShipCountryRegion = "United States",
                CustPhone = "987-555-0126",
                CustFirstName = "Takiko",
                CustLastName = "Collins"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43659",
                Store = "Better Bike Shop",
                OrderDate = new DateTime(2001, 7, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO522145787",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "42525 Austell Road",
                BillAddress2 = "",
                BillCity = "Austell",
                BillPostalCode = "30106",
                BillStateProvince = "Georgia",
                BillCountryRegion = "United States",
                ShipAddress1 = "42525 Austell Road",
                ShipAddress2 = "",
                ShipCity = "Austell",
                ShipPostalCode = "30106",
                ShipStateProvince = "Georgia",
                ShipCountryRegion = "United States",
                CustPhone = "967-555-0129",
                CustFirstName = "James",
                CustLastName = "Hendergart"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43875",
                Store = "Tread Industries",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12586178184",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25631 Florida Mall Ave.",
                BillAddress2 = "",
                BillCity = "Orlando",
                BillPostalCode = "32804",
                BillStateProvince = "Florida",
                BillCountryRegion = "United States",
                ShipAddress1 = "9707 Coldwater Drive",
                ShipAddress2 = "",
                ShipCity = "Orlando",
                ShipPostalCode = "32804",
                ShipStateProvince = "Florida",
                ShipCountryRegion = "United States",
                CustPhone = "965-555-0112",
                CustFirstName = "Joseph",
                CustLastName = "Cantoni"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43876",
                Store = "Active Transport Inc.",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO12006119347",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "225200 Miles Ave.",
                BillAddress2 = "",
                BillCity = "North Randall",
                BillPostalCode = "44128",
                BillStateProvince = "Ohio",
                BillCountryRegion = "United States",
                ShipAddress1 = "225200 Miles Ave.",
                ShipAddress2 = "",
                ShipCity = "North Randall",
                ShipPostalCode = "44128",
                ShipStateProvince = "Ohio",
                ShipCountryRegion = "United States",
                CustPhone = "526-555-0155",
                CustFirstName = "Lynn",
                CustLastName = "Tsoflias"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43877",
                Store = "Outdoor Sports Supply",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO11919119101",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Great Northwestern",
                BillAddress2 = "",
                BillCity = "North Bend",
                BillPostalCode = "98045",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "Great Northwestern",
                ShipAddress2 = "",
                ShipCity = "North Bend",
                ShipPostalCode = "98045",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "107-555-0132",
                CustFirstName = "Margaret",
                CustLastName = "Krupka"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43878",
                Store = "Only Bikes and Accessories",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO11716136854",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "123 Union Square South",
                BillAddress2 = "",
                BillCity = "New York",
                BillPostalCode = "10007",
                BillStateProvince = "New York",
                BillCountryRegion = "United States",
                ShipAddress1 = "123 Union Square South",
                ShipAddress2 = "",
                ShipCity = "New York",
                ShipPostalCode = "10007",
                ShipStateProvince = "New York",
                ShipCountryRegion = "United States",
                CustPhone = "539-555-0142",
                CustFirstName = "Gina",
                CustLastName = "Clark"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43879",
                Store = "Designated Distributors",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO11600128380",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "254 Colonnade Road",
                BillAddress2 = "",
                BillCity = "Nepean",
                BillPostalCode = "K2J 2W5",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "254 Colonnade Road",
                ShipAddress2 = "",
                ShipCity = "Nepean",
                ShipPostalCode = "K2J 2W5",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "699-555-0155",
                CustFirstName = "Cecil",
                CustLastName = "Allison"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43880",
                Store = "Primary Bike Distributors",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO11020127453",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "965 De La Gauchetiere West",
                BillAddress2 = "",
                BillCity = "Montreal",
                BillPostalCode = "H1Y 2H8",
                BillStateProvince = "Quebec",
                BillCountryRegion = "Canada",
                ShipAddress1 = "965 De La Gauchetiere West",
                ShipAddress2 = "",
                ShipCity = "Montreal",
                ShipPostalCode = "H1Y 2H8",
                ShipStateProvince = "Quebec",
                ShipCountryRegion = "Canada",
                CustPhone = "495-555-0161",
                CustFirstName = "Brian",
                CustLastName = "Goldstein"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43881",
                Store = "Great Bicycle Supply",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10759119626",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "455 256th St.",
                BillAddress2 = "",
                BillCity = "Moline",
                BillPostalCode = "61265",
                BillStateProvince = "Illinois",
                BillCountryRegion = "United States",
                ShipAddress1 = "455 256th St.",
                ShipAddress2 = "",
                ShipCity = "Moline",
                ShipPostalCode = "61265",
                ShipStateProvince = "Illinois",
                ShipCountryRegion = "United States",
                CustPhone = "810-555-0160",
                CustFirstName = "Ranjit",
                CustLastName = "Varkey Chudukatil"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43882",
                Store = "Scratch-Resistant Finishes Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10469165208",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "5700 Explorer Drive",
                BillAddress2 = "",
                BillCity = "Mississauga",
                BillPostalCode = "L4W 5J3",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "5700 Explorer Drive",
                ShipAddress2 = "",
                ShipCity = "Mississauga",
                ShipPostalCode = "L4W 5J3",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "156-555-0111",
                CustFirstName = "John",
                CustLastName = "Berger"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43883",
                Store = "Lease-a-Bike Shop",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Michael",
                SalesLastName = "Blythe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10121175623",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Connecticut Post Mall",
                BillAddress2 = "",
                BillCity = "Milford",
                BillPostalCode = "06460",
                BillStateProvince = "Connecticut",
                BillCountryRegion = "United States",
                ShipAddress1 = "Connecticut Post Mall",
                ShipAddress2 = "",
                ShipCity = "Milford",
                ShipPostalCode = "06460",
                ShipStateProvince = "Connecticut",
                ShipCountryRegion = "United States",
                CustPhone = "158-555-0188",
                CustFirstName = "Bernard",
                CustLastName = "Duerr"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43884",
                Store = "Hardware Components",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO10440182311",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "City Center",
                BillAddress2 = "",
                BillCity = "Minneapolis",
                BillPostalCode = "55402",
                BillStateProvince = "Minnesota",
                BillCountryRegion = "United States",
                ShipAddress1 = "99 Front Street",
                ShipAddress2 = "",
                ShipCity = "Minneapolis",
                ShipPostalCode = "55402",
                ShipStateProvince = "Minnesota",
                ShipCountryRegion = "United States",
                CustPhone = "153-555-0195",
                CustFirstName = "Phyllis",
                CustLastName = "Huntsman"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43885",
                Store = "Basic Sports Equipment",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO609186449",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "3250 Baldwin Park Blvd",
                BillAddress2 = "",
                BillCity = "Baldwin Park",
                BillPostalCode = "91706",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "3250 Baldwin Park Blvd",
                ShipAddress2 = "",
                ShipCity = "Baldwin Park",
                ShipPostalCode = "91706",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "768-555-0125",
                CustFirstName = "Garth",
                CustLastName = "Fort"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43886",
                Store = "Finer Riding Supplies",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO1827149671",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "#9900 2700 Production Way",
                BillAddress2 = "",
                BillCity = "Burnaby",
                BillPostalCode = "V5A 4X1",
                BillStateProvince = "British Columbia",
                BillCountryRegion = "Canada",
                ShipAddress1 = "#9900 2700 Production Way",
                ShipAddress2 = "",
                ShipCity = "Burnaby",
                ShipPostalCode = "V5A 4X1",
                ShipStateProvince = "British Columbia",
                ShipCountryRegion = "Canada",
                CustPhone = "767-555-0151",
                CustFirstName = "Jacob",
                CustLastName = "Dean"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43887",
                Store = "New Bikes Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO1276169981",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Hilton Head Factory Outlets No. 25",
                BillAddress2 = "",
                BillCity = "Bluffton",
                BillPostalCode = "29910",
                BillStateProvince = "South Carolina",
                BillCountryRegion = "United States",
                ShipAddress1 = "Hilton Head Factory Outlets No. 25",
                ShipAddress2 = "",
                ShipCity = "Bluffton",
                ShipPostalCode = "29910",
                ShipStateProvince = "South Carolina",
                ShipCountryRegion = "United States",
                CustPhone = "453-555-0165",
                CustFirstName = "Ronald",
                CustLastName = "Adina"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43888",
                Store = "Wholesale Parts",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2088113013",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "655-4th Ave S.W.",
                BillAddress2 = "",
                BillCity = "Calgary",
                BillPostalCode = "T2P 2G8",
                BillStateProvince = "Alberta",
                BillCountryRegion = "Canada",
                ShipAddress1 = "655-4th Ave S.W.",
                ShipAddress2 = "",
                ShipCity = "Calgary",
                ShipPostalCode = "T2P 2G8",
                ShipStateProvince = "Alberta",
                ShipCountryRegion = "Canada",
                CustPhone = "674-555-0187",
                CustFirstName = "Derek",
                CustLastName = "Graham"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43889",
                Store = "General Department Stores",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2030112412",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "253131 Lake Frasier Drive, Office No. 2",
                BillAddress2 = "",
                BillCity = "Calgary",
                BillPostalCode = "T2P 2G8",
                BillStateProvince = "Alberta",
                BillCountryRegion = "Canada",
                ShipAddress1 = "253131 Lake Frasier Drive, Office No. 2",
                ShipAddress2 = "",
                ShipCity = "Calgary",
                ShipPostalCode = "T2P 2G8",
                ShipStateProvince = "Alberta",
                ShipCountryRegion = "Canada",
                CustPhone = "143-555-0129",
                CustFirstName = "Kari",
                CustLastName = "Hensien"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43890",
                Store = "Serious Cycles",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2146115360",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Suite 99320 255 - 510th Avenue S.W.",
                BillAddress2 = "",
                BillCity = "Calgary",
                BillPostalCode = "T2P 2G8",
                BillStateProvince = "Alberta",
                BillCountryRegion = "Canada",
                ShipAddress1 = "Suite 99320 255 - 510th Avenue S.W.",
                ShipAddress2 = "",
                ShipCity = "Calgary",
                ShipPostalCode = "T2P 2G8",
                ShipStateProvince = "Alberta",
                ShipCountryRegion = "Canada",
                CustPhone = "614-555-0134",
                CustFirstName = "Maxwell",
                CustLastName = "Amland"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43891",
                Store = "Cross-Country Riding Supplies",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2726163521",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Station E",
                BillAddress2 = "",
                BillCity = "Chalk Riber",
                BillPostalCode = "K0J 1J0",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "Station E",
                ShipAddress2 = "",
                ShipCity = "Chalk Riber",
                ShipPostalCode = "K0J 1J0",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "344-555-0144",
                CustFirstName = "Bryan",
                CustLastName = "Hamilton"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43892",
                Store = "Farthermost Bike Shop",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Shu",
                SalesLastName = "Ito",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2523117473",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "99000 S. Avalon Blvd. Suite 750",
                BillAddress2 = "",
                BillCity = "Carson",
                BillPostalCode = "90746",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "99000 S. Avalon Blvd. Suite 750",
                ShipAddress2 = "",
                ShipCity = "Carson",
                ShipPostalCode = "90746",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "156-555-0187",
                CustFirstName = "Blaine",
                CustLastName = "Dockter"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43893",
                Store = "Acceptable Sales & Service",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "José",
                SalesLastName = "Saraiva",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2204129382",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "6400, 888 - 3rd Avenue",
                BillAddress2 = "",
                BillCity = "Calgary",
                BillPostalCode = "T2P 2G8",
                BillStateProvince = "Alberta",
                BillCountryRegion = "Canada",
                ShipAddress1 = "6400, 888 - 3rd Avenue",
                ShipAddress2 = "",
                ShipCity = "Calgary",
                ShipPostalCode = "T2P 2G8",
                ShipStateProvince = "Alberta",
                ShipCountryRegion = "Canada",
                CustPhone = "656-555-0173",
                CustFirstName = "Elizabeth",
                CustLastName = "Keyser"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43894",
                Store = "Some Discount Store",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2958194987",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Frontier Mall",
                BillAddress2 = "",
                BillCity = "Cheyenne",
                BillPostalCode = "82001",
                BillStateProvince = "Wyoming",
                BillCountryRegion = "United States",
                ShipAddress1 = "Frontier Mall",
                ShipAddress2 = "",
                ShipCity = "Cheyenne",
                ShipPostalCode = "82001",
                ShipStateProvince = "Wyoming",
                ShipCountryRegion = "United States",
                CustPhone = "158-555-0123",
                CustFirstName = "Nkenge",
                CustLastName = "McLin"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43895",
                Store = "Vast Bike Sales and Rental",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Pamela",
                SalesLastName = "Ansman-Wolfe",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO2900121738",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Lewis County Mall",
                BillAddress2 = "",
                BillCity = "Chehalis",
                BillPostalCode = "98532",
                BillStateProvince = "Washington",
                BillCountryRegion = "United States",
                ShipAddress1 = "Lewis County Mall",
                ShipAddress2 = "",
                ShipCity = "Chehalis",
                ShipPostalCode = "98532",
                ShipStateProvince = "Washington",
                ShipCountryRegion = "United States",
                CustPhone = "554-555-0124",
                CustFirstName = "Twanna",
                CustLastName = "Evans"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43896",
                Store = "Rental Bikes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO3857154341",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "99828 Routh Street, Suite 825",
                BillAddress2 = "",
                BillCity = "Dallas",
                BillPostalCode = "75201",
                BillStateProvince = "Texas",
                BillCountryRegion = "United States",
                ShipAddress1 = "99828 Routh Street, Suite 825",
                ShipAddress2 = "",
                ShipCity = "Dallas",
                ShipPostalCode = "75201",
                ShipStateProvince = "Texas",
                ShipCountryRegion = "United States",
                CustPhone = "367-555-0124",
                CustFirstName = "Richard",
                CustLastName = "Irwin"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43897",
                Store = "Resale Services",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO3799116239",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Fox Hills",
                BillAddress2 = "",
                BillCity = "Culver City",
                BillPostalCode = "90232",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "Fox Hills",
                ShipAddress2 = "",
                ShipCity = "Culver City",
                ShipPostalCode = "90232",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "226-555-0146",
                CustFirstName = "Thomas",
                CustLastName = "Armstrong"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43898",
                Store = "Rewarding Activities Company",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Garrett",
                SalesLastName = "Vargas",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO4901196283",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25575 The Queensway",
                BillAddress2 = "",
                BillCity = "Etobicoke",
                BillPostalCode = "M9W 3P3",
                BillStateProvince = "Ontario",
                BillCountryRegion = "Canada",
                ShipAddress1 = "25575 The Queensway",
                ShipAddress2 = "",
                ShipCity = "Etobicoke",
                ShipPostalCode = "M9W 3P3",
                ShipStateProvince = "Ontario",
                ShipCountryRegion = "Canada",
                CustPhone = "752-555-0185",
                CustFirstName = "Della",
                CustLastName = "Demott Jr"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43899",
                Store = "District Mall",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5191115657",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25095 W. Florissant",
                BillAddress2 = "",
                BillCity = "Ferguson",
                BillPostalCode = "63135",
                BillStateProvince = "Missouri",
                BillCountryRegion = "United States",
                ShipAddress1 = "25095 W. Florissant",
                ShipAddress2 = "",
                ShipCity = "Ferguson",
                ShipPostalCode = "63135",
                ShipStateProvince = "Missouri",
                ShipCountryRegion = "United States",
                CustPhone = "249-555-0179",
                CustFirstName = "Imtiaz",
                CustLastName = "Khan"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43900",
                Store = "Consolidated Sales",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5568199700",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Carolina Factory Shops",
                BillAddress2 = "",
                BillCity = "Gaffney",
                BillPostalCode = "29340",
                BillStateProvince = "South Carolina",
                BillCountryRegion = "United States",
                ShipAddress1 = "Carolina Factory Shops",
                ShipAddress2 = "",
                ShipCity = "Gaffney",
                ShipPostalCode = "29340",
                ShipStateProvince = "South Carolina",
                ShipCountryRegion = "United States",
                CustPhone = "762-555-0110",
                CustFirstName = "Samuel",
                CustLastName = "Johnson"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43901",
                Store = "Sturdy Toys",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Linda",
                SalesLastName = "Mitchell",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5684189260",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Pacific West Outlet",
                BillAddress2 = "",
                BillCity = "Gilroy",
                BillPostalCode = "95020",
                BillStateProvince = "California",
                BillCountryRegion = "United States",
                ShipAddress1 = "Pacific West Outlet",
                ShipAddress2 = "",
                ShipCity = "Gilroy",
                ShipPostalCode = "95020",
                ShipStateProvince = "California",
                ShipCountryRegion = "United States",
                CustPhone = "330-555-0116",
                CustFirstName = "John",
                CustLastName = "Kelly"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43902",
                Store = "eCommerce Bikes",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5858178400",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Gulfport Factory Shops",
                BillAddress2 = "",
                BillCity = "Gulfport",
                BillPostalCode = "39501",
                BillStateProvince = "Mississippi",
                BillCountryRegion = "United States",
                ShipAddress1 = "Gulfport Factory Shops",
                ShipAddress2 = "",
                ShipCity = "Gulfport",
                ShipPostalCode = "39501",
                ShipStateProvince = "Mississippi",
                ShipCountryRegion = "United States",
                CustPhone = "695-555-0111",
                CustFirstName = "Phyllis",
                CustLastName = "Allen"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43903",
                Store = "Metro Bike Mart",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Tsvi",
                SalesLastName = "Reiter",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO5800178059",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "Po Box 2257",
                BillAddress2 = "",
                BillCity = "Greensboro",
                BillPostalCode = "27412",
                BillStateProvince = "North Carolina",
                BillCountryRegion = "United States",
                ShipAddress1 = "Po Box 2257",
                ShipAddress2 = "",
                ShipCity = "Greensboro",
                ShipPostalCode = "27412",
                ShipStateProvince = "North Carolina",
                ShipCountryRegion = "United States",
                CustPhone = "565-555-0181",
                CustFirstName = "Helen",
                CustLastName = "Lutes"
            };
            datas.Add(data);
            data = new Customers()
            {
                SalesOrderNumber = "SO43904",
                Store = "Swift Cycles",
                OrderDate = new DateTime(2001, 8, 1, 0, 0, 0),
                SalesFirstName = "Jillian",
                SalesLastName = "Carson",
                SalesTitle = "Sales Representative",
                PurchaseOrderNumber = "PO6351158788",
                ShipMethod = "CARGO TRANSPORT 5",
                BillAddress1 = "25500 Old Spanish Trail",
                BillAddress2 = "",
                BillCity = "Houston",
                BillPostalCode = "77003",
                BillStateProvince = "Texas",
                BillCountryRegion = "United States",
                ShipAddress1 = "25500 Old Spanish Trail",
                ShipAddress2 = "",
                ShipCity = "Houston",
                ShipPostalCode = "77003",
                ShipStateProvince = "Texas",
                ShipCountryRegion = "United States",
                CustPhone = "184-555-0187",
                CustFirstName = "Sunil",
                CustLastName = "Uppal"
            };
            datas.Add(data);
            return datas;
        }
    }

    public class MasterDetails
    {
        public int ProductCategory_ProductCategoryID { get; set; }
        public string ProductCategory_Name { get; set; }
        public int ProductSubcategory_ProductCategoryID { get; set; }
        public int ProductSubcategory_ProductSubcategoryID { get; set; }
        public string ProductSubcategory_Name { get; set; }
        public string Color { get; set; }
        public int SafetyStockLevel { get; set; }
        public double StandardCost { get; set; }
        public double ListPrice { get; set; }

        public static List<MasterDetails> GetData()
        {
            List<MasterDetails> masterDet = new List<MasterDetails>();
            MasterDetails masetr = null;

            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 1059.3100,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 1059.3100,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 31,
                ProductSubcategory_Name = "Helmets",
                Color = "Red",
                SafetyStockLevel = 4,
                StandardCost = 13.0863,
                ListPrice = 34.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 31,
                ProductSubcategory_Name = "Helmets",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 13.0863,
                ListPrice = 34.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 23,
                ProductSubcategory_Name = "Socks",
                Color = "White",
                SafetyStockLevel = 4,
                StandardCost = 3.3963,
                ListPrice = 9.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 23,
                ProductSubcategory_Name = "Socks",
                Color = "White",
                SafetyStockLevel = 4,
                StandardCost = 3.3963,
                ListPrice = 9.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 31,
                ProductSubcategory_Name = "Helmets",
                Color = "Blue",
                SafetyStockLevel = 4,
                StandardCost = 13.0863,
                ListPrice = 34.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 19,
                ProductSubcategory_Name = "Caps",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 6.9223,
                ListPrice = 8.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 38.4923,
                ListPrice = 49.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 38.4923,
                ListPrice = 49.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 38.4923,
                ListPrice = 49.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 38.4923,
                ListPrice = 49.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 204.6251,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 204.6251,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 204.6251,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 187.1571,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 187.1571,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 187.1571,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 187.1571,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 187.1571,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 187.1571,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 352.1394,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 352.1394,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 352.1394,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 352.1394,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Red",
                SafetyStockLevel = 500,
                StandardCost = 352.1394,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 204.6251,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 204.6251,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 204.6251,
                ListPrice = 337.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 747.2002,
                ListPrice = 1364.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 706.8110,
                ListPrice = 1364.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 706.8110,
                ListPrice = 1364.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 747.2002,
                ListPrice = 1364.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 739.0410,
                ListPrice = 1349.6000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 699.0928,
                ListPrice = 1349.6000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 699.0928,
                ListPrice = 1349.6000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 739.0410,
                ListPrice = 1349.6000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 739.0410,
                ListPrice = 1349.6000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 747.2002,
                ListPrice = 1364.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 2171.2942,
                ListPrice = 3578.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 2171.2942,
                ListPrice = 3578.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 2171.2942,
                ListPrice = 3578.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 2171.2942,
                ListPrice = 3578.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 2171.2942,
                ListPrice = 3578.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 884.7083,
                ListPrice = 1457.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 884.7083,
                ListPrice = 1457.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 884.7083,
                ListPrice = 1457.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 884.7083,
                ListPrice = 1457.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 884.7083,
                ListPrice = 1457.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 486.7066,
                ListPrice = 782.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1912.1544,
                ListPrice = 3399.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1912.1544,
                ListPrice = 3399.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1912.1544,
                ListPrice = 3399.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1912.1544,
                ListPrice = 3399.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1898.0944,
                ListPrice = 3374.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1898.0944,
                ListPrice = 3374.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1898.0944,
                ListPrice = 3374.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1898.0944,
                ListPrice = 3374.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1265.6195,
                ListPrice = 2319.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1265.6195,
                ListPrice = 2319.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 1265.6195,
                ListPrice = 2319.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1251.9813,
                ListPrice = 2294.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1251.9813,
                ListPrice = 2294.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1251.9813,
                ListPrice = 2294.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 598.4354,
                ListPrice = 1079.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 598.4354,
                ListPrice = 1079.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 598.4354,
                ListPrice = 1079.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 598.4354,
                ListPrice = 1079.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 1518.7864,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 1518.7864,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 1518.7864,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Red",
                SafetyStockLevel = 100,
                StandardCost = 1554.9479,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1554.9479,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1554.9479,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1554.9479,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 1554.9479,
                ListPrice = 2443.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 713.0798,
                ListPrice = 1120.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 713.0798,
                ListPrice = 1120.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 713.0798,
                ListPrice = 1120.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 713.0798,
                ListPrice = 1120.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 713.0798,
                ListPrice = 1120.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 10,
                ProductSubcategory_Name = "Forks",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 65.8097,
                ListPrice = 148.2200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 10,
                ProductSubcategory_Name = "Forks",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 77.9176,
                ListPrice = 175.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 10,
                ProductSubcategory_Name = "Forks",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 101.8936,
                ListPrice = 229.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 11,
                ProductSubcategory_Name = "Headsets",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 15.1848,
                ListPrice = 34.2000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 11,
                ProductSubcategory_Name = "Headsets",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 45.4168,
                ListPrice = 102.2900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 11,
                ProductSubcategory_Name = "Headsets",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 55.3801,
                ListPrice = 124.7300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 19.7758,
                ListPrice = 44.5400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 27.4925,
                ListPrice = 61.9200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 53.3999,
                ListPrice = 120.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 19.7758,
                ListPrice = 44.5400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 27.4925,
                ListPrice = 61.9200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 53.3999,
                ListPrice = 120.2700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 185.8193,
                ListPrice = 348.7600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 26.9708,
                ListPrice = 60.7450
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 92.8071,
                ListPrice = 209.0250
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 133.2955,
                ListPrice = 300.2150
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 37.9909,
                ListPrice = 85.5650
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 110.2829,
                ListPrice = 248.3850
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 146.5466,
                ListPrice = 330.0600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 96.7964,
                ListPrice = 218.0100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 360.9428,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 38.9588,
                ListPrice = 87.7450
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 104.7951,
                ListPrice = 236.0250
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 145.2835,
                ListPrice = 327.2150
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 49.9789,
                ListPrice = 112.5650
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 122.2709,
                ListPrice = 275.3850
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 158.5346,
                ListPrice = 357.0600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 17,
                ProductSubcategory_Name = "Wheels",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 108.7844,
                ListPrice = 245.0100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 185.8193,
                ListPrice = 348.7600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 185.8193,
                ListPrice = 348.7600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 185.8193,
                ListPrice = 348.7600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 360.9428,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 360.9428,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 360.9428,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 360.9428,
                ListPrice = 594.8300
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 14,
                ProductSubcategory_Name = "Road Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 868.6342,
                ListPrice = 1431.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 24.7459,
                ListPrice = 59.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 35,
                ProductSubcategory_Name = "Panniers",
                Color = "Grey",
                SafetyStockLevel = 4,
                StandardCost = 51.5625,
                ListPrice = 125.0000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 34,
                ProductSubcategory_Name = "Locks",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 10.3125,
                ListPrice = 25.0000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 36,
                ProductSubcategory_Name = "Pumps",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 8.2459,
                ListPrice = 19.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 36,
                ProductSubcategory_Name = "Pumps",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 10.3084,
                ListPrice = 24.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 33,
                ProductSubcategory_Name = "Lights",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 5.7709,
                ListPrice = 13.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 33,
                ProductSubcategory_Name = "Lights",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 14.4334,
                ListPrice = 34.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 33,
                ProductSubcategory_Name = "Lights",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 18.5584,
                ListPrice = 44.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 24.7459,
                ListPrice = 59.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 24.7459,
                ListPrice = 59.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 24.7459,
                ListPrice = 59.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 24,
                ProductSubcategory_Name = "Tights",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 30.9334,
                ListPrice = 74.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 24,
                ProductSubcategory_Name = "Tights",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 30.9334,
                ListPrice = 74.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 24,
                ProductSubcategory_Name = "Tights",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 30.9334,
                ListPrice = 74.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 18,
                ProductSubcategory_Name = "Bib-Shorts",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 37.1209,
                ListPrice = 89.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 18,
                ProductSubcategory_Name = "Bib-Shorts",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 37.1209,
                ListPrice = 89.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 18,
                ProductSubcategory_Name = "Bib-Shorts",
                Color = "Multi",
                SafetyStockLevel = 4,
                StandardCost = 37.1209,
                ListPrice = 89.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 20,
                ProductSubcategory_Name = "Gloves",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 9.1593,
                ListPrice = 24.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 20,
                ProductSubcategory_Name = "Gloves",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 9.1593,
                ListPrice = 24.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 20,
                ProductSubcategory_Name = "Gloves",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 9.1593,
                ListPrice = 24.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 20,
                ProductSubcategory_Name = "Gloves",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 15.6709,
                ListPrice = 37.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 20,
                ProductSubcategory_Name = "Gloves",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 15.6709,
                ListPrice = 37.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 20,
                ProductSubcategory_Name = "Gloves",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 15.6709,
                ListPrice = 37.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 25,
                ProductSubcategory_Name = "Vests",
                Color = "Blue",
                SafetyStockLevel = 4,
                StandardCost = 23.7490,
                ListPrice = 63.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 25,
                ProductSubcategory_Name = "Vests",
                Color = "Blue",
                SafetyStockLevel = 4,
                StandardCost = 23.7490,
                ListPrice = 63.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 25,
                ProductSubcategory_Name = "Vests",
                Color = "Blue",
                SafetyStockLevel = 4,
                StandardCost = 23.7490,
                ListPrice = 63.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 26.1763,
                ListPrice = 69.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 26.1763,
                ListPrice = 69.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 22,
                ProductSubcategory_Name = "Shorts",
                Color = "Black",
                SafetyStockLevel = 4,
                StandardCost = 26.1763,
                ListPrice = 69.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 28,
                ProductSubcategory_Name = "Bottles and Cages",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 1.8663,
                ListPrice = 4.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 28,
                ProductSubcategory_Name = "Bottles and Cages",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 3.7363,
                ListPrice = 9.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 28,
                ProductSubcategory_Name = "Bottles and Cages",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 3.3623,
                ListPrice = 8.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 0.8565,
                ListPrice = 2.2900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 23,
                ProductSubcategory_Name = "Socks",
                Color = "White",
                SafetyStockLevel = 4,
                StandardCost = 3.3623,
                ListPrice = 8.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 23,
                ProductSubcategory_Name = "Socks",
                Color = "White",
                SafetyStockLevel = 4,
                StandardCost = 3.3623,
                ListPrice = 8.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 26,
                ProductSubcategory_Name = "Bike Racks",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 44.8800,
                ListPrice = 120.0000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 29,
                ProductSubcategory_Name = "Cleaners",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 2.9733,
                ListPrice = 7.9500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 30,
                ProductSubcategory_Name = "Fenders",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 8.2205,
                ListPrice = 21.9800
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 27,
                ProductSubcategory_Name = "Bike Stands",
                Color = "",
                SafetyStockLevel = 4,
                StandardCost = 59.4660,
                ListPrice = 159.0000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 32,
                ProductSubcategory_Name = "Hydration Packs",
                Color = "Silver",
                SafetyStockLevel = 4,
                StandardCost = 20.5663,
                ListPrice = 54.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Yellow",
                SafetyStockLevel = 4,
                StandardCost = 41.5723,
                ListPrice = 53.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Yellow",
                SafetyStockLevel = 4,
                StandardCost = 41.5723,
                ListPrice = 53.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Yellow",
                SafetyStockLevel = 4,
                StandardCost = 41.5723,
                ListPrice = 53.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 3,
                ProductCategory_Name = "Clothing",
                ProductSubcategory_ProductCategoryID = 3,
                ProductSubcategory_ProductSubcategoryID = 21,
                ProductSubcategory_Name = "Jerseys",
                Color = "Yellow",
                SafetyStockLevel = 4,
                StandardCost = 41.5723,
                ListPrice = 53.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 601.7437,
                ListPrice = 1003.9100
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 9,
                ProductSubcategory_Name = "Derailleurs",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 53.9282,
                ListPrice = 121.4600
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Yellow",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 16,
                ProductSubcategory_Name = "Touring Frames",
                Color = "Blue",
                SafetyStockLevel = 500,
                StandardCost = 199.8519,
                ListPrice = 333.4200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 199.3757,
                ListPrice = 364.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 199.3757,
                ListPrice = 364.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 199.3757,
                ListPrice = 364.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 6,
                ProductSubcategory_Name = "Brakes",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 47.2860,
                ListPrice = 106.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 12.0413,
                ListPrice = 27.1200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 17.3782,
                ListPrice = 39.1400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 23.3722,
                ListPrice = 52.6400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 12.0413,
                ListPrice = 27.1200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 17.3782,
                ListPrice = 39.1400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 23.3722,
                ListPrice = 52.6400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 12.0413,
                ListPrice = 27.1200
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 17.3782,
                ListPrice = 39.1400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 15,
                ProductSubcategory_Name = "Saddles",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 23.3722,
                ListPrice = 52.6400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 144.5938,
                ListPrice = 264.0500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 144.5938,
                ListPrice = 264.0500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 144.5938,
                ListPrice = 264.0500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 144.5938,
                ListPrice = 264.0500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 1.8663,
                ListPrice = 4.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 1.4923,
                ListPrice = 3.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 1.8663,
                ListPrice = 4.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 136.7850,
                ListPrice = 249.7900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 136.7850,
                ListPrice = 249.7900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 136.7850,
                ListPrice = 249.7900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 136.7850,
                ListPrice = 249.7900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 9.3463,
                ListPrice = 24.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 11.2163,
                ListPrice = 29.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 13.0900,
                ListPrice = 35.0000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 8.0373,
                ListPrice = 21.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 9.3463,
                ListPrice = 24.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 12.1924,
                ListPrice = 32.6000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 4,
                ProductCategory_Name = "Accessories",
                ProductSubcategory_ProductCategoryID = 4,
                ProductSubcategory_ProductSubcategoryID = 37,
                ProductSubcategory_Name = "Tires and Tubes",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 10.8423,
                ListPrice = 28.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 17.9776,
                ListPrice = 40.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 27.5680,
                ListPrice = 62.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 35.9596,
                ListPrice = 80.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 17.9776,
                ListPrice = 40.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 27.5680,
                ListPrice = 62.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 35.9596,
                ListPrice = 80.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 13,
                ProductSubcategory_Name = "Pedals",
                Color = "Silver/Black",
                SafetyStockLevel = 500,
                StandardCost = 35.9596,
                ListPrice = 80.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 199.3757,
                ListPrice = 364.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 136.7850,
                ListPrice = 249.7900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 12,
                ProductSubcategory_Name = "Mountain Frames",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 144.5938,
                ListPrice = 264.0500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 9,
                ProductSubcategory_Name = "Derailleurs",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 40.6216,
                ListPrice = 91.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 20.4640,
                ListPrice = 46.0900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 4,
                ProductSubcategory_Name = "Handlebars",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 40.6571,
                ListPrice = 91.5700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 6,
                ProductSubcategory_Name = "Brakes",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 47.2860,
                ListPrice = 106.5000
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 8,
                ProductSubcategory_Name = "Cranksets",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 77.9176,
                ListPrice = 175.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 8,
                ProductSubcategory_Name = "Cranksets",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 113.8816,
                ListPrice = 256.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 8,
                ProductSubcategory_Name = "Cranksets",
                Color = "Black",
                SafetyStockLevel = 500,
                StandardCost = 179.8156,
                ListPrice = 404.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 7,
                ProductSubcategory_Name = "Chains",
                Color = "Silver",
                SafetyStockLevel = 500,
                StandardCost = 8.9866,
                ListPrice = 20.2400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 755.1508,
                ListPrice = 1214.8500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 1481.9379,
                ListPrice = 2384.0700
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 755.1508,
                ListPrice = 1214.8500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 755.1508,
                ListPrice = 1214.8500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 755.1508,
                ListPrice = 1214.8500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1082.5100,
                ListPrice = 1700.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1082.5100,
                ListPrice = 1700.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1082.5100,
                ListPrice = 1700.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Yellow",
                SafetyStockLevel = 100,
                StandardCost = 1082.5100,
                ListPrice = 1700.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 343.6496,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 3,
                ProductSubcategory_Name = "Touring Bikes",
                Color = "Blue",
                SafetyStockLevel = 100,
                StandardCost = 461.4448,
                ListPrice = 742.3500
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 419.7784,
                ListPrice = 769.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 419.7784,
                ListPrice = 769.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 419.7784,
                ListPrice = 769.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 419.7784,
                ListPrice = 769.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 308.2179,
                ListPrice = 564.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 308.2179,
                ListPrice = 564.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 308.2179,
                ListPrice = 564.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 308.2179,
                ListPrice = 564.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Silver",
                SafetyStockLevel = 100,
                StandardCost = 308.2179,
                ListPrice = 564.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 294.5797,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 294.5797,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 294.5797,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 294.5797,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 1,
                ProductSubcategory_Name = "Mountain Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 294.5797,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 5,
                ProductSubcategory_Name = "Bottom Brackets",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 23.9716,
                ListPrice = 53.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 5,
                ProductSubcategory_Name = "Bottom Brackets",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 44.9506,
                ListPrice = 101.2400
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 2,
                ProductCategory_Name = "Components",
                ProductSubcategory_ProductCategoryID = 2,
                ProductSubcategory_ProductSubcategoryID = 5,
                ProductSubcategory_Name = "Bottom Brackets",
                Color = "",
                SafetyStockLevel = 500,
                StandardCost = 53.9416,
                ListPrice = 121.4900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 343.6496,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 343.6496,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            masetr = new MasterDetails()
            {
                ProductCategory_ProductCategoryID = 1,
                ProductCategory_Name = "Bikes",
                ProductSubcategory_ProductCategoryID = 1,
                ProductSubcategory_ProductSubcategoryID = 2,
                ProductSubcategory_Name = "Road Bikes",
                Color = "Black",
                SafetyStockLevel = 100,
                StandardCost = 343.6496,
                ListPrice = 539.9900
            };
            masterDet.Add(masetr);
            return masterDet;
        }
    }

    public class StoreSales
    {
        public int SalesOrderID { get; set; }
        public double TotalDue { get; set; }
        public int CustomerID { get; set; }
        public string Store { get; set; }
        public string StateProvinceCode { get; set; }

        public static List<StoreSales> GetData()
        {
            List<StoreSales> sales = new List<StoreSales>();
            StoreSales strSal = null;
            strSal = new StoreSales()
            {
                SalesOrderID = 43659,
                TotalDue = 23153.2339,
                CustomerID = 29825,
                StateProvinceCode = "GA",
                Store = "Better Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43663,
                TotalDue = 472.3108,
                CustomerID = 29565,
                StateProvinceCode = "CA",
                Store = "World Bike Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43673,
                TotalDue = 4216.0258,
                CustomerID = 29844,
                StateProvinceCode = "NH",
                Store = "Seventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43675,
                TotalDue = 6434.0848,
                CustomerID = 29827,
                StateProvinceCode = "MO",
                Store = "First Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43676,
                TotalDue = 15992.7446,
                CustomerID = 29811,
                StateProvinceCode = "VA",
                Store = "Trusted Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43678,
                TotalDue = 11036.3964,
                CustomerID = 29889,
                StateProvinceCode = "CA",
                Store = "Separate Parts Corporation"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43680,
                TotalDue = 12832.9009,
                CustomerID = 29489,
                StateProvinceCode = "CA",
                Store = "Area Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43681,
                TotalDue = 15524.0686,
                CustomerID = 29661,
                StateProvinceCode = "MS",
                Store = "Bike Rims Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43682,
                TotalDue = 4363.7107,
                CustomerID = 29759,
                StateProvinceCode = "MA",
                Store = "Convenient Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43683,
                TotalDue = 48204.0662,
                CustomerID = 29497,
                StateProvinceCode = "WY",
                Store = "Great Bikes "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43684,
                TotalDue = 6301.6258,
                CustomerID = 29912,
                StateProvinceCode = "FL",
                Store = "Daring Rides"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43685,
                TotalDue = 3082.0191,
                CustomerID = 30084,
                StateProvinceCode = "FL",
                Store = "Simple Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43686,
                TotalDue = 3899.6756,
                CustomerID = 29606,
                StateProvinceCode = "WA",
                Store = "Fifth Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43687,
                TotalDue = 1416.9322,
                CustomerID = 29610,
                StateProvinceCode = "OH",
                Store = "Curbside Universe"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43688,
                TotalDue = 14323.1194,
                CustomerID = 29718,
                StateProvinceCode = "IN",
                Store = "Weekend Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43689,
                TotalDue = 38291.2063,
                CustomerID = 29646,
                StateProvinceCode = "TX",
                Store = "Fitness Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43690,
                TotalDue = 1460.6061,
                CustomerID = 29533,
                StateProvinceCode = "MI",
                Store = "Small Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43845,
                TotalDue = 9661.1367,
                CustomerID = 29888,
                StateProvinceCode = "NC",
                Store = "New and Used Bicycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43848,
                TotalDue = 20571.9592,
                CustomerID = 29717,
                StateProvinceCode = "OR",
                Store = "Suburban Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43849,
                TotalDue = 23130.2957,
                CustomerID = 29818,
                StateProvinceCode = "UT",
                Store = "Brakes and Gears"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43851,
                TotalDue = 7638.8584,
                CustomerID = 29509,
                StateProvinceCode = "NH",
                Store = "Retail Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43858,
                TotalDue = 15423.0001,
                CustomerID = 29961,
                StateProvinceCode = "IN",
                Store = "Exotic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43859,
                TotalDue = 4404.1073,
                CustomerID = 29865,
                StateProvinceCode = "CA",
                Store = "Highway Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43860,
                TotalDue = 12381.0798,
                CustomerID = 29773,
                StateProvinceCode = "WA",
                Store = "A Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43861,
                TotalDue = 26346.8927,
                CustomerID = 29749,
                StateProvinceCode = "GA",
                Store = "Qualified Sales and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43862,
                TotalDue = 34922.3602,
                CustomerID = 29945,
                StateProvinceCode = "FL",
                Store = "Unified Sports Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43863,
                TotalDue = 1935.4159,
                CustomerID = 29764,
                StateProvinceCode = "TX",
                Store = "Social Activities Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43864,
                TotalDue = 43335.7219,
                CustomerID = 30056,
                StateProvinceCode = "CA",
                Store = "Sparkling Paint and Finishes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43865,
                TotalDue = 14860.6446,
                CustomerID = 30117,
                StateProvinceCode = "TX",
                Store = "Totes & Baskets Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43866,
                TotalDue = 4589.8732,
                CustomerID = 29571,
                StateProvinceCode = "WA",
                Store = "Moderately-Priced Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43867,
                TotalDue = 36806.4892,
                CustomerID = 29582,
                StateProvinceCode = "WA",
                Store = "Raw Materials Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43869,
                TotalDue = 55408.1581,
                CustomerID = 30107,
                StateProvinceCode = "NV",
                Store = "Permanent Finish Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43870,
                TotalDue = 4859.8668,
                CustomerID = 29675,
                StateProvinceCode = "MA",
                Store = "Wholesale Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43871,
                TotalDue = 10580.0803,
                CustomerID = 30076,
                StateProvinceCode = "CO",
                Store = "Fun Times Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43872,
                TotalDue = 13042.6279,
                CustomerID = 30100,
                StateProvinceCode = "CA",
                Store = "Wire Baskets and Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43873,
                TotalDue = 46465.9531,
                CustomerID = 29703,
                StateProvinceCode = "CA",
                Store = "Preferred Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43874,
                TotalDue = 472.3108,
                CustomerID = 29569,
                StateProvinceCode = "SD",
                Store = "Travel Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43875,
                TotalDue = 137343.2877,
                CustomerID = 29624,
                StateProvinceCode = "FL",
                Store = "Tread Industries"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43876,
                TotalDue = 8036.8834,
                CustomerID = 30091,
                StateProvinceCode = "OH",
                Store = "Active Transport Inc."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43877,
                TotalDue = 23223.5397,
                CustomerID = 29925,
                StateProvinceCode = "WA",
                Store = "Outdoor Sports Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43878,
                TotalDue = 4594.0664,
                CustomerID = 29664,
                StateProvinceCode = "NY",
                Store = "Only Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43881,
                TotalDue = 43706.8175,
                CustomerID = 30111,
                StateProvinceCode = "IL",
                Store = "Great Bicycle Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43883,
                TotalDue = 20634.6499,
                CustomerID = 29724,
                StateProvinceCode = "CT",
                Store = "Lease-a-Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43884,
                TotalDue = 130416.4829,
                CustomerID = 29861,
                StateProvinceCode = "MN",
                Store = "Hardware Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43885,
                TotalDue = 76.1805,
                CustomerID = 29757,
                StateProvinceCode = "CA",
                Store = "Basic Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43887,
                TotalDue = 472.3108,
                CustomerID = 29493,
                StateProvinceCode = "SC",
                Store = "New Bikes Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43892,
                TotalDue = 18627.7044,
                CustomerID = 29716,
                StateProvinceCode = "CA",
                Store = "Farthermost Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43910,
                TotalDue = 21862.8919,
                CustomerID = 29963,
                StateProvinceCode = "TN",
                Store = "Every Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43911,
                TotalDue = 22224.2255,
                CustomerID = 29617,
                StateProvinceCode = "WA",
                Store = "Thorough Parts and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43912,
                TotalDue = 14730.6466,
                CustomerID = 29853,
                StateProvinceCode = "CA",
                Store = "Affordable Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43913,
                TotalDue = 41347.1129,
                CustomerID = 29774,
                StateProvinceCode = "TX",
                Store = "Journey Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43914,
                TotalDue = 9179.7465,
                CustomerID = 29521,
                StateProvinceCode = "NV",
                Store = "Brightwork Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43915,
                TotalDue = 4560.2864,
                CustomerID = 29688,
                StateProvinceCode = "MI",
                Store = "Handy Bike Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43916,
                TotalDue = 44423.5959,
                CustomerID = 29511,
                StateProvinceCode = "CO",
                Store = "Bold Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 43917,
                TotalDue = 24047.8587,
                CustomerID = 29885,
                StateProvinceCode = "WA",
                Store = "Sure & Reliable Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44074,
                TotalDue = 950.3979,
                CustomerID = 29592,
                StateProvinceCode = "CT",
                Store = "Painters Bicycle Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44075,
                TotalDue = 29779.1373,
                CustomerID = 29632,
                StateProvinceCode = "WA",
                Store = "Sports Commodities"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44102,
                TotalDue = 3955.6420,
                CustomerID = 29681,
                StateProvinceCode = "SC",
                Store = "Touring Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44105,
                TotalDue = 6870.0165,
                CustomerID = 29769,
                StateProvinceCode = "WI",
                Store = "Unique Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44106,
                TotalDue = 472.3108,
                CustomerID = 30068,
                StateProvinceCode = "GA",
                Store = "Retirement Activities Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44107,
                TotalDue = 18226.9096,
                CustomerID = 30106,
                StateProvinceCode = "TX",
                Store = "Solid Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44108,
                TotalDue = 2442.3468,
                CustomerID = 29686,
                StateProvinceCode = "CA",
                Store = "Distinctive Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44109,
                TotalDue = 15582.1001,
                CustomerID = 29921,
                StateProvinceCode = "OR",
                Store = "Scooters and Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44110,
                TotalDue = 18768.2086,
                CustomerID = 29486,
                StateProvinceCode = "MN",
                Store = "Riders Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44113,
                TotalDue = 45621.2458,
                CustomerID = 29938,
                StateProvinceCode = "CA",
                Store = "Trailblazing Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44114,
                TotalDue = 37706.6125,
                CustomerID = 29746,
                StateProvinceCode = "OH",
                Store = "Bicycle Outfitters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44115,
                TotalDue = 75293.7194,
                CustomerID = 29525,
                StateProvinceCode = "CA",
                Store = "Extended Bike Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44116,
                TotalDue = 22915.4692,
                CustomerID = 29685,
                StateProvinceCode = "GA",
                Store = "Elemental Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44117,
                TotalDue = 14537.2940,
                CustomerID = 29581,
                StateProvinceCode = "CT",
                Store = "Modern Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44118,
                TotalDue = 3859.2790,
                CustomerID = 29883,
                StateProvinceCode = "CO",
                Store = "Sample Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44119,
                TotalDue = 55277.8557,
                CustomerID = 29834,
                StateProvinceCode = "CA",
                Store = "Small Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44120,
                TotalDue = 30375.6923,
                CustomerID = 29702,
                StateProvinceCode = "TX",
                Store = "Paint Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44121,
                TotalDue = 72894.3213,
                CustomerID = 29710,
                StateProvinceCode = "NV",
                Store = "Downtown Hotel"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44122,
                TotalDue = 4577.1764,
                CustomerID = 29518,
                StateProvinceCode = "KY",
                Store = "Distinctive Cycles Sales & Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44123,
                TotalDue = 985.0180,
                CustomerID = 29498,
                StateProvinceCode = "NH",
                Store = "Metropolitan Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44124,
                TotalDue = 17387.3963,
                CustomerID = 29637,
                StateProvinceCode = "TX",
                Store = "Advanced Bike Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44125,
                TotalDue = 2931.9869,
                CustomerID = 29872,
                StateProvinceCode = "MO",
                Store = "A Great Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44126,
                TotalDue = 16060.3046,
                CustomerID = 29810,
                StateProvinceCode = "WA",
                Store = "Central Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44127,
                TotalDue = 102525.9874,
                CustomerID = 29562,
                StateProvinceCode = "CA",
                Store = "Golf and Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44128,
                TotalDue = 20874.6359,
                CustomerID = 30088,
                StateProvinceCode = "TN",
                Store = "Reliable Brake Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44129,
                TotalDue = 62725.3407,
                CustomerID = 29966,
                StateProvinceCode = "NY",
                Store = "Larger Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44130,
                TotalDue = 39881.9747,
                CustomerID = 29642,
                StateProvinceCode = "TN",
                Store = "Ultimate Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44131,
                TotalDue = 23095.3463,
                CustomerID = 29487,
                StateProvinceCode = "OH",
                Store = "The Bike Mechanics"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44132,
                TotalDue = 4560.2864,
                CustomerID = 29484,
                StateProvinceCode = "TN",
                Store = "Next-Door Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44133,
                TotalDue = 28927.0463,
                CustomerID = 29715,
                StateProvinceCode = "TN",
                Store = "Excellent Riding Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44280,
                TotalDue = 64.2420,
                CustomerID = 29886,
                StateProvinceCode = "CT",
                Store = "Eleventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44281,
                TotalDue = 472.3108,
                CustomerID = 29565,
                StateProvinceCode = "CA",
                Store = "World Bike Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44284,
                TotalDue = 98932.1970,
                CustomerID = 29580,
                StateProvinceCode = "WA",
                Store = "Latest Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44285,
                TotalDue = 65037.6996,
                CustomerID = 29898,
                StateProvinceCode = "WA",
                Store = "Capable Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44286,
                TotalDue = 6236.3616,
                CustomerID = 30052,
                StateProvinceCode = "CA",
                Store = "Wheel Gallery"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44287,
                TotalDue = 18344.6411,
                CustomerID = 29974,
                StateProvinceCode = "MO",
                Store = "Yellow Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44289,
                TotalDue = 4596.2216,
                CustomerID = 29566,
                StateProvinceCode = "MI",
                Store = "Historic Bicycle Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44290,
                TotalDue = 4331.5897,
                CustomerID = 29682,
                StateProvinceCode = "CA",
                Store = "Vehicle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44291,
                TotalDue = 5093.9316,
                CustomerID = 29747,
                StateProvinceCode = "WA",
                Store = "The Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44292,
                TotalDue = 3865.0555,
                CustomerID = 29973,
                StateProvinceCode = "MI",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44293,
                TotalDue = 27005.1224,
                CustomerID = 29844,
                StateProvinceCode = "NH",
                Store = "Seventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44296,
                TotalDue = 36463.5495,
                CustomerID = 29827,
                StateProvinceCode = "MO",
                Store = "First Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44297,
                TotalDue = 11519.8817,
                CustomerID = 29811,
                StateProvinceCode = "VA",
                Store = "Trusted Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44299,
                TotalDue = 35609.3132,
                CustomerID = 29889,
                StateProvinceCode = "CA",
                Store = "Separate Parts Corporation"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44301,
                TotalDue = 33197.1756,
                CustomerID = 29489,
                StateProvinceCode = "CA",
                Store = "Area Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44302,
                TotalDue = 2417.4793,
                CustomerID = 29849,
                StateProvinceCode = "FL",
                Store = "Retail Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44303,
                TotalDue = 6.3484,
                CustomerID = 30096,
                StateProvinceCode = "CT",
                Store = "Classic Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44304,
                TotalDue = 42234.8895,
                CustomerID = 29958,
                StateProvinceCode = "TN",
                Store = "Sports Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44305,
                TotalDue = 21262.6570,
                CustomerID = 29825,
                StateProvinceCode = "GA",
                Store = "Better Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44306,
                TotalDue = 20995.4191,
                CustomerID = 29661,
                StateProvinceCode = "MS",
                Store = "Bike Rims Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44307,
                TotalDue = 8733.9760,
                CustomerID = 29759,
                StateProvinceCode = "MA",
                Store = "Convenient Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44308,
                TotalDue = 13928.5021,
                CustomerID = 29497,
                StateProvinceCode = "WY",
                Store = "Great Bikes "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44309,
                TotalDue = 31091.8093,
                CustomerID = 29912,
                StateProvinceCode = "FL",
                Store = "Daring Rides"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44310,
                TotalDue = 207.7582,
                CustomerID = 30084,
                StateProvinceCode = "FL",
                Store = "Simple Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44311,
                TotalDue = 8279.3334,
                CustomerID = 29610,
                StateProvinceCode = "OH",
                Store = "Curbside Universe"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44312,
                TotalDue = 2361.5536,
                CustomerID = 29606,
                StateProvinceCode = "WA",
                Store = "Fifth Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44313,
                TotalDue = 29323.3854,
                CustomerID = 29718,
                StateProvinceCode = "IN",
                Store = "Weekend Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44314,
                TotalDue = 47410.6684,
                CustomerID = 29646,
                StateProvinceCode = "TX",
                Store = "Fitness Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44315,
                TotalDue = 2923.7113,
                CustomerID = 29570,
                StateProvinceCode = "TX",
                Store = "Grease and Oil Products Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44316,
                TotalDue = 4262.3494,
                CustomerID = 29533,
                StateProvinceCode = "MI",
                Store = "Small Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44317,
                TotalDue = 38199.8970,
                CustomerID = 29992,
                StateProvinceCode = "NM",
                Store = "Bike Dealers Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44318,
                TotalDue = 23749.8917,
                CustomerID = 29491,
                StateProvinceCode = "VA",
                Store = "Clamps & Brackets Co."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44319,
                TotalDue = 38566.9973,
                CustomerID = 29549,
                StateProvinceCode = "FL",
                Store = "Juvenile Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44481,
                TotalDue = 29689.3502,
                CustomerID = 29757,
                StateProvinceCode = "CA",
                Store = "Basic Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44482,
                TotalDue = 472.3108,
                CustomerID = 29668,
                StateProvinceCode = "IL",
                Store = "Discount Bicycle Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44483,
                TotalDue = 3398.5212,
                CustomerID = 29611,
                StateProvinceCode = "WA",
                Store = "Alternative Vehicles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44487,
                TotalDue = 47155.5779,
                CustomerID = 29955,
                StateProvinceCode = "MI",
                Store = "Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44488,
                TotalDue = 36996.9047,
                CustomerID = 29888,
                StateProvinceCode = "NC",
                Store = "New and Used Bicycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44489,
                TotalDue = 11583.9419,
                CustomerID = 29717,
                StateProvinceCode = "OR",
                Store = "Suburban Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44491,
                TotalDue = 3859.2790,
                CustomerID = 29555,
                StateProvinceCode = "RI",
                Store = "Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44492,
                TotalDue = 75971.8920,
                CustomerID = 29818,
                StateProvinceCode = "UT",
                Store = "Brakes and Gears"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44493,
                TotalDue = 7290.6993,
                CustomerID = 30011,
                StateProvinceCode = "FL",
                Store = "Sunny Place Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44494,
                TotalDue = 32153.4600,
                CustomerID = 29509,
                StateProvinceCode = "NH",
                Store = "Retail Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44500,
                TotalDue = 5303.3339,
                CustomerID = 29865,
                StateProvinceCode = "CA",
                Store = "Highway Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44501,
                TotalDue = 22152.2446,
                CustomerID = 29773,
                StateProvinceCode = "WA",
                Store = "A Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44502,
                TotalDue = 20128.9083,
                CustomerID = 29961,
                StateProvinceCode = "IN",
                Store = "Exotic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44503,
                TotalDue = 3410.0741,
                CustomerID = 29554,
                StateProvinceCode = "MI",
                Store = "Field Trip Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44505,
                TotalDue = 39393.3135,
                CustomerID = 30056,
                StateProvinceCode = "CA",
                Store = "Sparkling Paint and Finishes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44506,
                TotalDue = 40145.6114,
                CustomerID = 29749,
                StateProvinceCode = "GA",
                Store = "Qualified Sales and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44507,
                TotalDue = 44212.6089,
                CustomerID = 29945,
                StateProvinceCode = "FL",
                Store = "Unified Sports Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44508,
                TotalDue = 4723.1073,
                CustomerID = 29764,
                StateProvinceCode = "TX",
                Store = "Social Activities Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44509,
                TotalDue = 49116.1883,
                CustomerID = 30117,
                StateProvinceCode = "TX",
                Store = "Totes & Baskets Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44510,
                TotalDue = 1970.0360,
                CustomerID = 29728,
                StateProvinceCode = "UT",
                Store = "Roadway Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44511,
                TotalDue = 11440.2727,
                CustomerID = 29571,
                StateProvinceCode = "WA",
                Store = "Moderately-Priced Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44513,
                TotalDue = 49012.5587,
                CustomerID = 29582,
                StateProvinceCode = "WA",
                Store = "Raw Materials Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44514,
                TotalDue = 47939.4352,
                CustomerID = 30107,
                StateProvinceCode = "NV",
                Store = "Permanent Finish Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44515,
                TotalDue = 6183.7133,
                CustomerID = 29675,
                StateProvinceCode = "MA",
                Store = "Wholesale Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44516,
                TotalDue = 472.3108,
                CustomerID = 29585,
                StateProvinceCode = "OR",
                Store = "Parcel Express Delivery Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44517,
                TotalDue = 28042.2034,
                CustomerID = 30076,
                StateProvinceCode = "CO",
                Store = "Fun Times Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44518,
                TotalDue = 142312.2199,
                CustomerID = 29624,
                StateProvinceCode = "FL",
                Store = "Tread Industries"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44519,
                TotalDue = 2417.4793,
                CustomerID = 29569,
                StateProvinceCode = "SD",
                Store = "Travel Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44520,
                TotalDue = 64981.7034,
                CustomerID = 29703,
                StateProvinceCode = "CA",
                Store = "Preferred Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44521,
                TotalDue = 29406.5783,
                CustomerID = 30100,
                StateProvinceCode = "CA",
                Store = "Wire Baskets and Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44751,
                TotalDue = 537.9491,
                CustomerID = 29914,
                StateProvinceCode = "CA",
                Store = "Finish and Sealant Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44752,
                TotalDue = 14594.6340,
                CustomerID = 29673,
                StateProvinceCode = "CA",
                Store = "Two Wheels Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44753,
                TotalDue = 2587.9204,
                CustomerID = 29944,
                StateProvinceCode = "CA",
                Store = "More Bikes!"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44754,
                TotalDue = 12197.4254,
                CustomerID = 29659,
                StateProvinceCode = "TX",
                Store = "Genuine Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44755,
                TotalDue = 32001.1813,
                CustomerID = 30090,
                StateProvinceCode = "TX",
                Store = "A Typical Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44756,
                TotalDue = 15780.2862,
                CustomerID = 29708,
                StateProvinceCode = "TX",
                Store = "Stationary Bikes and Stands"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44757,
                TotalDue = 42338.3846,
                CustomerID = 29748,
                StateProvinceCode = "NM",
                Store = "Safe Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44758,
                TotalDue = 28848.4215,
                CustomerID = 29651,
                StateProvinceCode = "WI",
                Store = "Good Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44759,
                TotalDue = 6908.4859,
                CustomerID = 29655,
                StateProvinceCode = "MI",
                Store = "Full-Service Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44760,
                TotalDue = 5861.3493,
                CustomerID = 29897,
                StateProvinceCode = "AZ",
                Store = "Racing Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44761,
                TotalDue = 92470.0936,
                CustomerID = 29504,
                StateProvinceCode = "TN",
                Store = "Global Plaza"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44762,
                TotalDue = 104545.3150,
                CustomerID = 29690,
                StateProvinceCode = "UT",
                Store = "Fashionable Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44763,
                TotalDue = 3790.7869,
                CustomerID = 29721,
                StateProvinceCode = "FL",
                Store = "Bike Goods "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44764,
                TotalDue = 2401.9502,
                CustomerID = 29681,
                StateProvinceCode = "SC",
                Store = "Touring Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44767,
                TotalDue = 34465.5095,
                CustomerID = 29769,
                StateProvinceCode = "WI",
                Store = "Unique Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44768,
                TotalDue = 24320.2543,
                CustomerID = 30106,
                StateProvinceCode = "TX",
                Store = "Solid Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44769,
                TotalDue = 207.7582,
                CustomerID = 30068,
                StateProvinceCode = "GA",
                Store = "Retirement Activities Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44770,
                TotalDue = 11690.7511,
                CustomerID = 29686,
                StateProvinceCode = "CA",
                Store = "Distinctive Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44771,
                TotalDue = 78461.0295,
                CustomerID = 29921,
                StateProvinceCode = "OR",
                Store = "Scooters and Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44772,
                TotalDue = 75865.1515,
                CustomerID = 29486,
                StateProvinceCode = "MN",
                Store = "Riders Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44775,
                TotalDue = 2480.2443,
                CustomerID = 30013,
                StateProvinceCode = "GA",
                Store = "Cycles and Scooters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44776,
                TotalDue = 53342.2783,
                CustomerID = 29938,
                StateProvinceCode = "CA",
                Store = "Trailblazing Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44777,
                TotalDue = 112067.3649,
                CustomerID = 29525,
                StateProvinceCode = "CA",
                Store = "Extended Bike Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44794,
                TotalDue = 4560.2864,
                CustomerID = 29915,
                StateProvinceCode = "WA",
                Store = "Finer Parts Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44795,
                TotalDue = 117373.1283,
                CustomerID = 29562,
                StateProvinceCode = "CA",
                Store = "Golf and Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44796,
                TotalDue = 15396.7194,
                CustomerID = 29531,
                StateProvinceCode = "NV",
                Store = "Remarkable Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44797,
                TotalDue = 67518.8195,
                CustomerID = 29966,
                StateProvinceCode = "NY",
                Store = "Larger Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44798,
                TotalDue = 37650.6136,
                CustomerID = 30088,
                StateProvinceCode = "TN",
                Store = "Reliable Brake Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44799,
                TotalDue = 45857.3386,
                CustomerID = 29642,
                StateProvinceCode = "TN",
                Store = "Ultimate Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44800,
                TotalDue = 19265.5486,
                CustomerID = 29487,
                StateProvinceCode = "OH",
                Store = "The Bike Mechanics"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44801,
                TotalDue = 54234.6640,
                CustomerID = 29715,
                StateProvinceCode = "TN",
                Store = "Excellent Riding Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 44802,
                TotalDue = 5416.2480,
                CustomerID = 29808,
                StateProvinceCode = "FL",
                Store = "Stylish Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45040,
                TotalDue = 472.3108,
                CustomerID = 29565,
                StateProvinceCode = "CA",
                Store = "World Bike Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45041,
                TotalDue = 472.3108,
                CustomerID = 29858,
                StateProvinceCode = "WA",
                Store = "Synthetic Materials Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45042,
                TotalDue = 45769.7268,
                CustomerID = 29898,
                StateProvinceCode = "WA",
                Store = "Capable Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45043,
                TotalDue = 36680.7029,
                CustomerID = 29580,
                StateProvinceCode = "WA",
                Store = "Latest Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45044,
                TotalDue = 5695.1541,
                CustomerID = 30052,
                StateProvinceCode = "CA",
                Store = "Wheel Gallery"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45045,
                TotalDue = 16058.1495,
                CustomerID = 29974,
                StateProvinceCode = "MO",
                Store = "Yellow Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45046,
                TotalDue = 944.6214,
                CustomerID = 29682,
                StateProvinceCode = "CA",
                Store = "Vehicle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45048,
                TotalDue = 6899.6033,
                CustomerID = 29566,
                StateProvinceCode = "MI",
                Store = "Historic Bicycle Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45049,
                TotalDue = 1555.7138,
                CustomerID = 29890,
                StateProvinceCode = "WA",
                Store = "Basic Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45050,
                TotalDue = 4843.9990,
                CustomerID = 29747,
                StateProvinceCode = "WA",
                Store = "The Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45051,
                TotalDue = 3386.9682,
                CustomerID = 29973,
                StateProvinceCode = "MI",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45053,
                TotalDue = 21748.2094,
                CustomerID = 29844,
                StateProvinceCode = "NH",
                Store = "Seventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45055,
                TotalDue = 22229.2505,
                CustomerID = 29827,
                StateProvinceCode = "MO",
                Store = "First Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45056,
                TotalDue = 43525.5187,
                CustomerID = 29811,
                StateProvinceCode = "VA",
                Store = "Trusted Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45059,
                TotalDue = 35223.3705,
                CustomerID = 29489,
                StateProvinceCode = "CA",
                Store = "Area Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45060,
                TotalDue = 26962.8476,
                CustomerID = 29889,
                StateProvinceCode = "CA",
                Store = "Separate Parts Corporation"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45061,
                TotalDue = 82490.9371,
                CustomerID = 29825,
                StateProvinceCode = "GA",
                Store = "Better Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45062,
                TotalDue = 17837.3280,
                CustomerID = 29661,
                StateProvinceCode = "MS",
                Store = "Bike Rims Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45063,
                TotalDue = 12522.4584,
                CustomerID = 29759,
                StateProvinceCode = "MA",
                Store = "Convenient Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45064,
                TotalDue = 59713.6183,
                CustomerID = 29497,
                StateProvinceCode = "WY",
                Store = "Great Bikes "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45065,
                TotalDue = 27052.2013,
                CustomerID = 29912,
                StateProvinceCode = "FL",
                Store = "Daring Rides"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45066,
                TotalDue = 472.3108,
                CustomerID = 30084,
                StateProvinceCode = "FL",
                Store = "Simple Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45067,
                TotalDue = 3484.0780,
                CustomerID = 29610,
                StateProvinceCode = "OH",
                Store = "Curbside Universe"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45068,
                TotalDue = 2401.9502,
                CustomerID = 29606,
                StateProvinceCode = "WA",
                Store = "Fifth Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45069,
                TotalDue = 27645.7018,
                CustomerID = 29718,
                StateProvinceCode = "IN",
                Store = "Weekend Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45070,
                TotalDue = 31637.8485,
                CustomerID = 29646,
                StateProvinceCode = "TX",
                Store = "Fitness Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45071,
                TotalDue = 6733.5399,
                CustomerID = 29533,
                StateProvinceCode = "MI",
                Store = "Small Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45072,
                TotalDue = 2361.5536,
                CustomerID = 29570,
                StateProvinceCode = "TX",
                Store = "Grease and Oil Products Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45073,
                TotalDue = 472.3108,
                CustomerID = 29768,
                StateProvinceCode = "CA",
                Store = "Riding Excursions"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45074,
                TotalDue = 27058.3881,
                CustomerID = 29992,
                StateProvinceCode = "NM",
                Store = "Bike Dealers Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45075,
                TotalDue = 13771.7748,
                CustomerID = 29491,
                StateProvinceCode = "VA",
                Store = "Clamps & Brackets Co."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45076,
                TotalDue = 9192.2504,
                CustomerID = 29549,
                StateProvinceCode = "FL",
                Store = "Juvenile Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45077,
                TotalDue = 21263.0024,
                CustomerID = 29958,
                StateProvinceCode = "TN",
                Store = "Sports Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45266,
                TotalDue = 27605.6261,
                CustomerID = 29955,
                StateProvinceCode = "MI",
                Store = "Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45267,
                TotalDue = 3899.6756,
                CustomerID = 29611,
                StateProvinceCode = "WA",
                Store = "Alternative Vehicles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45270,
                TotalDue = 32394.8687,
                CustomerID = 29888,
                StateProvinceCode = "NC",
                Store = "New and Used Bicycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45271,
                TotalDue = 6733.5399,
                CustomerID = 29555,
                StateProvinceCode = "RI",
                Store = "Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45273,
                TotalDue = 45754.8749,
                CustomerID = 29717,
                StateProvinceCode = "OR",
                Store = "Suburban Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45274,
                TotalDue = 75434.2741,
                CustomerID = 29818,
                StateProvinceCode = "UT",
                Store = "Brakes and Gears"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45275,
                TotalDue = 8069.6789,
                CustomerID = 30011,
                StateProvinceCode = "FL",
                Store = "Sunny Place Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45277,
                TotalDue = 33256.1571,
                CustomerID = 29509,
                StateProvinceCode = "NH",
                Store = "Retail Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45281,
                TotalDue = 1929.6395,
                CustomerID = 29554,
                StateProvinceCode = "MI",
                Store = "Field Trip Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45283,
                TotalDue = 31972.1684,
                CustomerID = 29773,
                StateProvinceCode = "WA",
                Store = "A Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45285,
                TotalDue = 16800.3827,
                CustomerID = 29961,
                StateProvinceCode = "IN",
                Store = "Exotic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45286,
                TotalDue = 4331.5897,
                CustomerID = 29865,
                StateProvinceCode = "CA",
                Store = "Highway Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45287,
                TotalDue = 472.3108,
                CustomerID = 29764,
                StateProvinceCode = "TX",
                Store = "Social Activities Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45288,
                TotalDue = 33502.0313,
                CustomerID = 29749,
                StateProvinceCode = "GA",
                Store = "Qualified Sales and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45289,
                TotalDue = 44776.7272,
                CustomerID = 29945,
                StateProvinceCode = "FL",
                Store = "Unified Sports Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45290,
                TotalDue = 37697.3974,
                CustomerID = 30056,
                StateProvinceCode = "CA",
                Store = "Sparkling Paint and Finishes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45291,
                TotalDue = 61426.8586,
                CustomerID = 30117,
                StateProvinceCode = "TX",
                Store = "Totes & Baskets Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45292,
                TotalDue = 32.1210,
                CustomerID = 29728,
                StateProvinceCode = "UT",
                Store = "Roadway Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45294,
                TotalDue = 38617.3999,
                CustomerID = 30107,
                StateProvinceCode = "NV",
                Store = "Permanent Finish Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45295,
                TotalDue = 18350.9895,
                CustomerID = 29571,
                StateProvinceCode = "WA",
                Store = "Moderately-Priced Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45296,
                TotalDue = 27306.4470,
                CustomerID = 29582,
                StateProvinceCode = "WA",
                Store = "Raw Materials Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45297,
                TotalDue = 7246.2473,
                CustomerID = 29675,
                StateProvinceCode = "MA",
                Store = "Wholesale Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45298,
                TotalDue = 17819.9750,
                CustomerID = 30076,
                StateProvinceCode = "CO",
                Store = "Fun Times Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45299,
                TotalDue = 23005.4047,
                CustomerID = 30100,
                StateProvinceCode = "CA",
                Store = "Wire Baskets and Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45300,
                TotalDue = 101020.1731,
                CustomerID = 29624,
                StateProvinceCode = "FL",
                Store = "Tread Industries"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45301,
                TotalDue = 29945.0453,
                CustomerID = 29703,
                StateProvinceCode = "CA",
                Store = "Preferred Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45302,
                TotalDue = 25016.9010,
                CustomerID = 30091,
                StateProvinceCode = "OH",
                Store = "Active Transport Inc."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45303,
                TotalDue = 22975.2493,
                CustomerID = 29925,
                StateProvinceCode = "WA",
                Store = "Outdoor Sports Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45304,
                TotalDue = 22885.8824,
                CustomerID = 29664,
                StateProvinceCode = "NY",
                Store = "Only Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45307,
                TotalDue = 32142.9153,
                CustomerID = 30111,
                StateProvinceCode = "IL",
                Store = "Great Bicycle Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45308,
                TotalDue = 96861.4290,
                CustomerID = 29861,
                StateProvinceCode = "MN",
                Store = "Hardware Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45309,
                TotalDue = 13432.3383,
                CustomerID = 29724,
                StateProvinceCode = "CT",
                Store = "Lease-a-Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45311,
                TotalDue = 20601.5459,
                CustomerID = 29757,
                StateProvinceCode = "CA",
                Store = "Basic Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45312,
                TotalDue = 2641.4923,
                CustomerID = 29493,
                StateProvinceCode = "SC",
                Store = "New Bikes Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45317,
                TotalDue = 68918.2404,
                CustomerID = 29716,
                StateProvinceCode = "CA",
                Store = "Farthermost Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45318,
                TotalDue = 33750.5413,
                CustomerID = 29742,
                StateProvinceCode = "WA",
                Store = "Vast Bike Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45320,
                TotalDue = 11476.7797,
                CustomerID = 30004,
                StateProvinceCode = "WY",
                Store = "Some Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45321,
                TotalDue = 68896.7026,
                CustomerID = 29522,
                StateProvinceCode = "CA",
                Store = "Resale Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45322,
                TotalDue = 15356.3228,
                CustomerID = 29866,
                StateProvinceCode = "TX",
                Store = "Rental Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45324,
                TotalDue = 944.6214,
                CustomerID = 30012,
                StateProvinceCode = "CA",
                Store = "Alpine Ski House"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45325,
                TotalDue = 2914.6576,
                CustomerID = 30022,
                StateProvinceCode = "CA",
                Store = "Metropolitan Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45326,
                TotalDue = 25594.8725,
                CustomerID = 29906,
                StateProvinceCode = "MO",
                Store = "District Mall"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45327,
                TotalDue = 13710.4462,
                CustomerID = 29880,
                StateProvinceCode = "SC",
                Store = "Consolidated Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45328,
                TotalDue = 71207.6516,
                CustomerID = 29901,
                StateProvinceCode = "CA",
                Store = "Sturdy Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45329,
                TotalDue = 69598.4079,
                CustomerID = 29507,
                StateProvinceCode = "MS",
                Store = "eCommerce Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45330,
                TotalDue = 76.9387,
                CustomerID = 29968,
                StateProvinceCode = "NC",
                Store = "Metro Bike Mart"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45331,
                TotalDue = 22686.9920,
                CustomerID = 29846,
                StateProvinceCode = "FL",
                Store = "General Associates"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45332,
                TotalDue = 31389.9814,
                CustomerID = 30095,
                StateProvinceCode = "TX",
                Store = "Swift Cycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45333,
                TotalDue = 4756.5839,
                CustomerID = 29731,
                StateProvinceCode = "IN",
                Store = "Super Sports Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45334,
                TotalDue = 57577.7682,
                CustomerID = 29523,
                StateProvinceCode = "TX",
                Store = "The Gear Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45335,
                TotalDue = 15813.9980,
                CustomerID = 29791,
                StateProvinceCode = "IN",
                Store = "Leather and Vinyl Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45336,
                TotalDue = 30762.7429,
                CustomerID = 29787,
                StateProvinceCode = "WA",
                Store = "Year-Round Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45337,
                TotalDue = 19899.7785,
                CustomerID = 29963,
                StateProvinceCode = "TN",
                Store = "Every Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45338,
                TotalDue = 64342.9523,
                CustomerID = 29617,
                StateProvinceCode = "WA",
                Store = "Thorough Parts and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45339,
                TotalDue = 31262.6438,
                CustomerID = 29853,
                StateProvinceCode = "CA",
                Store = "Affordable Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45340,
                TotalDue = 2874.2609,
                CustomerID = 29756,
                StateProvinceCode = "FL",
                Store = "Tough and Reliable Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45341,
                TotalDue = 39114.2895,
                CustomerID = 29774,
                StateProvinceCode = "TX",
                Store = "Journey Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45342,
                TotalDue = 70980.0740,
                CustomerID = 29521,
                StateProvinceCode = "NV",
                Store = "Brightwork Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45343,
                TotalDue = 23634.3103,
                CustomerID = 29511,
                StateProvinceCode = "CO",
                Store = "Bold Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45344,
                TotalDue = 65434.5791,
                CustomerID = 29885,
                StateProvinceCode = "WA",
                Store = "Sure & Reliable Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45516,
                TotalDue = 21576.4251,
                CustomerID = 30106,
                StateProvinceCode = "TX",
                Store = "Solid Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45517,
                TotalDue = 10608.3479,
                CustomerID = 29592,
                StateProvinceCode = "CT",
                Store = "Painters Bicycle Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45518,
                TotalDue = 13714.6394,
                CustomerID = 29632,
                StateProvinceCode = "WA",
                Store = "Sports Commodities"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45519,
                TotalDue = 4577.1764,
                CustomerID = 30003,
                StateProvinceCode = "MN",
                Store = "Practical Bike Supply Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45520,
                TotalDue = 35612.3114,
                CustomerID = 29967,
                StateProvinceCode = "IL",
                Store = "Leading Sales & Repair"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45521,
                TotalDue = 21659.9223,
                CustomerID = 29622,
                StateProvinceCode = "WA",
                Store = "Metro Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45523,
                TotalDue = 1614.5170,
                CustomerID = 29733,
                StateProvinceCode = "AZ",
                Store = "Regional Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45528,
                TotalDue = 2417.4793,
                CustomerID = 29508,
                StateProvinceCode = "TX",
                Store = "Mountain Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45530,
                TotalDue = 22.3061,
                CustomerID = 29842,
                StateProvinceCode = "AZ",
                Store = "First Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45531,
                TotalDue = 4803.9004,
                CustomerID = 29673,
                StateProvinceCode = "CA",
                Store = "Two Wheels Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45532,
                TotalDue = 7529.9140,
                CustomerID = 29659,
                StateProvinceCode = "TX",
                Store = "Genuine Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45533,
                TotalDue = 1416.9322,
                CustomerID = 29859,
                StateProvinceCode = "TX",
                Store = "Rural Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45534,
                TotalDue = 42339.2470,
                CustomerID = 29748,
                StateProvinceCode = "NM",
                Store = "Safe Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45535,
                TotalDue = 12672.5976,
                CustomerID = 29708,
                StateProvinceCode = "TX",
                Store = "Stationary Bikes and Stands"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45536,
                TotalDue = 24144.3832,
                CustomerID = 30090,
                StateProvinceCode = "TX",
                Store = "A Typical Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45538,
                TotalDue = 24600.1019,
                CustomerID = 29651,
                StateProvinceCode = "WI",
                Store = "Good Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45539,
                TotalDue = 32057.1254,
                CustomerID = 29655,
                StateProvinceCode = "MI",
                Store = "Full-Service Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45540,
                TotalDue = 48142.8235,
                CustomerID = 29504,
                StateProvinceCode = "TN",
                Store = "Global Plaza"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45541,
                TotalDue = 76.7331,
                CustomerID = 29897,
                StateProvinceCode = "AZ",
                Store = "Racing Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45542,
                TotalDue = 63507.9595,
                CustomerID = 29690,
                StateProvinceCode = "UT",
                Store = "Fashionable Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45543,
                TotalDue = 831.0328,
                CustomerID = 29721,
                StateProvinceCode = "FL",
                Store = "Bike Goods "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45544,
                TotalDue = 3818.8824,
                CustomerID = 29681,
                StateProvinceCode = "SC",
                Store = "Touring Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45547,
                TotalDue = 45902.8087,
                CustomerID = 29769,
                StateProvinceCode = "WI",
                Store = "Unique Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45548,
                TotalDue = 8622.7828,
                CustomerID = 29686,
                StateProvinceCode = "CA",
                Store = "Distinctive Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45549,
                TotalDue = 57157.6200,
                CustomerID = 29921,
                StateProvinceCode = "OR",
                Store = "Scooters and Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45550,
                TotalDue = 61904.5716,
                CustomerID = 29486,
                StateProvinceCode = "MN",
                Store = "Riders Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45551,
                TotalDue = 8190.8687,
                CustomerID = 30013,
                StateProvinceCode = "GA",
                Store = "Cycles and Scooters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45554,
                TotalDue = 28728.9392,
                CustomerID = 29938,
                StateProvinceCode = "CA",
                Store = "Trailblazing Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45555,
                TotalDue = 74018.1914,
                CustomerID = 29525,
                StateProvinceCode = "CA",
                Store = "Extended Bike Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45556,
                TotalDue = 25709.5900,
                CustomerID = 29746,
                StateProvinceCode = "OH",
                Store = "Bicycle Outfitters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45557,
                TotalDue = 36656.8539,
                CustomerID = 29883,
                StateProvinceCode = "CO",
                Store = "Sample Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45558,
                TotalDue = 6874.2098,
                CustomerID = 29685,
                StateProvinceCode = "GA",
                Store = "Elemental Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45559,
                TotalDue = 1416.9322,
                CustomerID = 29982,
                StateProvinceCode = "CA",
                Store = "Discount Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45560,
                TotalDue = 64143.5534,
                CustomerID = 29834,
                StateProvinceCode = "CA",
                Store = "Small Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45561,
                TotalDue = 28674.1873,
                CustomerID = 29581,
                StateProvinceCode = "CT",
                Store = "Modern Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45562,
                TotalDue = 3899.6756,
                CustomerID = 29669,
                StateProvinceCode = "NY",
                Store = "Famous Bike Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45563,
                TotalDue = 4827.1090,
                CustomerID = 29518,
                StateProvinceCode = "KY",
                Store = "Distinctive Cycles Sales & Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45564,
                TotalDue = 70632.8848,
                CustomerID = 29710,
                StateProvinceCode = "NV",
                Store = "Downtown Hotel"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45565,
                TotalDue = 38910.4755,
                CustomerID = 29702,
                StateProvinceCode = "TX",
                Store = "Paint Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45566,
                TotalDue = 985.0180,
                CustomerID = 29788,
                StateProvinceCode = "CA",
                Store = "The New Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45567,
                TotalDue = 985.0180,
                CustomerID = 29498,
                StateProvinceCode = "NH",
                Store = "Metropolitan Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45568,
                TotalDue = 17171.8077,
                CustomerID = 29637,
                StateProvinceCode = "TX",
                Store = "Advanced Bike Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45569,
                TotalDue = 2401.9502,
                CustomerID = 29872,
                StateProvinceCode = "MO",
                Store = "A Great Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45570,
                TotalDue = 36516.0719,
                CustomerID = 29810,
                StateProvinceCode = "WA",
                Store = "Central Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45571,
                TotalDue = 88863.9705,
                CustomerID = 29562,
                StateProvinceCode = "CA",
                Store = "Golf and Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45572,
                TotalDue = 12050.1477,
                CustomerID = 29531,
                StateProvinceCode = "NV",
                Store = "Remarkable Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45573,
                TotalDue = 9186.0949,
                CustomerID = 29487,
                StateProvinceCode = "OH",
                Store = "The Bike Mechanics"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45574,
                TotalDue = 31629.2609,
                CustomerID = 29642,
                StateProvinceCode = "TN",
                Store = "Ultimate Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45575,
                TotalDue = 33029.7055,
                CustomerID = 29966,
                StateProvinceCode = "NY",
                Store = "Larger Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45576,
                TotalDue = 9254.1920,
                CustomerID = 30088,
                StateProvinceCode = "TN",
                Store = "Reliable Brake Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45577,
                TotalDue = 66105.3595,
                CustomerID = 29715,
                StateProvinceCode = "TN",
                Store = "Excellent Riding Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45578,
                TotalDue = 4371.9863,
                CustomerID = 29808,
                StateProvinceCode = "FL",
                Store = "Stylish Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45579,
                TotalDue = 4594.0664,
                CustomerID = 29484,
                StateProvinceCode = "TN",
                Store = "Next-Door Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45779,
                TotalDue = 20304.9042,
                CustomerID = 29825,
                StateProvinceCode = "GA",
                Store = "Better Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45782,
                TotalDue = 45843.6116,
                CustomerID = 29580,
                StateProvinceCode = "WA",
                Store = "Latest Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45783,
                TotalDue = 29299.5826,
                CustomerID = 29898,
                StateProvinceCode = "WA",
                Store = "Capable Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45784,
                TotalDue = 4237.5277,
                CustomerID = 30052,
                StateProvinceCode = "CA",
                Store = "Wheel Gallery"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45785,
                TotalDue = 45901.3963,
                CustomerID = 29974,
                StateProvinceCode = "MO",
                Store = "Yellow Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45787,
                TotalDue = 11514.8700,
                CustomerID = 29566,
                StateProvinceCode = "MI",
                Store = "Historic Bicycle Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45788,
                TotalDue = 2442.3468,
                CustomerID = 29682,
                StateProvinceCode = "CA",
                Store = "Vehicle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45789,
                TotalDue = 3461.5897,
                CustomerID = 29747,
                StateProvinceCode = "WA",
                Store = "The Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45790,
                TotalDue = 3248.5120,
                CustomerID = 29890,
                StateProvinceCode = "WA",
                Store = "Basic Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45791,
                TotalDue = 3818.8824,
                CustomerID = 29973,
                StateProvinceCode = "MI",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45793,
                TotalDue = 30045.5398,
                CustomerID = 29844,
                StateProvinceCode = "NH",
                Store = "Seventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45795,
                TotalDue = 39546.3440,
                CustomerID = 29827,
                StateProvinceCode = "MO",
                Store = "First Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45796,
                TotalDue = 66548.9795,
                CustomerID = 29811,
                StateProvinceCode = "VA",
                Store = "Trusted Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45798,
                TotalDue = 33210.2125,
                CustomerID = 29889,
                StateProvinceCode = "CA",
                Store = "Separate Parts Corporation"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45799,
                TotalDue = 31052.5094,
                CustomerID = 29489,
                StateProvinceCode = "CA",
                Store = "Area Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45801,
                TotalDue = 60170.4748,
                CustomerID = 29958,
                StateProvinceCode = "TN",
                Store = "Sports Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45802,
                TotalDue = 25499.4202,
                CustomerID = 29661,
                StateProvinceCode = "MS",
                Store = "Bike Rims Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45803,
                TotalDue = 11135.9262,
                CustomerID = 29759,
                StateProvinceCode = "MA",
                Store = "Convenient Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45804,
                TotalDue = 45954.0341,
                CustomerID = 29497,
                StateProvinceCode = "WY",
                Store = "Great Bikes "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45805,
                TotalDue = 27708.6766,
                CustomerID = 29912,
                StateProvinceCode = "FL",
                Store = "Daring Rides"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45806,
                TotalDue = 3292.9062,
                CustomerID = 30084,
                StateProvinceCode = "FL",
                Store = "Simple Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45807,
                TotalDue = 3980.3915,
                CustomerID = 29610,
                StateProvinceCode = "OH",
                Store = "Curbside Universe"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45808,
                TotalDue = 4803.9004,
                CustomerID = 29606,
                StateProvinceCode = "WA",
                Store = "Fifth Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45809,
                TotalDue = 27128.8957,
                CustomerID = 29718,
                StateProvinceCode = "IN",
                Store = "Weekend Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45810,
                TotalDue = 35440.1635,
                CustomerID = 29646,
                StateProvinceCode = "TX",
                Store = "Fitness Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45811,
                TotalDue = 3891.4000,
                CustomerID = 29570,
                StateProvinceCode = "TX",
                Store = "Grease and Oil Products Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45812,
                TotalDue = 7721.8353,
                CustomerID = 29533,
                StateProvinceCode = "MI",
                Store = "Small Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45813,
                TotalDue = 36309.0209,
                CustomerID = 29992,
                StateProvinceCode = "NM",
                Store = "Bike Dealers Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45814,
                TotalDue = 37625.4303,
                CustomerID = 29491,
                StateProvinceCode = "VA",
                Store = "Clamps & Brackets Co."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 45815,
                TotalDue = 36281.4387,
                CustomerID = 29549,
                StateProvinceCode = "FL",
                Store = "Juvenile Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46025,
                TotalDue = 2978.8996,
                CustomerID = 29611,
                StateProvinceCode = "WA",
                Store = "Alternative Vehicles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46026,
                TotalDue = 31324.4507,
                CustomerID = 29955,
                StateProvinceCode = "MI",
                Store = "Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46027,
                TotalDue = 3891.4000,
                CustomerID = 29555,
                StateProvinceCode = "RI",
                Store = "Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46028,
                TotalDue = 29580.9836,
                CustomerID = 29888,
                StateProvinceCode = "NC",
                Store = "New and Used Bicycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46030,
                TotalDue = 9192.4432,
                CustomerID = 29717,
                StateProvinceCode = "OR",
                Store = "Suburban Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46032,
                TotalDue = 34905.1646,
                CustomerID = 29818,
                StateProvinceCode = "UT",
                Store = "Brakes and Gears"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46033,
                TotalDue = 5309.1103,
                CustomerID = 30011,
                StateProvinceCode = "FL",
                Store = "Sunny Place Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46036,
                TotalDue = 34356.8150,
                CustomerID = 29509,
                StateProvinceCode = "NH",
                Store = "Retail Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46040,
                TotalDue = 472.3108,
                CustomerID = 29554,
                StateProvinceCode = "MI",
                Store = "Field Trip Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46041,
                TotalDue = 3908.7294,
                CustomerID = 29865,
                StateProvinceCode = "CA",
                Store = "Highway Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46042,
                TotalDue = 29418.5269,
                CustomerID = 29773,
                StateProvinceCode = "WA",
                Store = "A Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46043,
                TotalDue = 21436.4436,
                CustomerID = 29961,
                StateProvinceCode = "IN",
                Store = "Exotic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46045,
                TotalDue = 55083.0127,
                CustomerID = 29749,
                StateProvinceCode = "GA",
                Store = "Qualified Sales and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46046,
                TotalDue = 985.0180,
                CustomerID = 29764,
                StateProvinceCode = "TX",
                Store = "Social Activities Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46047,
                TotalDue = 52255.6395,
                CustomerID = 29945,
                StateProvinceCode = "FL",
                Store = "Unified Sports Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46048,
                TotalDue = 38235.0189,
                CustomerID = 30056,
                StateProvinceCode = "CA",
                Store = "Sparkling Paint and Finishes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46049,
                TotalDue = 62770.1045,
                CustomerID = 30117,
                StateProvinceCode = "TX",
                Store = "Totes & Baskets Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46051,
                TotalDue = 37257.1606,
                CustomerID = 30107,
                StateProvinceCode = "NV",
                Store = "Permanent Finish Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46052,
                TotalDue = 27677.4245,
                CustomerID = 29571,
                StateProvinceCode = "WA",
                Store = "Moderately-Priced Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46053,
                TotalDue = 59545.6292,
                CustomerID = 29582,
                StateProvinceCode = "WA",
                Store = "Raw Materials Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46054,
                TotalDue = 9619.3538,
                CustomerID = 29675,
                StateProvinceCode = "MA",
                Store = "Wholesale Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46055,
                TotalDue = 34775.6435,
                CustomerID = 30076,
                StateProvinceCode = "CO",
                Store = "Fun Times Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46056,
                TotalDue = 106261.9130,
                CustomerID = 29624,
                StateProvinceCode = "FL",
                Store = "Tread Industries"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46057,
                TotalDue = 70140.5883,
                CustomerID = 29703,
                StateProvinceCode = "CA",
                Store = "Preferred Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46058,
                TotalDue = 33985.7129,
                CustomerID = 30100,
                StateProvinceCode = "CA",
                Store = "Wire Baskets and Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46059,
                TotalDue = 33159.5844,
                CustomerID = 30091,
                StateProvinceCode = "OH",
                Store = "Active Transport Inc."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46060,
                TotalDue = 51229.2526,
                CustomerID = 29925,
                StateProvinceCode = "WA",
                Store = "Outdoor Sports Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46061,
                TotalDue = 15977.8927,
                CustomerID = 29664,
                StateProvinceCode = "NY",
                Store = "Only Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46066,
                TotalDue = 113042.7512,
                CustomerID = 30111,
                StateProvinceCode = "IL",
                Store = "Great Bicycle Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46067,
                TotalDue = 114690.6064,
                CustomerID = 29861,
                StateProvinceCode = "MN",
                Store = "Hardware Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46068,
                TotalDue = 26252.3533,
                CustomerID = 29724,
                StateProvinceCode = "CT",
                Store = "Lease-a-Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46069,
                TotalDue = 9268.2382,
                CustomerID = 29757,
                StateProvinceCode = "CA",
                Store = "Basic Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46070,
                TotalDue = 856.2467,
                CustomerID = 29493,
                StateProvinceCode = "SC",
                Store = "New Bikes Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46076,
                TotalDue = 70211.2189,
                CustomerID = 29716,
                StateProvinceCode = "CA",
                Store = "Farthermost Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46077,
                TotalDue = 42544.4821,
                CustomerID = 29742,
                StateProvinceCode = "WA",
                Store = "Vast Bike Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46078,
                TotalDue = 1730.7949,
                CustomerID = 29583,
                StateProvinceCode = "IL",
                Store = "Lots of Bikes Storehouse"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46080,
                TotalDue = 16043.7937,
                CustomerID = 30004,
                StateProvinceCode = "WY",
                Store = "Some Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46081,
                TotalDue = 944.6214,
                CustomerID = 29930,
                StateProvinceCode = "IL",
                Store = "Largest Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46082,
                TotalDue = 52378.7571,
                CustomerID = 29522,
                StateProvinceCode = "CA",
                Store = "Resale Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46083,
                TotalDue = 13920.3402,
                CustomerID = 29866,
                StateProvinceCode = "TX",
                Store = "Rental Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46084,
                TotalDue = 1929.6395,
                CustomerID = 30022,
                StateProvinceCode = "CA",
                Store = "Metropolitan Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46085,
                TotalDue = 4371.9863,
                CustomerID = 30012,
                StateProvinceCode = "CA",
                Store = "Alpine Ski House"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46087,
                TotalDue = 27192.3367,
                CustomerID = 29906,
                StateProvinceCode = "MO",
                Store = "District Mall"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46088,
                TotalDue = 25330.4483,
                CustomerID = 29880,
                StateProvinceCode = "SC",
                Store = "Consolidated Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46089,
                TotalDue = 82830.5278,
                CustomerID = 29901,
                StateProvinceCode = "CA",
                Store = "Sturdy Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46090,
                TotalDue = 105780.1033,
                CustomerID = 29507,
                StateProvinceCode = "MS",
                Store = "eCommerce Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46091,
                TotalDue = 24925.5236,
                CustomerID = 29846,
                StateProvinceCode = "FL",
                Store = "General Associates"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46092,
                TotalDue = 816.1709,
                CustomerID = 29588,
                StateProvinceCode = "MT",
                Store = "Nonskid Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46093,
                TotalDue = 29292.1690,
                CustomerID = 30095,
                StateProvinceCode = "TX",
                Store = "Swift Cycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46094,
                TotalDue = 84134.3764,
                CustomerID = 29523,
                StateProvinceCode = "TX",
                Store = "The Gear Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46095,
                TotalDue = 10752.2252,
                CustomerID = 29791,
                StateProvinceCode = "IN",
                Store = "Leather and Vinyl Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46097,
                TotalDue = 3677.3573,
                CustomerID = 29731,
                StateProvinceCode = "IN",
                Store = "Super Sports Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46098,
                TotalDue = 57825.5764,
                CustomerID = 29787,
                StateProvinceCode = "WA",
                Store = "Year-Round Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46099,
                TotalDue = 16231.4577,
                CustomerID = 29963,
                StateProvinceCode = "TN",
                Store = "Every Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46100,
                TotalDue = 53660.6032,
                CustomerID = 29617,
                StateProvinceCode = "WA",
                Store = "Thorough Parts and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46101,
                TotalDue = 31642.1403,
                CustomerID = 29853,
                StateProvinceCode = "CA",
                Store = "Affordable Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46102,
                TotalDue = 11573.0102,
                CustomerID = 29521,
                StateProvinceCode = "NV",
                Store = "Brightwork Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46103,
                TotalDue = 74016.3123,
                CustomerID = 29774,
                StateProvinceCode = "TX",
                Store = "Journey Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46104,
                TotalDue = 472.3108,
                CustomerID = 29756,
                StateProvinceCode = "FL",
                Store = "Tough and Reliable Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46105,
                TotalDue = 63500.4848,
                CustomerID = 29885,
                StateProvinceCode = "WA",
                Store = "Sure & Reliable Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46106,
                TotalDue = 3283.7289,
                CustomerID = 29688,
                StateProvinceCode = "MI",
                Store = "Handy Bike Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46107,
                TotalDue = 51494.4587,
                CustomerID = 29511,
                StateProvinceCode = "CO",
                Store = "Bold Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46322,
                TotalDue = 201.7070,
                CustomerID = 30064,
                StateProvinceCode = "WA",
                Store = "Demand Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46323,
                TotalDue = 2910.0374,
                CustomerID = 29632,
                StateProvinceCode = "WA",
                Store = "Sports Commodities"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46324,
                TotalDue = 4853.3508,
                CustomerID = 29592,
                StateProvinceCode = "CT",
                Store = "Painters Bicycle Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46325,
                TotalDue = 54889.6182,
                CustomerID = 29967,
                StateProvinceCode = "IL",
                Store = "Leading Sales & Repair"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46327,
                TotalDue = 16156.2599,
                CustomerID = 29622,
                StateProvinceCode = "WA",
                Store = "Metro Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46329,
                TotalDue = 816.1709,
                CustomerID = 29697,
                StateProvinceCode = "MS",
                Store = "One-Piece Handle Bars"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46335,
                TotalDue = 403.1163,
                CustomerID = 29508,
                StateProvinceCode = "TX",
                Store = "Mountain Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46336,
                TotalDue = 472.3108,
                CustomerID = 29944,
                StateProvinceCode = "CA",
                Store = "More Bikes!"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46337,
                TotalDue = 1077.4318,
                CustomerID = 29914,
                StateProvinceCode = "CA",
                Store = "Finish and Sealant Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46338,
                TotalDue = 21444.2981,
                CustomerID = 29659,
                StateProvinceCode = "TX",
                Store = "Genuine Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46339,
                TotalDue = 3393.5229,
                CustomerID = 29673,
                StateProvinceCode = "CA",
                Store = "Two Wheels Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46340,
                TotalDue = 4377.7627,
                CustomerID = 29859,
                StateProvinceCode = "TX",
                Store = "Rural Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46341,
                TotalDue = 28906.8088,
                CustomerID = 29708,
                StateProvinceCode = "TX",
                Store = "Stationary Bikes and Stands"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46342,
                TotalDue = 17802.5280,
                CustomerID = 29748,
                StateProvinceCode = "NM",
                Store = "Safe Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46343,
                TotalDue = 33243.4322,
                CustomerID = 30090,
                StateProvinceCode = "TX",
                Store = "A Typical Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46344,
                TotalDue = 28981.1466,
                CustomerID = 29651,
                StateProvinceCode = "WI",
                Store = "Good Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46345,
                TotalDue = 21961.7533,
                CustomerID = 29504,
                StateProvinceCode = "TN",
                Store = "Global Plaza"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46346,
                TotalDue = 11589.5448,
                CustomerID = 29655,
                StateProvinceCode = "MI",
                Store = "Full-Service Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46347,
                TotalDue = 1291.2411,
                CustomerID = 29897,
                StateProvinceCode = "AZ",
                Store = "Racing Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46348,
                TotalDue = 30344.6257,
                CustomerID = 29690,
                StateProvinceCode = "UT",
                Store = "Fashionable Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46349,
                TotalDue = 4836.4395,
                CustomerID = 29721,
                StateProvinceCode = "FL",
                Store = "Bike Goods "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46350,
                TotalDue = 3859.2790,
                CustomerID = 29681,
                StateProvinceCode = "SC",
                Store = "Touring Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46353,
                TotalDue = 5062.2138,
                CustomerID = 29769,
                StateProvinceCode = "WI",
                Store = "Unique Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46354,
                TotalDue = 472.3108,
                CustomerID = 30068,
                StateProvinceCode = "GA",
                Store = "Retirement Activities Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46355,
                TotalDue = 25896.1905,
                CustomerID = 30106,
                StateProvinceCode = "TX",
                Store = "Solid Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46356,
                TotalDue = 66414.6274,
                CustomerID = 29921,
                StateProvinceCode = "OR",
                Store = "Scooters and Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46357,
                TotalDue = 9653.9739,
                CustomerID = 29686,
                StateProvinceCode = "CA",
                Store = "Distinctive Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46358,
                TotalDue = 67656.4546,
                CustomerID = 29486,
                StateProvinceCode = "MN",
                Store = "Riders Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46361,
                TotalDue = 6226.6090,
                CustomerID = 30013,
                StateProvinceCode = "GA",
                Store = "Cycles and Scooters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46362,
                TotalDue = 16461.6425,
                CustomerID = 29938,
                StateProvinceCode = "CA",
                Store = "Trailblazing Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46363,
                TotalDue = 37567.4236,
                CustomerID = 29746,
                StateProvinceCode = "OH",
                Store = "Bicycle Outfitters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46364,
                TotalDue = 36667.3332,
                CustomerID = 29525,
                StateProvinceCode = "CA",
                Store = "Extended Bike Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46365,
                TotalDue = 4302.6278,
                CustomerID = 29685,
                StateProvinceCode = "GA",
                Store = "Elemental Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46366,
                TotalDue = 6861.2843,
                CustomerID = 29982,
                StateProvinceCode = "CA",
                Store = "Discount Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46367,
                TotalDue = 27339.6079,
                CustomerID = 29883,
                StateProvinceCode = "CO",
                Store = "Sample Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46368,
                TotalDue = 26937.2303,
                CustomerID = 29581,
                StateProvinceCode = "CT",
                Store = "Modern Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46369,
                TotalDue = 4460.0736,
                CustomerID = 29669,
                StateProvinceCode = "NY",
                Store = "Famous Bike Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46370,
                TotalDue = 28633.1459,
                CustomerID = 29834,
                StateProvinceCode = "CA",
                Store = "Small Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46371,
                TotalDue = 1017.1390,
                CustomerID = 29674,
                StateProvinceCode = "IL",
                Store = "Westside Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46372,
                TotalDue = 36319.9540,
                CustomerID = 29710,
                StateProvinceCode = "NV",
                Store = "Downtown Hotel"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46373,
                TotalDue = 1829.2478,
                CustomerID = 29518,
                StateProvinceCode = "KY",
                Store = "Distinctive Cycles Sales & Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46374,
                TotalDue = 14679.4355,
                CustomerID = 29702,
                StateProvinceCode = "TX",
                Store = "Paint Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46375,
                TotalDue = 403.1163,
                CustomerID = 29788,
                StateProvinceCode = "CA",
                Store = "The New Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46376,
                TotalDue = 875.4270,
                CustomerID = 29498,
                StateProvinceCode = "NH",
                Store = "Metropolitan Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46377,
                TotalDue = 11092.3826,
                CustomerID = 29637,
                StateProvinceCode = "TX",
                Store = "Advanced Bike Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46378,
                TotalDue = 1889.2429,
                CustomerID = 29872,
                StateProvinceCode = "MO",
                Store = "A Great Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46379,
                TotalDue = 3759.6381,
                CustomerID = 29810,
                StateProvinceCode = "WA",
                Store = "Central Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46380,
                TotalDue = 53295.3497,
                CustomerID = 29562,
                StateProvinceCode = "CA",
                Store = "Golf and Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46381,
                TotalDue = 1614.5170,
                CustomerID = 29915,
                StateProvinceCode = "WA",
                Store = "Finer Parts Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46382,
                TotalDue = 15396.7194,
                CustomerID = 29531,
                StateProvinceCode = "NV",
                Store = "Remarkable Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46383,
                TotalDue = 18695.1005,
                CustomerID = 29642,
                StateProvinceCode = "TN",
                Store = "Ultimate Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46384,
                TotalDue = 15535.4164,
                CustomerID = 30088,
                StateProvinceCode = "TN",
                Store = "Reliable Brake Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46385,
                TotalDue = 52178.0228,
                CustomerID = 29966,
                StateProvinceCode = "NY",
                Store = "Larger Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46386,
                TotalDue = 11311.1394,
                CustomerID = 29487,
                StateProvinceCode = "OH",
                Store = "The Bike Mechanics"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46387,
                TotalDue = 54191.5037,
                CustomerID = 29715,
                StateProvinceCode = "TN",
                Store = "Excellent Riding Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46388,
                TotalDue = 2877.5382,
                CustomerID = 29808,
                StateProvinceCode = "FL",
                Store = "Stylish Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46389,
                TotalDue = 1439.1478,
                CustomerID = 29484,
                StateProvinceCode = "TN",
                Store = "Next-Door Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46604,
                TotalDue = 41824.8970,
                CustomerID = 29825,
                StateProvinceCode = "GA",
                Store = "Better Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46605,
                TotalDue = 6700.5716,
                CustomerID = 30039,
                StateProvinceCode = "IL",
                Store = "Gift and Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46606,
                TotalDue = 64.2420,
                CustomerID = 29565,
                StateProvinceCode = "CA",
                Store = "World Bike Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46609,
                TotalDue = 2677.9235,
                CustomerID = 29858,
                StateProvinceCode = "WA",
                Store = "Synthetic Materials Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46610,
                TotalDue = 41199.3865,
                CustomerID = 30065,
                StateProvinceCode = "CT",
                Store = "Immediate Repair Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46611,
                TotalDue = 87984.5334,
                CustomerID = 29580,
                StateProvinceCode = "WA",
                Store = "Latest Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46612,
                TotalDue = 1836.0776,
                CustomerID = 29599,
                StateProvinceCode = "ID",
                Store = "Commendable Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46613,
                TotalDue = 3302.5167,
                CustomerID = 29771,
                StateProvinceCode = "UT",
                Store = "Associated Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46617,
                TotalDue = 4600.4396,
                CustomerID = 29682,
                StateProvinceCode = "CA",
                Store = "Vehicle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46618,
                TotalDue = 96.3630,
                CustomerID = 29867,
                StateProvinceCode = "WA",
                Store = "Roving Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46619,
                TotalDue = 80.1767,
                CustomerID = 29890,
                StateProvinceCode = "WA",
                Store = "Basic Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46620,
                TotalDue = 56379.7647,
                CustomerID = 29844,
                StateProvinceCode = "NH",
                Store = "Seventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46621,
                TotalDue = 6467.8143,
                CustomerID = 29973,
                StateProvinceCode = "MI",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46624,
                TotalDue = 42418.7278,
                CustomerID = 29605,
                StateProvinceCode = "AZ",
                Store = "Professional Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46625,
                TotalDue = 50669.1839,
                CustomerID = 29744,
                StateProvinceCode = "AZ",
                Store = "Real Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46628,
                TotalDue = 729.6412,
                CustomerID = 29604,
                StateProvinceCode = "FL",
                Store = "Hobby Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46629,
                TotalDue = 111633.3826,
                CustomerID = 29827,
                StateProvinceCode = "MO",
                Store = "First Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46630,
                TotalDue = 40184.5711,
                CustomerID = 30075,
                StateProvinceCode = "FL",
                Store = "Valuable Bike Parts Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46631,
                TotalDue = 8293.7855,
                CustomerID = 29811,
                StateProvinceCode = "VA",
                Store = "Trusted Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46633,
                TotalDue = 74091.8828,
                CustomerID = 29647,
                StateProvinceCode = "NH",
                Store = "Casual Bicycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46634,
                TotalDue = 847.7428,
                CustomerID = 29489,
                StateProvinceCode = "CA",
                Store = "Area Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46635,
                TotalDue = 2685.8908,
                CustomerID = 30041,
                StateProvinceCode = "FL",
                Store = "Executive Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46636,
                TotalDue = 203.4557,
                CustomerID = 29500,
                StateProvinceCode = "FL",
                Store = "Worthwhile Activity Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46637,
                TotalDue = 236.3547,
                CustomerID = 29958,
                StateProvinceCode = "TN",
                Store = "Sports Sales and Rental"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46638,
                TotalDue = 69535.3981,
                CustomerID = 29889,
                StateProvinceCode = "CA",
                Store = "Separate Parts Corporation"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46640,
                TotalDue = 37508.5600,
                CustomerID = 30096,
                StateProvinceCode = "CT",
                Store = "Classic Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46641,
                TotalDue = 528.9880,
                CustomerID = 29999,
                StateProvinceCode = "FL",
                Store = "Spoke Manufacturers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46642,
                TotalDue = 110233.1643,
                CustomerID = 29772,
                StateProvinceCode = "TX",
                Store = "Modular Cycle Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46643,
                TotalDue = 123497.0664,
                CustomerID = 29689,
                StateProvinceCode = "WA",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46644,
                TotalDue = 1473.8636,
                CustomerID = 29661,
                StateProvinceCode = "MS",
                Store = "Bike Rims Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46646,
                TotalDue = 1284.1907,
                CustomerID = 30018,
                StateProvinceCode = "WA",
                Store = "All Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46647,
                TotalDue = 90890.6360,
                CustomerID = 29497,
                StateProvinceCode = "WY",
                Store = "Great Bikes "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46648,
                TotalDue = 64407.3379,
                CustomerID = 29937,
                StateProvinceCode = "TX",
                Store = "Go-cart and Bike Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46649,
                TotalDue = 11790.1317,
                CustomerID = 29683,
                StateProvinceCode = "WY",
                Store = "First Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46650,
                TotalDue = 4320.5075,
                CustomerID = 29636,
                StateProvinceCode = "UT",
                Store = "Western Bike Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46651,
                TotalDue = 13673.2194,
                CustomerID = 29654,
                StateProvinceCode = "IL",
                Store = "This Area Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46654,
                TotalDue = 7930.5570,
                CustomerID = 29520,
                StateProvinceCode = "TN",
                Store = "Activity Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46655,
                TotalDue = 50779.8221,
                CustomerID = 29658,
                StateProvinceCode = "IN",
                Store = "Grand Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46656,
                TotalDue = 34.0951,
                CustomerID = 29782,
                StateProvinceCode = "MN",
                Store = "Active Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46659,
                TotalDue = 770.9676,
                CustomerID = 29718,
                StateProvinceCode = "IN",
                Store = "Weekend Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46660,
                TotalDue = 132727.8506,
                CustomerID = 29646,
                StateProvinceCode = "TX",
                Store = "Fitness Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46661,
                TotalDue = 1721.4004,
                CustomerID = 29920,
                StateProvinceCode = "TX",
                Store = "Specialty Sports Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46662,
                TotalDue = 79767.4887,
                CustomerID = 30109,
                StateProvinceCode = "MI",
                Store = "Exhilarating Cycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46663,
                TotalDue = 9687.5932,
                CustomerID = 29570,
                StateProvinceCode = "TX",
                Store = "Grease and Oil Products Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46664,
                TotalDue = 17855.2985,
                CustomerID = 29533,
                StateProvinceCode = "MI",
                Store = "Small Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46665,
                TotalDue = 415.5164,
                CustomerID = 30057,
                StateProvinceCode = "AL",
                Store = "Racing Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46666,
                TotalDue = 99952.4380,
                CustomerID = 29594,
                StateProvinceCode = "IN",
                Store = "Eastside Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46667,
                TotalDue = 16410.8734,
                CustomerID = 29981,
                StateProvinceCode = "WA",
                Store = "Official Parts Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46668,
                TotalDue = 66861.4015,
                CustomerID = 29992,
                StateProvinceCode = "NM",
                Store = "Bike Dealers Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46671,
                TotalDue = 70498.0388,
                CustomerID = 29783,
                StateProvinceCode = "CO",
                Store = "Futuristic Sport Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46672,
                TotalDue = 71561.0617,
                CustomerID = 29704,
                StateProvinceCode = "FL",
                Store = "Rally Day Mall"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46673,
                TotalDue = 31545.9805,
                CustomerID = 29549,
                StateProvinceCode = "FL",
                Store = "Juvenile Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46674,
                TotalDue = 366.4694,
                CustomerID = 29849,
                StateProvinceCode = "FL",
                Store = "Retail Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46675,
                TotalDue = 6270.9230,
                CustomerID = 29805,
                StateProvinceCode = "CA",
                Store = "Distant Inn"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46931,
                TotalDue = 54434.5173,
                CustomerID = 29955,
                StateProvinceCode = "MI",
                Store = "Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46933,
                TotalDue = 53852.7385,
                CustomerID = 29888,
                StateProvinceCode = "NC",
                Store = "New and Used Bicycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46934,
                TotalDue = 528.9880,
                CustomerID = 29555,
                StateProvinceCode = "RI",
                Store = "Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46937,
                TotalDue = 38.1483,
                CustomerID = 30085,
                StateProvinceCode = "VA",
                Store = "Bike Products and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46942,
                TotalDue = 4906.7689,
                CustomerID = 30028,
                StateProvinceCode = "AZ",
                Store = "Professional Containers and Packaging Co."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46943,
                TotalDue = 10085.6434,
                CustomerID = 30011,
                StateProvinceCode = "FL",
                Store = "Sunny Place Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46944,
                TotalDue = 87179.0499,
                CustomerID = 29818,
                StateProvinceCode = "UT",
                Store = "Brakes and Gears"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46947,
                TotalDue = 43966.6364,
                CustomerID = 29828,
                StateProvinceCode = "NY",
                Store = "Traditional Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46948,
                TotalDue = 55440.0520,
                CustomerID = 29509,
                StateProvinceCode = "NH",
                Store = "Retail Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46952,
                TotalDue = 186.6284,
                CustomerID = 30077,
                StateProvinceCode = "NC",
                Store = "Chain and Chain Tool Distributions"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46954,
                TotalDue = 1673.9541,
                CustomerID = 29662,
                StateProvinceCode = "CA",
                Store = "Fleet Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46956,
                TotalDue = 4879.0386,
                CustomerID = 29554,
                StateProvinceCode = "MI",
                Store = "Field Trip Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46957,
                TotalDue = 84892.4274,
                CustomerID = 29997,
                StateProvinceCode = "WA",
                Store = "Closeout Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46958,
                TotalDue = 2768.7414,
                CustomerID = 29949,
                StateProvinceCode = "NV",
                Store = "Security Racks and Locks Wholesalers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46960,
                TotalDue = 11341.9880,
                CustomerID = 29865,
                StateProvinceCode = "CA",
                Store = "Highway Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46961,
                TotalDue = 366.4694,
                CustomerID = 29961,
                StateProvinceCode = "IN",
                Store = "Exotic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46962,
                TotalDue = 2798.9022,
                CustomerID = 29945,
                StateProvinceCode = "FL",
                Store = "Unified Sports Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46963,
                TotalDue = 528.9880,
                CustomerID = 29764,
                StateProvinceCode = "TX",
                Store = "Social Activities Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46964,
                TotalDue = 97424.9805,
                CustomerID = 30117,
                StateProvinceCode = "TX",
                Store = "Totes & Baskets Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46965,
                TotalDue = 9558.3823,
                CustomerID = 29598,
                StateProvinceCode = "CA",
                Store = "Mechanical Products Ltd."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46966,
                TotalDue = 46150.5713,
                CustomerID = 29935,
                StateProvinceCode = "UT",
                Store = "Frugal Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46967,
                TotalDue = 54663.8635,
                CustomerID = 30045,
                StateProvinceCode = "OR",
                Store = "Bike Experts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46968,
                TotalDue = 17918.1412,
                CustomerID = 29684,
                StateProvinceCode = "MI",
                Store = "Grand Sport Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46969,
                TotalDue = 44380.4430,
                CustomerID = 30055,
                StateProvinceCode = "MO",
                Store = "Bicycle Lines Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46970,
                TotalDue = 57366.7308,
                CustomerID = 30094,
                StateProvinceCode = "CA",
                Store = "Quantity Discounts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46971,
                TotalDue = 17223.2967,
                CustomerID = 29540,
                StateProvinceCode = "NC",
                Store = "Lubricant and Grease Suppliers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46972,
                TotalDue = 43044.4676,
                CustomerID = 30107,
                StateProvinceCode = "NV",
                Store = "Permanent Finish Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46973,
                TotalDue = 7012.7107,
                CustomerID = 29571,
                StateProvinceCode = "WA",
                Store = "Moderately-Priced Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46974,
                TotalDue = 45491.1338,
                CustomerID = 29953,
                StateProvinceCode = "WA",
                Store = "Front Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46976,
                TotalDue = 8727.1055,
                CustomerID = 29816,
                StateProvinceCode = "WA",
                Store = "Progressive Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46977,
                TotalDue = 4792.2470,
                CustomerID = 29675,
                StateProvinceCode = "MA",
                Store = "Wholesale Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46978,
                TotalDue = 205.8638,
                CustomerID = 29800,
                StateProvinceCode = "OR",
                Store = "Latest Accessories Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46979,
                TotalDue = 6385.2135,
                CustomerID = 30023,
                StateProvinceCode = "IL",
                Store = "Orange Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46980,
                TotalDue = 56702.8765,
                CustomerID = 30076,
                StateProvinceCode = "CO",
                Store = "Fun Times Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46986,
                TotalDue = 7447.5551,
                CustomerID = 29633,
                StateProvinceCode = "OH",
                Store = "Riverside Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46988,
                TotalDue = 89930.0449,
                CustomerID = 29703,
                StateProvinceCode = "CA",
                Store = "Preferred Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46989,
                TotalDue = 2645.8025,
                CustomerID = 29569,
                StateProvinceCode = "SD",
                Store = "Travel Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46990,
                TotalDue = 1044.1117,
                CustomerID = 29925,
                StateProvinceCode = "WA",
                Store = "Outdoor Sports Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46991,
                TotalDue = 11028.5875,
                CustomerID = 30017,
                StateProvinceCode = "KY",
                Store = "Village Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46992,
                TotalDue = 65766.0724,
                CustomerID = 29919,
                StateProvinceCode = "CA",
                Store = "Mountain Bike Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46993,
                TotalDue = 54842.8645,
                CustomerID = 29996,
                StateProvinceCode = "NY",
                Store = "Fashionable Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46994,
                TotalDue = 61834.9438,
                CustomerID = 30060,
                StateProvinceCode = "IN",
                Store = "Executive Gift Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46995,
                TotalDue = 9621.2115,
                CustomerID = 29798,
                StateProvinceCode = "TN",
                Store = "Manufacturers Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46996,
                TotalDue = 71753.9051,
                CustomerID = 29513,
                StateProvinceCode = "TN",
                Store = "Tiny Bike Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 46999,
                TotalDue = 2677.9235,
                CustomerID = 29765,
                StateProvinceCode = "MI",
                Store = "Blue Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47001,
                TotalDue = 78688.2955,
                CustomerID = 29724,
                StateProvinceCode = "CT",
                Store = "Lease-a-Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47002,
                TotalDue = 1401.4635,
                CustomerID = 29757,
                StateProvinceCode = "CA",
                Store = "Basic Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47005,
                TotalDue = 1481.5886,
                CustomerID = 29835,
                StateProvinceCode = "OR",
                Store = "Superior Hardware Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47010,
                TotalDue = 236.3547,
                CustomerID = 29691,
                StateProvinceCode = "AL",
                Store = "Extreme Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47011,
                TotalDue = 18932.1018,
                CustomerID = 30009,
                StateProvinceCode = "OH",
                Store = "Guaranteed Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47016,
                TotalDue = 8801.3444,
                CustomerID = 29784,
                StateProvinceCode = "CA",
                Store = "Big-Time Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47018,
                TotalDue = 121122.2311,
                CustomerID = 29716,
                StateProvinceCode = "CA",
                Store = "Farthermost Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47020,
                TotalDue = 982.3123,
                CustomerID = 29593,
                StateProvinceCode = "IL",
                Store = "Client Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47021,
                TotalDue = 1621.5349,
                CustomerID = 29619,
                StateProvinceCode = "OH",
                Store = "Mechanical Sports Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47022,
                TotalDue = 528.9880,
                CustomerID = 29930,
                StateProvinceCode = "IL",
                Store = "Largest Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47023,
                TotalDue = 1473.8636,
                CustomerID = 29640,
                StateProvinceCode = "GA",
                Store = "Distance Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47024,
                TotalDue = 51660.8576,
                CustomerID = 29732,
                StateProvinceCode = "TX",
                Store = "Satin Finish Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47025,
                TotalDue = 19339.9236,
                CustomerID = 29543,
                StateProvinceCode = "OH",
                Store = "Bike Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47026,
                TotalDue = 46208.5689,
                CustomerID = 29896,
                StateProvinceCode = "GA",
                Store = "Noiseless Gear Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47027,
                TotalDue = 118290.7501,
                CustomerID = 29616,
                StateProvinceCode = "TX",
                Store = "Sheet Metal Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47028,
                TotalDue = 45019.5403,
                CustomerID = 29522,
                StateProvinceCode = "CA",
                Store = "Resale Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47029,
                TotalDue = 60.1358,
                CustomerID = 29866,
                StateProvinceCode = "TX",
                Store = "Rental Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47030,
                TotalDue = 2875.0627,
                CustomerID = 29590,
                StateProvinceCode = "MI",
                Store = "Metro Bike Works"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47032,
                TotalDue = 5758.2551,
                CustomerID = 30022,
                StateProvinceCode = "CA",
                Store = "Metropolitan Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47033,
                TotalDue = 105493.6317,
                CustomerID = 30112,
                StateProvinceCode = "WA",
                Store = "Mail-Order Outlet"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47034,
                TotalDue = 76433.8823,
                CustomerID = 29560,
                StateProvinceCode = "CA",
                Store = "Number 1 Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47035,
                TotalDue = 2981.6012,
                CustomerID = 30012,
                StateProvinceCode = "CA",
                Store = "Alpine Ski House"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47036,
                TotalDue = 2824.2890,
                CustomerID = 29753,
                StateProvinceCode = "WA",
                Store = "Coho Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47038,
                TotalDue = 207.7582,
                CustomerID = 29993,
                StateProvinceCode = "AL",
                Store = "Pedal Systems Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47039,
                TotalDue = 37041.7271,
                CustomerID = 29901,
                StateProvinceCode = "CA",
                Store = "Sturdy Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47040,
                TotalDue = 25194.9170,
                CustomerID = 29880,
                StateProvinceCode = "SC",
                Store = "Consolidated Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47041,
                TotalDue = 95172.7396,
                CustomerID = 29924,
                StateProvinceCode = "CO",
                Store = "Reasonable Bicycle Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47042,
                TotalDue = 53375.5838,
                CustomerID = 29507,
                StateProvinceCode = "MS",
                Store = "eCommerce Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47043,
                TotalDue = 236.3547,
                CustomerID = 29588,
                StateProvinceCode = "MT",
                Store = "Nonskid Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47044,
                TotalDue = 201.9959,
                CustomerID = 29968,
                StateProvinceCode = "NC",
                Store = "Metro Bike Mart"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47045,
                TotalDue = 81115.0688,
                CustomerID = 29523,
                StateProvinceCode = "TX",
                Store = "The Gear Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47046,
                TotalDue = 4492.9230,
                CustomerID = 29846,
                StateProvinceCode = "FL",
                Store = "General Associates"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47048,
                TotalDue = 528.9880,
                CustomerID = 30095,
                StateProvinceCode = "TX",
                Store = "Swift Cycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47049,
                TotalDue = 52202.1458,
                CustomerID = 29792,
                StateProvinceCode = "TX",
                Store = "Genial Bike Associates"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47050,
                TotalDue = 7673.2560,
                CustomerID = 29731,
                StateProvinceCode = "IN",
                Store = "Super Sports Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47051,
                TotalDue = 23.1773,
                CustomerID = 29787,
                StateProvinceCode = "WA",
                Store = "Year-Round Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47052,
                TotalDue = 67022.2639,
                CustomerID = 29836,
                StateProvinceCode = "ME",
                Store = "Fitness Sport Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47053,
                TotalDue = 30039.2907,
                CustomerID = 29963,
                StateProvinceCode = "TN",
                Store = "Every Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47054,
                TotalDue = 47820.1104,
                CustomerID = 29617,
                StateProvinceCode = "WA",
                Store = "Thorough Parts and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47055,
                TotalDue = 52189.6994,
                CustomerID = 29947,
                StateProvinceCode = "ME",
                Store = "Wheelsets Storehouse"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47056,
                TotalDue = 60959.0476,
                CustomerID = 29853,
                StateProvinceCode = "CA",
                Store = "Affordable Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47057,
                TotalDue = 18278.1137,
                CustomerID = 29521,
                StateProvinceCode = "NV",
                Store = "Brightwork Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47058,
                TotalDue = 2461.1392,
                CustomerID = 29756,
                StateProvinceCode = "FL",
                Store = "Tough and Reliable Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47063,
                TotalDue = 2768.7414,
                CustomerID = 29511,
                StateProvinceCode = "CO",
                Store = "Bold Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47064,
                TotalDue = 895.4574,
                CustomerID = 29819,
                StateProvinceCode = "MN",
                Store = "The Accessories Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47065,
                TotalDue = 63052.1356,
                CustomerID = 29913,
                StateProvinceCode = "CO",
                Store = "Field Trip Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47066,
                TotalDue = 64643.6162,
                CustomerID = 29885,
                StateProvinceCode = "WA",
                Store = "Sure & Reliable Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47067,
                TotalDue = 20259.3929,
                CustomerID = 29667,
                StateProvinceCode = "TN",
                Store = "Wonderful Bikes Inc."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47349,
                TotalDue = 1763.8684,
                CustomerID = 30064,
                StateProvinceCode = "WA",
                Store = "Demand Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47350,
                TotalDue = 6442.7007,
                CustomerID = 29781,
                StateProvinceCode = "CA",
                Store = "The Bicycle Accessories Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47351,
                TotalDue = 12459.1132,
                CustomerID = 29592,
                StateProvinceCode = "CT",
                Store = "Painters Bicycle Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47352,
                TotalDue = 39395.2381,
                CustomerID = 29579,
                StateProvinceCode = "CO",
                Store = "Initial Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47355,
                TotalDue = 145741.8553,
                CustomerID = 29957,
                StateProvinceCode = "CA",
                Store = "Eastside Department Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47360,
                TotalDue = 883.9470,
                CustomerID = 29696,
                StateProvinceCode = "CA",
                Store = "Principal Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47363,
                TotalDue = 241.9796,
                CustomerID = 29508,
                StateProvinceCode = "TX",
                Store = "Mountain Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47364,
                TotalDue = 207.7582,
                CustomerID = 29528,
                StateProvinceCode = "MI",
                Store = "Work and Play Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47367,
                TotalDue = 29878.1139,
                CustomerID = 30105,
                StateProvinceCode = "OR",
                Store = "Convenient Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47368,
                TotalDue = 7546.9591,
                CustomerID = 29709,
                StateProvinceCode = "OR",
                Store = "Successful Sales Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47369,
                TotalDue = 158056.5449,
                CustomerID = 29998,
                StateProvinceCode = "CA",
                Store = "Bicycle Merchandise Warehouse"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47370,
                TotalDue = 168.3305,
                CustomerID = 29659,
                StateProvinceCode = "TX",
                Store = "Genuine Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47371,
                TotalDue = 992.9769,
                CustomerID = 30110,
                StateProvinceCode = "CA",
                Store = "Exercise Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47372,
                TotalDue = 12943.1100,
                CustomerID = 29975,
                StateProvinceCode = "CA",
                Store = "Sports Products Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47373,
                TotalDue = 1891.5571,
                CustomerID = 29842,
                StateProvinceCode = "AZ",
                Store = "First Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47374,
                TotalDue = 32557.2482,
                CustomerID = 29809,
                StateProvinceCode = "CA",
                Store = "Bike World"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47375,
                TotalDue = 528.9880,
                CustomerID = 29902,
                StateProvinceCode = "TX",
                Store = "Beneficial Exercises and Activities"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47378,
                TotalDue = 44437.3562,
                CustomerID = 30118,
                StateProvinceCode = "MO",
                Store = "World of Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47382,
                TotalDue = 74.0972,
                CustomerID = 29775,
                StateProvinceCode = "WA",
                Store = "Two Bike Shops"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47384,
                TotalDue = 49556.5811,
                CustomerID = 29651,
                StateProvinceCode = "WI",
                Store = "Good Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47385,
                TotalDue = 3555.1773,
                CustomerID = 29903,
                StateProvinceCode = "OR",
                Store = "Fad Outlet"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47386,
                TotalDue = 4077.8268,
                CustomerID = 29897,
                StateProvinceCode = "AZ",
                Store = "Racing Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47387,
                TotalDue = 45058.1297,
                CustomerID = 29690,
                StateProvinceCode = "UT",
                Store = "Fashionable Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47392,
                TotalDue = 366.4694,
                CustomerID = 29721,
                StateProvinceCode = "FL",
                Store = "Bike Goods "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47393,
                TotalDue = 23.1773,
                CustomerID = 29743,
                StateProvinceCode = "IL",
                Store = "Summer Sports Place"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47394,
                TotalDue = 37023.3511,
                CustomerID = 29891,
                StateProvinceCode = "MI",
                Store = "Fabrikam Inc., West"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47395,
                TotalDue = 165028.7482,
                CustomerID = 29701,
                StateProvinceCode = "NH",
                Store = "Outdoor Equipment Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47400,
                TotalDue = 116295.0969,
                CustomerID = 29793,
                StateProvinceCode = "CA",
                Store = "Commercial Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47403,
                TotalDue = 61719.7486,
                CustomerID = 29559,
                StateProvinceCode = "WA",
                Store = "Safe Cycles Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47404,
                TotalDue = 5485.5969,
                CustomerID = 30106,
                StateProvinceCode = "TX",
                Store = "Solid Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47405,
                TotalDue = 881.9341,
                CustomerID = 29847,
                StateProvinceCode = "CA",
                Store = "Good Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47406,
                TotalDue = 5319.0455,
                CustomerID = 29833,
                StateProvinceCode = "GA",
                Store = "Retread Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47407,
                TotalDue = 2838.9905,
                CustomerID = 29535,
                StateProvinceCode = "TX",
                Store = "Grand Bicycle Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47408,
                TotalDue = 1421.7572,
                CustomerID = 29573,
                StateProvinceCode = "CA",
                Store = "Economy Bikes Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47409,
                TotalDue = 69291.7744,
                CustomerID = 29486,
                StateProvinceCode = "MN",
                Store = "Riders Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47414,
                TotalDue = 770.9676,
                CustomerID = 29882,
                StateProvinceCode = "KY",
                Store = "Optimal Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47416,
                TotalDue = 116463.9102,
                CustomerID = 29707,
                StateProvinceCode = "VA",
                Store = "Sales and Supply Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47417,
                TotalDue = 55609.3095,
                CustomerID = 29938,
                StateProvinceCode = "CA",
                Store = "Trailblazing Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47418,
                TotalDue = 101.5473,
                CustomerID = 29758,
                StateProvinceCode = "TX",
                Store = "Cash & Carry Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47419,
                TotalDue = 14568.0157,
                CustomerID = 29663,
                StateProvinceCode = "IL",
                Store = "Local Hardware Factory"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47420,
                TotalDue = 555.0431,
                CustomerID = 29584,
                StateProvinceCode = "CA",
                Store = "Futuristic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47421,
                TotalDue = 10306.0361,
                CustomerID = 29746,
                StateProvinceCode = "OH",
                Store = "Bicycle Outfitters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47422,
                TotalDue = 70421.6105,
                CustomerID = 29954,
                StateProvinceCode = "TX",
                Store = "Elite Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47423,
                TotalDue = 4803.6406,
                CustomerID = 29574,
                StateProvinceCode = "TX",
                Store = "Third Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47424,
                TotalDue = 14218.4847,
                CustomerID = 29685,
                StateProvinceCode = "GA",
                Store = "Elemental Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47425,
                TotalDue = 4422.7704,
                CustomerID = 29982,
                StateProvinceCode = "CA",
                Store = "Discount Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47426,
                TotalDue = 1473.8636,
                CustomerID = 29883,
                StateProvinceCode = "CO",
                Store = "Sample Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47427,
                TotalDue = 38741.3159,
                CustomerID = 29834,
                StateProvinceCode = "CA",
                Store = "Small Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47428,
                TotalDue = 3028.7836,
                CustomerID = 29962,
                StateProvinceCode = "MN",
                Store = "Fitness Hotel"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47429,
                TotalDue = 1420.4070,
                CustomerID = 29674,
                StateProvinceCode = "IL",
                Store = "Westside Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47430,
                TotalDue = 528.9880,
                CustomerID = 29581,
                StateProvinceCode = "CT",
                Store = "Modern Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47431,
                TotalDue = 323.7274,
                CustomerID = 29568,
                StateProvinceCode = "CA",
                Store = "Coalition Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47432,
                TotalDue = 8103.9297,
                CustomerID = 29669,
                StateProvinceCode = "NY",
                Store = "Famous Bike Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47433,
                TotalDue = 101.5473,
                CustomerID = 29763,
                StateProvinceCode = "CA",
                Store = "Retail Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47434,
                TotalDue = 41978.4044,
                CustomerID = 29929,
                StateProvinceCode = "CA",
                Store = "Many Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47435,
                TotalDue = 53889.3084,
                CustomerID = 29702,
                StateProvinceCode = "TX",
                Store = "Paint Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47436,
                TotalDue = 19322.8073,
                CustomerID = 29815,
                StateProvinceCode = "CA",
                Store = "Metropolitan Sports Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47437,
                TotalDue = 241.9796,
                CustomerID = 29788,
                StateProvinceCode = "CA",
                Store = "The New Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47438,
                TotalDue = 63763.0613,
                CustomerID = 29956,
                StateProvinceCode = "TX",
                Store = "Chic Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47439,
                TotalDue = 66759.2041,
                CustomerID = 29637,
                StateProvinceCode = "TX",
                Store = "Advanced Bike Components"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47440,
                TotalDue = 9685.7144,
                CustomerID = 29635,
                StateProvinceCode = "MO",
                Store = "Responsible Bike Dealers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47441,
                TotalDue = 126830.9608,
                CustomerID = 29562,
                StateProvinceCode = "CA",
                Store = "Golf and Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47442,
                TotalDue = 276.4430,
                CustomerID = 29915,
                StateProvinceCode = "WA",
                Store = "Finer Parts Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47443,
                TotalDue = 8569.6012,
                CustomerID = 29810,
                StateProvinceCode = "WA",
                Store = "Central Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47444,
                TotalDue = 10161.6492,
                CustomerID = 29531,
                StateProvinceCode = "NV",
                Store = "Remarkable Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47446,
                TotalDue = 428.6079,
                CustomerID = 29838,
                StateProvinceCode = "IN",
                Store = "Recreation Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47448,
                TotalDue = 2381.7634,
                CustomerID = 29490,
                StateProvinceCode = "ID",
                Store = "Bicycle Accessories and Kits"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47449,
                TotalDue = 12070.3168,
                CustomerID = 29976,
                StateProvinceCode = "GA",
                Store = "Selected Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47450,
                TotalDue = 73470.9000,
                CustomerID = 29966,
                StateProvinceCode = "NY",
                Store = "Larger Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47452,
                TotalDue = 6832.9030,
                CustomerID = 29873,
                StateProvinceCode = "WA",
                Store = "Certified Bicycle Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47453,
                TotalDue = 2563.1349,
                CustomerID = 29487,
                StateProvinceCode = "OH",
                Store = "The Bike Mechanics"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47454,
                TotalDue = 30881.7718,
                CustomerID = 29484,
                StateProvinceCode = "TN",
                Store = "Next-Door Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47455,
                TotalDue = 126992.2202,
                CustomerID = 29715,
                StateProvinceCode = "TN",
                Store = "Excellent Riding Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47456,
                TotalDue = 54376.4439,
                CustomerID = 30046,
                StateProvinceCode = "TX",
                Store = "Extraordinary Bike Works"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47457,
                TotalDue = 5575.9343,
                CustomerID = 29678,
                StateProvinceCode = "FL",
                Store = "Superlative Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47458,
                TotalDue = 62642.9228,
                CustomerID = 29739,
                StateProvinceCode = "AZ",
                Store = "Retail Sporting Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47459,
                TotalDue = 7233.6102,
                CustomerID = 29600,
                StateProvinceCode = "MI",
                Store = "Online Bike Sellers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47658,
                TotalDue = 112076.4746,
                CustomerID = 29772,
                StateProvinceCode = "TX",
                Store = "Modular Cycle Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47659,
                TotalDue = 5663.7708,
                CustomerID = 30039,
                StateProvinceCode = "IL",
                Store = "Gift and Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47660,
                TotalDue = 528.9880,
                CustomerID = 29672,
                StateProvinceCode = "GA",
                Store = "Pedals Warehouse"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47661,
                TotalDue = 528.9880,
                CustomerID = 29565,
                StateProvinceCode = "CA",
                Store = "World Bike Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47664,
                TotalDue = 46597.9222,
                CustomerID = 30065,
                StateProvinceCode = "CT",
                Store = "Immediate Repair Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47665,
                TotalDue = 44.6121,
                CustomerID = 29599,
                StateProvinceCode = "ID",
                Store = "Commendable Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47666,
                TotalDue = 84508.0939,
                CustomerID = 29580,
                StateProvinceCode = "WA",
                Store = "Latest Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47667,
                TotalDue = 2281.7570,
                CustomerID = 29771,
                StateProvinceCode = "UT",
                Store = "Associated Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47671,
                TotalDue = 44.6121,
                CustomerID = 29867,
                StateProvinceCode = "WA",
                Store = "Roving Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47672,
                TotalDue = 78.6803,
                CustomerID = 29890,
                StateProvinceCode = "WA",
                Store = "Basic Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47674,
                TotalDue = 8692.6646,
                CustomerID = 29973,
                StateProvinceCode = "MI",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47675,
                TotalDue = 53979.9950,
                CustomerID = 29844,
                StateProvinceCode = "NH",
                Store = "Seventh Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47676,
                TotalDue = 33206.0223,
                CustomerID = 29605,
                StateProvinceCode = "AZ",
                Store = "Professional Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47677,
                TotalDue = 46923.0719,
                CustomerID = 29744,
                StateProvinceCode = "AZ",
                Store = "Real Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47681,
                TotalDue = 32498.5880,
                CustomerID = 30075,
                StateProvinceCode = "FL",
                Store = "Valuable Bike Parts Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47682,
                TotalDue = 297.9141,
                CustomerID = 29604,
                StateProvinceCode = "FL",
                Store = "Hobby Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47683,
                TotalDue = 93003.7488,
                CustomerID = 29827,
                StateProvinceCode = "MO",
                Store = "First Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47684,
                TotalDue = 1899.9866,
                CustomerID = 29811,
                StateProvinceCode = "VA",
                Store = "Trusted Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47685,
                TotalDue = 57652.3196,
                CustomerID = 29647,
                StateProvinceCode = "NH",
                Store = "Casual Bicycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47687,
                TotalDue = 53191.0071,
                CustomerID = 29889,
                StateProvinceCode = "CA",
                Store = "Separate Parts Corporation"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47688,
                TotalDue = 2798.9022,
                CustomerID = 29532,
                StateProvinceCode = "MT",
                Store = "Road-Way Mart"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47689,
                TotalDue = 915.3133,
                CustomerID = 29489,
                StateProvinceCode = "CA",
                Store = "Area Bike Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47691,
                TotalDue = 44.6121,
                CustomerID = 30041,
                StateProvinceCode = "FL",
                Store = "Executive Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47692,
                TotalDue = 4055.4448,
                CustomerID = 29805,
                StateProvinceCode = "CA",
                Store = "Distant Inn"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47693,
                TotalDue = 37295.9417,
                CustomerID = 29825,
                StateProvinceCode = "GA",
                Store = "Better Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47694,
                TotalDue = 81531.1583,
                CustomerID = 29689,
                StateProvinceCode = "WA",
                Store = "Friendly Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47695,
                TotalDue = 126.9341,
                CustomerID = 30018,
                StateProvinceCode = "WA",
                Store = "All Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47697,
                TotalDue = 432.2982,
                CustomerID = 29826,
                StateProvinceCode = "UT",
                Store = "Countryside Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47698,
                TotalDue = 82081.6877,
                CustomerID = 29497,
                StateProvinceCode = "WY",
                Store = "Great Bikes "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47699,
                TotalDue = 6953.1299,
                CustomerID = 29636,
                StateProvinceCode = "UT",
                Store = "Western Bike Supplies"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47700,
                TotalDue = 39568.4399,
                CustomerID = 29937,
                StateProvinceCode = "TX",
                Store = "Go-cart and Bike Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47701,
                TotalDue = 7218.9782,
                CustomerID = 29683,
                StateProvinceCode = "WY",
                Store = "First Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47702,
                TotalDue = 8483.9321,
                CustomerID = 29654,
                StateProvinceCode = "IL",
                Store = "This Area Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47703,
                TotalDue = 6959.2988,
                CustomerID = 29520,
                StateProvinceCode = "TN",
                Store = "Activity Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47706,
                TotalDue = 33508.6828,
                CustomerID = 29658,
                StateProvinceCode = "IN",
                Store = "Grand Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47707,
                TotalDue = 300.6724,
                CustomerID = 29782,
                StateProvinceCode = "MN",
                Store = "Active Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47710,
                TotalDue = 207.7582,
                CustomerID = 29610,
                StateProvinceCode = "OH",
                Store = "Curbside Universe"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47711,
                TotalDue = 56.8590,
                CustomerID = 29920,
                StateProvinceCode = "TX",
                Store = "Specialty Sports Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47712,
                TotalDue = 111922.8064,
                CustomerID = 29646,
                StateProvinceCode = "TX",
                Store = "Fitness Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47713,
                TotalDue = 76.2853,
                CustomerID = 29718,
                StateProvinceCode = "IN",
                Store = "Weekend Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47714,
                TotalDue = 4346.1690,
                CustomerID = 29533,
                StateProvinceCode = "MI",
                Store = "Small Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47715,
                TotalDue = 4255.4027,
                CustomerID = 29570,
                StateProvinceCode = "TX",
                Store = "Grease and Oil Products Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47716,
                TotalDue = 55147.3945,
                CustomerID = 30109,
                StateProvinceCode = "MI",
                Store = "Exhilarating Cycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47717,
                TotalDue = 1586.9642,
                CustomerID = 30057,
                StateProvinceCode = "AL",
                Store = "Racing Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47718,
                TotalDue = 97401.3048,
                CustomerID = 29594,
                StateProvinceCode = "IN",
                Store = "Eastside Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47719,
                TotalDue = 11088.8527,
                CustomerID = 29981,
                StateProvinceCode = "WA",
                Store = "Official Parts Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47720,
                TotalDue = 48829.2808,
                CustomerID = 29992,
                StateProvinceCode = "NM",
                Store = "Bike Dealers Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47722,
                TotalDue = 207.7582,
                CustomerID = 29862,
                StateProvinceCode = "NV",
                Store = "Retail Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47724,
                TotalDue = 54538.2759,
                CustomerID = 29783,
                StateProvinceCode = "CO",
                Store = "Futuristic Sport Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47725,
                TotalDue = 49318.9998,
                CustomerID = 29704,
                StateProvinceCode = "FL",
                Store = "Rally Day Mall"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47726,
                TotalDue = 32162.6078,
                CustomerID = 29549,
                StateProvinceCode = "FL",
                Store = "Juvenile Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47727,
                TotalDue = 236.3547,
                CustomerID = 29500,
                StateProvinceCode = "FL",
                Store = "Worthwhile Activity Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47728,
                TotalDue = 1473.8636,
                CustomerID = 29849,
                StateProvinceCode = "FL",
                Store = "Retail Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47729,
                TotalDue = 366.4694,
                CustomerID = 29999,
                StateProvinceCode = "FL",
                Store = "Spoke Manufacturers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47730,
                TotalDue = 29638.2773,
                CustomerID = 30096,
                StateProvinceCode = "CT",
                Store = "Classic Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47962,
                TotalDue = 43393.5931,
                CustomerID = 29955,
                StateProvinceCode = "MI",
                Store = "Catalog Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47965,
                TotalDue = 55842.0357,
                CustomerID = 29888,
                StateProvinceCode = "NC",
                Store = "New and Used Bicycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47968,
                TotalDue = 307.5668,
                CustomerID = 30085,
                StateProvinceCode = "VA",
                Store = "Bike Products and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47970,
                TotalDue = 81357.0314,
                CustomerID = 29818,
                StateProvinceCode = "UT",
                Store = "Brakes and Gears"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47971,
                TotalDue = 6347.8565,
                CustomerID = 30011,
                StateProvinceCode = "FL",
                Store = "Sunny Place Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47972,
                TotalDue = 3425.4214,
                CustomerID = 30028,
                StateProvinceCode = "AZ",
                Store = "Professional Containers and Packaging Co."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47975,
                TotalDue = 55601.1616,
                CustomerID = 29509,
                StateProvinceCode = "NH",
                Store = "Retail Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47976,
                TotalDue = 45097.4442,
                CustomerID = 29828,
                StateProvinceCode = "NY",
                Store = "Traditional Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47982,
                TotalDue = 76.2966,
                CustomerID = 29991,
                StateProvinceCode = "WA",
                Store = "City Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47983,
                TotalDue = 528.9880,
                CustomerID = 29961,
                StateProvinceCode = "IN",
                Store = "Exotic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47984,
                TotalDue = 6622.6191,
                CustomerID = 29865,
                StateProvinceCode = "CA",
                Store = "Highway Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47985,
                TotalDue = 23.1773,
                CustomerID = 29949,
                StateProvinceCode = "NV",
                Store = "Security Racks and Locks Wholesalers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47986,
                TotalDue = 98786.0510,
                CustomerID = 29997,
                StateProvinceCode = "WA",
                Store = "Closeout Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47987,
                TotalDue = 1797.0194,
                CustomerID = 29554,
                StateProvinceCode = "MI",
                Store = "Field Trip Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47989,
                TotalDue = 8418.7379,
                CustomerID = 29598,
                StateProvinceCode = "CA",
                Store = "Mechanical Products Ltd."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47990,
                TotalDue = 112859.9318,
                CustomerID = 30117,
                StateProvinceCode = "TX",
                Store = "Totes & Baskets Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47991,
                TotalDue = 39748.1045,
                CustomerID = 29935,
                StateProvinceCode = "UT",
                Store = "Frugal Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47992,
                TotalDue = 48974.7969,
                CustomerID = 30045,
                StateProvinceCode = "OR",
                Store = "Bike Experts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47993,
                TotalDue = 10283.5803,
                CustomerID = 29540,
                StateProvinceCode = "NC",
                Store = "Lubricant and Grease Suppliers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47994,
                TotalDue = 53191.3049,
                CustomerID = 30094,
                StateProvinceCode = "CA",
                Store = "Quantity Discounts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47995,
                TotalDue = 16319.2209,
                CustomerID = 29684,
                StateProvinceCode = "MI",
                Store = "Grand Sport Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47996,
                TotalDue = 45220.8879,
                CustomerID = 30055,
                StateProvinceCode = "MO",
                Store = "Bicycle Lines Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47997,
                TotalDue = 4682.6908,
                CustomerID = 29816,
                StateProvinceCode = "WA",
                Store = "Progressive Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47998,
                TotalDue = 12839.3803,
                CustomerID = 29571,
                StateProvinceCode = "WA",
                Store = "Moderately-Priced Bikes Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 47999,
                TotalDue = 38477.3289,
                CustomerID = 30107,
                StateProvinceCode = "NV",
                Store = "Permanent Finish Products"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48001,
                TotalDue = 40968.3578,
                CustomerID = 29953,
                StateProvinceCode = "WA",
                Store = "Front Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48002,
                TotalDue = 5190.1966,
                CustomerID = 29675,
                StateProvinceCode = "MA",
                Store = "Wholesale Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48003,
                TotalDue = 269.8050,
                CustomerID = 30023,
                StateProvinceCode = "IL",
                Store = "Orange Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48004,
                TotalDue = 49589.3932,
                CustomerID = 30076,
                StateProvinceCode = "CO",
                Store = "Fun Times Club"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48011,
                TotalDue = 8463.8087,
                CustomerID = 29633,
                StateProvinceCode = "OH",
                Store = "Riverside Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48012,
                TotalDue = 57550.3009,
                CustomerID = 29703,
                StateProvinceCode = "CA",
                Store = "Preferred Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48013,
                TotalDue = 2257.2249,
                CustomerID = 29569,
                StateProvinceCode = "SD",
                Store = "Travel Systems"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48014,
                TotalDue = 236.3547,
                CustomerID = 29925,
                StateProvinceCode = "WA",
                Store = "Outdoor Sports Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48015,
                TotalDue = 3400.0346,
                CustomerID = 30017,
                StateProvinceCode = "KY",
                Store = "Village Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48016,
                TotalDue = 49868.5573,
                CustomerID = 29919,
                StateProvinceCode = "CA",
                Store = "Mountain Bike Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48017,
                TotalDue = 40878.2782,
                CustomerID = 29996,
                StateProvinceCode = "NY",
                Store = "Fashionable Department Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48018,
                TotalDue = 50220.1810,
                CustomerID = 29513,
                StateProvinceCode = "TN",
                Store = "Tiny Bike Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48019,
                TotalDue = 6997.2556,
                CustomerID = 29621,
                StateProvinceCode = "TN",
                Store = "Mountain Emporium"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48020,
                TotalDue = 8530.1459,
                CustomerID = 29798,
                StateProvinceCode = "TN",
                Store = "Manufacturers Inc"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48021,
                TotalDue = 40073.1715,
                CustomerID = 30060,
                StateProvinceCode = "IN",
                Store = "Executive Gift Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48024,
                TotalDue = 22.3061,
                CustomerID = 29765,
                StateProvinceCode = "MI",
                Store = "Blue Bicycle Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48026,
                TotalDue = 52145.5501,
                CustomerID = 29724,
                StateProvinceCode = "CT",
                Store = "Lease-a-Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48027,
                TotalDue = 350.2312,
                CustomerID = 29757,
                StateProvinceCode = "CA",
                Store = "Basic Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48029,
                TotalDue = 22.3061,
                CustomerID = 29835,
                StateProvinceCode = "OR",
                Store = "Superior Hardware Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48034,
                TotalDue = 17589.2799,
                CustomerID = 30009,
                StateProvinceCode = "OH",
                Store = "Guaranteed Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48041,
                TotalDue = 11451.9319,
                CustomerID = 29784,
                StateProvinceCode = "CA",
                Store = "Big-Time Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48043,
                TotalDue = 109751.4891,
                CustomerID = 29716,
                StateProvinceCode = "CA",
                Store = "Farthermost Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48044,
                TotalDue = 245.1090,
                CustomerID = 29930,
                StateProvinceCode = "IL",
                Store = "Largest Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48045,
                TotalDue = 1302.7588,
                CustomerID = 29593,
                StateProvinceCode = "IL",
                Store = "Client Discount Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48046,
                TotalDue = 362.9685,
                CustomerID = 29619,
                StateProvinceCode = "OH",
                Store = "Mechanical Sports Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48047,
                TotalDue = 15.7361,
                CustomerID = 30047,
                StateProvinceCode = "CA",
                Store = "Valley Bicycle Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48048,
                TotalDue = 107136.3425,
                CustomerID = 29616,
                StateProvinceCode = "TX",
                Store = "Sheet Metal Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48049,
                TotalDue = 46172.7196,
                CustomerID = 29522,
                StateProvinceCode = "CA",
                Store = "Resale Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48050,
                TotalDue = 37910.4265,
                CustomerID = 29543,
                StateProvinceCode = "OH",
                Store = "Bike Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48051,
                TotalDue = 48155.6042,
                CustomerID = 29896,
                StateProvinceCode = "GA",
                Store = "Noiseless Gear Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48052,
                TotalDue = 27778.5386,
                CustomerID = 29732,
                StateProvinceCode = "TX",
                Store = "Satin Finish Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48054,
                TotalDue = 3173.9282,
                CustomerID = 30022,
                StateProvinceCode = "CA",
                Store = "Metropolitan Manufacturing"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48055,
                TotalDue = 2268.5228,
                CustomerID = 30012,
                StateProvinceCode = "CA",
                Store = "Alpine Ski House"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48056,
                TotalDue = 67121.2511,
                CustomerID = 29560,
                StateProvinceCode = "CA",
                Store = "Number 1 Supply"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48057,
                TotalDue = 97613.7308,
                CustomerID = 30112,
                StateProvinceCode = "WA",
                Store = "Mail-Order Outlet"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48058,
                TotalDue = 23.1773,
                CustomerID = 29753,
                StateProvinceCode = "WA",
                Store = "Coho Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48060,
                TotalDue = 1586.9642,
                CustomerID = 29719,
                StateProvinceCode = "WA",
                Store = "Racing Bike Outlet"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48061,
                TotalDue = 1057.9760,
                CustomerID = 29993,
                StateProvinceCode = "AL",
                Store = "Pedal Systems Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48062,
                TotalDue = 16080.0463,
                CustomerID = 29880,
                StateProvinceCode = "SC",
                Store = "Consolidated Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48063,
                TotalDue = 40986.0702,
                CustomerID = 29507,
                StateProvinceCode = "MS",
                Store = "eCommerce Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48064,
                TotalDue = 100.4487,
                CustomerID = 29588,
                StateProvinceCode = "MT",
                Store = "Nonskid Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48065,
                TotalDue = 89031.0812,
                CustomerID = 29924,
                StateProvinceCode = "CO",
                Store = "Reasonable Bicycle Sales"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48066,
                TotalDue = 44070.7691,
                CustomerID = 29901,
                StateProvinceCode = "CA",
                Store = "Sturdy Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48067,
                TotalDue = 40.0883,
                CustomerID = 29968,
                StateProvinceCode = "NC",
                Store = "Metro Bike Mart"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48068,
                TotalDue = 2851.8933,
                CustomerID = 29846,
                StateProvinceCode = "FL",
                Store = "General Associates"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48069,
                TotalDue = 74829.8502,
                CustomerID = 29523,
                StateProvinceCode = "TX",
                Store = "The Gear Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48070,
                TotalDue = 207.7582,
                CustomerID = 30095,
                StateProvinceCode = "TX",
                Store = "Swift Cycles"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48071,
                TotalDue = 38624.2853,
                CustomerID = 29792,
                StateProvinceCode = "TX",
                Store = "Genial Bike Associates"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48073,
                TotalDue = 11543.7753,
                CustomerID = 29731,
                StateProvinceCode = "IN",
                Store = "Super Sports Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48075,
                TotalDue = 21149.6277,
                CustomerID = 29963,
                StateProvinceCode = "TN",
                Store = "Every Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48076,
                TotalDue = 72651.9849,
                CustomerID = 29836,
                StateProvinceCode = "ME",
                Store = "Fitness Sport Boutique"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48077,
                TotalDue = 44637.9672,
                CustomerID = 29947,
                StateProvinceCode = "ME",
                Store = "Wheelsets Storehouse"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48078,
                TotalDue = 2768.7414,
                CustomerID = 29787,
                StateProvinceCode = "WA",
                Store = "Year-Round Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48079,
                TotalDue = 48930.5642,
                CustomerID = 29617,
                StateProvinceCode = "WA",
                Store = "Thorough Parts and Repair Services"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48080,
                TotalDue = 56071.6643,
                CustomerID = 29853,
                StateProvinceCode = "CA",
                Store = "Affordable Sports Equipment"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48083,
                TotalDue = 7806.9381,
                CustomerID = 29521,
                StateProvinceCode = "NV",
                Store = "Brightwork Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48087,
                TotalDue = 53883.4153,
                CustomerID = 29885,
                StateProvinceCode = "WA",
                Store = "Sure & Reliable Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48089,
                TotalDue = 68500.2118,
                CustomerID = 29913,
                StateProvinceCode = "CO",
                Store = "Field Trip Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48090,
                TotalDue = 8487.9788,
                CustomerID = 29667,
                StateProvinceCode = "TN",
                Store = "Wonderful Bikes Inc."
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48091,
                TotalDue = 1473.8636,
                CustomerID = 29819,
                StateProvinceCode = "MN",
                Store = "The Accessories Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48092,
                TotalDue = 265.7329,
                CustomerID = 29626,
                StateProvinceCode = "TN",
                Store = "Tandem Bicycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48286,
                TotalDue = 6347.8565,
                CustomerID = 29781,
                StateProvinceCode = "CA",
                Store = "The Bicycle Accessories Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48288,
                TotalDue = 432.2982,
                CustomerID = 29536,
                StateProvinceCode = "MI",
                Store = "Kickstand Sellers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48289,
                TotalDue = 718.1476,
                CustomerID = 30064,
                StateProvinceCode = "WA",
                Store = "Demand Distributors"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48290,
                TotalDue = 10516.9668,
                CustomerID = 29592,
                StateProvinceCode = "CT",
                Store = "Painters Bicycle Specialists"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48292,
                TotalDue = 39877.3389,
                CustomerID = 29579,
                StateProvinceCode = "CO",
                Store = "Initial Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48294,
                TotalDue = 2798.9022,
                CustomerID = 29622,
                StateProvinceCode = "WA",
                Store = "Metro Cycle Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48295,
                TotalDue = 89069.5444,
                CustomerID = 29957,
                StateProvinceCode = "CA",
                Store = "Eastside Department Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48302,
                TotalDue = 366.4694,
                CustomerID = 29696,
                StateProvinceCode = "CA",
                Store = "Principal Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48305,
                TotalDue = 675.8956,
                CustomerID = 29528,
                StateProvinceCode = "MI",
                Store = "Work and Play Association"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48308,
                TotalDue = 3402.6470,
                CustomerID = 29709,
                StateProvinceCode = "OR",
                Store = "Successful Sales Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48309,
                TotalDue = 551.2941,
                CustomerID = 29508,
                StateProvinceCode = "TX",
                Store = "Mountain Toy Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48310,
                TotalDue = 27811.7892,
                CustomerID = 30105,
                StateProvinceCode = "OR",
                Store = "Convenient Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48311,
                TotalDue = 88767.0192,
                CustomerID = 29998,
                StateProvinceCode = "CA",
                Store = "Bicycle Merchandise Warehouse"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48312,
                TotalDue = 1299.1702,
                CustomerID = 29842,
                StateProvinceCode = "AZ",
                Store = "First Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48313,
                TotalDue = 14951.2989,
                CustomerID = 29809,
                StateProvinceCode = "CA",
                Store = "Bike World"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48314,
                TotalDue = 5302.2384,
                CustomerID = 29975,
                StateProvinceCode = "CA",
                Store = "Sports Products Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48315,
                TotalDue = 283.3125,
                CustomerID = 30110,
                StateProvinceCode = "CA",
                Store = "Exercise Center"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48316,
                TotalDue = 366.4694,
                CustomerID = 29902,
                StateProvinceCode = "TX",
                Store = "Beneficial Exercises and Activities"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48318,
                TotalDue = 35194.5141,
                CustomerID = 30118,
                StateProvinceCode = "MO",
                Store = "World of Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48322,
                TotalDue = 675.8956,
                CustomerID = 29775,
                StateProvinceCode = "WA",
                Store = "Two Bike Shops"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48325,
                TotalDue = 54611.5389,
                CustomerID = 29651,
                StateProvinceCode = "WI",
                Store = "Good Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48326,
                TotalDue = 1902.3692,
                CustomerID = 29903,
                StateProvinceCode = "OR",
                Store = "Fad Outlet"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48327,
                TotalDue = 3905.7470,
                CustomerID = 29897,
                StateProvinceCode = "AZ",
                Store = "Racing Toys"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48328,
                TotalDue = 33869.1054,
                CustomerID = 29690,
                StateProvinceCode = "UT",
                Store = "Fashionable Bikes and Accessories"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48333,
                TotalDue = 37780.2553,
                CustomerID = 29891,
                StateProvinceCode = "MI",
                Store = "Fabrikam Inc., West"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48334,
                TotalDue = 2768.7414,
                CustomerID = 29743,
                StateProvinceCode = "IL",
                Store = "Summer Sports Place"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48335,
                TotalDue = 1110.4682,
                CustomerID = 29721,
                StateProvinceCode = "FL",
                Store = "Bike Goods "
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48336,
                TotalDue = 113231.0188,
                CustomerID = 29701,
                StateProvinceCode = "NH",
                Store = "Outdoor Equipment Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48341,
                TotalDue = 78835.7251,
                CustomerID = 29793,
                StateProvinceCode = "CA",
                Store = "Commercial Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48342,
                TotalDue = 9796.1579,
                CustomerID = 29600,
                StateProvinceCode = "MI",
                Store = "Online Bike Sellers"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48343,
                TotalDue = 893.3601,
                CustomerID = 29833,
                StateProvinceCode = "GA",
                Store = "Retread Tire Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48344,
                TotalDue = 1399.4512,
                CustomerID = 29573,
                StateProvinceCode = "CA",
                Store = "Economy Bikes Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48345,
                TotalDue = 4567.3935,
                CustomerID = 30106,
                StateProvinceCode = "TX",
                Store = "Solid Bike Parts"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48346,
                TotalDue = 2768.7414,
                CustomerID = 29535,
                StateProvinceCode = "TX",
                Store = "Grand Bicycle Stores"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48347,
                TotalDue = 49894.8739,
                CustomerID = 29559,
                StateProvinceCode = "WA",
                Store = "Safe Cycles Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48349,
                TotalDue = 61020.2059,
                CustomerID = 29486,
                StateProvinceCode = "MN",
                Store = "Riders Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48356,
                TotalDue = 30728.8984,
                CustomerID = 29938,
                StateProvinceCode = "CA",
                Store = "Trailblazing Sports"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48357,
                TotalDue = 277.4200,
                CustomerID = 29882,
                StateProvinceCode = "KY",
                Store = "Optimal Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48358,
                TotalDue = 76.1604,
                CustomerID = 29758,
                StateProvinceCode = "TX",
                Store = "Cash & Carry Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48359,
                TotalDue = 90167.3302,
                CustomerID = 29707,
                StateProvinceCode = "VA",
                Store = "Sales and Supply Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48360,
                TotalDue = 12471.8662,
                CustomerID = 29663,
                StateProvinceCode = "IL",
                Store = "Local Hardware Factory"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48361,
                TotalDue = 12498.1133,
                CustomerID = 29746,
                StateProvinceCode = "OH",
                Store = "Bicycle Outfitters"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48362,
                TotalDue = 311.0507,
                CustomerID = 29584,
                StateProvinceCode = "CA",
                Store = "Futuristic Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48363,
                TotalDue = 57452.3567,
                CustomerID = 29954,
                StateProvinceCode = "TX",
                Store = "Elite Bikes"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48364,
                TotalDue = 3849.9257,
                CustomerID = 29574,
                StateProvinceCode = "TX",
                Store = "Third Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48365,
                TotalDue = 11348.6883,
                CustomerID = 29685,
                StateProvinceCode = "GA",
                Store = "Elemental Sporting Goods"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48366,
                TotalDue = 2229.6446,
                CustomerID = 29982,
                StateProvinceCode = "CA",
                Store = "Discount Tours"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48367,
                TotalDue = 2805.6132,
                CustomerID = 29962,
                StateProvinceCode = "MN",
                Store = "Fitness Hotel"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48368,
                TotalDue = 207.7582,
                CustomerID = 29581,
                StateProvinceCode = "CT",
                Store = "Modern Bike Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48369,
                TotalDue = 4992.7544,
                CustomerID = 29568,
                StateProvinceCode = "CA",
                Store = "Coalition Bike Company"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48370,
                TotalDue = 40814.1926,
                CustomerID = 29834,
                StateProvinceCode = "CA",
                Store = "Small Bike Shop"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48371,
                TotalDue = 4548.1081,
                CustomerID = 29669,
                StateProvinceCode = "NY",
                Store = "Famous Bike Sales and Service"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48372,
                TotalDue = 119.4688,
                CustomerID = 29674,
                StateProvinceCode = "IL",
                Store = "Westside Cycle Store"
            };
            sales.Add(strSal);
            strSal = new StoreSales()
            {
                SalesOrderID = 48373,
                TotalDue = 43048.7685,
                CustomerID = 29929,
                StateProvinceCode = "CA",
                Store = "Many Bikes Store"
            };
            sales.Add(strSal);
            return sales;
        }
    }

    public class CustomerSales
    {
        public int SalesOrderID { get; set; }
        public double TotalDue { get; set; }
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string StateProvinceCode { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }

        public static List<CustomerSales> GetData()
        {
            List<CustomerSales> customerSals = new List<CustomerSales>();
            CustomerSales cusSal = null;

            cusSal = new CustomerSales()
            {
                SalesOrderID = 56893,
                TotalDue = 1934.8329,
                CustomerID = 20668,
                FirstName = "Eric",
                LastName = "Rothenberg",
                StateProvinceCode = "CA",
                City = "Concord",
                PostalCode = "94519"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 66530,
                TotalDue = 5.5140,
                CustomerID = 16737,
                FirstName = "Steven",
                LastName = "Selikoff",
                StateProvinceCode = "WA",
                City = "Burien",
                PostalCode = "98168"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 69193,
                TotalDue = 5.5140,
                CustomerID = 17166,
                FirstName = "Joshua",
                LastName = "Several",
                StateProvinceCode = "OR",
                City = "Beaverton",
                PostalCode = "97005"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 52124,
                TotalDue = 8.0444,
                CustomerID = 27040,
                FirstName = "Paul",
                LastName = "Singh",
                StateProvinceCode = "OH",
                City = "Burbank",
                PostalCode = "44214"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 48800,
                TotalDue = 865.2040,
                CustomerID = 15491,
                FirstName = "Shannon",
                LastName = "Li",
                StateProvinceCode = "FL",
                City = "Clearwater",
                PostalCode = "33755"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 56152,
                TotalDue = 32.5754,
                CustomerID = 18546,
                FirstName = "Pieter",
                LastName = "Wycoff",
                StateProvinceCode = "GA",
                City = "Clarkston",
                PostalCode = "30021"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 64623,
                TotalDue = 28.1554,
                CustomerID = 26791,
                FirstName = "Kelvin",
                LastName = "Nath",
                StateProvinceCode = "TX",
                City = "Baytown",
                PostalCode = "77520"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 58620,
                TotalDue = 90.0133,
                CustomerID = 13291,
                FirstName = "Nina",
                LastName = "Xu",
                StateProvinceCode = "MO",
                City = "Branson",
                PostalCode = "65616"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 50425,
                TotalDue = 2264.2536,
                CustomerID = 27421,
                FirstName = "Mindy",
                LastName = "Chander",
                StateProvinceCode = "MA",
                City = "Braintree",
                PostalCode = "02184"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 44953,
                TotalDue = 3953.9884,
                CustomerID = 28859,
                FirstName = "Micah",
                LastName = "Cai",
                StateProvinceCode = "UT",
                City = "Bountiful",
                PostalCode = "84010"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 70714,
                TotalDue = 2690.5866,
                CustomerID = 16916,
                FirstName = "Cheryl",
                LastName = "Dominguez",
                StateProvinceCode = "SC",
                City = "Bluffton",
                PostalCode = "29910"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 52591,
                TotalDue = 8.0444,
                CustomerID = 18053,
                FirstName = "Stefanie",
                LastName = "Smith",
                StateProvinceCode = "NC",
                City = "Charlotte",
                PostalCode = "28202"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 71714,
                TotalDue = 93.8808,
                CustomerID = 27657,
                FirstName = "Frederick",
                LastName = "Chandra",
                StateProvinceCode = "IL",
                City = "Chicago",
                PostalCode = "60610"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 58451,
                TotalDue = 1918.2579,
                CustomerID = 17120,
                FirstName = "Michele",
                LastName = "Raje",
                StateProvinceCode = "NY",
                City = "Clay",
                PostalCode = "13041"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 57966,
                TotalDue = 2.5305,
                CustomerID = 11533,
                FirstName = "Ebony",
                LastName = "Gill",
                StateProvinceCode = "AL",
                City = "Birmingham",
                PostalCode = "35203"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 57382,
                TotalDue = 132.6000,
                CustomerID = 13099,
                FirstName = "Jay",
                LastName = "Romero",
                StateProvinceCode = "KY",
                City = "Campbellsville",
                PostalCode = "42718"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 68532,
                TotalDue = 1341.9783,
                CustomerID = 21583,
                FirstName = "Jaclyn",
                LastName = "Lal",
                StateProvinceCode = "WY",
                City = "Casper",
                PostalCode = "82601"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 64910,
                TotalDue = 91.2620,
                CustomerID = 24442,
                FirstName = "Briana",
                LastName = "Gutierrez",
                StateProvinceCode = "MS",
                City = "Biloxi",
                PostalCode = "39530"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 75103,
                TotalDue = 44.1779,
                CustomerID = 18529,
                FirstName = "Albert",
                LastName = "Castro",
                StateProvinceCode = "VA",
                City = "Chantilly",
                PostalCode = "20151"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 50550,
                TotalDue = 2288.9187,
                CustomerID = 27448,
                FirstName = "Marc",
                LastName = "Romero",
                StateProvinceCode = "AZ",
                City = "Chandler",
                PostalCode = "85225"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 64621,
                TotalDue = 59.6590,
                CustomerID = 11676,
                FirstName = "Alan",
                LastName = "Hu",
                StateProvinceCode = "MN",
                City = "Branch",
                PostalCode = "55056"
            };
            customerSals.Add(cusSal); cusSal = new CustomerSales()
            {
                SalesOrderID = 58555,
                TotalDue = 101.7484,
                CustomerID = 25174,
                FirstName = "Monica",
                LastName = "Smith",
                StateProvinceCode = "MT",
                City = "Billings",
                PostalCode = "59101"
            };
            customerSals.Add(cusSal);
            return customerSals;
        }
    }

    public class SalesDetails
    {
        public string ProdCat { get; set; }
        public string SubCat { get; set; }
        public double? OrderYear { get; set; }
        public string OrderQtr { get; set; }
        public double? Sales { get; set; }
        public static IList GetData()
        {
            List<SalesDetails> datas = new List<SalesDetails>();
            SalesDetails data = null;
            data = new SalesDetails()
            {
                ProdCat = "Accessories",
                SubCat = "Helmets",
                OrderYear = 2002,
                OrderQtr = "Q1",
                Sales = 4945.6925
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Road Frames",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 957715.1942
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Forks",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 23543.1060
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Bikes",
                SubCat = "Road Bikes",
                OrderYear = 2002,
                OrderQtr = "Q1",
                Sales = 3171787.6112
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Accessories",
                SubCat = "Helmets",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 33853.1033
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Wheels",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 163921.8870
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Bikes",
                SubCat = "Road Bikes",
                OrderYear = 2003,
                OrderQtr = "Q2",
                Sales = 4119658.6506
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Socks",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 6968.6884
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Bikes",
                SubCat = "Road Bikes",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 3734891.6389
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Mountain Frames",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 608352.8754
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Handlebars",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 18309.4452
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Road Frames",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 286591.8208
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Accessories",
                SubCat = "Tires and Tubes",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 41940.3364
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Mountain Frames",
                OrderYear = 2003,
                OrderQtr = "Q2",
                Sales = 440260.9831
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Road Frames",
                OrderYear = 2003,
                OrderQtr = "Q2",
                Sales = 457688.8401
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Vests",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 66882.6450
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Accessories",
                SubCat = "Pumps",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 3226.3860
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Tights",
                OrderYear = 2003,
                OrderQtr = "Q2",
                Sales = 51600.6190
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Chains",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 3476.0176
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Handlebars",
                OrderYear = 2003,
                OrderQtr = "Q2",
                Sales = 17194.2146
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Mountain Frames",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 565229.8810
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Tights",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 243.7175
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Road Frames",
                OrderYear = 2002,
                OrderQtr = "Q2",
                Sales = 155311.4063
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Mountain Frames",
                OrderYear = 2002,
                OrderQtr = "Q2",
                Sales = 220935.1648
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Accessories",
                SubCat = "Locks",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 15.0000
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Mountain Frames",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 827287.5234
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Accessories",
                SubCat = "Bike Racks",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 75920.4000
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Bottom Brackets",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 17453.6400
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Bikes",
                SubCat = "Touring Bikes",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 3298006.2858
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Brakes",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 18571.4700
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Tights",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 56782.4280
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Pedals",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 54185.2014
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Jerseys",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 173041.0492
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Jerseys",
                OrderYear = 2002,
                OrderQtr = "Q2",
                Sales = 16931.2362
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Headsets",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 19701.9001
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Road Frames",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 458089.4246
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Shorts",
                OrderYear = 2003,
                OrderQtr = "Q1",
                Sales = 11230.1280
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Bikes",
                SubCat = "Road Bikes",
                OrderYear = 2002,
                OrderQtr = "Q4",
                Sales = 4189621.8590
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Brakes",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 26659.0800
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Wheels",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 83.2981
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Vests",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 81085.6900
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Cranksets",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 80244.1372
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Socks",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 6183.1422
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Components",
                SubCat = "Wheels",
                OrderYear = 2003,
                OrderQtr = "Q2",
                Sales = 163929.9435
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Tights",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 67088.3037
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Tights",
                OrderYear = 2003,
                OrderQtr = "Q3",
                Sales = 779.8960
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Socks",
                OrderYear = 2002,
                OrderQtr = "Q1",
                Sales = 1273.8550
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Bikes",
                SubCat = "Road Bikes",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 4930692.7825
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Shorts",
                OrderYear = 2003,
                OrderQtr = "Q4",
                Sales = 84192.3708
            };
            datas.Add(data);
            data = new SalesDetails()
            {
                ProdCat = "Clothing",
                SubCat = "Jerseys",
                OrderYear = 2002,
                OrderQtr = "Q3",
                Sales = 48901.7598
            };
            datas.Add(data);
            return datas;
        }
    }
}   