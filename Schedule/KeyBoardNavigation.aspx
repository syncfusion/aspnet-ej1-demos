<%@ Page Title="Schedule-KeyBoard Interaction-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example demonstrates the available keyboard shortcuts for the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyBoardNavigation.aspx.cs" Inherits="WebSampleBrowser.Schedule.KeyBoardNavigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" Views="day,week,workweek,month" CurrentDate="6/5/2017" AllowKeyboardNavigation="true">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) {
                    $("#Schedule1").find(".e-workcells").hasClass("e-selectedCell") && $("#Schedule1").find(".e-workcells").removeClass("e-selectedCell") || $("#Schedule1").find(".e-monthcells").hasClass("e-selectedCell") && $("#Schedule1").find(".e-monthcells").removeClass("e-selectedCell");
                    $("#Schedule1").find(".e-workcells").length != 0 ? $($("#Schedule1").find(".e-workcells")[0]).addClass("e-selectedCell").attr("tabIndex", "0").focus() : $($("#Schedule1").find(".e-monthcells")[0]).addClass("e-selectedCell").attr("tabIndex", "0").focus();
                    $("#Schedule1").find(".e-scrolltimecells").css("top", (-$("#Schedule1").find('.e-draggableworkarea').scrollTop()) + "px");
                    $("#Schedule1_scroller").ejScroller({ scrollTop: 0 });
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
             <div class="row">
        <div class="col-md-3">
            <b>Alt + j</b>
        </div>
        <div class="col-md-3">
            Focuses the control
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <b>Up</b>
        </div>
        <div class="col-md-3">
            Upward cell navigation
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <b>Down</b>
        </div>
        <div class="col-md-3">
            Downward cell navigation
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <b>Left</b>
        </div>
        <div class="col-md-3">
            Left cell navigation
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <b>Right</b>
        </div>
        <div class="col-md-3">
            Right cell navigation
        </div>
    </div>
    <br />
    <div class="row">
        <div class="col-md-3">
            <b>Tab</b>
        </div>
        <div class="col-md-3">
            Appointment forward navigation
        </div>
    </div>
            <br />
    <div class="row">
        <div class="col-md-3">
<br />
            <b>Shift  + Tab</b>
        </div>
        <div class="col-md-3">
            <br />
            Appointment backward navigation
        </div>
    </div>
            <br />
    <div class="row">
        <div class="col-md-3">
            <br />
            <br />
            <b>Alt + "+"</b>
        </div>
        <div class="col-md-3">
            <br />
            <br />
            Toolbar item forward navigation
        </div>
    </div>
            <br />
             <div class="row">
                    <div class="col-md-3">
                        </div>
                       </div>
    <div class="row">
        <div class="col-md-3">
            <br />
            <b>Alt + "-"</b>
        </div>
        <div class="col-md-3">
            <br />
            Toolbar item backward navigation
        </div>
    </div>
            <br />
         <div class="row">
                    <div class="col-md-3">
                        </div>
                       </div>
    <div class="row">
        <div class="col-md-3">
            <b>Alt + N</b>
        </div>
        <div class="col-md-3">
            Opens new appointment window
        </div>
    </div>
            <br />
    <div class="row">
        <div class="col-md-3">
            <br />
            <b>Ctrl + E</b>
        </div>
        <div class="col-md-3">
            <br />
            Edit appointment window
        </div>
    </div>
            <br />
    <div class="row">
        <div class="col-md-3">
            <br />
            <br />
            <b>Alt + C</b>
        </div>
        <div class="col-md-3">
            <br />
            <br />
            Opens the calendar
        </div>
    </div>
             <br />
             <div class="row">
                  <div class="col-md-3">
                        </div>
                       </div>
    <div class="row">
        <div class="col-md-3">
            <b>Esc</b>
        </div>
        <div class="col-md-3">
            Closes the appointment window
        </div>
    </div>
        </div>
    </div>
</asp:Content>

