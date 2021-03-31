#region Copyright Syncfusion Inc. 2001-2021
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.Collections.Generic;
using System.Dynamic;
using Newtonsoft;
using System.Collections;
using Newtonsoft.Json.Linq;

namespace WebSampleBrowser.XlsIO
{
    public partial class ImportJSON : System.Web.UI.Page
    {        

        # region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        # endregion

        # region Helpher Methods  

        /// <summary>
        ///  Gets the Collection of customized dynamic objects from the JSON data.
        /// </summary>
        /// <returns>Collection of Customer Objects</returns>
        private IList<CustomDynamicObject> GetCustomDynamicObjects()
        {
           string jsonString = System.IO.File.ReadAllText(XlsIOHelper.ResolveApplicationDataPath("salespersons.json", Request));
           JObject jsonObject = JObject.Parse(jsonString);
           List<CustomDynamicObject> list = ((JArray)(jsonObject["SalesPersons"])).ToObject<List<CustomDynamicObject>>();
           return list;
        }
        # endregion

        # region Events
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            #region Initialize Workbook
            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.
            //Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            //Set the Default version as Excel 97to2003
            //Opens a spreadsheet.
            string fileName = "ImportJSONTemplate.xlsx";
            IWorkbook workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(fileName, Request));
            //The first worksheet object in the worksheets collection is accessed.
            IWorksheet sheet = workbook.Worksheets[0];          

            #endregion

            IEnumerable list = GetCustomDynamicObjects();

            sheet.ImportData(list, 5, 1, false);

            //Saving the workbook to disk.
            if (rdBtnXls.Checked == true)
            {
                workbook.Version = ExcelVersion.Excel97to2003;
                workbook.SaveAs("Sample.xls", Response, ExcelDownloadType.PromptDialog);
            }
            else
            {
                workbook.SaveAs("Sample.xlsx", Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);
            }           
            workbook.Close();
            excelEngine.Dispose();

        }
        # endregion
    }

    #region Helper Class
    /// <summary>
    /// Custom dynamic object class
    /// </summary>
    public class CustomDynamicObject : System.Dynamic.DynamicObject
    {
        /// <summary>
        /// The dictionary property used store the data
        /// </summary>
        internal Dictionary<string, object> properties = new Dictionary<string, object>();
        /// <summary>
        /// Provides the implementation for operations that get member values.
        /// </summary>
        /// <param name="binder">Get Member Binder object</param>
        /// <param name="result">The result of the get operation.</param>
        /// <returns>true if the operation is successful; otherwise, false.</returns>
        public override bool TryGetMember(GetMemberBinder binder, out object result)
        {
            result = default(object);
 
            if (properties.ContainsKey(binder.Name))
            {
                result = properties[binder.Name];
                return true;
            }
            return false;
        }
        /// <summary>
        /// Provides the implementation for operations that set member values.
        /// </summary>
        /// <param name="binder">Set memeber binder object</param>
        /// <param name="value">The value to set to the member</param>
        /// <returns>true if the operation is successful; otherwise, false.</returns>
        public override bool TrySetMember(SetMemberBinder binder, object value)
        {
            properties[binder.Name] = value;
            return true;
        }
        /// <summary>
        /// Return all dynamic member names
        /// </summary>
        /// <returns>the property name list</returns>
        public override IEnumerable<string> GetDynamicMemberNames()
        {
            return properties.Keys;
        }
    }

    #endregion
}