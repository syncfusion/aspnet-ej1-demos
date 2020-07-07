<%@ Page Title="Chart-Empty Points-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render empty points series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" CodeBehind="EmptyPoints.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Chart.EmptyPoints" %>

<%@ Register Assembly="Syncfusion.EJ.Web" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ejChart" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1"  ClientIDMode="Static" OnClientDisplayTextRendering="textRender" runat="server" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <Margin Left="20" />
            <PrimaryXAxis Title-Text="Server Number" RangePadding="Additional">
            </PrimaryXAxis>
            <PrimaryYAxis RangePadding="None" Title-Text="Server Load (M Bytes)" />
            <CommonSeriesOptions  Type="Spline" Marker-Visible="true" Marker-Size-Height="12" Marker-Size-Width="12" Marker-DataLabel-Visible="True" Marker-DataLabel-Shape="Rectangle" Marker-DataLabel-EnableContrastColor="true" Marker-DataLabel-VerticalTextAlignment="Far"  EnableAnimation="True">
                 <EmptyPointSettings Visible="True" DisplayMode="Gap">
                        <Style Color="#afafaf"></Style>
                 </EmptyPointSettings>
            </CommonSeriesOptions>
            <Series>
                <ej:Series Name="Course" Fill="#f37024">                   
                     <Points>
                       <ej:points Fill="#81B518" Marker-Border-Color="#81B518" Marker-Visible="True" Marker-Shape="Circle" 
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white" X="0" Y="210" />
                       <ej:Points X="1" Y="200" Marker-Border-Color="#afafaf" Marker-Visible="True" Marker-Shape="Circle"
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white" IsEmpty="True"/>
                       <ej:points Fill="#ccdc00" Marker-Border-Color="#ccdc00" Marker-Visible="True" Marker-Shape="Circle"
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white" X="2" Y="150" />
                       <ej:Points X="3" Y="200" IsEmpty="True" Marker-Border-Color="#afafaf" Marker-Visible="True" Marker-Shape="Circle"
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white"/>
                       <ej:points Fill="#a6405a" Marker-Border-Color="#a6405a" Marker-Visible="True" Marker-Shape="Circle" 
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white" X="4" Y ="170" />
                          <ej:points Fill="#60056d" Marker-Border-Color="#60056d" Marker-Visible="True" Marker-Shape="Circle" 
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white" X="5" Y ="200" />
                       <ej:Points X="6" Y="200" IsEmpty="True" Marker-Border-Color="#afafaf" Marker-Visible="True" Marker-Shape="Circle"
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white"/>
                         <ej:points Fill="#01599c" Marker-Border-Color="#01599c" Marker-Visible="True" Marker-Shape="Circle" 
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white" X="7" Y="120" />
                        <ej:points Fill="#385815" Marker-Border-Color="#385815" Marker-Visible="True" Marker-Shape="Circle" 
                            Marker-Size-Width="12" Marker-Size-Height="12" Marker-Fill="white"  X="8" Y="140"/>
                    </Points> 
                </ej:Series>
            </Series>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>



<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Type
                        </div>
                        <div class="col-md-3">
                            <select name="selectIndex"  id="seriestype">
								<option value="spline">Spline</option>
                                <option value="column">Column</option>
                                <option value="area">Area</option>
                                <option value="pie">Pie</option>
                            </select>
                        </div>
                    </div>
					<div class="row">
						<div class="col-md-3">
							 Empty Point Visible
						</div>
						<div class="col-md-3 aligntop">
                            <input type="checkbox" checked="checked" id="visible"/>
						</div>
					</div>
					<div class="row" style="margin: 10px 0;">
						<div class="col-md-3">
							  Empty Point Mode
						</div>
						<div class="col-md-3 aligntop">
							<select name="selectIndex" autocomplete="off" id="mode" style="width:100px;">
								<option value="gap">Gap</option>
								<option value="zero">Zero</option>
								<option value="average">Average</option>
						    </select>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							Color
						</div>
						<div class="col-md-3 aligntop">
							<div class="element"><input type="text" id="color" /></div>

						</div>
					</div>
                </div>
			</div>			
    				
    <script type="text/javascript">
       
        $("#color").ejColorPicker({
            value: '#afafaf',
            select: "onChange1"
        });
        function textRender(sender) {
            if (sender.model.AreaType == 'none' && sender.data.text == 0)
                sender.data.text = '';
        }
        function onChange1(args) {
            var color = args.value;
			var chartInstance = $("#Chart1").ejChart('instance');
			var points = chartInstance.model.series[0].points;
			for (var i = 0; i < points.length; i++) {
				if (points[i].isEmpty)
					points[i].marker.border.color = color;
			}
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { emptyPointSettings: { style: { color: color } } } });
        }

        $('#seriestype').change(function () {
            var chart = $("#Chart1").ejChart('instance');
            var type = $('#seriestype')[0].value;
            chart.model.series[0].type = type;
            var pointsLength = chart.model.series[0].points.length;
            for (var i = 0; i < pointsLength; i++) {
                if (chart.model.series[0].points[i].marker) {
                    if (type == 'column') {
                        chart.model.series[0].points[i].marker.visible = false;
                        chart.model.series[0].marker.visible = false;
                    }
                    else {
                        chart.model.series[0].points[i].marker.visible = true;
                        chart.model.series[0].marker.visible = true;
                    }
                }
            }
            chart.redraw();
        });

        $('#mode').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { emptyPointSettings: { displayMode: $('#mode')[0].value } } });
        });
        $('#visible').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { emptyPointSettings: { visible: $('#visible').is(":checked") } } });
            if ($('#visible').is(":checked"))
                $('#mode').removeAttr('disabled');
            else
                $('#mode').attr('disabled', 'disabled');
        });

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>




