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
using System.IO;
using Syncfusion.Presentation;

namespace WebSampleBrowser.PPTX
{
    public partial class WriteProtection : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void ClickToProtect_Click(object sender, EventArgs e)
        {
             if (this.FileUpload1.HasFile)
            {
                string fileName = Path.GetFileNameWithoutExtension(this.FileUpload1.PostedFile.FileName);
                string ext = Path.GetExtension(this.FileUpload1.PostedFile.FileName).ToLower();
                if (ext == ".pptx")
                {
                    Stream readFile = this.FileUpload1.PostedFile.InputStream;
                    try
                    {
                       // Opens the specified presentation
                        IPresentation presentation = Presentation.Open(readFile);
                        if (txtEnOpen.Text == null)
                            txtEnOpen.Text = string.Empty;
                        //Set the write protection for the presentation
                        presentation.SetWriteProtection(txtEnOpen.Text);
                        //saves the presentation
                        presentation.Save("WriteProtection.pptx", FormatType.Pptx, Response);
                       
                    }
                    catch (Exception ex)
                    {
                        this.label1.Text = "Please Check the password";
                    }
                }
            }
        }       
    }
}