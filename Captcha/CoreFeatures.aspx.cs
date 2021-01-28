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
using Syncfusion.JavaScript;

namespace WebSampleBrowser.Captcha
{
    public partial class CoreFeatures : System.Web.UI.Page
    {
        private Dictionary<string, HatchStyle> hatchList;

        private void LoadValues()
        {
            hatchList = new Dictionary<string, HatchStyle>();
            hatchList.Add("BackwardDiagonal", HatchStyle.BackwardDiagonal);
            hatchList.Add("LargeGrid", HatchStyle.LargeGrid);
            hatchList.Add("DarkDownwardDiagonal", HatchStyle.DarkDownwardDiagonal);
            hatchList.Add("DarkHorizontal", HatchStyle.DarkHorizontal);
            hatchList.Add("DarkUpwardDiagonal", HatchStyle.DarkUpwardDiagonal);
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            LoadValues();
            Hatch.DataSource = hatchList.Keys.ToList<string>();
        }
        [System.Web.Services.WebMethod]
        public static string GetCurrentItem(Dictionary<object, object> captchaModel)
        {
            return Syncfusion.JavaScript.Web.Captcha.GetModel(captchaModel).ExecuteResult();
        }
        protected void apply1_Click(object Sender, Syncfusion.JavaScript.Web.ButtonEventArgs e)
        {
            if (string.IsNullOrEmpty(Hatch.Value.ToString()))
                captcha1.HatchStyle = hatchList["BackwardDiagonal"];
            else
                captcha1.HatchStyle = hatchList[Hatch.Value.ToString()];

            if (string.IsNullOrEmpty(charset1.Text))
                captcha1.CharacterSet = "ABCDEFGHIJKLMN01234";
            else
                captcha1.CharacterSet = charset1.Text;
            if (string.IsNullOrEmpty(maxset.Value.ToString()))
                captcha1.MaximumLength = 4;
            else
                captcha1.MaximumLength = int.Parse(maxset.Value.ToString());
        }

   

    }
}