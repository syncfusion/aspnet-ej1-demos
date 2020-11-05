<%@ Page Title="Schedule-API's-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example demonstrates the ASP.NET Web Scheduler’s APIs." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs" Inherits="WebSampleBrowser.Schedule.API" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Time Mode</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" CurrentDate="6/5/2017" TimeMode="Hour24">
            <PrioritySettings Enable="true" Text="text" Value="value"></PrioritySettings>
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" Priority="Priority" />
        </ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [API]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var obj;
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            obj= $("#Schedule1").data("ejSchedule");
        });
        var maxDatepicker = null;
        var minDatepicker = null;
        var currentdate = null;
        function selectedDate1(sender) {
            $(function () {
                maxDatepicker = $("#maxdate").data("ejDatePicker");
                currentdate = $("#currentdate").data("ejDatePicker");
                minDatepicker = $("#mindate").data("ejDatePicker");
                maxDatepicker.setModel({ "minDate": new Date(sender.value) });
                currentdate.setModel({ "minDate": new Date(sender.value) });
            });
        }
        function selectedDate2(sender) {
            $(function () {
                currentdate = $("#currentdate").data("ejDatePicker");
                minDatepicker = $("#mindate").data("ejDatePicker");
                minDatepicker.setModel({ "maxDate": new Date(sender.value) });
                currentdate.setModel({ "maxDate": new Date(sender.value) });
            });
        }

        function onChange(args) {
            $("#Schedule1").ejSchedule({ dateFormat: args.value });
            $("#currentdate").ejDatePicker({ dateFormat: args.value });
            $("#mindate").ejDatePicker({ dateFormat: args.value });
            $("#maxdate").ejDatePicker({ dateFormat: args.value });
        }
        function viewChange(args) {
            $("#Schedule1").ejSchedule({ currentView: args.text.toLowerCase() });
        }
        function businessStart(args) {
            obj = $("#Schedule1").data("ejSchedule");
            if (args.itemId < obj.model.workHours.end)
                $("#Schedule1").ejSchedule({ workHours: { start:args.itemId } });
            else
                alert("Start time should be less than end time.");
        }
        function businessEnd(args) {
            obj = $("#Schedule1").data("ejSchedule");
            if (args.itemId > obj.model.workHours.start)
                $("#Schedule1").ejSchedule({ workHours: { end:args.itemId } });
            else
                alert("End time should be greater than start time.");
        }
        function onBusinessHour(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ workHours: { highlight: true } });
            else
                $("#Schedule1").ejSchedule({ workHours: { highlight: false } });
        }
        function onReadOnly(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ readOnly: true });
            else
                $("#Schedule1").ejSchedule({ readOnly: false });
        }
        function onAllDayRow(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ showAllDayRow: true });
            else
                $("#Schedule1").ejSchedule({ showAllDayRow: false });
        }
        function nextPrevMonth(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ showNextPrevMonth: true });
            else
                $("#Schedule1").ejSchedule({ showNextPrevMonth: false });
        }
		function onApplyTimeOffset(args) {
            $("#Schedule1").ejSchedule({ appointmentSettings: { applyTimeOffset: !args.isChecked }});
        }
        function onTimeScale(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ timeScale: { enable: false }});
            else
                $("#Schedule1").ejSchedule({ timeScale: { enable: true }});
        }
        function dateChange(args) {
            $("#Schedule1").ejSchedule({ currentDate: args.value });
        }
        function ChangeTime(args) {
            if (parseInt($("#stime").val()) < parseInt($("#etime").val()))
                $("#Schedule1").ejSchedule({
                    startHour: parseInt($("#stime").val()),
                    endHour: parseInt($("#etime").val()),
                    cellWidth: $("#cellwidth").val() + "px",
                    cellHeight: $("#cellheight").val() + "px",
                    minDate: $("#mindate").val(),
                    maxDate: $("#maxdate").val()
                });
            else
                alert("Start hour should be lesser than end hour");
        }
        function onAppointmentPriority(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ prioritySettings: { enable: true } });
            else
                $("#Schedule1").ejSchedule({ prioritySettings: { enable: false } });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Current Date
                </div>
                <div class="col-md-3">
                    <ej:DatePicker  ClientIDMode="Static" runat="server" ID="currentdate" Width="120px" Value="06/05/2017" ClientSideOnSelect="dateChange"></ej:DatePicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Min Date
                </div>
                <div class="col-md-3">
                    <ej:DatePicker  ClientIDMode="Static" runat="server" ID="mindate" Width="120px" Value="01/01/2017" ClientSideOnSelect="selectedDate1"></ej:DatePicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Max Date
                </div>
                <div class="col-md-3">
                    <ej:DatePicker  ClientIDMode="Static" runat="server" ID="maxdate" Width="120px" Value="12/31/2017" ClientSideOnSelect="selectedDate2"></ej:DatePicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    DateFormat
                </div>
                <div class="col-md-3">
                    <ej:DropDownList  ClientIDMode="Static" runat="server" ID="DropDownList2" Width="115px" SelectedItemIndex="0" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="Default - MM/dd/yyyy" Value="MM/dd/yyyy"/>
                            <ej:DropDownListItem  Text="Short - d M, y" Value="d M, y"/>
                            <ej:DropDownListItem  Text="Medium - d MM, y" Value="d MM, y"/>
                            <ej:DropDownListItem  Text="Full-dddd,d MMMM,yy" Value="dddd, d MMMM, yy"/>
                            <ej:DropDownListItem  Text="UTC - yyyy-MM-dd" Value="yyyy-MM-dd"/>
                        </Items>
                    </ej:DropDownList>          
                        </div>
                    </div>
            <div class="row">
                <div class="col-md-3">
                   Buisness Start Hour
                </div>
                <div class="col-md-3">
                  <ej:DropDownList  ClientIDMode="Static" runat="server" ID="ddlBusinessStartHour" Width="115px" ClientSideOnChange="businessStart" ClientSideOnSelect="businessStart">
                    </ej:DropDownList>
                </div>
            </div>
               <div class="row">
                <div class="col-md-3">
                   Business End Hour
                </div>
                <div class="col-md-3">
                   <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlBusinessEndHour" Width="115px" ClientSideOnChange="businessEnd" ClientSideOnSelect="businessEnd">
                    </ej:DropDownList>
                </div>
            </div>
               <div class="row">
                <div class="col-md-3">
                   HighLight Business Hour
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="true" ID="Enablebusinesshour" ClientSideOnChange="onBusinessHour"></ej:Checkbox>
                </div>
            </div>
               <div class="row">
                <div class="col-md-3">
                   Read Only
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="false" ID="ReadOnly" ClientSideOnChange="onReadOnly"></ej:Checkbox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Show/Hide AllDay row
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="true" ID="AllDayRow" ClientSideOnChange="onAllDayRow"></ej:Checkbox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Next/Prev Month Date
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="true" ID="nextprevmonth" ClientSideOnChange="nextPrevMonth"></ej:Checkbox>
                </div>
            </div>
			<div class="row">
                <div class="col-md-3">
                    ApplyTimeOffset
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="false" ID="applytimeoffset" ClientSideOnChange="onApplyTimeOffset"></ej:Checkbox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Disable TimeScale
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="false" ID="timescale" ClientSideOnChange="onTimeScale"></ej:Checkbox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Show/Hide Appointment Priority
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="true" ID="AppointmentPriority" ClientSideOnChange="onAppointmentPriority"></ej:Checkbox>
                </div>
            </div><br/>
               <div class="row">
                <div class="col-md-3">
                   Current View
                </div>
                <div class="col-md-3">
                   <ej:DropDownList ClientIDMode="Static" runat="server" ID="DropDownList4" Width="115px" SelectedItemIndex="1" ClientSideOnChange="viewChange" ClientSideOnSelect="viewChange">
                        <Items>
                            <ej:DropDownListItem  Text="Day" Value="Day"/>
                            <ej:DropDownListItem  Text="Week" Value="Week"/>
                            <ej:DropDownListItem  Text="WorkWeek" Value="WorkWeek"/>
                            <ej:DropDownListItem  Text="Month" Value="Month"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3">
                   Start Hour
                </div>
                <div class="col-md-3">
                  <ej:NumericTextBox  ClientIDMode="Static" Width="115px" ID="stime" Value="0" MinValue="0" MaxValue="24" Name="numeric" EnableStrictMode="true" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   End Hour
                </div>
                <div class="col-md-3">
                   <ej:NumericTextBox ClientIDMode="Static" Width="115px" ID="etime" Value="24" MinValue="0" MaxValue="24" Name="numeric" EnableStrictMode="true" runat="server" />
                </div>
            </div>
            <div class="row">
    <div class="col-md-3">
        Cell Width
    </div>
    <div class="col-md-3">
        <ej:NumericTextBox ClientIDMode="Static" Width="115px" ID="cellwidth" Value="100" Name="numeric"  runat="server" />
    </div>
</div>
<div class="row">
    <div class="col-md-3">
        Cell Height
    </div>
    <div class="col-md-3">
        <ej:NumericTextBox ClientIDMode="Static" Width="115px" ID="cellheight" Value="60" Name="numeric" runat="server" />
    </div>
</div><br />
            <div class="row">
                <div class="col-md-3">
                  <ej:Button ClientIDMode="Static" Type="Button" ID="BtnSubmit" runat="server" Text="Submit" ClientSideOnClick="ChangeTime"></ej:Button>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>

