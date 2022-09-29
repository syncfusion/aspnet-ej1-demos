#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Syncfusion.XlsIO;
using System.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls.WebParts;
using System.Globalization;
using System.Collections.Generic;

namespace WebSampleBrowser.XlsIO
{
    public partial class Filters : System.Web.UI.Page
    {
        int iconId = 1;

        #region Page Load
        /// <summary>
        /// Handles the page load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string[] filterNames = { "Custom Filter", "Text Filter", "DateTime Filter", "Dynamic Filter", "Color Filter", "Icon Filter", "Advanced Filter" };

                foreach (string filterName in filterNames)
                {
                    FilterList.Items.Add(filterName);
                }
                string[] colors = { "Red", "Blue", "Green", "Yellow", "Empty" };

                foreach (string color in colors)
                {
                    colorsList.Items.Add(color);
                }
            }
            List<IconSet> iconSets = new List<IconSet>();
            iconSets.Add(new IconSet("a", "ThreeSymbols"));
            iconSets.Add(new IconSet("b", "FourRating"));
            iconSets.Add(new IconSet("c", "FiveArrows"));
            this.iconSetList.DataSource = iconSets;
            this.selectIcon.DataSource = icons.GetIcons();
        }
        #endregion

        # region Events
        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {

            //New instance of XlsIO is created.[Equivalent to launching Microsoft Excel with no workbooks open].
            //The instantiation process consists of two steps.

            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();
            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;
            IWorkbook book;
            if (FilterList.SelectedIndex == 6)
            {
                book = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"AdvancedFilterData.xlsx", Request), ExcelOpenType.Automatic);
            }
            else if (FilterList.SelectedIndex == 5)
            {
                book = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"IconFilterData.xlsx", Request), ExcelOpenType.Automatic);
            }
            else if (FilterList.SelectedIndex == 4)
            {
                book = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"FilterData_Color.xlsx", Request), ExcelOpenType.Automatic);
            }
            else
            {
                book = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"FilterData.xlsx", Request), ExcelOpenType.Automatic);
            }
            book.Version = ExcelVersion.Excel2016;
            IWorksheet sheet = book.Worksheets[0];
            if (FilterList.SelectedIndex != 6)
                sheet.AutoFilters.FilterRange = sheet.Range[1, 1, 49, 3];

            string fileName = null;
            switch (FilterList.SelectedIndex)
            {
                case 0:
                    fileName = "CustomFilter.xlsx";
                    IAutoFilter filter1 = sheet.AutoFilters[0];
                    filter1.IsAnd = false;
                    filter1.FirstCondition.ConditionOperator = ExcelFilterCondition.Equal;
                    filter1.FirstCondition.DataType = ExcelFilterDataType.String;
                    filter1.FirstCondition.String = "Owner";

                    filter1.SecondCondition.ConditionOperator = ExcelFilterCondition.Equal;
                    filter1.SecondCondition.DataType = ExcelFilterDataType.String;
                    filter1.SecondCondition.String = "Sales Representative";
                    break;

                case 1:
                    fileName = "TextFilter.xlsx";
                    IAutoFilter filter2 = sheet.AutoFilters[0];
                    filter2.AddTextFilter(new string[] { "Owner", "Sales Representative", "Sales Associate" });
                    break;

                case 2:
                    fileName = "DateTimeFilter.xlsx";
                    IAutoFilter filter3 = sheet.AutoFilters[1];
                    filter3.AddDateFilter(new DateTime(2004, 9, 1, 1, 0, 0, 0), DateTimeGroupingType.month);
                    filter3.AddDateFilter(new DateTime(2011, 1, 1, 1, 0, 0, 0), DateTimeGroupingType.year);
                    break;

                case 3:
                    fileName = "DynamicFilter.xlsx";
                    IAutoFilter filter4 = sheet.AutoFilters[1];
                    filter4.AddDynamicFilter(DynamicFilterType.Quarter1);
                    break;
                case 4:

                    fileName = "ColorFilter.xlsx";
                    #region ColorFilter
                    sheet.AutoFilters.FilterRange = sheet["A1:C49"];
                    Color color = Color.Empty;

                    switch (colorsList.SelectedIndex)
                    {
                        case 0:
                            color = Color.Red;
                            break;
                        case 1:
                            color = Color.Blue;
                            break;
                        case 2:
                            color = Color.Green;
                            break;
                        case 3:
                            color = Color.Yellow;
                            break;
                        case 4:
                            color = Color.Empty;
                            break;

                    }
                    if (rdb3.Checked)
                    {
                        IAutoFilter filter = sheet.AutoFilters[2];
                        filter.AddColorFilter(color, ExcelColorFilterType.FontColor);
                    }
                    else
                    {
                        IAutoFilter filter = sheet.AutoFilters[0];
                        filter.AddColorFilter(color, ExcelColorFilterType.CellColor);
                    }

                    #endregion
                    break;

                case 5:

                    fileName = "IconFilter.xlsx";
                    #region IconFilter
                    sheet.AutoFilters.FilterRange = sheet["A4:D44"];
                    ExcelIconSetType iconset = ExcelIconSetType.FiveArrows;
                    int filterIndex = 0;
                    string iconSet = Request.Form[iconsetTemp.UniqueID];
                    string iconIdTemp = Request.Form[iconidTemp.UniqueID];
                    switch (iconSet)
                    {
                        case "a":
                            iconset = ExcelIconSetType.ThreeSymbols;
                            filterIndex = 3;
                            break;
                        case "b":
                            iconset = ExcelIconSetType.FourRating;
                            filterIndex = 1;
                            break;
                        case "c":
                            iconset = ExcelIconSetType.FiveArrows;
                            filterIndex = 2;
                            break;
                    }
                    if (iconIdTemp != string.Empty && !iconIdTemp.Equals("NoIcon"))
                        switch (int.Parse(iconIdTemp.ToString()) - 1)
                        {
                            case 0:
                                iconId = 0;
                                break;
                            case 1:
                                iconId = 1;
                                break;
                            case 2:
                                iconId = 2;
                                break;
                            case 3:
                                if (filterIndex == 3)
                                    iconset = (ExcelIconSetType)(-1);
                                else
                                    iconId = 3;
                                break;
                            case 4:
                                if (filterIndex == 1)
                                    iconset = (ExcelIconSetType)(-1);
                                else
                                    iconId = 4;
                                break;
                        }
                    else
                        iconId = -1;

                    IAutoFilter filter5 = sheet.AutoFilters[filterIndex];
                    if (iconId == -1)
                        iconset = (ExcelIconSetType)(-1);
                    if (iconSet != string.Empty && iconIdTemp != string.Empty)
                        filter5.AddIconFilter(iconset, iconId);

                    #endregion
                    break;

                case 6:
                    fileName = "AvancedFilter.xlsx";
                    #region AdvancedFilter

                    IRange filterRange = sheet.Range["A8:G51"];
                    IRange criteriaRange = sheet.Range["A2:B5"];
                    if (rdb1.Checked == true)
                    {
                        sheet.AdvancedFilter(ExcelFilterAction.FilterInPlace, filterRange, criteriaRange, null, chb1.Checked == true);
                    }
                    else if (rdb2.Checked == true)
                    {
                        IRange range = sheet.Range["I7:O7"];
                        range.Merge();
                        range.Text = "FilterCopy";
                        range.CellStyle.Font.RGBColor = System.Drawing.Color.FromArgb(0, 112, 192);
                        range.HorizontalAlignment = ExcelHAlign.HAlignCenter;
                        range.CellStyle.Font.Bold = true;
                        IRange copyRange = sheet.Range["I8"];
                        sheet.AdvancedFilter(ExcelFilterAction.FilterCopy, filterRange, criteriaRange, copyRange, chb1.Checked == true);
                    }
                    break;
                    #endregion

            }


            //Saving the workbook to disk.
            book.SaveAs(fileName, Response, ExcelDownloadType.PromptDialog, ExcelHttpContentType.Excel2016);

            book.Close();
            excelEngine.Dispose();
        }

        /// <summary>
        /// Creates spreadsheet
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click1(object sender, EventArgs e)
        {
            //Step 1 : Instantiate the spreadsheet creation engine.
            ExcelEngine excelEngine = new ExcelEngine();

            //Step 2 : Instantiate the excel application object.
            IApplication application = excelEngine.Excel;

            //Open an existing spreadsheet which will be used as a template for generating the new spreadsheet.
            //After opening, the workbook object represents the complete in-memory object model of the template spreadsheet.
            IWorkbook workbook;
            if (FilterList.SelectedIndex == 6)
            {
                workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"AdvancedFilterData.xlsx", Request), ExcelOpenType.Automatic);
            }
            else if (FilterList.SelectedIndex == 5)
            {
                workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"IconFilterData.xlsx", Request), ExcelOpenType.Automatic);
            }
            else if (FilterList.SelectedIndex == 4)
            {
                workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"FilterData_Color.xlsx", Request), ExcelOpenType.Automatic);
            }
            else
            {
                workbook = excelEngine.Excel.Workbooks.Open(XlsIOHelper.ResolveApplicationDataPath(@"FilterData.xlsx", Request), ExcelOpenType.Automatic);
            }
            workbook.SaveAs("InputTemplate.xlsx", Response, ExcelDownloadType.PromptDialog);
            workbook.Close();
        }
        # endregion
        /// <summary>
        /// Event that gets triggered when the Filter List index is changed.
        /// </summary>
        /// <param name="sender">Filter list combobox as object</param>
        /// <param name="e"></param>
        protected void FilterList_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (FilterList.SelectedIndex == 6)
            {
                actionType.Visible = true;
                rdb1.Checked = true;
                colorFilter.Visible = false;
                iconFilter.Visible = false;

            }
            else if (FilterList.SelectedIndex == 5)
            {
                actionType.Visible = false;
                colorFilter.Visible = false;
                iconFilter.Visible = true;
            }
            else if (FilterList.SelectedIndex == 4)
            {
                actionType.Visible = false;
                colorFilter.Visible = true;
                iconFilter.Visible = false;
            }
            else
            {
                actionType.Visible = false;
                colorFilter.Visible = false;
                iconFilter.Visible = false;
            }
        }
        protected void SelectIcon(object sender, Syncfusion.JavaScript.Web.ComboBoxEventArgs e)
        {
            if (!e.Value.ToString().Equals("NoIcon"))
                iconId = int.Parse(e.Value.ToString());
            selectIcon.Text = e.Value.ToString();
            Session.Add("IconId", e.Value);
        }
        public class IconSet
        {
            public string Id { get; set; }
            public string IconSetName { get; set; }

            public IconSet(string id, string iconSet)
            {
                Id = id;
                IconSetName = iconSet;
            }
        }
        /// <summary>
        /// Template Class used for Loading Icons and their respective Ids in dropdownlist.
        /// </summary>
        public class icons
        {
            public string Id { get; set; }
            public string text { get; set; }
            public string eimg { get; set; }
            /// <summary>
            /// Constructor used to populate the initial values for the first time of loading.
            /// </summary>
            /// <returns>Returns list of icons Objects to be used as DataSource</returns>
            public static List<icons> GetIcons()
            {
                List<icons> iconList = new List<icons>();

                iconList.Add(new icons { Id = "a", text = "1", eimg = "CF_IS_RedCrossSymbol" });
                iconList.Add(new icons { Id = "a", text = "2", eimg = "CF_IS_YellowExclamationSymbol" });
                iconList.Add(new icons { Id = "a", text = "3", eimg = "CF_IS_GreenCheckSymbol" });
                iconList.Add(new icons { Id = "a", text = "NoIcon", eimg = "NoIcon" });
                iconList.Add(new icons { Id = "b", text = "1", eimg = "CF_IS_SignalWithOneFillBar" });
                iconList.Add(new icons { Id = "b", text = "2", eimg = "CF_IS_SignalWithTwoFillBars" });
                iconList.Add(new icons { Id = "b", text = "3", eimg = "CF_IS_SignalWithThreeFillBars" });
                iconList.Add(new icons { Id = "b", text = "4", eimg = "CF_IS_SignalWithFourFillBars" });
                iconList.Add(new icons { Id = "b", text = "NoIcon", eimg = "NoIcon" });
                iconList.Add(new icons { Id = "c", text = "1", eimg = "CF_IS_RedDownArrow" });
                iconList.Add(new icons { Id = "c", text = "2", eimg = "CF_IS_YellowDownInclineArrow" });
                iconList.Add(new icons { Id = "c", text = "3", eimg = "CF_IS_YellowSideArrow" });
                iconList.Add(new icons { Id = "c", text = "4", eimg = "CF_IS_YellowUpInclineArrow" });
                iconList.Add(new icons { Id = "c", text = "5", eimg = "CF_IS_GreenUpArrow" });
                iconList.Add(new icons { Id = "c", text = "NoIcon", eimg = "NoIcon" });

                return iconList;
            }
        }
    }
}