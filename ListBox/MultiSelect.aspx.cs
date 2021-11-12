#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebSampleBrowser.DropDownList;

namespace WebSampleBrowser.ListBox
{
    public partial class MultiSelect : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Lanuages> language = new List<Lanuages>();
            language.Add(new Lanuages("ActionScript"));
            language.Add(new Lanuages("Basic"));
            language.Add(new Lanuages("C"));
            language.Add(new Lanuages("C++"));
            language.Add(new Lanuages("C#"));
            language.Add(new Lanuages("dBase"));
            language.Add(new Lanuages("Delphi"));
            language.Add(new Lanuages("ESPOL"));
            language.Add(new Lanuages("F#"));
            language.Add(new Lanuages("FoxPro"));
            language.Add(new Lanuages("Java"));
            language.Add(new Lanuages("j#"));
            language.Add(new Lanuages("Lisp"));
            language.Add(new Lanuages("Logo"));
            language.Add(new Lanuages("PHP"));
            this.skillsets.DataSource = language;
        }
    }
}