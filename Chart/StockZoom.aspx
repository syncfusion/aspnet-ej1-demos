
<%@ Page Title="Chart-Stock Zooming-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render stock chart using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StockZoom.aspx.cs" Inherits="WebSampleBrowser.Chart.StockZoom" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div class="row">
        <div id="zoomButtons" style="float: left">
            <div style="display: inline-block; font-size: 12px">Zoom</div>
            <ej:Button Type="Button" ClientIDMode="Static" runat="server" ID="month1" CssClass="monthButton" Height="18" Width="35" ShowRoundedCorner="true" ClientSideOnClick="getMonth" Text="1M"></ej:Button>
            <ej:Button Type="Button" ClientIDMode="Static" runat="server" ID="month3" CssClass="monthButton" Height="18" Width="35" ShowRoundedCorner="true" ClientSideOnClick="getMonth" Text="3M"></ej:Button>
            <ej:Button Type="Button" ClientIDMode="Static" runat="server" ID="month6" CssClass="monthButton" Height="18" Width="35" ShowRoundedCorner="true" ClientSideOnClick="getMonth" Text="6M"></ej:Button>
            <ej:Button Type="Button" ClientIDMode="Static" runat="server" ID="monthYTD" CssClass="monthButton" Height="18" Width="35" ShowRoundedCorner="true" ClientSideOnClick="getMonth" Text="YTD"></ej:Button>
            <ej:Button Type="Button" ClientIDMode="Static" runat="server" ID="monthYear1" CssClass="monthButton button-hit" Height="18" Width="35" ShowRoundedCorner="true" ClientSideOnClick="getMonth" Text="1Y"></ej:Button>
            <ej:Button Type="Button" ClientIDMode="Static" runat="server" ID="monthAllData" CssClass="monthButton" Height="18" Width="35" ShowRoundedCorner="true" ClientSideOnClick="getMonth" Text="All"></ej:Button>
        </div>

        <div style="float: right;">
            <div class="move" style="float: left; padding-top: 2px; font-size: 12px;">From</div>
            <div class="move dateStyle" style="float: left;">
                <ej:DatePicker ClientIDMode="Static" ID="datepick" runat="server" ClientSideOnCreate="datePickLoad" ClientSideOnSelect="changeStartDate" Width="100" Height="20"></ej:DatePicker>
            </div>
            <div class="move" style="float: left; margin-left: 5px; padding-top: 2px; font-size: 12px;">To</div>
            <div class="move dateStyle" style="float: left;">
                <ej:DatePicker ClientIDMode="Static" ID="datepick2" runat="server" ClientSideOnCreate="datePickLoad2" ClientSideOnSelect="changeEndDate" Width="100" Height="20"></ej:DatePicker>
            </div>
        </div>
    </div>



    <ej:Chart ID="container" ClientIDMode="Static" OnClientLoad="chartLoad" OnChartLoaded="chartLoadComplete" IsResponsive="true" Height="300" OnClientTrackToolTip="trackballTooltip" runat="server">
        <PrimaryXAxis ValueType="Datetime" LabelIntersectAction="Trim">
            <MajorGridLines Visible="false" />
        </PrimaryXAxis>
        <PrimaryYAxis LabelFormat="${value}">
            <MajorGridLines Visible="false" />
            <Range Min="0" Max="120" Interval="20" />
        </PrimaryYAxis>
        <CommonSeriesOptions Type="Area" EnableAnimation="true"></CommonSeriesOptions>
        <Series>
            <ej:Series Name="India" XName="XValue" YName="YValue" Fill="rgba(124,181,236,0.75)">
                <Border Width="2" Color="rgba(124,181,236,1)" />
            </ej:Series>
        </Series>
        <Legend Visible="false" />
        <Title Text="Stock Price History" />
        <Crosshair Visible="true" Type="Trackball">
        </Crosshair>
    </ej:Chart>

    <ej:RangeNavigator ID="scrollcontent" ClientIDMode="Static" runat="server" EnableDeferredUpdate="true" IsResponsive="true" onClientSideLoaded="loadingtheme" onClientSideLoad="loadingdata" onClientSideRangeChanged="onchartloaded">
        <SizeSettings Height="75" />
        <LabelSettings>
            <HigherLevel Visible="true" LabelPlacement="Inside"></HigherLevel>
            <LowerLevel Visible="false" IntervalType="Quarters"></LowerLevel>
        </LabelSettings>
        <ValueAxisSettings Visible="true">
            <Range Min="0" Max="120" Interval="20" />
        </ValueAxisSettings>
        <NavigatorStyleSettings ThumbColor="#ffffff" UnselectedRegionColor="#999999" UnselectedRegionOpacity="0.3" SelectedRegionColor="#0f4f4f4"></NavigatorStyleSettings>
        <Series>
            <ej:Series Name="Product A" EnableAnimation="false" Type="Line" Fill="#357cd2" Width="1"></ej:Series>
        </Series>
    </ej:RangeNavigator>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">


    <script type="text/javascript">

        Date.prototype.subMonths = function (month) {
            var dat = new Date(this.valueOf())
            dat = new Date(dat.getFullYear(), dat.getMonth() - month, dat.getDate());
            return dat;
        }

        function datePickLoad(args) {
            args.model.value = startDate;
            args.model.minDate = startDate;
            args.model.maxDate = endDate;
        }
        function datePickLoad2(args) {
            args.model.value = endDate;
            args.model.minDate = startDate;
            args.model.maxDate = endDate;
        }
        function changeStartDate(sender) {
            if (!buttonFlag) {
                $("#" + previousFocusedButton).removeClass("button-hit");
                buttonFlag = true;
            }
            var rangeobj = $("#scrollcontent").data("ejRangeNavigator");
            rangeobj.model.selectedRangeSettings.start = sender.value;
            rangeobj.redraw();
        }

        function changeEndDate(sender) {
            if (!buttonFlag) {
                $("#" + previousFocusedButton).removeClass("button-hit");
                buttonFlag = true;
            }
            var rangeobj = $("#scrollcontent").data("ejRangeNavigator");
            rangeobj.model.selectedRangeSettings.end = sender.value;
            rangeobj.redraw();
        }

        var rangeNavigator, datePicker1, datePicker2;
        function loadingdata(sender) {
            datePicker1 = $("#datepick").data("ejDatePicker");
            datePicker2 = $("#datepick2").data("ejDatePicker");
            rangeNavigator = $("#scrollcontent").ejRangeNavigator("instance");
            sender.model.series[0].dataSource = data;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].yName = "YValue";
            sender.model.selectedRangeSettings.start = new Date(endDate.getFullYear(), endDate.getMonth() - 12, endDate.getDate()).toLocaleString();
            sender.model.selectedRangeSettings.end = endDate.toLocaleString();
        }

        function onchartloaded(sender) {
            var chartobj = $("#container").data("ejChart");
            if (chartobj != null) {
                datePicker1 = $("#datepick").data("ejDatePicker");
                datePicker2 = $("#datepick2").data("ejDatePicker");;
                chartobj.model.primaryXAxis.zoomPosition = sender.zoomPosition;
                chartobj.model.primaryXAxis.zoomFactor = sender.zoomFactor;
                if (datePicker1 != null && datePicker2 != null) {
                    datePicker1.setModel({ value: sender.selectedRangeSettings.start });
                    datePicker2.setModel({ value: sender.selectedRangeSettings.end });
                    if (!buttonFlag) {
                        $("#" + previousFocusedButton).removeClass("button-hit");
                        buttonFlag = true;
                    }
                }
            }
            $("#container").ejChart("redraw");

        }
        $("#scrollcontent,.dateStyle").mousedown(function (event) {
            buttonFlag = false
        });
        var data = allYearData().Open;
        function chartLoad(sender) {
            loadTheme(sender);
            var chart = $("#container").ejChart("instance");
            sender.model.series[0].dataSource = data;
        }

        function chartLoadComplete(sender) {
            sender.model.crosshair.line.color = "transparent";
        }
        function trackballTooltip(sender) {
            var seriesIndex = sender.data.serIndex;
            var pointIndex = sender.data.pointIndex;
            var point = sender.model.series[seriesIndex].points[pointIndex];
            sender.data.currentText = point.x.toDateString() + "<br/>" + "Stock price : " + "$" + point.y.toFixed(2);
        }

        function allYearData() {
            var currentDate = new Date();
            var series1 = [];
            var series2 = [];
            var value = 70;
            var value1 = 120;
            for (var i = 0; i < 2555; i++) {

                if (Math.random() > .5) {
                    value += Math.random();
                    value1 += Math.random();
                } else {
                    value -= Math.random();
                    value1 -= Math.random();
                }
                if (value >= 110) value = 110;
                if (value <= 20) value = 20;
                var point1 = { XValue: new Date(currentDate.getFullYear(), currentDate.getMonth(), (currentDate.getDate() - i)), YValue: value };
                series1.push(point1);
                if (i == 0) endDate = point1.XValue;
                if (i == 2554) startDate = point1.XValue;
            }

            data = { Open: series1 };
            return data;
        }

        var buttonFlag = true;
        var previousFocusedButton = "monthYear1"

        function getMonth(args) {
            var index = args.target.id.indexOf("month");
            var currentId = args.target.id.substring(index);
            var values = args.target.innerText;
            $("#" + previousFocusedButton).removeClass("button-hit");
            $("#" + currentId).addClass("button-hit");
            previousFocusedButton = currentId;
            var rangeobj = $("#scrollcontent").data("ejRangeNavigator");
            datePicker1 = $("#datepick").data("ejDatePicker");
            datePicker2 = $("#datepick2").data("ejDatePicker");;
            var dateStart = rangeobj.model.selectedRangeSettings.start;
            var dateEnd = rangeobj.model.selectedRangeSettings.end;
            var currentMonth = dateEnd.getMonth();
            eDate = new Date(dateEnd);
            if (values == "1M")
                startDate = eDate.subMonths(1);
            else if (values == "3M")
                startDate = eDate.subMonths(3);
            else if (values == "6M")
                startDate = eDate.subMonths(6);
            else if (values == "YTD") {
                var currentYTD = new Date().subMonths(new Date().getMonth());
                startDate = new Date(currentYTD.getFullYear(), 0, 1);
                rangeobj.model.selectedRangeSettings.end = endDate.toString();
            }
            else if (values == "1Y")
                startDate = eDate.subMonths(12);
            else if (values == "All") {
                rangeobj.model.selectedRangeSettings.end = endDate.toString();
                startDate = new Date(eDate.getFullYear(), eDate.getMonth(), (eDate.getDate() - 2553));
            }
            datePicker1.setModel({ value: startDate });
            datePicker2.setModel({ value: endDate });
            rangeobj.model.selectedRangeSettings.start = startDate.toString();
            buttonFlag = true;
            rangeobj.redraw();
        }

        function loadingtheme(sender) {
            if (this.model._themeChanged) this.model.theme = "";
            var theme = window.themestyle + window.themecolor + window.themevarient;
            if (theme) {
                switch (theme) {
                    case "flatazurelight":
                        theme = "azurelight";
                        break;
                    case "flatlimelight":
                        theme = "limelight";
                        break;
                    case "flatsaffronlight":
                        theme = "saffronlight";
                        break;
                    case "gradientazurelight":
                        theme = "gradientazure";
                        break;
                    case "gradientlimelight":
                        theme = "gradientlime";
                        break;
                    case "gradientsaffronlight":
                        theme = "gradientsaffron";
                        break;
                    case "flatazuredark":
                        theme = "azuredark";
                        break;
                    case "flatlimedark":
                        theme = "limedark";
                        break;
                    case "flatsaffrondark":
                        theme = "saffrondark";
                        break;
                    case "gradientazuredark":
                        theme = "gradientazuredark";
                        break;
                    case "gradientlimedark":
                        theme = "gradientlimedark";
                        break;
                    case "gradientsaffrondark":
                        theme = "gradientsaffrondark";
                        break;
                    case "flathigh-contrast-01dark":
                        theme = "highcontrast01";
                        break;
                    case "flathigh-contrast-02dark":
                        theme = "highcontrast02";
                        break;
                    case "flatmateriallight":
                        theme = "material";
                        break;
                    case "flatoffice-365light":
                        theme = "office";
                        break;
                    default:
                        theme = "flatlight";
                        break;
                } 
                if (theme == "azuredark" || theme == "limedark" || theme == "saffrondark" || theme == "gradientazuredark" || theme == "gradientlimedark" || theme == "gradientsaffrondark" ||
                    theme == "highcontrast01" || theme == "highcontrast02") {                    
                    var buttonFont = document.getElementsByClassName("monthButton");
                    for (var i = 0; i < buttonFont.length; i++)
                        buttonFont[i].style.color = "white";
                    sender.model.navigatorStyleSettings.thumbStroke = "#303030";
                    sender.model.tooltipSettings.font.color = "#FFFFFF";
                    sender.model.tooltipSettings.backgroundColor = "#303030";
                }
                else {
                    var buttonFont = document.getElementsByClassName("monthButton");
                    for (var i = 0; i < buttonFont.length; i++)
                        buttonFont[i].style.color = "black";
                }
                sender.model.navigatorStyleSettings.thumbColor = "#ffffff";
                sender.model.navigatorStyleSettings.unselectedRegionColor = "#999999";
                sender.model.navigatorStyleSettings.unselectedRegionOpacity = 0.4;
                sender.model.navigatorStyleSettings.selectedRegionColor = "#0f4f4f4";


            }
        }

    </script>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .move {
            padding-left: 2px;
        }

        .button-hit {
            border: 1px solid #357cd2 !important;
        }

        .monthButton, .e-datepicker {
            font-size: 12px !important;
            padding-top: 2px;
            border-radius:4px;
        }
    </style>
</asp:Content>

