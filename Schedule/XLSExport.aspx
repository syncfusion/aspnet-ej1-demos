<%@ Page Title="Schedule-Excel Export-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler exports appointments to an Excel file." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="XLSExport.aspx.cs" Inherits="WebSampleBrowser.Schedule.XLSExport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Excel Export</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" OnExportToExcel="Schedule1_ServerExportExcel">
        <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
    </ej:Schedule>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>" SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <p>To export the Schedule appointments in an excel file, click the below button.</p>
                <div class="col-md-3">
                    <ej:Button ClientIDMode="Static" Type="Button" ID="btnExport" runat="server" Text="Export To Excel" Height="30px" ClientSideOnClick="onExportClick"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        function onExportClick(args) {
            var proxy = $("#Schedule1").data("ejSchedule");
            proxy.exportToExcel(null, "exportToExcel", false);
        }
    </script>
</asp:Content>

