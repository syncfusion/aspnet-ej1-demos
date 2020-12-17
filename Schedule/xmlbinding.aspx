<%@ Page Title="Schedule-XML Binding-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="xmlbinding.aspx.cs" Inherits="WebSampleBrowser.Schedule.xmlbinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / XML</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="XmlDataSource1" CurrentView="Month" CurrentDate="6/5/2017" Width="100%" Height="525px">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/schedule.xml"></asp:XmlDataSource>
</asp:Content>

