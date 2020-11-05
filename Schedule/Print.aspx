<%@ Page Title="Schedule-Print-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to print the scheduler layout and its appointments in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Print.aspx.cs" Inherits="WebSampleBrowser.Schedule.Print" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Print Option</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" CurrentDate="6/5/2017">
            <ContextMenuSettings Enable="true">
                <MenuItems>
                    <AppointmentCollection>
                        <ej:Appointment Id="open" Text="Open Appointment" />
                        <ej:Appointment Id="delete" Text="Delete Appointment" />
                        <ej:Appointment Id="print" Text="Print Appointment" />
                    </AppointmentCollection>
                </MenuItems>
            </ContextMenuSettings>
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
        </ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3" style="padding-top:5px;">Print Schedule</div>
                <div class="col-md-3">
                    <div id="reminder">
                        <a class="pull-left" href="#" style="outline: medium none;">
                            <div class="reminder-icon e-btn e-select"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $('.reminder-icon').bind("click", function () {
                var obj = $("#Schedule1").data("ejSchedule");
                obj.print();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="StyleContent" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #reminder {
            width: 50px;
            height: 40px;
            margin-top: 1px;
        }
        .reminder-icon {
            background-image: url("../Content/images/Schedule/print.png") !important;
            background-repeat: no-repeat !important;
            background-position: 3px 3px !important;
            border: 1px solid #BBBCBB !important;
            height: 28px;
            width: 28px;
        }
        .reminder-icon:hover {
            background-image: url("../Content/images/Schedule/print-hover.png") !important;
        }
    </style>
</asp:Content>



