<%@ Page Title="Schedule-SignalR-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to work with SignalR in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SignalR.aspx.cs" Inherits="WebSampleBrowser.Schedule.SignalR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / SignalR</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" BeforeAppointmentChange="actionComplete" BeforeAppointmentCreate="actionComplete" BeforeAppointmentRemove="actionComplete" Navigation="actionComplete" ResizeStop="actionComplete" DragStop="actionComplete">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
     <script src="../Scripts/jquery.signalR-1.1.4.min.js" type="text/javascript"></script>
    <script src='<%: ResolveClientUrl("~/signalr/hubs") %>' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            window.signal = $.connection.scheduleHub;
            window.signal.client.modify = function (action, data) {
                $("#Schedule1").ejSchedule('instance').notifyChanges(action, data);
            };
            $.connection.hub.start().done(function () {
                window.actionComplete = function (args) {
					if (args.methodType != "public" && (args.type == "beforeAppointmentCreate" || args.type == "resizeStop" || args.type == "dragStop" || args.type == "beforeAppointmentChange" || args.type == "beforeAppointmentRemove")) {
						window.signal.server.modify(args.type, args.appointment);
					}
                };
            });
        });
    </script>
</asp:Content>

