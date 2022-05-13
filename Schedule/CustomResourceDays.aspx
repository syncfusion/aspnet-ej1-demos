<%@ Page Title="Schedule-Custom Work Hours-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to set different working days for each of the resources in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomResourceDays.aspx.cs" Inherits="WebSampleBrowser.Schedule.CustomResourceDays" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Custom Work Hours</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="550px" CurrentDate="6/5/2017" CurrentView="Workweek">
            <Resources>
                <ej:Resources Field="RoomId" Name="Rooms" Title="Room" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text">
                    </ResourceSettings>
                </ej:Resources>
                <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
                    <ResourceSettings Color="color" Id="id" Text="text" GroupId="groupId" Start="on" End="off" WorkWeek="customDays">
                    </ResourceSettings>
                </ej:Resources>
            </Resources>
            <Group Resources="Rooms,Owners" />
            <AppointmentSettings Id="AppointmentSettings1" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="RoomId,OwnerId" />
        </ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [MultipleResource]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div id="sampleProperties">
        <div class="prop-grid content">
            <div class="row">
                <div style="padding-left:5px;"><strong>Nancy</strong></div>
                <div class="col-md-3">Workweek Days</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="nancyworkdays" runat="server" ShowCheckbox="true" Width="110px" ClientSideOnChange="onChange">
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
                <div class="col-md-3">WorkHours Start</div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="nancyhourstart" Value="10" Name="numeric" runat="server" MinValue="0" MaxValue="24" Width="110px" ShowSpinButton="false" DecimalPlaces="0" ClientSideOnChange="onChange" />
                </div>
                <div class="col-md-3">WorkHours End</div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="nancyhourend" Value="18" Name="numeric" runat="server" MinValue="0" MaxValue="24" Width="110px" ShowSpinButton="false" DecimalPlaces="0" ClientSideOnChange="onChange" />
                </div>
            </div>
            <br>
            <div class="row">
                <div style="padding-left:5px;"><strong>Michael</strong></div>
                <div class="col-md-3">Workweek Days</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="michaelworkdays" runat="server" ShowCheckbox="true" Width="110px" ClientSideOnChange="onChange">
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
                <div class="col-md-3">WorkHours Start</div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="michaelhourstart" Value="11" Name="numeric" runat="server" MinValue="0" MaxValue="24" Width="110px" ShowSpinButton="false" DecimalPlaces="0" ClientSideOnChange="onChange" />
                </div>
                <div class="col-md-3">WorkHours End</div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="michaelhourend" Value="15" Name="numeric" runat="server" MinValue="0" MaxValue="24" Width="110px" ShowSpinButton="false" DecimalPlaces="0" ClientSideOnChange="onChange" />
                </div>
            </div>
            <br>
            <div class="row">
                <div style="padding-left:5px;"><strong>Steven</strong></div>
                <div class="col-md-3">Workweek Days</div>
                <div class="col-md-3">
                    <ej:DropDownList ID="stevenworkdays" runat="server" ShowCheckbox="true" Width="110px" ClientSideOnChange="onChange">
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
                <div class="col-md-3">WorkHours Start</div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="stevenhourstart" Value="6" Name="numeric" runat="server" MinValue="0" MaxValue="24" Width="110px" ShowSpinButton="false" DecimalPlaces="0" ClientSideOnChange="onChange" />
                </div>
                <div class="col-md-3">WorkHours End</div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="stevenhourend" Value="10" Name="numeric" runat="server" MinValue="0" MaxValue="24" Width="110px" ShowSpinButton="false" DecimalPlaces="0" ClientSideOnChange="onChange" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });

        function onChange() {
            var weekDays = ej.cultureObject.calendar.days.names;
            var nancydays = $("#LayoutSection_EventSection_nancyworkdays").data("ejDropDownList");
            var michaeldays = $("#LayoutSection_EventSection_michaelworkdays").data("ejDropDownList");
            var stevendays = $("#LayoutSection_EventSection_stevenworkdays").data("ejDropDownList");

            var nancy = nancydays.model.selectedItems.sort();
            var michael = michaeldays.model.selectedItems.sort();
            var steven = stevendays.model.selectedItems.sort();

            var nancyWorkweek = [], michaelWorkweek = [], stevenWorkweek = [];
            for (i = 0; i < nancy.length; i++) { nancyWorkweek.push(weekDays[nancy[i]].toLowerCase()); }
            for (i = 0; i < michael.length; i++) { michaelWorkweek.push(weekDays[michael[i]].toLowerCase()); }
            for (i = 0; i < steven.length; i++) { stevenWorkweek.push(weekDays[steven[i]].toLowerCase()); }

            var schObj = $("#Schedule1").data("ejSchedule");
            if (nancyWorkweek.length == 0) nancyWorkweek = schObj.model.workWeek;
            if (michaelWorkweek.length == 0) michaelWorkweek = schObj.model.workWeek;
            if (stevenWorkweek.length == 0) stevenWorkweek = schObj.model.workWeek;

            var nancyStart = $("#LayoutSection_EventSection_nancyhourstart").val();
            var nancyEnd = $("#LayoutSection_EventSection_nancyhourend").val();
            var michaelStart = $("#LayoutSection_EventSection_michaelhourstart").val();
            var michaelEnd = $("#LayoutSection_EventSection_michaelhourend").val();
            var stevenStart = $("#LayoutSection_EventSection_stevenhourstart").val();
            var stevenEnd = $("#LayoutSection_EventSection_stevenhourend").val();

            $("#Schedule1").ejSchedule({
                resources: [{
                    field: "RoomId",
                    title: "Room",
                    name: "Rooms", allowMultiple: false,
                    resourceSettings: {
                        dataSource: [
							{ text: "ROOM 1", id: "1", groupId: "1", color: "#cb6bb2" },
							{ text: "ROOM 2", id: "2", groupId: "1", color: "#56ca85" }
                        ],
                        text: "text", id: "id", groupId: "groupId", color: "color"
                    }
                }, {
                    field: "OwnerId",
                    title: "Owner",
                    name: "Owners", allowMultiple: true,
                    resourceSettings: {
                        dataSource: [
							{ text: "Nancy", id: "1", groupId: "1", color: "#ffaa00", on: nancyStart, off: nancyEnd, customDays: nancyWorkweek },
							{ text: "Steven", id: "3", groupId: "2", color: "#f8a398", on: stevenStart, off: stevenEnd, customDays: stevenWorkweek },
							{ text: "Michael", id: "5", groupId: "1", color: "#7499e1", on: michaelStart, off: michaelEnd, customDays: michaelWorkweek }
                        ],
                        text: "text", id: "id", groupId: "groupId", color: "color", start: "on", end: "off", workWeek: "customDays"
                    }
                }]
            });
        }
    </script>
</asp:Content>

