<%@ Page Title="Schedule-FirstDayOfWeek-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to set the first day of the week in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FirstDayOfWeek.aspx.cs" Inherits="WebSampleBrowser.Schedule.FirstDayOfWeek" %>

<asp:Content ID="ControlContent1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" CurrentDate="6/5/2017" FirstDayOfWeek="Monday" WorkWeek="Monday,Tuesday,Wednesday,Thursday,Friday">
            <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
        </ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#<%=dayofweek.ClientID%>").ejDropDownList({ width: "110px", change: "onChange" });
        });

        function onChange(args) {
            $("#Schedule1").ejSchedule({ firstDayOfWeek: args.selectedValue });
        }

        function workweeks(args) {
            object = $('#LayoutSection_PropertySection_workweeks').data("ejDropDownList");
            var array = [];
            var element = object.listitems;
            for (var i = 0; i < element.length; i++) {
                list = element.get(i);
                var arr = list.textContent;
                array.push(arr);
            }
            var items = args.model.selectedItems;
            items.sort();
            var workweek = [];
            for (var j = 0; j < items.length; j++) {
                var week = array[items[j]];
                workweek.push(week);
            }
            $.unique(workweek);
            if (args.isChecked)
                $("#Schedule1").ejSchedule({ workWeek: workweek });
            else
                $("#Schedule1").ejSchedule({ workWeek: workweek });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    FirstDayOfWeek
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="dayofweek" Width="105px" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
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
            <div class="row">
                <div class="col-md-3">
                    WorkWeek
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="workweeks" runat="server" ShowCheckbox="true" Width="120px" ClientSideOnChange="workweeks" ClientSideOnSelect="workweeks">
                        <Items>
                            <ej:DropDownListItem Text="Sunday" Value="Sunday"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Monday" Value="Monday"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Tuesday" Value="Tuesday"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Wednesday" Value="Wednesday"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Thursday" Value="Thursday"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Friday" Value="Friday"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Saturday" Value="Saturday"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>







