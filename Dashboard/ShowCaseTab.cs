#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Linq;
using Manoli.Utils.CSharpFormat;
using System.Xml;
using System.Xml.Linq;



namespace AspSamplebrowser
{
    public class ShowCaseTab : CompositeControl
    {

        internal Dictionary<string, string> TabInfo
        {
            get;
            set;
        }
        

        internal void SetTabInfo()
        {
            string qString = HttpContext.Current.Request.Params["sid"];
            TabInfo = new Dictionary<string, string>();
            XDocument xml = XDocument.Load(HttpContext.Current.Server.MapPath("~/Sourcetabfiles.xml"));
            List<XElement> x = new List<XElement>();
            List<XElement> x1 = new List<XElement>();
            
            x = (from e in xml.Root.Elements("Controls")
                  where ((string)e.Attribute("foldername").Value.ToString().ToLower() == "dashboard")
                select e).Elements("Samples")
                    .Where(c => c.Attribute("name").Value.ToLower().ToString() == qString).Elements("DependentFiles")
                    .ToList();
            for (int i = 0; i < x.Count; i++)
            {
                var tabtitle = x[i].Attributes("displayname").ToList();
                var tabsource = x[i].Attributes("url").ToList();

                if (tabtitle.Count > 0 && tabsource.Count > 0 && tabsource.Count == tabtitle.Count)
                    for (var j = 0; j < tabtitle.Count; j++)
                    {
                        if (File.Exists(HttpContext.Current.Server.MapPath("~/" + tabsource[j].Value)))
                            TabInfo.Add(tabtitle[j].Value,
                                HttpContext.Current.Server.MapPath("~/" + tabsource[j].Value));
                    }
            }

        }

        protected override void OnPreRender(EventArgs e)
        {
            if (!this.DesignMode)
            {
                if (TabInfo == null)
                    SetTabInfo();
                this.ClientIDMode = ClientIDMode.Static;
                this.ID = "SourceTabDiv";
                this.Attributes.Add("Name", "SourceTabDiv");

                HtmlGenericControl codeUl = new HtmlGenericControl("ul");
                this.Controls.Add(codeUl);
                foreach (KeyValuePair<string, string> pair in TabInfo)
                {
                    HtmlGenericControl codeLi = new HtmlGenericControl("li");
                    codeUl.Controls.Add(codeLi);

                    HtmlAnchor codeAnc = new HtmlAnchor();
                    codeAnc.HRef = "#" + pair.Key.Replace('.', '_');
                    codeLi.Controls.Add(codeAnc);

                    HtmlGenericControl textSpan = new HtmlGenericControl();
                    textSpan.InnerHtml = pair.Key.ToString();
                    codeAnc.Controls.Add(textSpan);

                }

                base.OnPreRender(e);
            }
        }
        protected override void Render(HtmlTextWriter writer)
        {
            if (!this.DesignMode)
            {
                ProcessRequest();
                base.Render(writer);
            }
        }
        public void ProcessRequest()
        {
            foreach (KeyValuePair<string, string> pair in TabInfo)
            {

                string filePath = pair.Value;
                if (File.Exists(filePath))
                {
                    FileInfo file = new FileInfo(filePath);
                    HtmlGenericControl divelemt = new HtmlGenericControl("Div");
                    divelemt.ClientIDMode = ClientIDMode.Static;
                    divelemt.ID = Convert.ToString(pair.Key.Replace('.', '_'));
                    divelemt.Attributes.Add("Name", Convert.ToString(pair.Key));
                    switch (file.Extension.ToLower())
                    {
                        case ".cs":
                            CSharpFormat cformat = new CSharpFormat();
                            cformat.EmbedStyleSheet = false;
                            divelemt.InnerHtml = cformat.FormatCode(new FileStream(file.FullName, FileMode.Open));
                            break;

                        case ".css":
                            HtmlFormat htmlformat = new HtmlFormat();
                            htmlformat.EmbedStyleSheet = false;
                            FileInfo files = file;
                            if (files.Length > 0)
                            {
                                string s1 = "";
                                StreamReader reader1;
                                FileStream stra;
                                stra = new FileStream(files.FullName, FileMode.Open);
                                reader1 = new StreamReader(stra);
                                s1 = s1 + ("<b><i>" + files.Name + "</i></b>");
                                s1 = s1 + htmlformat.FormatCode(stra);
                                divelemt.InnerHtml = s1;
                            }

                            break;

                        case ".js":
                            JavaScriptFormat jsformat = new JavaScriptFormat();
                            jsformat.EmbedStyleSheet = false;
                            divelemt.InnerHtml = jsformat.FormatCode(new FileStream(file.FullName, FileMode.Open));
                            break;

                        default:
                            HtmlFormat htmlformat5 = new HtmlFormat();
                            htmlformat5.EmbedStyleSheet = false;
                            divelemt.InnerHtml = htmlformat5.FormatCode(new FileStream(file.FullName, FileMode.Open));
                            break;

                    }

                    this.Controls.Add(divelemt);
                }
            }
        }

    }
    
}
