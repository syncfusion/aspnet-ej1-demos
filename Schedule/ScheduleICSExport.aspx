<%@ Page Title="Schedule-ICS Export & Import-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler imports and exports appointments in an ICS file." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ScheduleICSExport.aspx.cs" Inherits="WebSampleBrowser.Schedule.ScheduleICSExport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Import & Export</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="objectDataSource1" Width="100%" CurrentView="Month" CurrentDate="6/5/2017" OnServerExportICS="Schedule1_ExportICS" MenuItemClick="onMenuItemClick">
    <ContextMenuSettings Enable="true">
        <MenuItems>
            <AppointmentCollection>
                <ej:Appointment Id="open" Text="Open Appointment" />
                <ej:Appointment Id="delete" Text="Delete Appointment" />
                <ej:Appointment Id="exportApp" Text="Export Appointment" />
            </AppointmentCollection>
            <CellsCollection>
                <ej:Cells Id="new" Text="New Appointment" />
                <ej:Cells Id="recurrence" Text="New recuring Appointment" />
                <ej:Cells Id="settings" Text="Settings"/>
                <ej:Cells Id="view" Text="view" ParentId="settings"/>
                <ej:Cells Id="timemode" Text="Time Mode" ParentId="settings"/>
                <ej:Cells Id="view_Day" Text="Day" ParentId="view"/>
                <ej:Cells Id="view_Week" Text="Week" ParentId="view"/>
                <ej:Cells Id="view_Workweek" Text="Workweek" ParentId="view"/>
                <ej:Cells Id="view_Month" Text="Month" ParentId="view"/>
                <ej:Cells Id="timemode_Hour12" Text="12 Hours" ParentId="timemode"/>
                <ej:Cells Id="timemode_Hour24" Text="24 Hours" ParentId="timemode"/>
            </CellsCollection>
        </MenuItems>
    </ContextMenuSettings>
    <AppointmentSettings Id="ID" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>
    </div>
    <asp:ObjectDataSource ID="objectDataSource1" runat="server" TypeName="ScheduleAppointmentsObjDatum" SelectMethod="GetRecords">

    </asp:ObjectDataSource>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">Import ICS</div>
                <div class="col-md-3">
                    <ej:UploadBox ID="fileUpload1" ClientIDMode="Static" runat="server" Height="30px" Width="60px" ExtensionsAllow=".ics"  SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" AutoUpload="true" ShowFileDetails="false" MultipleFilesSelection="false" OnComplete="fileUpload1_Complete">
                        <UploadBoxButtonText Browse="Import" />
                    </ej:UploadBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Export ICS</div>
                <div class="col-md-3">
                    <ej:Button ClientIDMode="Static" Type="Button" ID="exportFile" Height="30px" Width="60px" Text="Export" runat="server" ShowRoundedCorner="true" ClientSideOnClick="onExportClick"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        function onExportClick(Args) {
            var obj = $("#Schedule1").data("ejSchedule");
            obj.exportSchedule(null, "exportICS", null);
        }

        function onMenuItemClick(args) {
            if (args.events.ID == "exportApp") {
                var obj = $("#Schedule1").data("ejSchedule");
                obj.exportSchedule(null, "exportICS", args.targetInfo.ID);
            }
        }

    </script>
</asp:Content>

