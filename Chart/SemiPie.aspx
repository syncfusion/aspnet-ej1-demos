<%@ Page Title="Chart-Semi Pie and Doughnut-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render semi pie series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SemiPie.aspx.cs" Inherits="WebSampleBrowser.Chart.SemiPie" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="600" IsResponsive="true" Text="Agricultural land" 
            OnClientSeriesRendering="seriesRender" OnClientLoad="onChartLoad">
            <Title Text="Agricultural land in 2011 (% of land area)"></Title>
            <Series>
                <ej:Series EnableAnimation="True"  Name="Expenses" XName="Xvalue" YName="YValue1" Type="Doughnut" 
                    LabelPosition="Outside" EnableSmartLabels="True" StartAngle="-90" EndAngle="90" Explode="true">
                <Marker>
                    <DataLabel Visible="True" EnableContrastColor="true">
                    <ConnectorLine Color="Black" Type="Line"></ConnectorLine>
                    <Font FontSize="14px"/>
                    </DataLabel>
                </Marker>
                    <Border Width="1" Color="white" />
                    <Points>
                        <ej:points X="Australia" Y="53.3" Text="Australia"/>
                        <ej:points X="China" Y="55.7" Text="China" />
                        <ej:points X="India" Y="60.5" Text="India"/>
                        <ej:points X="Japan" Y="12.5" Text="Japan"/>
                        <ej:points X="South Africa" Y="79.4" Text="South Africa"/>
                        <ej:Points X="United Kingdom" Y="70.9" Text="United Kingdom"/>
                        <ej:Points X="United States" Y="45.0" Text="United States"/>
                    </Points>
                    <Tooltip Visible="true" Format="#point.x# : #point.y#%"/>
                </ej:Series>
            </Series>
            <Legend Visible="False"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    
    <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Start Angle
                        </div>
                        <div class="col-md-3">
                            <div id="startAngleSlider"></div>
                        </div>
                        <div class="col-md-3">
                            End Angle
                        </div>
                        <div class="col-md-3">
                            <div id="endAngleSlider"></div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                           Series Type
                        </div>
                        <div class="col-md-3">
                            <select name="disableItem"  id="optSeriesType">
                                 <option value="Doughnut">Doughnut</option>
                                 <option value="Pie">Pie</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        <script>
            function seriesRender(sender) {
                if (sender.model.theme == "flatdark" || sender.model.theme == "gradientdark" || sender.model.theme == "high-contrast-01")
                    sender.data.series.marker.dataLabel.connectorLine.color = "white";
            }
            
            $('#startAngleSlider').ejSlider({
                height: 16,
                value: -90,
                minValue: -360,
                maxValue: 360,
                incrementStep: 1,
                change: "startAngleChange",
            });
            $('#endAngleSlider').ejSlider({
                height: 16,
                value: 90,
                minValue: -360,
                maxValue: 360,
                incrementStep: 1,
                change: "endAngleChange",

            });
            $("#optSeriesType").ejDropDownList({ "change": "seriesChanged", width: "110px", selectedItemIndex: 0 });
            function startAngleChange(args) {
                var chart = $("#Chart1").ejChart("instance");
                endAngle = $("#endAngleSlider a").attr("aria-label");
                chart.model.series[0].startAngle = parseInt(args.value);
                chart.model.series[0].endAngle = parseInt(endAngle);
                chart.model.series[0].enableAnimation = false;
                chart.redraw();
            }
            function endAngleChange(args) {
                var chart = $("#Chart1").ejChart("instance");
                startAngle = $("#startAngleSlider a").attr("aria-label");
                chart.model.series[0].startAngle = parseInt(startAngle);
                chart.model.series[0].endAngle = parseInt(args.value);
                chart.model.series[0].enableAnimation = false;
                chart.redraw();
            }
            function seriesChanged(sender) {
                var option = sender.selectedText;
                var chart = $("#Chart1").ejChart("instance");
                chart.model.series[0].type = option.toLowerCase();
                chart.model.series[0].enableAnimation = true;
                chart.redraw();
            }
            $("#sampleProperties").ejPropertiesPanel();
        </script>
    </asp:Content>

