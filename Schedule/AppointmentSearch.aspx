<%@ Page Title="Schedule-Appointment Search-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler performs searches based on specific fields." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AppointmentSearch.aspx.cs" Inherits="WebSampleBrowser.Schedule.AppointmentSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule /Appointment Search</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017">
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
                <p>Filter applied on all fields.</p>
                <div class="col-md-12">
                    <div id="searchDiv">
                        <input id="txtSearch" type="text" onkeyup="searchKeyUp()" />
                    </div>
                </div>
            </div>
            <hr />
            <div class="row" style="margin-top:15px;">
                <p>Filter applied on specific fields.</p>
            </div>
            <div class="row">
                <div class="col-md-4 colwidth">Subject</div>
                <div class="col-md-8">
                    <input type="text" id="txtSubject" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 colwidth">Description</div>
                <div class="col-md-8">
                    <input type="text" id="txtDes" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 colwidth">Start Time</div>
                <div class="col-md-8">
                    <input type="text" id="txtStartDate" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 colwidth">End Time</div>
                <div class="col-md-8">
                    <input type="text" id="txtEndDate" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <input type="button" id="btnSearch" value="Search" />
                </div>
                <div class="col-md-3">
                    <input type="button" id="btnCancel" value="Clear" style="margin-left: 10px;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">

        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#txtSearch").ejAutocomplete({ width: "200", watermarkText: "Search Appointments", showEmptyResultText: false, showPopupButton: true });
            $("#txtSubject").ejAutocomplete({ width: "120", watermarkText: "Subject", showEmptyResultText: false });
            $("#txtDes").ejAutocomplete({ width: "120", watermarkText: "Description", showEmptyResultText: false });
            $("#txtStartDate").ejDatePicker({ width: "120" });
            $("#txtEndDate").ejDatePicker({ width: "120" });
            $("#btnSearch").ejButton({ click: "filterClick" });
            $("#btnCancel").ejButton({ click: "clearFields" });
            $("#txtSearch").keydown(function (e) {
                if (e.keyCode == 46) {
                    $("#txtSearch").val("");
                    showResult(null, "");
                }
            });

        });
        function searchKeyUp(args) {
            var searchString = $("#txtSearch").val();
            var schObj = $("#Schedule1").data("ejSchedule");
            var result = schObj.searchAppointments(searchString);
            showResult(result, searchString);
        }

        function showResult(list, searchString) {
            if ($("#Schedule1").find("#grid1").length == 0) {
                var tr = ej.buildTag("tr").append(ej.buildTag("td").append(ej.buildTag("div#grid1")));
                $("#Schedule1").find(".e-scheduleheader").parent().append(tr);
            }
            if ($("#Schedule1").find("#grid1").data("ejGrid")) $("#Schedule1").find("#grid1").ejGrid("destroy");
            if (!ej.isNullOrUndefined(list) && list.length != 0 && searchString != "") {
                $("#Schedule1").find(".e-datecommondiv").hide();
                $("#Schedule1").find(".e-scheduleheader").next().hide();
                $("#Schedule1").find(".e-scheduleheader").next().next().hide();
                $("#Schedule1").find(".e-viewsdiv").css("visibility", "hidden");
                $("#Schedule1").find("#grid1").show();
                $("#Schedule1").find("#grid1").ejGrid({
                    dataSource: list,
                    allowPaging: true,
                    pageSettings: { pageSize: 10 }
                });
                $("#Schedule1").find("#grid1").find("div.e-prev").removeClass("e-prev");
            }
            else {
                $("#Schedule1").find(".e-datecommondiv").show();
                $("#Schedule1").find(".e-scheduleheader").next().show();
                $("#Schedule1").find(".e-scheduleheader").next().next().show();
                $("#Schedule1").find(".e-viewsdiv").css("visibility", "visible");
                $("#Schedule1").find("#grid1").hide();
                $("#Schedule1").ejSchedule("refreshScroller");
            }
        }

        function filterClick(args) {
            if (args.model.text == "Search") {
                var search, subject = $("#txtSubject").val();
                var des = $("#txtDes").val();
                var strDate = $("#txtStartDate").ejDatePicker("option", "value");
                var endDate = $("#txtEndDate").ejDatePicker("option", "value");
                search = (subject == "" ? "" : subject) + ", " + (des == "" ? "" : (des + ", ")) + (strDate == null || strDate == "" ? "" : (strDate + ", ")) + (endDate == null || endDate == "" ? "" : endDate);
                var schObj = $("#Schedule1").data("ejSchedule");
                var list, serch = [];
                if (subject !== "")
                    serch.push({ field: "Subject", operator: "contains", value: subject, predicate: "or" });
                if (des !== "")
                    serch.push({ field: "Description", operator: "contains", value: des, predicate: "or" });
                if (strDate !== null && strDate !== "")
                    serch.push({ field: "StartTime", operator: "greaterthanorequal", value: strDate, predicate: "and", matchcase: false });
                if (endDate !== null && endDate !== "")
                    serch.push({ field: "EndTime", operator: "lessthanorequal", value: endDate, predicate: "and", matchcase: false });
                serch.length > 0 && (list = schObj.filterAppointments(serch)) && showResult(list, search);
            }
        }
        function clearFields() {
            $("#txtSearch").val("");
            $("#txtSubject").val("");
            $("#txtDes").val("");
            $("#txtStartDate").ejDatePicker({ value: "" });
            $("#txtEndDate").ejDatePicker({ value: "" });
            showResult();
        }
    </script>
</asp:Content>
<asp:Content ID="styleSection" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        hr {
            margin: 0;
        }

        .colwidth {
            width: 70px !important;
            padding: 0 5px !important;
        }

        .e-grid .e-rowcell {
            padding: 0.7em !important;
        }
    </style>
</asp:Content>



