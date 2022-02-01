<%@ Page Title="Schedule-Appointment-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler can customize appointments." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="templates.aspx.cs" Inherits="WebSampleBrowser.Schedule.templates" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" CurrentView="Month" Width="100%" Height="525px" AppointmentTemplateId="#MyTemplate" CurrentDate="6/5/2017">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [Template]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="styleContent" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        img
        {
            height:30px;
            width:30px;
        }
        .e-agendaappointment img {
            background-color: #a9ca44;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="MyTemplate" type="text/x-jsrender">
        <div style="height: 100%">
            <div style="float: left; width: 33px;">
                {{:~format(StartTime)}}
            </div>
            <div>
                <div>{{:Subject}}</div>
            </div>
        </div>
    </script>
    <script type="text/javascript">
        function _getImages(date) {
            switch (new Date(date).getDay()) {
                case 0:
                    return "<img src='../Content/images/Schedule/cake.png' />";
                case 1:
                    return "<img src='../Content/images/Schedule/basketball.png'/>";
                case 2:
                    return "<img src='../Content/images/Schedule/rugby.png'/>";
                case 3:
                    return "<img src='../Content/images/Schedule/guitar.png'/>";
                case 4:
                    return "<img src='../Content/images/Schedule/music.png'/>";
                case 5:
                    return "<img src='../Content/images/Schedule/doctor.png'/>";
                case 6:
                    return "<img src='../Content/images/Schedule/beach.png'/>";
                default:
                    return null;
            }
        }
        $.views.helpers({ format: _getImages });
    </script>
</asp:Content>

