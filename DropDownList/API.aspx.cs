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

namespace WebSampleBrowser.DropDownList
{
    public partial class API : System.Web.UI.Page
    {
        List<Books> book = new List<Books>();
        protected void Page_Load(object sender, EventArgs e)
        {
            book.Add(new Books ( "Art",0, "item" ));
            book.Add(new Books ( "Architecture",1,"2 Item"));
            book.Add(new Books ( "Biographies", 2,"3 Item" ));
            book.Add(new Books ( "Business",   3,"4 Item" ));
            book.Add(new Books (  "ComputerIT", 4,"5 Item" ));
            book.Add(new Books (  "Comics",5,"6 Item" ));
            book.Add(new Books (  "Cookery",6,"7 Item" ));
            book.Add(new Books (  "Environment",7,"8 Item" ));
            book.Add(new Books (  "Fiction",8,"9 Item" ));
            book.Add(new Books (  "Health",9,"10 Item" ));
            book.Add(new Books (  "Humanities",10,"11 Item" ));
            book.Add(new Books (  "Language",11,"12 Item" ));
            book.Add(new Books (  "Literature",12,"13 Item" ));
            book.Add(new Books (  "Memoirs",13,"14 Item" ));
            book.Add(new Books (  "Management",14,"15 Item" ));
            book.Add(new Books (  "Professional",15,"16 Item" ));
            book.Add(new Books (  "Reference",16,"17 Item" ));
            book.Add(new Books (  "Spirituality",17,"18 Item" ));
            book.Add(new Books (  "Sports",18,"19 Item" ));
            book.Add(new Books (  "Sciences",19,"20 Item" ));
            this.bookSelect.DataSource = book;
        }
    }
    [Serializable]
    class Books
    {
        public string category{get;set;}
        public string text{get;set;}
        public int id{get;set;}
        public Books(string cat,int id,string txt)
        {
            this.category = cat;
            this.id = id;
            this.text = txt;
           
        }
    }
}