<%@ Page Title="Schedule-SQL Data Binding-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SQLData.aspx.cs" Inherits="WebSampleBrowser.Schedule.DefaultFunctionalities" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / SQL Data Source</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" CurrentDate="6/5/2017" CurrentView="Week" AllowDragAndDrop="True" AllowKeyboardNavigation="True" ShowAppointmentNavigator="True" EnableAppointmentResize="True" EnableResize="False" EnableRTL="False" EndHour="24" Height="800px" Locale="en-US" ShowCurrentTimeIndicator="True" ShowQuickWindow="True" StartHour="0" TimeMode="Hour12" Width="100%">
    <WorkHours Highlight="True" End="18" Start="9"></WorkHours>
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

