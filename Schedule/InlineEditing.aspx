<%@ Page Title="Schedule-Inline Add & Edit-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to add and edit appointments inline on the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="InlineEditing.aspx.cs" Inherits="WebSampleBrowser.Schedule.InlineEditing" %>

<asp:Content ID="SampleTitle" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Inline Add & Edit</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" CurrentDate="6/5/2017" AllowInline="true">
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" Priority="Priority" />
        </ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>


