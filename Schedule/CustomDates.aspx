<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomDates.aspx.cs" Inherits="WebSampleBrowser.Schedule.CustomDates" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Custom Dates</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIdMode="Static" runat="server" Id="Schedule1" Width="100%" Height="525px" Views="CustomView" CurrentView="CustomView">    
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
        </ej:Schedule>
    </div>
</asp:Content>
