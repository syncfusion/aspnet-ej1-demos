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

namespace WebSampleBrowser.Kanban
{
    public partial class rtl : System.Web.UI.Page
    {
        List<Tasks> Task = new List<Tasks>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }
        private void BindDataSource()
        {            
            Task.Add(new Tasks(1, "Open","تحليل المتطلبات الجديدة التي تم جمعها من العملاء.","قصة","منخفض", " تحليل, زبون", 3.5,  "Davloio  نانسي","../content/images/kanban/1.png", 1 ));
            Task.Add(new Tasks(2, "InProgress","تحسين أداء التطبيقات."," تحسين","عادي", " تحسين", 6,  " أندرو فولر","../content/images/kanban/2.png", 1 ));
            Task.Add(new Tasks(3, "Open"," ترتيب لقاء على شبكة الإنترنت مع العملاء للحصول على المتطلبات الجديدة.","آخرون","حرج", "لقاء", 5.5,  "جانيت Leverling","../content/images/kanban/3.png", 2 ));
            Task.Add(new Tasks(4, "في تَقَدم","إصلاح المشكلات التي أعلن عنها في متصفح إنترنت إكسبلورر.","بق","قواطع الإفراج", "أي", 2.5,  "جانيت Leverling","../content/images/kanban/3.png" ,4));
            Task.Add(new Tasks(5, "Testing","إصلاح المشكلات التي أبلغ عنها العملاء.","بق","منخفض", "زبون", 3.5,  "ستيفن ووكر","../content/images/kanban/5.png", 1  ));
            Task.Add(new Tasks(6, "Close"," ترتيب شبكة لقاء مع زبون للحصول على صفحة تسجيل الدخول المتطلبات.","آخرون","منخفض", "لقاء", 2,  "مايكل أسعد","../content/images/kanban/6.png", 1 ));
            Task.Add(new Tasks(7, "Validate"," تحقق المتطلبات الجديدة تحقق المتطلبات الجديدة"," تحسين","منخفض", " التحقق من صحة", 1.5,  "روبرت الملك","../content/images/kanban/7.png",5 ));
            Task.Add(new Tasks(8, "Close"," التحقق من صحة الصفحة الدخول"," قصة"," قواطع الإفراج", " التحقق من صحة,حل", 2.5,  "لورا كالاهان","../content/images/kanban/8.png", 2 ));
            Task.Add(new Tasks(9, "Testing","إصلاح المشكلات التي أعلن عنها في متصفح سفاري.","بق","قواطع الإفراج", "حل, رحلات السفاري", 1.5,  "Davloio  نانسي","../content/images/kanban/1.png", 2  ));
            Task.Add(new Tasks(10, "Close","Test the application in the أي browser."," قصة","منخفض", "تجريب,أي", 5.5,  " مارغريت hamilt","../content/images/kanban/4.png", 3 ));
            Task.Add(new Tasks(11, "Validate","التحقق من صحة the issues reported by the  زبون."," قصة","عالي", " التحقق من صحة,حل", 1,  "ستيفن ووكر","../content/images/kanban/5.png" ,6));
            Task.Add(new Tasks(12, "Testing","Check Login page  التحقق من صحة."," قصة","قواطع الإفراج", "تجريب", 0.5,  "مايكل أسعد","../content/images/kanban/6.png", 3  ));
            Task.Add(new Tasks(13, "Open"," تحسينات API."," تحسين","عالي", "شبكة,API", 3.5,  " روبرت الملك","../content/images/kanban/7.png", 3 ));
            Task.Add(new Tasks(14, "InProgress"," إضافة دعم استجابة لطلب.","الملحمي","حرج", "Responsive", 6,  "لورا كالاهان","../content/images/kanban/8.png", 2  ));
            Task.Add(new Tasks(15, "Open"," عرض البيانات التي تم استردادها من الملقم في مراقبة الشبكة."," قصة","عالي", " قاعدة البيانات,SQL", 5.5,  " مارغريت hamilt","../content/images/kanban/4.png", 4 ));
            Task.Add(new Tasks(16, "InProgress"," لا يمكن إصلاح الخطأ Open قاعدة البيانات SQL الافتراضي المستخدم.","حرج","بق", " قاعدة البيانات,Sql2008", 2.5,  "جانيت Leverling","../content/images/kanban/3.png", 3 ));
            Task.Add(new Tasks(17, "Testing"," إصلاح المشكلات التي أعلن عنها في ربط البيانات."," قصة","عادي", " ربط البيانات", 3.5,  "جانيت Leverling","../content/images/kanban/3.png", 4  ));
            Task.Add(new Tasks(18, "Close"," تحليل خادم SQL 2008 اتصال."," قصة","قواطع الإفراج", "شبكة,Sql", 2,  " أندرو فولر","../content/images/kanban/2.png", 4 ));
            Task.Add(new Tasks(19, "Validate"," التحقق من صحة القضايا ربط البيانات."," قصة","منخفض", " التحقق من صحة", 1.5,  " مارغريت hamilt","../content/images/kanban/4.png" ,5));
            Task.Add(new Tasks(20, "Close","تحليل مراقبة الشبكة."," قصة","عالي", " تحليل", 2.5,  " مارغريت hamilt","../content/images/kanban/4.png", 5 ));
            Task.Add(new Tasks(21, "Close"," إجراء مخزن للبيانات الأولية ربط الشبكة.","آخرون","قواطع الإفراج", " ربط البيانات", 1.5,  "ستيفن ووكر","../content/images/kanban/5.png", 6 ));
            Task.Add(new Tasks(22, "Close","تحليل الإجراءات المخزنة."," قصة","قواطع الإفراج", "Procedures", 5.5,  "جانيت Leverling","../content/images/kanban/3.png", 7 ));
            Task.Add(new Tasks(23, "Validate"," التحقق من صحة القضايا التحرير."," قصة","حرج", "التحرير", 1,  "Davloio  نانسي","../content/images/kanban/1.png",5 ));
            Task.Add(new Tasks(24, "Testing"," تعزيز وظائف التحرير."," قصة","عادي", "التحرير,Test", 0.5,  "Davloio  نانسي","../content/images/kanban/1.png", 5 ));
            Task.Add(new Tasks(25, "Open"," تعزيز وظائف التحرير."," تحسين","منخفض", "التحرير", 3.5,  " أندرو فولر","../content/images/kanban/2.png", 5 ));
            Task.Add(new Tasks(27, "Open","ترتيب اجتماع الويب مع العملاء لاظهار التحرير العرض.t","آخرون","عالي", "لقاء,التحرير", 5.5,  "ستيفن ووكر","../content/images/kanban/5.png", 6 ));
            Task.Add(new Tasks(28, "InProgress","تحديد القضايا التحرير ذكرت في الكروم.","بق","عادي", "التحرير, زبون", 2.5,  "جانيت Leverling","../content/images/kanban/3.png", 4  ));
            Task.Add(new Tasks(29, "Testing","حل the التحرير issues reported by the  زبون.","بق","منخفض", "التحرير,حل", 3.5,  "جانيت Leverling","../content/images/kanban/3.png", 6 ));
            Task.Add(new Tasks(30, "Close", " ترتيب لقاء على شبكة الإنترنت مع العملاء للحصول على متطلبات التحرير.", "آخرون", "حرج", "لقاء,التحرير", 2, "ستيفن ووكر", "../content/images/kanban/5.png", 8));
            this.KanbanBoard.DataSource = Task;
            this.KanbanBoard.DataBind();
        }
        [Serializable]
        public class Tasks
        {
            public Tasks()
            {
            }
            public Tasks(int Id, string Status, string Summary, string Type, string Priority, string Tags, double Estimate, string Assignee, string ImgUrl, int RankId)
            {
                this.Id = Id;
                this.Status = Status;
                this.Summary = Summary;
                this.Type = Type;
                this.Priority = Priority;
                this.Tags = Tags;
                this.Estimate = Estimate;
                this.Assignee = Assignee;
                this.ImgUrl = ImgUrl;
                this.RankId = RankId;

            }
            public int Id { get; set; }
            public string Status { get; set; }
            public string Summary { get; set; }
            public string Type { get; set; }
            public string Priority { get; set; }
            public string Tags { get; set; }
            public double Estimate { get; set; }
            public string Assignee { get; set; }
            public string ImgUrl { get; set; }
            public int RankId { get; set; }

        }

    }
}