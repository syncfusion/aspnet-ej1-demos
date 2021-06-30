<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExpenseAnalysis.aspx.cs" Inherits="WebSampleBrowser.Dashboard.ExpenseAnalysis" %>

<%@ Register Assembly="Syncfusion.EJ.Web" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.Models" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>ASP.NET Web Forms | Showcase Sample | Expense Analysis</title>
	<meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="The ASP.NET Web Forms Expense Analysis application is used to categorize and analyze the expenses details against budget.">		
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ej.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ejgrid.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/Dashboard/ExpenseAnalysis/css/expense-css.css")%>' />

    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsviews.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.validate.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/respond.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsondatachart.js")%>' type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sample-title">
        </div>
        <div class="container">
            <div class="sample-container">
                <div id="control-container">
                    <div class="text-title">
                            <h1 style=" color: transparent; user-select: none; ">Expense Analysis</h1>
                    </div>
                    <div class="row imagetile">
                        <div class="col-md-5">
                            <table>
                                <tr>
                                    <td>
                                        <div class="left-image">
                                        </div>
                                    </td>
                                    <td>
                                        <div style="horz-align: right;">
                                            <div class="e-exptitle">
                                                <label class="e-name">
                                                    David Carter</label><br />
                                                <label class="e-phone">
                                                    Phone : +1 919.494.1974
                                                </label>
                                                <br />
                                                <label class="e-mail">
                                                    email : davidc@syncfusion.com</label>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div class="col-md-7 e-values-td">
                            <div class="initborder">
                                <table class="e-values">
                                    <tr>
                                        <td class="pos-amt-td sideborder">
                                            <p class="pos-amt"></p>
                                            <p class="pos-text">
                                                Positive
                                            </p>
                                            <p class="pos-transc">
                                            </p>
                                        </td>
                                        <td class="neg-amt-td sideborder">
                                            <p class="neg-amt"></p>
                                            <p class="neg-text">
                                                Negative
                                            </p>
                                            <p class="neg-transc"></p>
                                        </td>
                                        <td class="bal-amt-td">
                                            <p class="bal-amt"></p>
                                            <p class="bal-text">
                                                Balance
                                            </p>
                                            <p class="bal-empty" style="visibility: hidden">
                                                Transaction
                                            </p>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                    </div>

                    <div class="chartgridtable">
                        <div id="control-panel" class="add-filter-panel">
                            <div class="row">
                                <div class="col-md-1" style="DISPLAY: inline">
                                    <label class="sample-t">
                                        Transactions</label>
                                </div>
                                <div class="col-md-8" style="DISPLAY: inline"></div>
                                <div class="col-md-3" style="DISPLAY: inline">
                                    <table style="float: left;">
                                        <tr>
                                            <td>
                                                <div>
                                                    <ej:DropDownList ID="selectMonth" ClientSideOnChange="changeMonth" width="150px" TargetId="MonthList" height="30px" runat="server"></ej:DropDownList>
                                                    <div id="MonthList">
                                                        <ul>
                                                            <li>All</li>
                                                            <li>January</li>
                                                            <li>February</li>
                                                            <li>March</li>
                                                            <li>April</li>
                                                            <li>May</li>
                                                            <li>June</li>
                                                            <li>July</li>
                                                            <li>August</li>
                                                            <li>September</li>
                                                            <li>October</li>
                                                            <li>November</li>
                                                            <li>December</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="add-image" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="expensegridborder">
                            <div class="col-xs-13 grid-container">
                                <ej:WaitingPopup ID="target" runat="server" ShowOnInit="False" Target=".add-filter-panel" ></ej:WaitingPopup>
                                <ej:Grid ID="ExpenseGrid" runat="server" EnableAltRow="true" AllowPaging="true" AllowSorting="true" IsResponsive="true" EnableResponsiveRow="false">
                                    <pagesettings pagesize="12" PageCount="4" />
                                    <editsettings allowadding="true" allowediting="false" editmode="Dialog" />
                                    <columns>
                                          <ej:Column Field="DateTime" HeaderText="Date" Format="{0:MMM dd yyyy}" EditType="Datepicker" Width="75">
                                            <ValidationRule>
                                                <ej:KeyValue Key="required" Value="true" />
                                            </ValidationRule>
                                        </ej:Column>
                                        <ej:Column Field="CategoryName" HeaderText="CategoryName" Width="100">
                                            <ValidationRule>
                                                <ej:KeyValue Key="required" Value="true" />
                                                <ej:KeyValue Key="minlength" Value="3" />
                                            </ValidationRule>
                                        </ej:Column>
                                        <ej:Column Field="Description" HeaderText="Description" Width="100"  Priority="3">
                                            <ValidationRule>
                                                <ej:KeyValue Key="required" Value="true" />
                                                <ej:KeyValue Key="minlength" Value="3" />
                                            </ValidationRule>
                                        </ej:Column>
                                        <ej:Column Field="Amount" HeaderText="Amount" TextAlign="Right" Width="80" EditType="NumericEdit" Priority="4">
                                            <ValidationRule>
                                                <ej:KeyValue Key="required" Value="true" />
                                            </ValidationRule>
                                        </ej:Column>
                                  </columns>
                                </ej:Grid>
                            </div>
                        </div>
                        <div class="chart-container">
                            <div class="col-md-13 chart-inner">
                                <div class="samplesec">
                                    <div>
                                        <div class="samplename">
                                            <span>Expense Analysis Chart </span>
                                        </div>
                                        <div class="samplebody">
                                            <div class="samplecontent">
                                                <div class="chart-back-button">
                                                    <ej:Button ID="btnBack" Text="Back" Size="Mini" ClientSideOnClick="btnClick" Type="Button" runat="server"></ej:Button>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-8">
                                                        <ej:Chart ID="Chart" runat="server" IsResponsive="true" OnClientPointRegionClick="onclick" OnClientAnimationComplete="completeAnimation" OnClientPreRender="seriesRender" Background="transparent" OnClientLoad="chartLoaded" EnableSmartLabels="true">
                                                            <series>
                                                                <ej:Series Type="Pie" Name="ExpenseChart" Explode="true" XName="ExpenseCategory" YName="Amount" EnableAnimation="true" LabelPosition="Outside" Marker-DataLabel-Visible="true" Marker-DataLabel-ConnectorLine-Height="20"/>                                                               
                                                            </series>
                                                            <legend visible="False"></legend>
                                                        </ej:Chart>
                                                    </div>
                                                    <div class="col-md-3">
                                                        <div class="spend-div">
                                                            <table cellspacing="10">
                                                                <tr>
                                                                    <td class="most-spent">
                                                                        <p class="most-spent-text">
                                                                            Most Spent
                                                                        </p>
                                                                        <p class="most-spent-amt">
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="least-spent">
                                                                        <p class="least-spent-text">
                                                                            Least Spent
                                                                        </p>
                                                                        <p class="least-spent-amt">
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="avg-spent">
                                                                        <p class="avg-spent-text">
                                                                            Average Spent
                                                                        </p>
                                                                        <p class="avg-spent-amt">
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="footer">
                        <div class="bottom-links">
                            <div class="left">
                                <div class="sync-text">
                                    Copyright © 2001-2019 Syncfusion Inc.
                                </div>
                            </div>
                            <div class="right">
                                <a href="https://www.syncfusion.com">
                                    <div class="syncfusion-image"></div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(function () {
                $(document).ready(function () {
                    $('#selectMonth').data("ejDropDownList").selectItemByText("January");
                });
                $("#btnBack").hide();
            });
            function changeMonth(args) {
                var popupObj = $("#target").data("ejWaitingPopup");
                popupObj.show();
                UpdateGridChart(args.text); //updating content of grid and chart on change of month
            }

            // Updating the grid and chart contents
            function UpdateGridChart(month) {
                var dataManger = ej.DataManager({
                    url: "//js.syncfusion.com/ejServices/api/expense/get?month=" + month,
                    offline: true,
                    requiresFormat: false, crossDomain: true
                });
                dataManger.ready.done(function (e) {
                    $("#ExpenseGrid").ejGrid({
                        dataSource: e.result[1]
                    });
                    
                    $("#Chart").ejChart("option", {
                        "model": {
                            series: [{
                                dataSource: e.result[0],
                                type: 'pie',
                                name: "ExpenseChart",
                                enableAnimation: true,
                                labelPosition: 'outside',
                                marker: { connectorLine: { height: 20 }, dataLabel: { visible: true, } },
                                border: { width: 1 },
                                explode: true,
                                xName: "ExpenseCategory",
                                yName: "Amount"
                            }]
                        }
                    });
                    $('.pos-amt').html("$" + formatNumber(parseInt(e.result[5])));
                    $('.neg-amt').html("$" + formatNumber(parseInt(e.result[6])));
                    $('.bal-amt').html("$" + formatNumber(parseInt(e.result[7])));
                    $('.most-spent-amt').html(e.result[2]);
                    $('.least-spent-amt').html(e.result[3]);
                    $('.avg-spent-amt').html(e.result[4]);
                    $('.pos-transc').html(e.result[8] + " Transactions");
                    $('.neg-transc').html(e.result[9] + " Transactions");
                    window.chartDS = e.result[0];
                    window.Home = e.result[10];
                    window.DailyLiving = e.result[11];
                    window.Entertainment = e.result[12];
                    window.Health = e.result[13];
                    window.Transportation = e.result[14];
                    window.Personal = e.result[15];
                    $("#target").ejWaitingPopup("hide");
                });
            }
            
            $(document).on("click", ".add-image", function () {
                $("#ExpenseGrid").ejGrid("addRecord");     //adding new record in grid
                $("#ExpenseGrid_dialogEdit").ejDialog({ isResponsive: true });
            });

            function formatNumber(number) {
                return ej.format(number, "n0"); //formating numbers  for spent amounts
            }
            function chartLoaded(sender) {
                sender.model.series[0].animation = false;
                sender.model.AnimationComplete = true;
            }
            function seriesRender(e) {
                //Adding text to the series points to chart
                $.each(e.model.series[0].points, function () {
                    this.text = this.x + "- $" + formatNumber(parseInt((this.YValues)));
                });
            }
            function btnClick(sender) {
                $("#Chart").ejChart("option", { "pie": pieSeries() });
                $("#btnBack").hide();
            }
            function onclick(sender) {
                 var isIe8 = ej.browserInfo().name == "msie" && parseInt(ej.browserInfo().version) == 8;                //Rendering drilldown dhart based on the points clicked
                  if (sender.model.AnimationComplete || isIe8) {
                    var index = sender.data.region.Region.PointIndex;
                    var name = sender.model.series[0].points[index].x;
                    if (sender.model.series[0].name == "ExpenseChart")
                        $("#Chart").ejChart("option", { "drilldown": pieSeries(name) });
					if (isIe8)
			            $("#btnBack").show();
                }
            }
            function completeAnimation(sender) {
                //show or hide back button based on the series name
                if (sender.model.series[0].name != "ExpenseChart")
                    $("#btnBack").show();
                else
                    $("#btnBack").hide();
            }

            function genarateSeries(sName) {
                var seriesData = {
                    series: [{
                        dataSource: window[sName],
                        xName: "ExpenseCategory",
                        yName: "Amount",
                        type: 'pie',
                        labelPosition: 'outside',
                        pieCoefficient: 0.8,
                        enableAnimation: true,
                        explode: false,
                        marker: {
                            dataLabel: {
                                visible: true,
                                shape: 'none',
                                connectorLine: { color: 'black', width: 0.5 },
                                font: { fontFamily: 'Segoe UI', fontStyle: 'Normal ', fontWeight: 'Regular', size: '12px', color: '#707070', opacity: 1 }
                            }
                        }

                    }],
                    legend: { visible: false },
                }
                return seriesData;
            }

            function pieSeries(seriesName) {
                //Choosing the series points based on the series name to drilldown chart
                switch (seriesName) {
                case "Home":
                    return genarateSeries(seriesName);
                    break;
                case "Entertainment":
                    window.Entertainment[1].Amount = 45;
                    return genarateSeries(seriesName);
                    break;
                case "Daily Living":
                    return genarateSeries("DailyLiving");
                    break;
                case "Health":
                    return genarateSeries(seriesName);
                    break;
                case "Transportation":
                    return genarateSeries(seriesName);
                    break;
                case "Personal":
                    return genarateSeries(seriesName);
                    break;
                default:
                {
                    return {
                        series: [
                            {
                                name: "ExpenseChart",
                                dataSource: window.chartDS,
                                xName: "ExpenseCategory",
                                yName: "Amount",
                                type: 'pie',
                                labelPosition: 'outside',
                                pieCoefficient: 0.8,
                                explode: true,
                                explodeOffset: 25,
                                enableAnimation: true,
                                AnimationComplete: false,
                                marker: {
                                    dataLabel: {
                                        visible: true,
                                        shape: 'none',
                                        connectorLine: { color: 'black', width: 0.5 },
                                        font: { fontFamily: 'Segoe UI', fontStyle: 'Normal ', fontWeight: 'Regular', size: '12px', color: '#707070', opacity: 1 }
                                    }
                                }
                            }
                        ],
                        legend: { visible: false },
                        AnimationComplete: false
                    };
                }
                }
            }
        </script>
    </form>
</body>
</html>
