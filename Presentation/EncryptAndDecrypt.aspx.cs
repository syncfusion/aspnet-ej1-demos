#region Copyright Syncfusion Inc. 2001-2018.
// Copyright Syncfusion Inc. 2001-2018. All rights reserved.
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
    public partial class Security : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }
        protected void ClickToEncrypt_Click(object sender, EventArgs e)
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
                        IPresentation presentation = Presentation.Open(readFile,txtEnOpen.Text);
                        //Encrypts the presentation
                        presentation.Encrypt(txtEnOpen.Text);
                        //saves the presentation
                        presentation.Save("Encryption.pptx", FormatType.Pptx, Response);
                       
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "Please Check the password";
                    }
                }
            }
        }
        protected void ClickToDecrypt_Click(object sender, EventArgs e)
        {
            if (this.FileUpload2.HasFile)
            {
                string fileName = Path.GetFileNameWithoutExtension(this.FileUpload2.PostedFile.FileName);
                string ext = Path.GetExtension(this.FileUpload2.PostedFile.FileName).ToLower();
                if (ext == ".pptx")
                {
                    Stream readFile = this.FileUpload2.PostedFile.InputStream;
                    try
                    {
                        //Opens the specified file
                        IPresentation presentation = Presentation.Open(readFile, txtDeOpen.Text);
                        //Decrypts the document
                        presentation.RemoveEncryption();
                        //Saving the presentation
                        presentation.Save("Decryption.pptx", FormatType.Pptx, Response);
                       
                    }
                    catch (Exception)
                    {
                        this.label1.Text = "Please check the password";
                    }
                }
            }
        }
    }
}