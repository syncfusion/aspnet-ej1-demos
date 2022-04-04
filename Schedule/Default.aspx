<%@ Page Title="Schedule-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler looks with its default configuration." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.Schedule.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" Width="100%" Height="525px" CurrentDate="6/5/2017">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>
    </div>
</asp:Content>

