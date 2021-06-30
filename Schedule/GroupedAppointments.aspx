<%@ Page Title="Schedule-Grouped Appointments-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example shows the usage of single events that are shared by multiple resources in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="GroupedAppointments.aspx.cs" Inherits="WebSampleBrowser.Schedule.GroupedAppointments" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grouped Appointments</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:schedule clientidmode="Static" runat="server" id="Schedule1" width="100%" height="525px" currentdate="5/6/2017" showcurrenttimeindicator="false">
            <Group Resources="Owners" AllowGroupEditing="true"/>
            <Resources>
                <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text">
                    </ResourceSettings>
                </ej:Resources>
            </Resources>
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="OwnerId" />
        </ej:schedule>
    </div>
    </br>
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <ej:dropdownlist clientidmode="Static" runat="server" id="ddlView" width="115px" selecteditemindex="1" clientsideonchange="onChange" clientsideonselect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="Horizontal" Value="horizontal"/>
                            <ej:DropDownListItem  Text="Vertical" Value="vertical"/>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>

        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });
        function onChange(args) {
            $("#Schedule1").ejSchedule({ orientation: args.value });
        }
    </script>

</asp:Content>
<asp:Content runat="server" ID="Style" ContentPlaceHolderID="StyleSection">
    <style>
        .row .cols-prop-area {
            margin-left: 0px;
            width: 100%;
        }
    </style>
</asp:Content>

