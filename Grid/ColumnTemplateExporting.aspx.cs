#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using Syncfusion.DocIO.DLS;
using Syncfusion.EJ.Export;
using Syncfusion.JavaScript.Models;
using Syncfusion.Pdf.Interactive;
using Syncfusion.XlsIO;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Script.Serialization;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Grid
{
    public partial class ColumnTemplateExporting : System.Web.UI.Page
    {
        List<Orders> order = new List<Orders>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }

        private void BindDataSource()
        {
            order.Add(new Orders(1, "Nancy", "Davolio", new DateTime(1948, 12, 08), "USA"));
            order.Add(new Orders(2, "Andrew", "Fuller", new DateTime(1952, 02, 19), "USA"));
            order.Add(new Orders(3, "Janet", "Leverling", new DateTime(1963, 08, 30), "USA"));
            order.Add(new Orders(4, "Margaret", "Peacock", new DateTime(1937, 09, 19), "USA"));
            order.Add(new Orders(5, "Steven", "Buchanan", new DateTime(1955, 03, 04), "UK"));
            order.Add(new Orders(6, "Michael", "Suyama", new DateTime(1963, 07, 02), "UK"));
            order.Add(new Orders(7, "Robert", "King", new DateTime(1960, 05, 29), "UK"));
            order.Add(new Orders(8, "Laura", "Callahan", new DateTime(1958, 01, 09), "USA"));

            this.EmployeesGrid.DataSource = order;
            this.EmployeesGrid.DataBind();
        }

        [Serializable]
        public class Orders
        {
            public Orders()
            {

            }
            public Orders(int EmployeeId, string FirstName, string LastName, DateTime BirthDate, string Country)
            {

                this.EmployeeID = EmployeeId;
                this.FirstName = FirstName;
                this.LastName = LastName;
                this.BirthDate = BirthDate;
                this.Country = Country;
            }
            public int EmployeeID { get; set; }
            public string FirstName { get; set; }
            public string LastName { get; set; }
            public DateTime BirthDate { get; set; }
            public string Country { get; set; }
        }

        protected void EmployeesGrid_ServerExcelExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            ExcelExport exp = new ExcelExport();
            GridProperties obj = ConvertGridObject(e.Arguments["model"].ToString());
            GridExcelExport exp1 = new GridExcelExport() {  IsTemplateColumnIncluded = true, IsHideColumnIncude = false, Theme = "flat-lime", FileName = "Export.xlsx" };
            exp.Export(obj, (IEnumerable)EmployeesGrid.DataSource, exp1);
        }

        protected void EmployeesGrid_ServerWordExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            WordExport exp = new WordExport();
            GridProperties obj = ConvertGridObject(e.Arguments["model"].ToString());
            GridWordExport exp1 = new GridWordExport() { IsTemplateColumnIncluded = true, IsHideColumnIncude = false, Theme = "flat-lime", FileName = "Export.docx" };
            exp.Export(obj, (IEnumerable)EmployeesGrid.DataSource, exp1);
        }

        protected void EmployeesGrid_ServerPdfExporting(object sender, Syncfusion.JavaScript.Web.GridEventArgs e)
        {
            PdfExport exp = new PdfExport();
            GridProperties obj = ConvertGridObject(e.Arguments["model"].ToString());
            GridPdfExport exp1 = new GridPdfExport() { IsTemplateColumnIncluded = true, IsHideColumnIncude = false, Theme = "flat-lime", FileName = "Export.pdf" };
            exp.Export(obj, (IEnumerable)EmployeesGrid.DataSource, exp1);
        }
        private GridProperties ConvertGridObject(string gridProperty)
        {
            JavaScriptSerializer serializer = new JavaScriptSerializer();
            IEnumerable div = (IEnumerable)serializer.Deserialize(gridProperty, typeof(IEnumerable));
            GridProperties gridProp = this.EmployeesGrid.Model;
            foreach (KeyValuePair<string, object> ds in div)
            {
                var property = gridProp.GetType().GetProperty(ds.Key, BindingFlags.Instance | BindingFlags.Public | BindingFlags.IgnoreCase);

                if (property != null)
                {
                    Type type = property.PropertyType;
                    string serialize = serializer.Serialize(ds.Value);
                    object value = serializer.Deserialize(serialize, type);
                    property.SetValue(gridProp, value, null);
                }
            }
            return gridProp;
        }

        protected void EmployeesGrid_ServerExcelColumnTemplateInfo(object arg1, object arg2)
        {
            IRange range = (IRange)arg1;
            object templatevalue;
            foreach (var ds in arg2.GetType().GetProperties())
            {
                if (range.Value.Contains(ds.Name))
                {
                    templatevalue = arg2.GetType().GetProperty(ds.Name).GetValue(arg2, null);
                    range.Value = range.Value.Replace(ds.Name, templatevalue.ToString());
                    var regex = new Regex("<a [^>]*href=(?:'(?<href>.*?)')|(?:\"(?<href>.*?)\")", RegexOptions.IgnoreCase);
                    var urls = regex.Matches(range.Value.ToString()).OfType<Match>().Select(m => m.Groups["href"].Value).SingleOrDefault();
                    IHyperLink hyperlink = (range.Parent as Syncfusion.XlsIO.Implementation.WorksheetImpl).HyperLinks.Add(range);
                    hyperlink.Type = ExcelHyperLinkType.Url;
                    hyperlink.TextToDisplay = templatevalue.ToString();
                    hyperlink.Address = urls;
                }
            }
        }

        protected void EmployeesGrid_ServerWordColumnTemplateInfo(object arg1, object arg2)
        {
            WTableCell wCell = (WTableCell)arg1;
            object templatevalue;
            foreach (var ds in arg2.GetType().GetProperties())
            {
                if (wCell.LastParagraph.Text.ToString().Contains(ds.Name))
                {
                    templatevalue = arg2.GetType().GetProperty(ds.Name).GetValue(arg2, null);
                    var regex = new Regex("<a [^>]*href=(?:'(?<href>.*?)')|(?:\"(?<href>.*?)\")", RegexOptions.IgnoreCase);
                    var urls = regex.Matches(wCell.LastParagraph.Text).OfType<Match>().Select(m => m.Groups["href"].Value).SingleOrDefault();
                    wCell.LastParagraph.Text = "";
                    IWField field = wCell.LastParagraph.AppendHyperlink(urls, templatevalue.ToString(), HyperlinkType.WebLink);
                }
            }
        }

        protected void EmployeesGrid_ServerPdfColumnTemplateInfo(object arg1, object arg2)
        {
            Syncfusion.Pdf.Grid.PdfGridCell range = (Syncfusion.Pdf.Grid.PdfGridCell)arg1;
            object templatevalue;
            range.Value = Uri.UnescapeDataString(range.Value.ToString());
            foreach (var ds in arg2.GetType().GetProperties())
            {
                if (range.Value.ToString().Contains(ds.Name))
                {
                    templatevalue = arg2.GetType().GetProperty(ds.Name).GetValue(arg2, null);
                    var regex = new Regex("<a [^>]*href=(?:'(?<href>.*?)')|(?:\"(?<href>.*?)\")", RegexOptions.IgnoreCase);
                    var urls = regex.Matches(range.Value.ToString()).OfType<Match>().Select(m => m.Groups["href"].Value).SingleOrDefault();
                    RectangleF rectangle = new RectangleF(10, 40, 30, 30);
                    PdfUriAnnotation uriAnnotation = new PdfUriAnnotation(rectangle, urls);
                    uriAnnotation.Text = templatevalue.ToString();
                    range.Value = uriAnnotation;
                }
            }
        }
    }
}