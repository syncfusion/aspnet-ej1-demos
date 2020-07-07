<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="StockAnalysis.aspx.cs" Inherits="WebSampleBrowser.Dashboard.StockAnalysis" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    
<head>
    <title>Essential Studio for ASP.NET  : Stock Analysis</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="description" content="Displays the historical stock price and volume in a graphical form using chart control | ASP.NET">
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' type="image/x-icon"  />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/Dashboard/StockAnalysis/stockCss.css")%>' />


    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>

</head>
<body>
    <form id="Form1" runat="server">
    <div class="stockanalysis">
        <div class="samplecontent">

            <div class="sampletitle container">
                <div class="sampleimg">
                    <div class="leftHeader">
                        <img src="../Content/Dashboard/StockAnalysis/stock_logo.png" class="stockImg" alt="Stock"/>
                        <label class="imgLabel">STOCK ANALYSIS</label>
                        <div class="tile">
                            <img src="../Content/Dashboard/StockAnalysis/tile.png" class="stockImg" alt="Tile"/>
                        </div>
                    </div>

                    <div class="ownerdetails">
                        <table>
                            <tr>
                                <td>
                                    <img src="../Content/Dashboard/StockAnalysis/person.png" alt="Person"/>
                                </td>
                                <td class="ownname">Andrew Fuller<br />
                                    <span>My Watch List</span>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="chartdetail">
                    <div class="stockstatus">
                        <div class="row">



                            <div id="GOOG" class="ptiles col-xs-2">
                                <div>
                                    <table class="titletab" cellspacing="0.1em">

                                        <tr>
                                            <td>
                                                <span class="ptext">GOOG</span>
                                            </td>
                                            <td id="goog-wait"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="decrement">
                                                    70.39
                                                </div>
                                            </td>
                                            <td>
                                                <div class="down">
                                                    <div class="downarrow"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="high">
                                                <div class="higharrow">
                                                    <span>High: 764.8</span>
                                                </div>
                                            </td>
                                            <td class="low">
                                                <div class="lowarrow">
                                                    <span>Low: 673.5</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>


                            <div id="MSFT" class="ptiles col-xs-2">
                                <div>
                                    <table class="titletab" cellspacing="0.1em">
                                        <tr>
                                            <td>
                                                <span class="ptext">MSFT</span>
                                            </td>
                                            <td id="msft-wait"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="increment">
                                                    1.82
                                                </div>
                                            </td>
                                            <td>
                                                <div class="up">
                                                    <div class="uparrow"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="high">
                                                <div class="higharrow">
                                                    <span>High: 37.5</span>
                                                </div>
                                            </td>

                                            <td class="low">
                                                <div class="lowarrow">
                                                    <span>Low: 32.68</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>


                            <div id="AAPL" class="ptiles col-xs-2">
                                <div>
                                    <table class="titletab" cellspacing="0.1em">
                                        <tr>
                                            <td>
                                                <span class="ptext">AAPL</span>
                                            </td>
                                            <td id="aapl-wait"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="increment">
                                                    7.61
                                                </div>
                                            </td>
                                            <td>
                                                <div class="up">
                                                    <div class="uparrow"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="high">
                                                <div class="higharrow">
                                                    <span>High: 705.7</span>
                                                </div>
                                            </td>
                                            <td class="low">
                                                <div class="lowarrow">
                                                    <span>Low: 656.0</span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>


                            <div id="NOK" class="ptiles col-xs-2">
                                <div>
                                    <table class="titletab" cellspacing="0.1em">
                                        <tr>
                                            <td>
                                                <span class="ptext">NOK</span>
                                            </td>
                                            <td id="nok-wait"></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <div class="decrement">
                                                    10.35
                                                </div>
                                            </td>
                                            <td>
                                                <div class="down">
                                                    <div class="downarrow"></div>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="high">
                                                <div class="higharrow">
                                                    <span>High: 42.22
                                                    </span>
                                                </div>
                                            </td>
                                            <td class="low">
                                                <div class="lowarrow">
                                                    <span>Low: 36.6
                                                    </span>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>



                        </div>
                    </div>
                    <div class="chartbody">
                        <div class="stockdetails">
                            <div class="row">
                                <div id="hiloOpenClose1">
                                    
                                    <ej:chart ID="hiloOpenClose" runat="server" Width="800" Height="300" Background="transparent" IsResponsive="True" OnClientLoad="chartload">
                                        <ChartArea Border-Color="transparent"></ChartArea>
                                        <PrimaryXAxis MajorGridLines-Visible="False" MajorTickLines-Visible="False" LabelFormat="MMM-yy" ValueType="Datetime" RangePadding="None"></PrimaryXAxis>
                                         <PrimaryYAxis AxisLine-Visible="False" MajorTickLines-Visible="False" MajorGridLines-Visible="True" RangePadding="None" Font-Color="transparent"></PrimaryYAxis>
                                         <CommonSeriesOptions Tooltip-Visible="True"></CommonSeriesOptions>
                                        <Title Text="GOOG" Font-Color="#B9CFE7" Font-FontSize="45px" Font-FontWeight="Lighter" TextAlignment="Far"></Title>
                                        <Margin Right="20"></Margin>
                                        <Series>
                                         <ej:Series Name="Bank" Type="HiloOpenClose" Tooltip-Visible="True" Tooltip-Template="Tooltip" Border-Width="1"> </ej:Series>
                                        </Series>
                                        <Legend Visible="false"></Legend>
                                         </ej:chart>
                                </div>

                                <div id="colChart1">
                                    <ej:chart ID="colChart" runat="server" Width="800" Height="450" IsResponsive="True" Background="transparent" OnClientLoad="onchartload">
                                        <PrimaryXAxis IntervalType="Years" LabelFormat="yyyy" MajorGridLines-Visible="False" MajorTickLines-Visible="False"></PrimaryXAxis>
                                        <PrimaryYAxis MajorTickLines-Visible="False" AxisLine-Visible="False" RangePadding="None" Font-Color="transparent"></PrimaryYAxis>
                                        <Series>
                                            <ej:Series Name="Gold" Fill="#BA4558" EnableAnimation="True" Type="Column"></ej:Series>
                                            <ej:Series Name="Silver" Fill="#1D9059" EnableAnimation="True" Type="Column"></ej:Series>
                                        </Series>
                                        <Legend Visible="False"></Legend>
                                         </ej:chart>
                                </div>

                                <div class="yearlabel">
                                    <label id="5y" class="changeyear">5Y</label> 
                                    <label id="3y" class="changeyear">3Y</label>
                                    <label id="2y" class="changeyear">2Y</label>
                                    <label id="1y" class="changeyear">1Y</label>
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

    <div id="Tooltip" style="display: none;">
        <table bgcolor="transparent" cellspacing="0.1em">
            <tr>
                <td>Date:
                </td>
                <td class="vponits">#point.x#
                </td>
            </tr>
            <tr>
                <td>Open:
                </td>
                <td class="vponits">#point.open#
                </td>
            </tr>
            <tr>
                <td>High:
                </td>
                <td class="vponits">#point.high#
                </td>
            </tr>
            <tr>
                <td>Low:
                </td>
                <td class="vponits">#point.low#
                </td>
            </tr>
            <tr>
                <td>Close:
                </td>
                <td class="vponits">#point.close#
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript" lang="javascript">
        $(window).resize(function () {
            $(".tile").css("display", "none");
            var marginResize = getWidth();
            $(".stockstatus").find(".row").css("padding-left", marginResize);

        });
        $(window).ready(function () {
            $(".tile").css("display", "none");
            var marginReady = getWidth();
            $(".stockstatus").find(".row").css("padding-left", marginReady);

        });
        $(".tile").bind("click", function () {
            if ($(".stockstatus").css("display") == "inline")
                $(".stockstatus").css("display", "none");
            else
                $(".stockstatus").css("display", "inline");
        });

        function getWidth() {
            var ownerWindth = $(".sampletitle").width();
            if (ownerWindth < 700)
                $(".sampletitle").find(".ownerdetails").css("display", "none");
            else
                $(".sampletitle").find(".ownerdetails").css("display", "inline");
            var width = $(".stockstatus").width();
            if (width < 418) {
                $(".tile").css("display", "inline");
                $(".stockstatus").css("display", "none");
                $(".imgLabel").css("font-size", "20px");
            } else {
                $(".tile").css("display", "none");
                $(".stockstatus").css("display", "block");
                $(".imgLabel").css("font-size", "27px");
            }
            var eleWidth = 209;
            var value;
            var div = width % eleWidth;
            if (width > 0) {
                if (width > 825)
                    return value = 0;
                else if (width % eleWidth < 200)
                    return value = (width % eleWidth) / 2;
                else if (width % (eleWidth * 2) < 200)
                    return value = (width % (eleWidth * 2)) / 2;
                else if (width % (eleWidth * 3) < 200)
                    return value = (width % (eleWidth * 2)) / 2;

                else
                    return value = 0;
            }
        }
        </script>
      
    <div>
       
    </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dashboard/stockanalysis.js")%>' type="text/javascript"></script>

</form>
</body>
        
</html>
