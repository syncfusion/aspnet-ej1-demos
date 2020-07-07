<%@ Page Title="Schedule-Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows the client-side events that trigger on specific actions in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Schedule.Events" %>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" AppointmentClick="onAppointmentClick" BeforeAppointmentCreate="onBeforeAppointmentCreate" BeforeAppointmentChange="onBeforeAppointmentChange" BeforeAppointmentRemove="onBeforeAppointmentRemove" AppointmentRemoved="onAppointmentRemoved" AppointmentChanged="onAppointmentChanged" AppointmentCreated="onAppointmentCreated" AppointmentWindowOpen="onAppointmentWindowOpen" CellDoubleClick="onCellDoubleClick" CellClick="onCellClick" Create="onCreate" Navigation="onNavigation" ResizeStart="onResizeStart" ResizeStop="onResizeStop" DragStart="onDragStart" DragStop="onDragStop">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="eventsection" ContentPlaceHolderID="EventSection" runat="server">
     <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList  ID="selectControls" runat="server" SelectedItemIndex="0" Width="150px" ShowCheckbox="True"
                        CheckAll="True" ClientSideOnChange="evtpropscheckedevent">
                        <Items>
                            <ej:DropDownListItem Text="Create" Value="create" />
                            <ej:DropDownListItem Text="Cell Click" Value="cellClick" />
                            <ej:DropDownListItem Text="App Click" Value="appointmentClick" />
                            <ej:DropDownListItem Text="Double Click" Value="cellDoubleClick" />
                            <ej:DropDownListItem Text="Window Open" Value="appointmentWindowOpen" />
                            <ej:DropDownListItem Text="App Save" Value="beforeAppointmentCreate" />
                            <ej:DropDownListItem Text="App Edit" Value="beforeAppointmentChange" />
                            <ej:DropDownListItem Text="App Delete" Value="beforeAppointmentRemove" />
                            <ej:DropDownListItem Text="App Created" Value="appointmentCreated" />
                            <ej:DropDownListItem Text="App Updated" Value="appointmentChanged" />
                            <ej:DropDownListItem Text="App Removed" Value="appointmentRemoved" />
                            <ej:DropDownListItem Text="Navigation" Value="navigation" />
                            <ej:DropDownListItem Text="Resize Start" Value="resizeStart" />
                            <ej:DropDownListItem Text="Resize Stop" Value="resizeStop" />
                            <ej:DropDownListItem Text="Drag Start" Value="dragStart" />
                            <ej:DropDownListItem Text="Drag Stop" Value="dragStop" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClear"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function evtpropscheckedevent(args) {
            var scheObj = $("#Schedule1").data("ejSchedule");
            if (args.isChecked) {
                switch (args.value) {
                    case "create": scheObj.option(args.value, "onCreate"); break;
                    case "cellClick": scheObj.option(args.value, "onCellClick"); break;
                    case "appointmentClick": scheObj.option(args.value, "onAppointmentClick"); break;
                    case "cellDoubleClick": scheObj.option(args.value, "onCellDoubleClick"); break;
                    case "appointmentWindowOpen": scheObj.option(args.value, "onAppointmentWindowOpen"); break;
                    case "beforeAppointmentCreate": scheObj.option(args.value, "onBeforeAppointmentCreate"); break;
                    case "beforeAppointmentChange": scheObj.option(args.value, "onBeforeAppointmentChange"); break;
                    case "beforeAppointmentRemove": scheObj.option(args.value, "onBeforeAppointmentRemove"); break;
                    case "appointmentCreated": scheObj.option(args.value, "onAppointmentCreated"); break;
                    case "appointmentChanged": scheObj.option(args.value, "onAppointmentChanged"); break;
                    case "appointmentRemoved": scheObj.option(args.value, "onAppointmentRemoved"); break;
                    case "navigation": scheObj.option(args.value, "onNavigation"); break;
                    case "resizeStart": scheObj.option(args.value, "onResizeStart"); break;
                    case "resizeStop": scheObj.option(args.value, "onResizeStop"); break;
                    case "dragStart": scheObj.option(args.value, "onDragStart"); break;
                    case "dragStop": scheObj.option(args.value, "onDragStop"); break;
                }
            }
            else scheObj.option(args.value, null);
        }
        function onCellClick() {
            jQuery.addEventLog("Cell has been <span class='eventTitle'>Clicked.</span>");
        }
        function onCreate() {
            jQuery.addEventLog("Schedule has been <span class='eventTitle'>Created.</span>");
        }
        function onAppointmentClick() {
            jQuery.addEventLog("Appointment has been <span class='eventTitle'>Clicked.</span>");
        }
       function onCellDoubleClick() {
            jQuery.addEventLog("<span class='eventTitle'>Double Clicked</span> the cells");
        }
        function onAppointmentWindowOpen() {
            jQuery.addEventLog("Appointment window has been <span class='eventTitle'>Opened.</span>");
        }
        function onBeforeAppointmentCreate() {
            jQuery.addEventLog("Appointment window opened to <span class='eventTitle'>Save.</span>");
        }
        function onBeforeAppointmentChange() {
            jQuery.addEventLog("Appointment opened for <span class='eventTitle'>Edit.</span>");
        }
        function onBeforeAppointmentRemove() {
            jQuery.addEventLog("Appointment opened for <span class='eventTitle'>Delete.</span>");
        }
        function onAppointmentCreated() {
            jQuery.addEventLog("Appointment has been <span class='eventTitle'>Created.</span>");
        }
        function onAppointmentChanged() {
            jQuery.addEventLog("Appointment has been <span class='eventTitle'>Updated.</span>");
        }
        function onAppointmentRemoved() {
            jQuery.addEventLog("Appointment has been <span class='eventTitle'>Deleted.</span>");
        }
        function onNavigation() {
            jQuery.addEventLog("Changed the <span class='eventTitle'>Date / View </span>");
        }
        function onResizeStart() {
            jQuery.addEventLog("Appointment <span class='eventTitle'>Resize Started </span>");
        }
        function onResizeStop() {
            jQuery.addEventLog("Appointment <span class='eventTitle'>Resize Stopped </span>");
        }
        function onDragStart() {
            jQuery.addEventLog("Appointment <span class='eventTitle'>Drag Started </span>");
        }
        function onDragStop() {
            jQuery.addEventLog("Appointment <span class='eventTitle'>Drag Stopped </span>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>

