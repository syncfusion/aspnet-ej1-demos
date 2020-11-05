<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WeatherAnalysis.aspx.cs" Inherits="WebSampleBrowser.Dashboard.WeatherAnalysis" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    
<head>
    <title>Essential Studio for ASP.NET  : Weather Analysis</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="description" content="Analyze weather data using charts and grids. It displays the Temperature, Humidity, Precipitation and Sunlight | ASP.NET">
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' type="image/x-icon"  />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/Dashboard/weatheranalysis/weatheranalysis.css")%>' />

    <script src='<%= Page.ResolveClientUrl("~/Scripts/respond.js")%>' type="text/javascript"></script>
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
    <div class="top-section">
            <div class="topbox"></div>
            <img src="../Content/Dashboard/WeatherAnalysis/WeatherIcon.png" id="WeatherIcon" alt="Weather Icon" />
            <div class="top-inner-section container">
                <div class="row boxcompress">
                    <div id="Circle1" class="col-sm-4">
                        <div id="Circle_Temperature">
                        </div>
                        <div id="Circle_SkyCondition">
                        </div>
                    </div>
                    <div id="Circle2" class="col-sm-4">
                        <div id="Circle_City">
                            New York
                        </div>
                        <div id="Circle_Time">
                        </div>
                        <div id="Circle_Day">
                        </div>
                    </div>
                    <div id="Circle3" class="col-sm-4">
                        <div id="tophalf">
                            <div id="Circle_Humidity">
                            </div>
                            <div id="HumidityCaption">
                                Humidity
                            </div>
                        </div>
                        <div id="bottomhalf">
                            <div id="Circle_DewPoint">
                            </div>
                            <div id="DewPointCaption">
                                Dew Point
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="weather-samples container">
            <div id="ScreenLeft" class="row">
                <div id="HeaderBar1">
                    <div>
                        <label id="CurrentDay"></label>
                        <div class="buttons">
                            <a class="signal inactive" id="ChartHour"></a>
                            <a class="square active" id="GridHour"></a>
                        </div>
                    </div>
                </div>
                <div id="HourData">
                    <div id ="HourGrid"></div>
              
                     <ej:chart ID="HourChart" runat="server" OnClientLoad="hourChartLoad" OnClientSeriesRendering="renderSeries" Background="white">
                         <ChartArea Background="transparent"></ChartArea>
                         <RowDefinitions>
                             <ej:RowDefinitions RowHeight="25" LineColor="transparent" Unit="percentage"/>
                             <ej:RowDefinitions RowHeight="25" LineColor="transparent" Unit="percentage"/>
                             <ej:RowDefinitions RowHeight="50" LineColor="transparent" Unit="percentage"/>
                         </RowDefinitions>
                         <PrimaryXAxis MinorGridLines-Visible="False" AxisLine-Visible="False" ValueType="Datetime" LabelFormat="hh:mm tt" IntervalType="Hours" ></PrimaryXAxis>
                         <PrimaryYAxis LabelFormat="{value}" MajorTickLines-Visible="False" RangePadding="None" AxisLine-Visible="False" MajorGridLines-Visible="False" HidePartialLabels="True" Font-Color="transparent" Visible="False"></PrimaryYAxis> 
                     <Axes>
                         <ej:Axis MajorTickLines-Visible="False" MajorGridLines-Visible="False" Orientation="vertical" RowIndex="1" OpposedPosition="False" Name="yAxis1" HidePartialLabels="True" Font-Color="transparent" AxisLine-Visible="False"/>
                         <ej:Axis MajorTickLines-Visible="False" MajorGridLines-Visible="False" Orientation="vertical" RowIndex="2" OpposedPosition="False" Name="yAxis2" HidePartialLabels="True" Font-Color="transparent" AxisLine-Visible="False"/>
                         <ej:Axis MajorTickLines-Visible="False" MajorGridLines-Visible="False" Orientation="vertical" RowIndex="2" OpposedPosition="False" Name="yAxis3" HidePartialLabels="True" Font-Color="transparent" AxisLine-Visible="False"/>
                     </Axes>
                         <CommonSeriesOptions Marker-Visible="True" Type="Line" Marker-Shape="Circle" Marker-Size-Width="6" Marker-Size-Height="6" Border-Color="white" Border-Width="3" EnableAnimation="True"></CommonSeriesOptions>
                     <Series>
                         <ej:Series Name="Temperature" Fill="#A0C037" Tooltip-Visible="True" Tooltip-Format="#series.name#: #point.y# c"></ej:Series>
                         <ej:Series Name="FeelsLike" Fill="#369E45" Tooltip-Visible="True" Tooltip-Format="#series.name#: #point.y# c" YAxisName="yAxis1"></ej:Series>
                         <ej:Series Name="Humidity" Fill="#9F5123" Tooltip-Visible="True" Tooltip-Format="#series.name#: #point.y# %" YAxisName="yAxis2"></ej:Series>
                         <ej:Series Name="Wind" Fill="#2DA2D8" Tooltip-Visible="True" Tooltip-Format="#series.name#: #point.y# MPH" YAxisName="yAxis3"></ej:Series>
                     </Series>
                         <Crosshair Visible="True" Type="Trackball" Line-Width="2" Line-Color="#F2B16D" Marker-Visible="True" Marker-Shape="Circle" Marker-Size-Width="9" Marker-Size-Height="9"></Crosshair>
                     <Margin Left="20" Top="20"></Margin>
                         <Legend Visible="True" Shape="Circle" Position="Bottom" ItemStyle-Height="10" ItemStyle-Width="10"></Legend>
                     </ej:chart>      
            </div>
             <br/>
            <div id="ScreenRight" class="row">
                <div id="HeaderBar2">
                    <div>
                        Average Conditions
                        <div class="buttons">
                            <a class="signal active" id="ChartAverage"></a>
                            <a class="square inactive" id="GridAverage"></a>
                        </div>
                    </div>
                </div>
                <div id="AverageData">
                   <ej:chart ID="AverageChart" runat="server" IsResponsive="True" OnClientLoad="averageChartLoad" Background="white">
                       <PrimaryXAxis OpposedPosition="True"  ValueType="Category" MajorGridLines-Visible="False" MajorTickLines-Visible="False" RangePadding="None" LabelFormat="{value} mm" AxisLine-Visible="False"></PrimaryXAxis>
                   <Axes>
                       <ej:Axis MajorGridLines-Visible="False" ValueType="Double" Orientation="vertical" RowIndex="0" OpposedPosition="True" AxisLine-Visible="False" RangePadding="None" Name="yAxis" LabelFormat="{value} hrs"/>
                   </Axes>   
                       <Series>
                           <ej:Series Name="Average Precipitaition" Type="Column" EnableAnimation="True" Tooltip-Visible="true" Tooltip-Template="precipitationTooltip" Fill="#84C865"></ej:Series>
                           <ej:Series Name="Average Sunlight" Type="Column" YAxisName="yAxis" EnableAnimation="True" Tooltip-Visible="true" Tooltip-Template="sunlightTooltip" Fill="#E94649"></ej:Series>
                       </Series>
                       <Legend Visible="True" Shape="Circle" Position="Bottom" ItemStyle-Height="10" ItemStyle-Width="10"></Legend>
                   </ej:chart>    
                    <div class="averagegridwrapper">
                        <br/><br/><br/>
                        <div id="AverageGrid"></div>
                       </div>
                </div>
            </div>
            <div id="precipitationTooltip" style="display: none;">
                <div class="value">
                    <div>
                        <label class="month">#point.x#</label><br />
                        <label class="precipitation">Avg Precipitation (mm) : <b>#point.y#</b></label>
                    </div>
                </div>
            </div>
            <div id="sunlightTooltip" style="display: none;">
                <div class="value">
                    <div>
                        <label class="month">#point.x#</label><br />
                        <label class="sunlight">Avg Sunlight (Hrs): <b>#point.y#</b></label>
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
        <div class="frame">
                             
                    
        </div>     

<script  type="text/javascript">
    
    var currentDate = new Date();
    var skyCondition = ["Snow", "Rain Storm", "Thunder", "Rainy", "Cloudy", "Partly Cloudy", "Sunny", "Partly Sunny"];
    var currentSkyCondition = Math.floor((Math.random() * 7));
    var WeatherData = [];
    WeatherData.push({
        "Date": new Date(currentDate.setHours(currentDate.getHours())),
        "SkyCondition": skyCondition[currentSkyCondition],
        "Humidity": Math.floor(Math.random() * 40 + 35),
        "Wind": Math.floor(Math.random() * 10 + 1),
        "Pressure": Math.floor(Math.random() * 30 + 70),
        "Temperature": currentSkyCondition * 5 + Math.floor(Math.random() * 5),
        "FeelsLike": currentSkyCondition * 5 + Math.floor(Math.random() * 15)
    });

    $("#CurrentDay").text(Globalize.format(currentDate, "dddd"));
    $("#Circle_Temperature").html(WeatherData[0].Temperature + "&deg;c");
    $("#Circle_SkyCondition").html(WeatherData[0].SkyCondition);
    $("#Circle_Time").html(Globalize.format(WeatherData[0].Date, "hh:mm tt"));
    $("#Circle_Day").html(Globalize.format(WeatherData[0].Date, "dddd"));
    $("#Circle_Humidity").html(WeatherData[0].Humidity + "%");
    $("#Circle_DewPoint").html(Math.floor((Math.random() * 10 + 10)) + "&deg;c");

    for (var i = 1; i < 24; i++) {
        var skyRandom = Math.floor((Math.random() * 7));
        WeatherData.push({
            "Date": new Date(currentDate.setHours(currentDate.getHours() + 1)),
            "SkyCondition": skyCondition[skyRandom],
            "Humidity": Math.floor(Math.random() * 40 + 35),
            "Wind": Math.floor(Math.random() * 2 + 1),
            "Pressure": Math.floor(Math.random() * 30 + 70),
            "Temperature": skyRandom * 5 + Math.floor(Math.random() * 5),
            "FeelsLike": skyRandom * 5 + Math.floor(Math.random() * 15)
        });
    }

    window.WeatherDataObject = WeatherData;

    var data = ej.DataManager(window.WeatherDataObject).executeLocal(ej.Query());

    $("#HourGrid").ejGrid({
        dataSource: data,
        allowScrolling: true,
        enableAltRow: false,
        scrollSettings: { height: 470, width: 0 },
        columns: [
                { field: "Date", headerText: "Time", textAlign: ej.TextAlign.Center, width: 125, format: "{0:hh:mm tt}", customAttributes: { "class": "e-rowcell date" } },
                { field: "SkyCondition", headerText: "Sky Condition", textAlign: ej.TextAlign.Center, width: 120, format: "<div class=\"{SkyCondition}\" width=\"48px\" heigth=\"48px\" />", customAttributes: { "class": "e-rowcell skycondition" } },
                { field: "Temperature", headerText: "Temperature", textAlign: ej.TextAlign.Center, width: 100, format: "<label>{Temperature}&deg;c</label>", customAttributes: { "class": "e-rowcell temperature" } },
                { field: "SkyCondition", headerText: "Weather Description", textAlign: ej.TextAlign.Center, width: 150, customAttributes: { "class": "e-rowcell skycondition" } }
                //{ field: "Wind", headerText: "Wind", textAlign: ej.textAlign.Center, width: 100, format: "<label>{Wind} mph</label>", customAttributes: { "class": "e-rowcell wind" } }
                //{ field: "Pressure", headerText: "Pressure", textAlign: ej.textAlign.Center, width: 100, format: "<label>{Pressure} kPa</label>", customAttributes: { "class": "rowcell pressure" } }
        ]
    });
    window.onresize = function () {
        $("#HourGrid .e-gridcontent").ejScroller("refresh");
    };
  
    var Average = ["Average Precipitation", "Average Sunlight", "Average Minimum Temperature", "Average Maximum Temperature", "Average Wind"];
    var AverageData = [];
    var months = ["Jan", "Feb", "Mar", "Apl", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    var d = {};
    d["Average"] = "Precipitation";
    for (var i = 0; i < 12; i++) {
        var date = new Date();
        var monthValue = date.getMonth() + i;
        if (monthValue < 12)
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 100 + 20));
        else {
            monthValue = monthValue - 12;
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 100 + 20));
        }
    }
    AverageData.push(d);

    var d = {};
    d["Average"] = "Sunlight";
    for (var i = 0; i < 12; i++) {
        var date = new Date();
        var monthValue = date.getMonth() + i;
        if (monthValue < 12)
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 12 + 2));
        else {
            monthValue = monthValue - 12;
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 12 + 2));
        }
    }
    AverageData.push(d);

    var d = {};
    d["Average"] = "Minimum Temperature";
    for (var i = 0; i < 12; i++) {
        var date = new Date();
        var monthValue = date.getMonth() + i;
        if (monthValue < 12)
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 15 - 5));
        else {
            monthValue = monthValue - 12;
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 15 - 5));
        }
    }
    AverageData.push(d);

    var d = {};
    d["Average"] = "Maximum Temperature";
    for (var i = 0; i < 12; i++) {
        var date = new Date();
        var monthValue = date.getMonth() + i;
        if (monthValue < 12)
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 20 + 25));
        else {
            monthValue = monthValue - 12;
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 20 + 25));
        }
    }
    AverageData.push(d);

    var d = {};
    d["Average"] = "Wind";
    for (var i = 0; i < 12; i++) {
        var date = new Date();
        var monthValue = date.getMonth() + i;
        if (monthValue < 12)
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 15));
        else {
            monthValue = monthValue - 12;
            d[months[new Date(date.setMonth(monthValue)).getMonth()]] = Math.floor((Math.random() * 15));
        }
    }
    AverageData.push(d);

    window.AverageData = AverageData;

    

    var averageData = ej.DataManager(window.AverageData).executeLocal(ej.Query());
    var columnNames = [];
    $.each(averageData[0], function (index, value) {
        if (index == "Average") {
            var column = { field: index, textAlign: ej.TextAlign.Center }
            columnNames.push(column);
        }
        else {
            var column = { field: index, textAlign: ej.TextAlign.Center, width: 50, customAttributes: { "class": "e-rowcell average" } }
            columnNames.push(column);
        }
    });

    $("#AverageGrid").ejGrid({
        dataSource: averageData,
        enableAltRow: false,
        allowGrouping: true,
        heigth: "500px",
        groupSettings: {groupedColumns: ["Average"] },
        columns: columnNames,
        queryCellInfo: "queryCellInfo"
    });

    $("#AverageGrid").find(".groupdroparea").hide();
    $("#HourChart").hide();
    $("#AverageGrid").hide();

    $('.buttons > a').bind('click', function () { weatherSelection(this) });

    //It is used to perform navigation between Chart and Grid
    function weatherSelection(target) {
        switch (target.id) {
            case "ChartHour":
                if ($(target).hasClass("inactive")) {
                    $(target).removeClass("inactive").addClass("active");
                    $("#GridHour").removeClass("active").addClass("inactive");
                    $("#HourGrid").hide();
                    $("#HourChart").show();
                    var chartobj = $("#HourChart").data("ejChart");
                    chartobj.chartResize();
                }
                break;
            case "GridHour":
                if ($(target).hasClass("inactive")) {
                    $(target).removeClass("inactive").addClass("active");
                    $("#ChartHour").removeClass("active").addClass("inactive");
                    $("#HourChart").hide();
                    $("#HourGrid").show();
                }
                break;
            case "ChartAverage":
                if ($(target).hasClass("inactive")) {
                    $(target).removeClass("inactive").addClass("active");
                    $("#GridAverage").removeClass("active").addClass("inactive");
                    $("#AverageGrid").hide();
                    $("#AverageChart").show();
                    var chartobj = $("#AverageChart").data("ejChart");
                    chartobj.chartResize();
                }
                break;
            case "GridAverage":
                if ($(target).hasClass("inactive")) {
                    $(target).removeClass("inactive").addClass("active");
                    $("#ChartAverage").removeClass("active").addClass("inactive");
                    $("#AverageChart").hide();
                    $("#AverageGrid").show();
                }
                break;
        }
    }

    //It is used to apply formatting for the cells in Grid dynamically at run time
    function queryCellInfo(args) {
        if ($(args.cell).hasClass("groupcaption")) {
            if (args.cell.innerHTML.indexOf("Precipitation") != -1)
                args.cell.innerHTML = "Average Precipitation (mm)";
            if (args.cell.innerHTML.indexOf("Sunlight") != -1)
                args.cell.innerHTML = "Average Sunlight (Hours)";
            if (args.cell.innerHTML.indexOf("Minimum Temperature") != -1)
                args.cell.innerHTML = "Average Minimum Temperature (&deg;C)";
            if (args.cell.innerHTML.indexOf("Maximum Temperature") != -1)
                args.cell.innerHTML = "Average Maximum Temperature (&deg;C)";
            if (args.cell.innerHTML.indexOf("Wind") != -1)
                args.cell.innerHTML = "Average Wind (mph)";
        }
    }

    //It is used to set data source for the chart to series in model
    function hourChartLoad(sender) {
        var data = getHourData();
        sender.model.primaryXAxis.range = range= { min: window.WeatherDataObject[0].Date, max: window.WeatherDataObject[window.WeatherDataObject.length - 1].Date, interval: 6 },
        sender.model.series[0].dataSource = data.Temperature;
        sender.model.series[0].xName = "XValue";
        sender.model.series[0].yName = "YValue";
        sender.model.series[1].dataSource = data.FeelsLike;
        sender.model.series[1].xName = "XValue";
        sender.model.series[1].yName = "YValue";
        sender.model.series[2].dataSource = data.Humidity;
        sender.model.series[2].xName = "XValue";
        sender.model.series[2].yName = "YValue";
        sender.model.series[3].dataSource = data.Wind;
        sender.model.series[3].xName = "XValue";
        sender.model.series[3].yName = "YValue";
    }

    //It is used to retrieve data for binding chart to display hour details for the day
    function getHourData() {
        var series1 = [];
        var series2 = [];
        var series3 = [];
        var series4 = [];
        $.each(window.WeatherDataObject, function (index, value) {
            var point1 = { XValue: value.Date, YValue: value.Temperature };
            var point2 = { XValue: value.Date, YValue: value.FeelsLike };
            var point3 = { XValue: value.Date, YValue: value.Humidity };
            var point4 = { XValue: value.Date, YValue: value.Wind };
            series1.push(point1);
            series2.push(point2);
            series3.push(point3);
            series4.push(point4);
        });
        var data = { Temperature: series1, FeelsLike: series2, Humidity: series3, Wind: series4 };
        return data;
    }

    //It is used to set data source for the chart to series in model
    function averageChartLoad(sender) {
        var data = getAverageData();
        sender.model.series[0].dataSource = data.Precipitation;
        sender.model.series[0].xName = "XValue";
        sender.model.series[0].yName = "YValue";
        sender.model.series[1].dataSource = data.Sunlight;
        sender.model.series[1].xName = "XValue";
        sender.model.series[1].yName = "YValue";
    }

    //It is used to retrieve data for binding chart to display average record details for the year
    function getAverageData() {
        var series1 = [];
        var series2 = [];
        $.each(window.AverageData[0], function (index, value) {
            if (index != "Average") {
                var point1 = { XValue: index, YValue: value };
                series1.push(point1);
            }
        });
        $.each(window.AverageData[1], function (index, value) {
            if (index != "Average") {
                var point1 = { XValue: index, YValue: value };
                series2.push(point1);
            }
        });
        var data = { Precipitation: series1, Sunlight: series2 };
        return data;
    }
</script>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    
    
    

</div>
            </div>
        </form>
</body>
        
</html>
