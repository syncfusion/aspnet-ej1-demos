<%@ Page Title="Schedule-PDF Export-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to export the ASP.NET Web Scheduler to PDF format." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="PDFExport.aspx.cs" Inherits="WebSampleBrowser.Schedule.PDFExport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">PDF Export</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
        <div>
<ej:Schedule OnServerExportPDF="Schedule1_OnServerExportPDF" ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" CurrentView="Workweek">
    <BlockoutSettings Enable="true" Id="BlockId" Subject="Subject" StartTime="StartTime" EndTime="EndTime" IsBlockAppointment="BlockAppointment" ResourceId="ResourceId" GroupId="GroupId" IsAllDay="FullDay" />
    <Resources>
        <ej:Resources Field="RoomId" Name="Rooms" Title="Room" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text">
            </ResourceSettings>
        </ej:Resources>
        <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text" GroupId="groupId">
            </ResourceSettings>
        </ej:Resources>
         
    </Resources>
    <Group Resources="Rooms,Owners"/>
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="RoomId,OwnerId"/>
</ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [MultipleResource]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Orientation
                </div>
                <div class="col-md-3">
                   <ej:DropDownList  ClientIDMode="Static" runat="server" ID="ddlOrientation" Width="115px" SelectedIndex="0" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="Vertical" Value="Vertical"/>
                            <ej:DropDownListItem  Text="Horizontal" Value="Horizontal"/>
                        </Items>
                    </ej:DropDownList> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                  <ej:Button ClientIDMode="Static" Type="Button" ID="BtnSubmit" runat="server" Text="Export" ClientSideOnClick="onExportClick"></ej:Button>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });
        function onChange(args) {
            if (args.text == "Vertical")
                $("#Schedule1").ejSchedule({ orientation: "vertical" });
            else if (args.text == "Horizontal")
                $("#Schedule1").ejSchedule({ orientation: "horizontal" });
        }
        function onExportClick(args) {
            var obj = $("#Schedule1").data("ejSchedule");
            obj.exportSchedule(null, "exportPDF", null);
        }
    </script>
</asp:Content>

