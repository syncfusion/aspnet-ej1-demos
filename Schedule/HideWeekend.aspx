<%@ Page Title="Schedule-Hide Weekend-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to hide the weekend days in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HideWeekend.aspx.cs" Inherits="WebSampleBrowser.Schedule.HideWeekend" %>

<asp:Content ID="SampleTitle" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Hide Weekend</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" CurrentDate="6/5/2017" ShowWeekend="false" Views="Day,Week,Month,Agenda">
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" Priority="Priority" />
        </ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="PropertyContent" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">Non-Working Days</div>
                <div class="col-md-3">
                    <ej:ToggleButton ID="showrhideweekends" ClientIDMode="Static" runat="server" Size="Medium" ShowRoundedCorner="true" DefaultText="Show" ActiveText="Hide" ClientSideOnChange="onShowOrHideDays"></ej:ToggleButton>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">Orientation</div>
                <div class="col-md-3">
                    <ej:DropDownList  ClientIDMode="Static" runat="server" ID="orientation" Width="105px" ClientSideOnChange="onOrientationChange" ClientSideOnSelect="onOrientationChange">
                        <Items>
                            <ej:DropDownListItem Text="Vertical" Value="Vertical" />
                            <ej:DropDownListItem Text="Horizontal" Value="Horizontal" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3">Working Days</div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="workingdays" Width="105px" ShowCheckbox="true" ClientSideOnChange="onChangeWorkingDays" ClientSideOnSelect="onChangeWorkingDays">
                        <Items>
                            <ej:DropDownListItem Text="Sunday" Value="Sunday" />
                            <ej:DropDownListItem Text="Monday" Value="Monday" />
                            <ej:DropDownListItem Text="Tuesday" Value="Tuesday" />
                            <ej:DropDownListItem Text="Wednesday" Value="Wednesday" />
                            <ej:DropDownListItem Text="Thursday" Value="Thursday" />
                            <ej:DropDownListItem Text="Friday" Value="Friday" />
                            <ej:DropDownListItem Text="Saturday" Value="Saturday" />
                        </Items>
                    </ej:DropDownList>
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
        function onShowOrHideDays(args) {
            $("#Schedule1").ejSchedule({ showWeekend: args.isChecked });
        }

        function onOrientationChange(args) {
            $("#Schedule1").ejSchedule({ orientation: args.value.toLowerCase() });
        }

        function onChangeWorkingDays(args) {
            var object = $('#workingdays').data("ejDropDownList");
            var array = [], workweek = [];
            var items = args.model.selectedItems.sort();
            var element = object.listitems;
            for (var i = 0; i < element.length; i++) {
                list = element.get(i);
                array.push(list.textContent);
            }
            for (var j = 0; j < items.length; j++) {
                workweek.push(array[items[j]]);
            }
            $.unique(workweek);
            $("#Schedule1").ejSchedule({ workWeek: workweek });
        }
    </script>
</asp:Content>

