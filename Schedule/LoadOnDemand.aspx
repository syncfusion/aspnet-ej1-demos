<%@ Page Title="Schedule-Load On Demand-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler loads appointments based on the current date range." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LoadOnDemand.aspx.cs" Inherits="WebSampleBrowser.Schedule.LoadOnDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Load On Demand</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" Width="100%" Height="525px" Views="Day,Week,WorkWeek,Month" EnableLoadOnDemand="true" ShowAppointmentNavigator="false" CurrentDate="6/5/2017">
    <DataManager CrudURL="LoadOnDemand.aspx/CrudResult" InsertURL="LoadOnDemand.aspx/InsertData" UpdateURL="LoadOnDemand.aspx/UpdateData" RemoveURL="LoadOnDemand.aspx/RemoveData" URL="LoadOnDemand.aspx/Data" Adaptor="UrlAdaptor"  />
    <AppointmentSettings Id="ID" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" StartTimeZone="StartTimeZone" EndTimeZone="EndTimeZone"/>
</ej:Schedule>

    </div>
    
</asp:Content>


