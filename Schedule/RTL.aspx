<%@ Page Title="Schedule-RTL-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to display the layout from right to left in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.Schedule.RTL" %>


<asp:Content ID="HeaderSection" ContentPlaceHolderID="HeadSection" runat="server">
    <script type="text/javascript" src="../Scripts/cultures/ej.culture.ar-AE.min.js"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / RTL</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Locale="ar-AE" Width="100%" Height="525px" CurrentDate="6/5/2017" EnableRTL="true">
     <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
            ej.Schedule.Locale["ar-AE"] = {
                ReminderWindowTitle: "نافذة تذكير",
                CreateAppointmentTitle: "إنشاء التعيين",
                RecurrenceEditTitle: "تحرير كرر تعيين",
                RecurrenceEditMessage: "كيف تريد أن تغيير المواعيد في سلسلة الأحداث؟",
                RecurrenceEditOnly: "فقط هذا التعيين",
                RecurrenceEditSeries: "سلسلة كاملة",
                PreviousAppointment: "تعيين السابق",
                NextAppointment: "تعيين المقبل",
                AppointmentSubject: "موضوع",
                StartTime: "وقت البدء",
                EndTime: "نهاية الوقت",
                AllDay: "طوال اليوم",
                StartTimeZone: "بدء والوقت",
                EndTimeZone: "نهاية والوقت",
                Today: "اليوم",
                Recurrence: "تكرر",
                Done: "فعله",
                Cancel: "إلغاء",
                Ok: "حسنا",
                RepeatBy: "كرر بواسطة",
                RepeatEvery: "كرر كل",
                RepeatOn: "كرر على",
                StartsOn: "يبدأ يوم",
                Ends: "ينتهي",
                Summary: "ملخص",
                Daily: "يوميا",
                Weekly: "أسبوعيا",
                Monthly: "شهريا",
                Yearly: "سنويا",
                Every: "كل",
                EveryWeekDay: "كل ايام الاسبوع",
                Never: "أبدا",
                After: "بعد",
                Occurence: "الأحداث",
                On: "على",
                Edit: "تحرير",
                RecurrenceDay: "أيام",
                RecurrenceWeek: "أسابيع",
                RecurrenceMonth: "أشهر",
                RecurrenceYear: "سنوات",
                The: "ال",
                OfEvery: "كل",
                First: "أولا",
                Second: "ثان",
                Third: "ثالث",
                Fourth: "رابع",
                Last: "مشاركة",
                WeekDay: "يوم من أيام الأسبوع",
                WeekEndDay: "اليوم نهاية الاسبوع",
                Subject: "موضوع",
                Categorize: "الفئات",
                DueIn: "في المقرر",
                DismissAll: "افصل الكل",
                Dismiss: "رفض",
                OpenItem: "فتح البند",
                Snooze: "غفوة",
                Day: "يوم",
                Week: "أسبوع",
                WorkWeek: "أسبوع العمل",
                Month: "شهر",
                AddEvent: "إضافة حدث",
                CustomView: "عرض مخصص",
                Agenda: "جدول أعمال",
                Detailed: "مفصل",
                EventBeginsin: "تعيين يبدأ في",
                Editevent: "تحرير تعيين",
                Editseries: "تحرير السلسلة",
                Times: "مرات",
                Until: "حتى",
                Eventwas: "كان التعيين",
                Hours: "ساعة",
                Minutes: "دقائق",
                Overdue: "تعيين طال",
                Days: "يوم",
                Event: "حالة",
                Select: "حدد",
                Previous: "السابق",
                Next: "التالى",
                Close: "غلق",
                Delete: "حذف",
                Date: "تاريخ",
                Showin: "تظهر في",
                Gotodate: "إذهب إلى تاريخ",
                Resources: "الموارد",
                RecurrenceDeleteTitle: "حذف كرر تعيين",
                Location: "موقع",
                Priority: "أفضلية",
                RecurrenceAlert: "إنذار",
                NoTitle: "بدون عنوان",
                WrongPattern: "نمط التكرار غير صالح",
                CreateError: "يجب أن تكون مدة التعيين أقصر من مدى تكرار حدوثه. تقصير المدة، أو تغيير نمط التكرار في مربع الحوار تعيين تكرار.",
                DragResizeError: "لا يمكن إعادة جدولة حدوث الموعد المتكرر إذا تخطى تكرار لاحق من نفس التعيين.",
                MouseOverDeleteTitle: "حذف موعد",
                DeleteConfirmation: "هل أنت متأكد أنك تريد حذف هذا التعيين؟",
                Time: "مرة",
				StartTimeZone: "بداية منطقة زمنية",
				EndTimeZone: "النهاية منطقة زمنية",
				NoTitle: "بدون عنوان",
                OverFlowAppCount : "المزيد من التعيينات (ق )",
				AppointmentIndicator: "انقر إلى أكثر تعيينات",
				EmptyResultText:"لا اقتراحات"
            };
        </script>
</asp:Content>

