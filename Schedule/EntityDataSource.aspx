<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="EntityDataSource.aspx.cs" Inherits="WebSampleBrowser.Schedule.EntityDataSource" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Entity data model</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="entitydatasource1" CurrentView="Month" Width="100%">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>
    </div>
    
    <asp:EntityDataSource ID="entitydatasource1" runat="server" ConnectionString="name=ScheduleDataEntities" DefaultContainerName="ScheduleDataEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="DefaultSchedules"></asp:EntityDataSource>
</asp:Content>