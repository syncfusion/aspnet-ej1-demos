<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RemoteDataBinding.aspx.cs" Inherits="WebSampleBrowser.Schedule.RemoteDataBinding" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Remote Data Binding</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" Width="100%" Height="525px" timeZone="UTC -05:00" CurrentDate="6/5/2017" ReadOnly="true">
    <AppointmentSettings Id="Id" Subject="Subject" StartTime="StartTime" EndTime="EndTime" Description="Description" AllDay="AllDay" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
    <DataManager CrossDomain="true" URL="//js.syncfusion.com/demos/ejServices/api/Schedule/LoadData"/>
</ej:Schedule>
    </div>
</asp:Content>
