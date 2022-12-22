#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
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
    public class SourceCodeTab : CompositeControl
    {

        internal Dictionary<string, string> TabInfo
        {
            get;
            set;
        }
        

        internal void SetTabInfo()
        {
            FileInfo filepath;
            string m_file;
            string m_sfile;
            string m_folder;
            FileInfo[] files;
            DirectoryInfo baseDirectory = GetBaseDirectory(Page.Request.PhysicalPath);

            filepath = new FileInfo(Page.Request.PhysicalPath);
            m_file = Page.Request.PhysicalPath.Remove(0, baseDirectory.FullName.Length + 1);
            m_sfile = m_file.Contains(".aspx") ? m_file.Replace(".aspx", "") : m_file;
            m_folder = baseDirectory.FullName.Remove(0, baseDirectory.FullName.LastIndexOf('\\') + 1);

            TabInfo = new Dictionary<string, string>();

            foreach (TabType type in Enum.GetValues(typeof(TabType)))
            {
                switch (type)
                {

                    case TabType.ASPX:

                        files = baseDirectory.GetFiles(m_file);
                        if (files.Length > 0)
                            TabInfo.Add(m_file, Page.Request.PhysicalPath);
                        break;
                    case TabType.CS:
                        {

                            files = baseDirectory.GetFiles(m_file + ".cs");
                            if (files.Length > 0)
                                TabInfo.Add(m_file +".cs", files[0].FullName);
                            break;
                        }

                    default:
                        throw new Exception(string.Format("Type {0} is not defined.", type));
                }
            }
            var myDoc = new XmlDocument();
            XDocument xml = XDocument.Load(HttpContext.Current.Server.MapPath("~/Sourcetabfiles.xml"));
            List<XElement> x = new List<XElement>();
            x = (from e in xml.Root.Elements("Controls")
                 where ((string)e.Attribute("foldername").Value.ToString().ToLower() == m_folder.ToString().ToLower())
                 select e).ToList();
            Dictionary<string, string> dependentlist = new Dictionary<string, string>();
            if (x.Count > 0)
            {
                var ds = (from s in x.Elements("Samples")
                          where (string)s.Attribute("name").Value.ToString().ToLower() == m_sfile.ToString().ToLower()
                          select s.Elements("dependantfiles")).ToList();
                if (ds.Count > 0)
                {

                    for (int i = 0; i < ds.Count; i++)
                    {
                        if (ds[i].Attributes("displayname") != null && ds[i].Attributes("url") != null)
                        {
                            var tabtitle = ds[i].Attributes("displayname").ToList();
                            var tabsource = ds[i].Attributes("url").ToList();
                            if (tabtitle.Count > 0 && tabsource.Count > 0 && tabsource.Count == tabtitle.Count)
                                for (var j = 0; j < tabtitle.Count; j++)
                                {
                                    if (File.Exists(HttpContext.Current.Server.MapPath(tabsource[j].Value.ToString())))
                                        TabInfo.Add(tabtitle[j].Value.ToString(), HttpContext.Current.Server.MapPath(tabsource[j].Value.ToString()));
                                }
                        }
                    }

                }
            }

        }



        private DirectoryInfo GetBaseDirectory(string path)
        {
            DirectoryInfo baseDir;

            if (File.Exists(path))
            {
                FileInfo info = new FileInfo(path);
                baseDir = info.Directory;
            }
            else
                baseDir = new DirectoryInfo(path);

            return baseDir;
        }



        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
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
                    System.Web.UI.HtmlControls.HtmlGenericControl divelemt = new System.Web.UI.HtmlControls.HtmlGenericControl("Div");
                    divelemt.ClientIDMode = ClientIDMode.Static;
                    divelemt.ID = Convert.ToString(pair.Key.Replace('.','_'));
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
    
    internal enum TabType
    {
        ASPX = 1,
        CS = 2,
    }    
}
