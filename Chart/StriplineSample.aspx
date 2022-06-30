<%@ Page Title="Chart-Stripline-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure stripline for axis using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" 
    AutoEventWireup="true" CodeBehind="StriplineSample.aspx.cs" Inherits="WebSampleBrowser.Chart.StriplineSample" %>
<%@ Register Assembly="Syncfusion.EJ.Web" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ejChart" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <ChartArea Background="transparent" Border-Color="#686868" Border-width="4" Border-Opacity="1" />
            <PrimaryXAxis Title-Text="Month" MajorGridLines-Visible="false" />
            <PrimaryYAxis Title-Text="Temperature in Celcius" AxisLine-Color="#808080" LabelFormat="{value} C" >
            <Stripline>
                 <ejChart:StripLine Start="30" End="40" Text="High Temperature" TextAlignment="MiddleCenter" Color="#0D97D4" 
                     ZIndex="Behind" BorderWidth="0" Font-FontSize="18px" Font-Color="white" />
                 <ejChart:StripLine Start="20" End="30" Text="Average Temperature" TextAlignment="MiddleCenter" Color="#00AEFF" 
                     ZIndex="Behind" BorderWidth="0" Font-FontSize="18px" Font-Color="white" />
                 <ejChart:StripLine Start="10" End="20" Text="Low Temperature" TextAlignment="MiddleCenter" Color="#14B9FF"
                     ZIndex="Behind" BorderWidth="0" Font-FontSize="18px" Font-Color="white" />
            </Stripline>
            </PrimaryYAxis>
            <Series>
               <ej:Series Name="Course" XName="Xvalue" YName="YValue1" Width="4"
                    Marker-Visible="true" Marker-Border-Width="4" Marker-Fill="Black" Tooltip-Visible="true"
                    Tooltip-Format="#point.x# : #point.y#" Tooltip-Font-Color="Black" Tooltip-Fill="White"
                    Tooltip-Border-Width="1" Tooltip-Border-Color="Black" Marker-Size-Height="12" Marker-Size-Width="12" 
                    Type="Line" Fill="#ffffff" ></ej:Series>
            </Series>
            <Title Text="Weather Report"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    
      <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            StripLine Orientation:
                        </div>
                        <div class="col-md-3">
                            <div id="dropdown">
                                <select id="selectType">
                                    <option value="Horizontal">Horizontal</option>
                                    <option value="Vertical">Vertical</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        <script type="text/javascript">

            $('#selectType').change(function () {
                var option = $("#selectType option:selected").text();
                if (option.toLowerCase() == "vertical") {
                    var chart = $("#Chart1").ejChart("instance");
                    chart.model.primaryXAxis.labelPlacement = "betweenticks";
                    for (var i = 0; i <= 4; i++) {
                        if (i == 3 || i == 4) {
                            chart.model.primaryYAxis.stripLine[i] = {};
                        }
                        chart.model.primaryYAxis.stripLine[i].visible = false;
                        chart.model.primaryXAxis.stripLine[i] = {};
                        switch (i) {
                            case 0:
                                chart.model.primaryXAxis.stripLine[i].start = -1;
                                chart.model.primaryXAxis.stripLine[i].end = 1.5;
                                chart.model.primaryXAxis.stripLine[i].text = "Winter";
                                chart.model.primaryXAxis.stripLine[i].color = "#1e88e5";
                                break;
                            case 1:
                                chart.model.primaryXAxis.stripLine[i].start = 1.5;
                                chart.model.primaryXAxis.stripLine[i].text = "Summer";
                                chart.model.primaryXAxis.stripLine[i].end = 4.5;
                                chart.model.primaryXAxis.stripLine[i].color = "#2196f3";
                                break;
                            case 2:
                                chart.model.primaryXAxis.stripLine[i].start = 4.5;
                                chart.model.primaryXAxis.stripLine[i].end = 7.5;
                                chart.model.primaryXAxis.stripLine[i].text = "Spring";
                                chart.model.primaryXAxis.stripLine[i].color = "#42a5f5";
                                break;
                            case 3:
                                chart.model.primaryXAxis.stripLine[i].start = 7.5;
                                chart.model.primaryXAxis.stripLine[i].end = 10.5;
                                chart.model.primaryXAxis.stripLine[i].color = "#64b5f6";
                                chart.model.primaryXAxis.stripLine[i].text = "Autumn";
                                break;
                            case 4:
                                chart.model.primaryXAxis.stripLine[i].start = 10.5;
                                chart.model.primaryXAxis.stripLine[i].end = 12;
                                chart.model.primaryXAxis.stripLine[i].text = "Winter";
                                chart.model.primaryXAxis.stripLine[i].color = "#1e88e5";
                                break;
                        }
                        chart.model.primaryXAxis.stripLine[i].textAlignment = "middlecenter";                      
                        chart.model.primaryXAxis.stripLine[i].font = {};
                        chart.model.primaryXAxis.stripLine[i].font.size = "18px";
                        chart.model.primaryXAxis.stripLine[i].font.color = "white";
                        chart.model.primaryXAxis.stripLine[i].zIndex = "behind";
                        chart.model.primaryXAxis.stripLine[i].borderWidth = 0;
                        chart.model.primaryXAxis.stripLine[i].visible = true;
                    }
                    $("#Chart1").ejChart("redraw");
                }
                else {
                    var chart = $("#Chart1").ejChart("instance");
                    var text = ["High Temperature", "Average Temperature", "Low Temperature"];
                    var color = ["#0D97D4", "#00AEFF", "#14B9FF"]
                    for (var i = 0; i <= 3; i++) {
                        chart.model.primaryXAxis.stripLine[i] = {};
                        chart.model.primaryXAxis.stripLine[i].visible = false;
                        if (i == 3) break;
                        switch (i) {
                            case 0:
                                chart.model.primaryYAxis.stripLine[i].start = 30;
                                chart.model.primaryYAxis.stripLine[i].end = 40;
                                break;
                            case 1:
                                chart.model.primaryYAxis.stripLine[i].start = 20;
                                chart.model.primaryYAxis.stripLine[i].end = 30;
                                break;
                            case 2:
                                chart.model.primaryYAxis.stripLine[i].start = 10;
                                chart.model.primaryYAxis.stripLine[i].end = 20;
                                break;
                        }
                        chart.model.primaryYAxis.stripLine[i].text = text[i];
                        chart.model.primaryYAxis.stripLine[i].textAlignment = "middlecenter";
                        chart.model.primaryYAxis.stripLine[i].color = color[i];
                        chart.model.primaryYAxis.stripLine[i].font = {};
                        chart.model.primaryYAxis.stripLine[i].font.size = "18px";
                        chart.model.primaryYAxis.stripLine[i].font.color = "white";
                        chart.model.primaryYAxis.stripLine[i].zIndex = "behind";
                        chart.model.primaryYAxis.stripLine[i].borderWidth = 0;
                        chart.model.primaryYAxis.stripLine[i].visible = true;
                    }
                    $("#Chart1").ejChart("redraw");
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
            </script>
    </asp:Content>



