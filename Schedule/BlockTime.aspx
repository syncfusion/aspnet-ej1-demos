<%@ Page Title="Schedule-Block Intervals-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to block specific time intervals in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="BlockTime.aspx.cs" Inherits="WebSampleBrowser.Schedule.BlockTime" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Block Intervals</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" Width="100%" Height="525px" CurrentDate="6/5/2017" CurrentView="Day" TimeZone="UTC +00:00">
            <BlockoutSettings Enable="true" TemplateId="#blocktemplate" Id="BlockId" Subject="Subject" StartTime="StartTime" EndTime="EndTime" IsBlockAppointment="BlockAppointment" ResourceId="ResourceId" IsAllDay="FullDay" />
            <Group Resources="Owners" />
            <Resources>
                <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text">
                    </ResourceSettings>
                </ej:Resources>
            </Resources>
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="OwnerId" />
        </ej:Schedule>
    </div>
</asp:Content>
<asp:Content ID="styleContent" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .e-blocktimeappointment img
        {
            width: 36px;
        }

        .blocksubject
        {
            font-size: 14px;
            font-weight: 600;
            color: rgba(0, 0, 0, 1);
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            padding: 0px 5px;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="blocktemplate" type="text/x-jsrender">
        <span class="blocksubject">{{:Subject}}</span>
        <div style='float:right; padding:5px;'>{{:~format(Subject)}}</div>
    </script>
    <script type="text/javascript">
        function _getImages(Subject) {
            switch (Subject) {
                case "BAD MONSOON":
                    return "<img src='../Content/images/schedule/badmonsoon.png'/>";
                case "MAINTENANCE":
                    return "<img src='../Content/images/schedule/maintenance_01.png'/>";
                case "SERVICE":
                    return "<img src='../Content/images/schedule/service.png'/>";
                default:
                    return null;
            }
        }
        $.views.helpers({ format: _getImages });
    </script>
</asp:Content>

