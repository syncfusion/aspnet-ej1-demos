<%@ Page Title="Schedule-Cell Auto Fit-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to autofit the cells to the number of appointments in the ASP.NET Web Scheduler." AutoEventWireup="true" CodeBehind="CellAutoFit.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Schedule.CellAutoFit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Cell Auto Fit</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CellWidth="40px" CurrentDate="6/5/2017" Orientation="Horizontal" Views="Week,WorkWeek,Month,Agenda" CurrentView="Month"  ShowCurrentTimeIndicator="false" ShowOverflowButton="false">
    <Group Resources="Owners" />
    <Resources>
        <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text">
                
            </ResourceSettings>
        </ej:Resources>
    </Resources>
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="OwnerId"/>
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
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlView" Width="115px" SelectedItemIndex="1" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="Vertical" Value="vertical"/>
                            <ej:DropDownListItem  Text="Horizontal" Value="horizontal"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <br />
               <div class="row">
                <div class="col-md-3">
                  Disable Cell Auto Fit
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="false" ID="cellautofit" ClientSideOnChange="onAutoChange"></ej:Checkbox>
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
        function onAutoChange(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule("option", "showOverflowButton", true);
            else
                $("#Schedule1").ejSchedule("option", "showOverflowButton", false);
        }
        </script>
</asp:Content>

