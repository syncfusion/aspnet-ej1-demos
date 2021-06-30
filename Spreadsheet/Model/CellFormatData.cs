#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
namespace WebSampleBrowser.SpreadsheetASP.Model
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.ComponentModel;
    public class CellFormatData
    {
        public string name { get; set; }
        public string style1 { get; set; }
        public string style2 { get; set; }
        public string style3 { get; set; }
        public string style4 { get; set; }
        public string style5 { get; set; }
        public static List<CellFormatData> GetCellFormats
        {
            get
            {
                List<CellFormatData> formats = new List<CellFormatData>();

                formats.Add(new CellFormatData() { name = "FONT FAMILY", style1 = "Arial", style2 = "Times New Roman", style3 = "Tahoma", style4 = "Verdana", style5 = "Calibri" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "FONT STYLE", style1 = "Bold", style2 = "Italic" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "FONT SIZE", style1 = "8pt", style2 = "11pt", style3 = "12pt", style4 = "14pt", style5 = "16pt" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "FONT COLOR", style1 = "Font Color", style2 = "Fill Color", style3 = "Font/Fill Color" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "TEXT DECORATION", style1 = "Underline", style2 = "Strikethrough" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "TEXT ALIGNMENT", style1 = "Left", style2 = "Center", style3 = "Right" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "VERTICAL ALIGNMENT", style1 = "Top", style2 = "Middle", style3 = "Bottom" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "Custom Cell Styles" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "Cell Styles", style1 = "Arial", style2 = "Bold", style3 = "8pt", style4 = "Font Color", style5 = "Underline" });
                formats.Add(new CellFormatData());
                formats.Add(new CellFormatData() { name = "Number Formatting", style1 = "12", style2 = "12", style3 = "12/23/2015", style4 = "12/23/2015", style5 = "10:09:15 AM" });

                return formats;
            }
        }
    }
}