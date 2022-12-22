#region Copyright Syncfusion Inc. 2001-2022.
// Copyright Syncfusion Inc. 2001-2022. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Syncfusion.DocIO.DLS;
using Syncfusion.DocIO;
using System.Collections;
using System.IO;
using System.ComponentModel;

namespace WebSampleBrowser.DocIO
{
    public partial class Hyperlinks : System.Web.UI.Page
    {
        #region State Variables
        protected ArrayList WebLinks
        {
            get
            {
                if (Session["weblinks"] != null)
                    return Session["weblinks"] as ArrayList;
                else
                    return null;
            }
            set
            {
                Session["weblinks"] = value;
            }
        }
        protected ArrayList FileLinks
        {
            get
            {
                if (Session["filelinks"] != null)
                    return Session["filelinks"] as ArrayList;
                else
                    return null;
            }
            set
            {
                Session["filelinks"] = value;
            }
        }
        protected ArrayList EmailLinks
        {
            get
            {
                if (Session["emaillinks"] != null)
                    return Session["emaillinks"] as ArrayList;
                else
                    return null;
            }
            set
            {
                Session["emaillinks"] = value;
            }
        }
        protected ArrayList BookMarks
        {
            get
            {
                if (Session["bookmarks"] != null)
                    return Session["bookmarks"] as ArrayList;
                else
                    return null;
            }
            set
            {
                Session["bookmarks"] = value;
            }
        }

        //Return currently Loaded list index
        protected int CurrentList
        {
            get
            {
                if (ViewState["currentList"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["currentList"]);
            }
            set
            {
                ViewState["currentList"] = value;
            }
        }

        //Return previously selected index
        protected int ListBoxPreviousIndex
        {
            get
            {
                if (ViewState["ListBoxPreviousIndex"] == null)
                    return 0;
                else
                    return Convert.ToInt32(ViewState["ListBoxPreviousIndex"]);
            }
            set
            {
                ViewState["ListBoxPreviousIndex"] = value;
            }
        }
        #endregion

        # region Private Members
        protected ArrayList fileName = new ArrayList();
        protected int i;
        //string array which is used to detect the display member of the currently loaded list
        protected string[] displayMember = new string[] { "Uri", "Uri", "FilePath", "TextToDisplay" };
        # endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            fileName.Clear();
            fileName.Add(@"\syncfusion_logo.gif");
            fileName.Add(@"\google.png");
            fileName.Add(@"\yahoo.gif");
            i = 0;

            if (!IsPostBack)
            {
                CreateDocument();
                FindHyperLinks();
                UpdateListBox(this.WebLinks, "Uri");
            }
        }
        #region Events
        protected void RadioButtonList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Default settings
            TextBox1.ReadOnly = false;
            TextBox2.Visible = true;
            File1.Enabled = false;

            //Update Hyperlink value if any modified
            UpdateListWithNewEditedValues(GetCurrentlyLoadedList());
            //Reset listbox previous selected index
            this.ListBoxPreviousIndex = 0;

            //Set current list index
            this.CurrentList = Convert.ToInt32(RadioButtonList.SelectedIndex.ToString());

            //DataBind the ListBox and Update the labels in Edit hyperlink panel
            switch (RadioButtonList.SelectedIndex)
            {
                case 0:
                    UpdateListBox(this.WebLinks, "Uri");
                    UpdateLabel("Web Text", "Uri");
                    break;
                case 1:
                    UpdateListBox(this.EmailLinks, "Uri");
                    UpdateLabel("Email Text", "Uri");
                    break;
                case 2:
                    UpdateListBox(this.FileLinks, "FilePath");
                    UpdateLabel("File Text", "File Path");
                    File1.Enabled = true;
                    TextBox2.Visible = true;
                    break;
                case 3:
                    UpdateListBox(this.BookMarks, "TextToDisplay");
                    UpdateLabel("Bookmark Name", "Bookmark Text");
                    TextBox1.ReadOnly = true;
                    break;
            }
        }
        protected void detailsListBox_SelectedIndexChanged(object sender, EventArgs e)
        {
            //Get the currently loaded list in ListBox
            ArrayList list = GetCurrentlyLoadedList();
            //Update Hyperlink value if any modified
            UpdateListWithNewEditedValues(list);


            if (this.RadioButtonList.SelectedValue == "Bookmark")
            {
                UpdateTextBox(list[detailsListBox.SelectedIndex] as Syncfusion.DocIO.DLS.Hyperlink, "BookmarkName", TextBox1);
            }
            else
            {
                UpdateTextBox(list[detailsListBox.SelectedIndex] as Syncfusion.DocIO.DLS.Hyperlink, "TextToDisplay", TextBox1);
            }

            //Update Lable and TextBox values
            UpdateTextBox(list[detailsListBox.SelectedIndex] as Syncfusion.DocIO.DLS.Hyperlink, GetCurrentDisplayMember(), TextBox2);

            //Maintain previous selected index
            this.ListBoxPreviousIndex = detailsListBox.SelectedIndex;
        }
        protected void CreateDoc_Click(object sender, EventArgs e)
        {
            UpdateListWithNewEditedValues(GetCurrentlyLoadedList());
            WordDocument doc = RewriteDocument();
            OpenDocument(doc);
        }

        protected void ShowTemplate_Click(object sender, EventArgs e)
        {
            WordDocument doc = new WordDocument(this.Server.MapPath("App_Data/Template.doc"));
            OpenDocument(doc);
        }
        #endregion

        #region Helper Methods

        #region Create Updated Document
        protected WordDocument RewriteDocument()
        {
            WordDocument document = new WordDocument();
            IWSection section = document.AddSection();
            IWParagraph para = section.AddParagraph();
            WriteDocument("Title", section, null, null, HyperlinkType.None);
            section.AddParagraph();

            WriteDocument("Heading", section, "Web Hyperlinks", "Hyperlinks to web pages creates a link to a web page, email address or to a program. \nSample Links:", HyperlinkType.None);
            foreach (object item in this.WebLinks)
            {
                Syncfusion.DocIO.DLS.Hyperlink hl = item as Syncfusion.DocIO.DLS.Hyperlink;
                if (hl.PictureToDisplay == null)
                {
                    WriteDocument("HyperLink", section, hl.TextToDisplay, hl.Uri, HyperlinkType.WebLink);
                }
            }

            WriteDocument("Heading", section, "E-mail Hyperlinks", "Hyperlinks that links to e-mail.", HyperlinkType.None);
            foreach (object item in this.EmailLinks)
            {
                Syncfusion.DocIO.DLS.Hyperlink hl = item as Syncfusion.DocIO.DLS.Hyperlink;
                WriteDocument("HyperLink", section, hl.TextToDisplay, hl.Uri, HyperlinkType.EMailLink);
            }

            WriteDocument("Heading", section, "Image Hyperlink", "Hyperlinks to image creates link to a web page, email address or to a program.", HyperlinkType.None);
            foreach (object item in this.WebLinks)
            {
                Syncfusion.DocIO.DLS.Hyperlink hl = item as Syncfusion.DocIO.DLS.Hyperlink;
                if (hl.PictureToDisplay != null)
                {
                    WriteDocument("HyperLink", section, this.Server.MapPath("../images") + fileName[i].ToString(), hl.Uri, HyperlinkType.WebLink);
                    i++;
                }
            }

            WriteDocument("Heading", section, "File Hyperlinks", "Hyperlinks to files creates links to other files, an image and so on.", HyperlinkType.None);
            foreach (object item in this.FileLinks)
            {
                Syncfusion.DocIO.DLS.Hyperlink hl = item as Syncfusion.DocIO.DLS.Hyperlink;
                WriteDocument("HyperLink", section, hl.TextToDisplay, hl.FilePath, HyperlinkType.FileLink);
            }

            section = document.AddSection();
            section.BreakCode = SectionBreakCode.NewPage;
            InsertBookMark(section);

            section = document.Sections[0];
            WriteDocument("Heading", section, "Bookmark Hyperlinks", "A bookmark is a location or selected text on a document that was marked. One can create a hyperlink to a bookmark.", HyperlinkType.None);
            foreach (object item in this.BookMarks)
            {
                Syncfusion.DocIO.DLS.Hyperlink hl = item as Syncfusion.DocIO.DLS.Hyperlink;
                WriteDocument("HyperLink", section, hl.TextToDisplay, hl.BookmarkName, HyperlinkType.Bookmark);
            }

            return document;
        }
        #endregion

        #region Create Template Document
        private void CreateDocument()
        {
            WordDocument document = new WordDocument();
            IWSection section = document.AddSection();
            IWParagraph para = section.AddParagraph();
            WriteDocument("Title", section, null, null, HyperlinkType.None);
            section.AddParagraph();

            WriteDocument("Heading", section, "Web Hyperlinks", "Hyperlinks to web pages creates a link to a web page, email address or to a program. \nSample Links:", HyperlinkType.None);
            WriteDocument("HyperLink", section, "Syncfusion", "//www.syncfusion.com", HyperlinkType.WebLink);
            WriteDocument("HyperLink", section, "Google", "http://www.google.com", HyperlinkType.WebLink);
            WriteDocument("HyperLink", section, "MSN", "http://www.msn.com", HyperlinkType.WebLink);


            WriteDocument("Heading", section, "E-mail Hyperlinks", "Hyperlinks that links to e-mail.", HyperlinkType.None);
            WriteDocument("HyperLink", section, "John", "mailto:john@gmail.com", HyperlinkType.EMailLink);
            WriteDocument("HyperLink", section, "Eric", "mailto:eric@yahoo.com", HyperlinkType.EMailLink);
            WriteDocument("HyperLink", section, "David", "mailto:david@hotmail.com", HyperlinkType.EMailLink);

            WriteDocument("Heading", section, "Image Hyperlink", "Hyperlinks to image creates link to a web page, email address or to a program.", HyperlinkType.None);
            WriteDocument("HyperLink", section, this.Server.MapPath("../images") + fileName[0].ToString(), "//www.syncfusion.com", HyperlinkType.WebLink);
            WriteDocument("HyperLink", section, this.Server.MapPath("../images") + fileName[1].ToString(), "http://www.google.com", HyperlinkType.WebLink);
            WriteDocument("HyperLink", section, this.Server.MapPath("../images") + fileName[2].ToString(), "http://www.yahoo.com", HyperlinkType.WebLink);

            WriteDocument("Heading", section, "File Hyperlinks", "Hyperlinks to files creates links to other files, an image and so on.", HyperlinkType.None);
            WriteDocument("HyperLink", section, "File 1", this.Server.MapPath("../images") + @"\DocIO.gif", HyperlinkType.FileLink);
            WriteDocument("HyperLink", section, "File 2", this.Server.MapPath("../images") + @"\XlsIO.gif", HyperlinkType.FileLink);
            WriteDocument("HyperLink", section, "File 3", this.Server.MapPath("../images") + @"\DocIO.gif", HyperlinkType.FileLink);
            section = document.AddSection();
            section.BreakCode = SectionBreakCode.NewPage;
            InsertBookMark(section);

            section = document.Sections[0];
            WriteDocument("Heading", section, "Bookmark Hyperlinks", "A bookmark is a location or selected text on a document that was marked. One can create a hyperlink to a bookmark.", HyperlinkType.None);
            WriteDocument("HyperLink", section, "What is Hyperlink?", "Introduction", HyperlinkType.Bookmark);
            WriteDocument("HyperLink", section, "How to create a Hyperlink?", "Insert", HyperlinkType.Bookmark);
            WriteDocument("HyperLink", section, "How to edit Hyperlink?", "Edit", HyperlinkType.Bookmark);

            document.Save(this.Server.MapPath("App_Data") + "\\Template.doc", FormatType.Doc);
        }
        #endregion

        # region FindHyperlinks
        /// <summary>
        /// Find hyperlinks in the loaded document and updates the underlying database.
        /// </summary>
        private void FindHyperLinks()
        {
            ArrayList _WebLinks = new ArrayList();
            ArrayList _EmailLinks = new ArrayList();
            ArrayList _FileLinks = new ArrayList();
            ArrayList _Bookmarks = new ArrayList();
            WordDocument document = new WordDocument(this.Server.MapPath("App_Data") + "\\Template.doc");
            foreach (Entity ent in document.ChildEntities)
            {
                if (ent is WSection)
                {
                    WSection section = ent as WSection;
                    foreach (WParagraph paragraph in section.Body.Paragraphs)
                    {
                        foreach (ParagraphItem item in paragraph.Items)
                        {
                            if (item is WField && (item as WField).FieldType == FieldType.FieldHyperlink)
                            {
                                Syncfusion.DocIO.DLS.Hyperlink hlink = new Syncfusion.DocIO.DLS.Hyperlink(item as WField);
                                switch (hlink.Type)
                                {
                                    case HyperlinkType.WebLink:
                                        _WebLinks.Add(hlink);
                                        break;
                                    case HyperlinkType.EMailLink:
                                        _EmailLinks.Add(hlink);
                                        break;
                                    case HyperlinkType.FileLink:
                                        _FileLinks.Add(hlink);
                                        break;
                                    case HyperlinkType.Bookmark:
                                        _Bookmarks.Add(hlink);
                                        break;
                                    default:
                                        break;
                                }
                            }
                        }
                    }
                }
            }
            this.WebLinks = _WebLinks;
            this.EmailLinks = _EmailLinks;
            this.FileLinks = _FileLinks;
            this.BookMarks = _Bookmarks;
        }
        # endregion

        //Update Edited new values in the session list
        private void UpdateListWithNewEditedValues(ArrayList list)
        {
            Syncfusion.DocIO.DLS.Hyperlink link = list[this.ListBoxPreviousIndex] as Syncfusion.DocIO.DLS.Hyperlink;
            link.TextToDisplay = TextBox1.Text;
            switch (link.Type)
            {
                case HyperlinkType.Bookmark:
                    link.TextToDisplay = TextBox2.Text;
                    link.BookmarkName = TextBox1.Text;
                    break;
                case HyperlinkType.EMailLink:
                    link.Uri = TextBox2.Text;
                    break;
                case HyperlinkType.FileLink:
                    {
                        if (File1.HasFile)
                            link.FilePath = File1.PostedFile.FileName;
                        else
                            link.FilePath = TextBox2.Text;
                    }
                    break;
                case HyperlinkType.WebLink:
                    link.Uri = TextBox2.Text;
                    break;
            }
        }

        //Method to return currently loaded list in ListBox
        private ArrayList GetCurrentlyLoadedList()
        {
            switch (this.CurrentList)
            {
                case 0:
                    return this.WebLinks;
                case 1:
                    return this.EmailLinks;
                case 2:
                    return this.FileLinks;
                case 3:
                    return this.BookMarks;
                default:
                    return null;
            }
        }


        //Return the displaymember of the currently loaded list
        private string GetCurrentDisplayMember()
        {
            return displayMember[this.CurrentList].ToString();
        }

        //Update ListBox and TextBoxes with given list and Data Member
        private void UpdateListBox(ArrayList list, string dataMember)
        {
            // Bind the ListBox with the appropraite list
            this.detailsListBox.DataSource = list;
            if (this.RadioButtonList.SelectedValue == "Bookmark")
            {
                this.detailsListBox.DataTextField = "BookmarkName";
                UpdateTextBox(list[0] as Syncfusion.DocIO.DLS.Hyperlink, "BookmarkName", TextBox1);
            }
            else
            {
                this.detailsListBox.DataTextField = "TextToDisplay";
                UpdateTextBox(list[0] as Syncfusion.DocIO.DLS.Hyperlink, "TextToDisplay", TextBox1);
            }
            this.detailsListBox.DataBind();
            this.detailsListBox.SelectedIndex = 0;

            //Removes the imagehyperlink from the listbox
            ArrayList remove = new ArrayList();

            foreach (ListItem item in this.detailsListBox.Items)
            {
                if (item.Text == String.Empty)
                    remove.Add(item);
            }
            foreach (object obj in remove)
                this.detailsListBox.Items.Remove(obj as ListItem);

            UpdateTextBox(list[0] as Syncfusion.DocIO.DLS.Hyperlink, dataMember, TextBox2);
        }

        //Update labels
        private void UpdateLabel(string label1, string label2)
        {
            Label1.Text = label1;
            Label2.Text = label2;
        }

        //Update TextBoxes
        private void UpdateTextBox(Syncfusion.DocIO.DLS.Hyperlink hyperlink, string displayMember, TextBox txtBox)
        {
            switch (displayMember)
            {
                case "Uri":
                    txtBox.Text = hyperlink.Uri;
                    break;
                case "FilePath":
                    txtBox.Text = hyperlink.FilePath;
                    break;
                case "TextToDisplay":
                    txtBox.Text = hyperlink.TextToDisplay;
                    break;
                case "BookmarkName":
                    txtBox.Text = hyperlink.BookmarkName;
                    break;
            }
        }

        # region Insert Bookmark
        /// <summary>
        /// Inserts BookMark content
        /// </summary>
        /// <param name="section"></param>
        private void InsertBookMark(IWSection section)
        {
            //Insert BookMarks
            // Creating BookMarks
            IWParagraph para = section.AddParagraph();

            para = section.AddParagraph();
            para.AppendBookmarkStart("Introduction");
            para.AppendText("What is Hyperlink?").CharacterFormat.Bold = true;
            para.AppendBookmarkEnd("Introduction");
            para.AppendText("\nA hyperlink is a reference or navigation element in a document to another section of the same document or to another document that may be on or part of a (different) domain.");

            para = section.AddParagraph();
            para = section.AddParagraph();
            para.AppendBookmarkStart("Insert");
            para.AppendText("How to create a Hyperlink?").CharacterFormat.Bold = true;
            para.AppendBookmarkEnd("Insert");
            para.AppendText("\nSyncfusion.DocIO.DLS.IWField field = para.AppendField(\"Syncfusion\", Syncfusion.DocIO.FieldType.FieldHyperlink);\n");
            para.AppendText("para.ApplyStyle(Syncfusion.DocIO.DLS.BuiltinStyle.Hyperlink);\n");
            para.AppendText("Syncfusion.DocIO.DLS.Hyperlink hyperLink = new Hyperlink(field as WField);\n");
            para.AppendText("hyperLink.Type = Syncfusion.DocIO.DLS.HyperlinkType.WebLink;\n");
            para.AppendText("hyperLink.Uri = \"//www.syncfusion.com\";\n");

            para = section.AddParagraph();
            para.AppendBookmarkStart("Edit");
            para.AppendText("How to edit Hyperlink?").CharacterFormat.Bold = true;
            para.AppendBookmarkEnd("Edit");
            para.AppendText("\nSyncfusion.DocIO.DLS.Hyperlink hlink = new Hyperlink(item as WField);\n");
            para.AppendText("if(hlink.Type = Syncfusion.DocIO.DLS.HyperlinkType.WebLink)\n");
            para.AppendText("{\n");
            para.AppendText("if (hlink.TextToDisplay == \"Syncfusion\")\n");
            para.AppendText("{\n");
            para.AppendText("hlink.TextToDisplay = \"Syncfusion Support\";\n");
            para.AppendText("hlink.Uri = \"//www.syncfusion.com/support/default.aspx\";\n");
            para.AppendText("}\n");
            para.AppendText("}\n");
        }
        # endregion

        # region Write Document
        /// <summary>
        /// Write document
        /// </summary>
        /// <param name="_type"></param>
        /// <param name="section"></param>
        /// <param name="line1"></param>
        /// <param name="line2"></param>
        /// <param name="linkstype"></param>
        protected void WriteDocument(string _type, IWSection section, string line1, string line2, HyperlinkType linkstype)
        {
            IWParagraph para = section.AddParagraph();
            WPicture image1 = new WPicture(new WordDocument(this.Server.MapPath("App_Data") + "\\Template.doc"));
            switch (_type)
            {
                case "Title":
                    para.AppendText("Inserting Hyperlink");
                    para.ApplyStyle(BuiltinStyle.Title);
                    break;
                case "Heading":
                    para = section.AddParagraph();
                    para.AppendText(line1);
                    para.ApplyStyle(BuiltinStyle.Heading3);
                    para = section.AddParagraph();
                    para.AppendText(line2);
                    break;
                case "HyperLink":
                    {
                        IWField field = para.AppendField(line1, FieldType.FieldHyperlink);
                        para.ApplyStyle(BuiltinStyle.Hyperlink);
                        Syncfusion.DocIO.DLS.Hyperlink hyperLink = new Syncfusion.DocIO.DLS.Hyperlink(field as WField);
                        switch (linkstype)
                        {
                            case HyperlinkType.WebLink:
                                hyperLink.Type = HyperlinkType.WebLink;
                                if (line1.EndsWith(".png") || (line1.EndsWith(".gif")))
                                {
                                    para.ApplyStyle(BuiltinStyle.NoStyle);
                                    image1.LoadImage(System.Drawing.Image.FromFile(line1));
                                    hyperLink.PictureToDisplay = image1;
                                }
                                hyperLink.Uri = line2;
                                break;
                            case HyperlinkType.FileLink:
                                hyperLink.Type = HyperlinkType.FileLink;
                                hyperLink.FilePath = line2;
                                break;
                            case HyperlinkType.EMailLink:
                                hyperLink.Type = HyperlinkType.EMailLink;
                                hyperLink.Uri = line2;
                                break;
                            case HyperlinkType.Bookmark:
                                hyperLink.Type = HyperlinkType.Bookmark;
                                hyperLink.BookmarkName = line2;
                                break;
                        }
                    }
                    break;
            }
        }
        #endregion

        # region Open Document
        private void OpenDocument(WordDocument doc)
        {
            if (rdButtonWord97To2003.Checked)
            {
                //Save as .doc Word 97-2003 format
                doc.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx Word2007 format
            else if (rdButtonWord2007.Checked)
            {
                try
                {
                    doc.Save("Sample.docx", FormatType.Word2007, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Word 2007 is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as .docx Word2010 format
            else if (rdButtonWord2010.Checked)
            {
                try
                {
                    doc.Save("Sample.docx", FormatType.Word2010, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Word 2010 is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as .docx Word2013 format
            else if (rdButtonWord2013.Checked)
            {
                try
                {
                    doc.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                try
                {
                    doc.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
                }
                catch (Win32Exception ex)
                {
                    Response.Write("Microsoft Word Viewer or Microsoft Word is not installed in this system");
                    Console.WriteLine(ex.ToString());
                }
            }
        }
        # endregion

        #region ResolveApplicationDataPath
        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\Content\\DocIO\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        #endregion
        #endregion
    }
}