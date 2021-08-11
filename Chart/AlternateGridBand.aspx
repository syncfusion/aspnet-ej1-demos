<% @Page Language="C#" MetaDescription="This sample demonstrates how to render alternate grid bands along horizontal and vertical axis using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="AlternateGridBand.aspx.cs" Inherits="WebSampleBrowser.Chart.AlternateGridBand" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
       <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
       <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis>
                <Title Text="Year"></Title>
                <MajorGridLines Color="transparent" />
                <AxisLine Visible="false" />
            </PrimaryXAxis>
            <PrimaryYAxis>
                <Title Text="Tons Per Day"></Title>
                <MajorTickLines Visible="false" />
                <AxisLine Visible="false" />
                <AlternateGridBand Even-Fill="#A7A9AB" Even-Opacity="0.1" />
            </PrimaryYAxis>
            <CommonSeriesOptions Type="Column" EnableAnimation="true" Tooltip-Visible="true" 
                Tooltip-Format="#series.name# <br/> Year: #point.x# <br/>Tons Per Day: #point.y#"></CommonSeriesOptions>
              <Series>
                 <ej:Series Name="Voc Emission By All Sources"  XName="Xvalue" YName="YValue1" Fill="#FF7F7F" ></ej:Series>
                 <ej:Series Name="Voc Emission By Autos and Light Trucks" XName="Xvalue" YName="YValue2" Fill="#3E9C9C" ></ej:Series>
              </Series>
            <Title Text="World Pollution Report"></Title>
            <Legend Visible="true"></Legend>
            <ChartArea Border-Color="transparent"></ChartArea>
        </ej:Chart> 
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
         <div id="sampleProperties">
         <div id="select">
                        <b> Xaxis </b>
                        <br/>
						 AlternateGridBand
         <div class="dropdown">
                            <select name="xaxis" autocomplete="off"  id="Xaxisalternateband">
                                <option value="0" selected>None</option>
                                <option value="1">Even</option>
                                <option value="2">Odd</option>
                            </select>
         </div>
                        <br/><br/>
                           <b>Yaxis</b>
                        <br/>
					    AlternateGridBand
         <div class="dropdown">
				        <select name="yaxis" autocomplete="off"  id="Yaxisalternateband">
				            <option value="0">None</option>
				            <option value="1" selected>Even</option>
				            <option value="2">Odd</option>
				        </select>
         </div>
         </div>	
         </div>				
    <script>
        $('#Xaxisalternateband').change(function () {
            var option1 = $("#Xaxisalternateband option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var ygridline = chart.model.primaryYAxis.alternateGridBand;
            switch (option1) {
                case 'Even':
                    chart.model.primaryXAxis.alternateGridBand.odd.fill = 'transparent';
                    chart.model.primaryXAxis.alternateGridBand.even.fill = '#A7A9AB';
                    chart.model.primaryXAxis.alternateGridBand.even.opacity = 0.1;
                    chart.model.primaryXAxis.majorGridLines.color = "#DFDFDF";
                    chart.model.primaryYAxis.majorGridLines.color = "transparent";
                    chart.model.primaryXAxis.axisLine.visible = false;
                    chart.model.primaryYAxis.axisLine.visible = false;
                    chart.redraw();
                    break;
                case 'Odd':
                    chart.model.primaryXAxis.alternateGridBand.even.fill = 'transparent';
                    chart.model.primaryXAxis.alternateGridBand.odd.fill = '#A7A9AB';
                    chart.model.primaryXAxis.alternateGridBand.odd.opacity = 0.1;
                    chart.model.primaryXAxis.majorGridLines.color = "#DFDFDF";
                    chart.model.primaryYAxis.majorGridLines.color = "transparent";
                    chart.model.primaryXAxis.axisLine.visible = false;
                    chart.model.primaryYAxis.axisLine.visible = false;
                    chart.redraw();
                    break;
                case 'None':
                    chart.model.primaryXAxis.alternateGridBand.even.fill = 'transparent';
                    chart.model.primaryXAxis.alternateGridBand.odd.fill = 'transparent';
                    chart.model.primaryYAxis.majorGridLines.color = "#DFDFDF";
                    if (ygridline.even.fill != "transparent" || ygridline.odd.fill != "transparent") {
                        chart.model.primaryXAxis.majorGridLines.color = "transparent";
                        chart.model.primaryXAxis.axisLine.visible = false;
                        chart.model.primaryYAxis.axisLine.visible = false;
                    }
                    else {
                        chart.model.primaryXAxis.axisLine.visible = true;
                        chart.model.primaryYAxis.axisLine.visible = true;
                    }
                    chart.redraw();
                    break;
                default:

            }
        });
        $('#Yaxisalternateband').change(function () {
            var option1 = $("#Yaxisalternateband option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            var xgridline = chart.model.primaryXAxis.alternateGridBand;
            switch (option1) {
                case 'Even':
                    chart.model.primaryYAxis.alternateGridBand.odd.fill = 'transparent';
                    chart.model.primaryYAxis.alternateGridBand.even.fill = '#A7A9AB';
                    chart.model.primaryYAxis.alternateGridBand.even.opacity = 0.1;
                    chart.model.primaryYAxis.majorGridLines.color = "#DFDFDF";
                    chart.model.primaryXAxis.majorGridLines.color = "transparent";
                    chart.model.primaryXAxis.axisLine.visible = false;
                    chart.model.primaryYAxis.axisLine.visible = false;
                    chart.redraw();
                    break;
                case 'Odd':
                    chart.model.primaryYAxis.alternateGridBand.even.fill = 'transparent';
                    chart.model.primaryYAxis.alternateGridBand.odd.fill = '#A7A9AB';
                    chart.model.primaryYAxis.alternateGridBand.odd.opacity = 0.1;
                    chart.model.primaryYAxis.majorGridLines.color = "#DFDFDF";
                    chart.model.primaryXAxis.majorGridLines.color = "transparent";
                    chart.model.primaryXAxis.axisLine.visible = false;
                    chart.model.primaryYAxis.axisLine.visible = false;
                    chart.redraw();
                    break;
                case 'None':
                    chart.model.primaryYAxis.alternateGridBand.even.fill = 'transparent';
                    chart.model.primaryYAxis.alternateGridBand.odd.fill = 'transparent';
                    chart.model.primaryXAxis.majorGridLines.color = "#DFDFDF";
                    if (xgridline.even.fill != "transparent" || xgridline.odd.fill != "transparent") {
                        chart.model.primaryYAxis.majorGridLines.color = "transparent";
                        chart.model.primaryYAxis.axisLine.visible = false;
                        chart.model.primaryXAxis.axisLine.visible = false;
                    }
                    else {
                        chart.model.primaryXAxis.axisLine.visible = true;
                        chart.model.primaryYAxis.axisLine.visible = true;
                    }
                    chart.redraw();
                    break;
                default:

            }
        });
        $("#sampleProperties").ejPropertiesPanel();

    </script>
    <style>
        .dropdown{
            float:right;
            padding-right:40px;
        }
    </style>
</asp:Content>


