<%@ Page Title="Chart-Selection API-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to perform selection for series types using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true"  MasterPageFile="~/Samplebrowser.Master" CodeBehind="Selection.aspx.cs" Inherits="WebSampleBrowser.Chart.Selection" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
       <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
       <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
           
            <PrimaryXAxis  Title-Text="Countries" LabelIntersectAction="MultipleRows" />
            <PrimaryYAxis Title-Text="Percentage" LabelFormat="{value}%" />
            <CommonSeriesOptions Type="Column" EnableAnimation="true" Tooltip-Visible="false">
                <HighlightSettings Enable="true" Mode="Point" Opacity="1" Pattern="DiagonalForward">
                    <Border Width="1"/>
                </HighlightSettings>
                <SelectionSettings Enable="true" Mode="Point" Opacity="1" Pattern="Dots">
                    <Border Width="1"/>
                </SelectionSettings>
            </CommonSeriesOptions>
            <Series>
                <ej:Series Name="Age 0- 14"  XName="Xvalue" YName="YValue1" DoughnutCoefficient="0.5" DoughnutSize="0.9" />
				<ej:Series Name="Age 15 - 64"  XName="Xvalue" YName="YValue2" />
				<ej:Series Name="Age 65 & above"  XName="Xvalue" YName="YValue3" />
            </Series>
            <Title Text="Age Distribution By Country In Percentage"></Title>
            <Legend Visible="true" ToggleSeriesVisibility="false"></Legend>
        </ej:Chart> 
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
				<div class="prop-grid">
						<div class="row">
							<div class="col-md-3">
								 Enable Highlight
							</div>
							<div class="col-md-3 aligntop">
                                <input type="checkbox" checked="checked" id="enablehigh"/>
							</div>
						</div>
                        <div class="row">
							<div class="col-md-3">
								 Enable Selection
							</div>
							<div class="col-md-3 aligntop">
                                <input type="checkbox" checked="checked" id="enablesel"/>
							</div>
						</div>
                        <div class="row">
							<div class="col-md-3">
								 Enable 3D
							</div>
							<div class="col-md-3 aligntop">
                                <input type="checkbox" id="enable3d"/>
							</div>
						</div>
                        <div class="row">
							<div class="col-md-3">
								 Enable Legend Selection
							</div>
							<div class="col-md-3 aligntop">
                                <input type="checkbox" checked="checked" id="enablelege"/>
							</div>
						</div>
						<div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Type
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="type">
									<option value="column">Column</option>
									<option value="bar">Bar</option>
									<option value="doughnut">Doughnut</option>
									<option value="pie">Pie</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								  Highlight Color
							</div>
							<div class="col-md-3 aligntop">
								 <ej:ColorPicker ID="colorPicker" Value="#278787" ClientSideOnSelect="onChange" runat="server"></ej:ColorPicker>
							</div>
						</div>
                        <div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Highlight Pattern
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="highpattern" style="width:100px;">
									<option value="diagonalForward">Diagonal Forward</option>
									<option value="chessboard">Chessboard</option>
									<option value="dots">Dots</option>
									<option value="none">None</option>
								</select>
							</div>
						</div>
						 <div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Highlight Mode
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="highmode" style="width:100px;">
									<option value="point">Point</option>
									<option value="series">Series</option>
									<option value="cluster">Cluster</option>
							    </select>
							</div>
						</div>
                        <div class="row">
							<div class="col-md-3">
								  Selection Color
							</div>
							<div class="col-md-3 aligntop">
								 <ej:ColorPicker ID="colorPicker1" Value="#278787" ClientSideOnSelect="onChange1" runat="server"></ej:ColorPicker>
							</div>
						</div>
                        <div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Selection Pattern
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="selpattern" style="width:100px;">
									<option value="dots">Dots</option>
									<option value="diagonalForward">Diagonal Forward</option>
									<option value="chessboard">Chessboard</option>
									<option value="none">None</option>
								</select>
							</div>
						</div>
						<div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Selection Mode
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="selmode" style="width:100px;">
									<option value="point">Point</option>
									<option value="series">Series</option>
									<option value="cluster">Cluster</option>
								</select>
							</div>
						</div>
                    	<div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Selection Type
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="selctionType" style="width:100px;">
									<option value="Single">Single</option>
									<option value="Multiple">Multiple</option>
								</select>
							</div>
						</div>
			    </div>
        </div>
    </div>
    				
    <script type="text/javascript">
        $('#enablehigh').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": {highlightSettings:{enable:$('#enablehigh').is(":checked")}} });

        });
        $('#enablesel').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": {selectionSettings:{enable:$('#enablesel').is(":checked")}} });

        });
        $('#enable3d').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.enable3D = $('#enable3d').is(":checked");
            chart.model.enableRotation = true;
            chart.model.depth = 40;
            chart.model.wallSize = 2;
            chart.model.tilt = 0;
            chart.model.rotation = 34;
            chart.model.perspectiveAngle = 90;
            chart.model.sideBySideSeriesPlacement = true;
            chart.redraw();

        });
        $('#enablelege').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.legend.toggleSeriesVisibility = !$('#enablelege').is(":checked");
            chart.redraw();

        });
        $('#type').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            if ($('#type')[0].value.toLowerCase() == "pie" || $('#type')[0].value.toLowerCase() == "doughnut") {

                chart.model.series[0].type = ($('#type')[0].value);
                chart.model.series[1].type = "column";
                chart.model.series[2].type = "column";
            }
            else {
                chart.model.series[0].type = ($('#type')[0].value);
                chart.model.series[1].type = ($('#type')[0].value);
                chart.model.series[2].type = ($('#type')[0].value);
            }
            chart.redraw();

        });

      
        $('#highpattern').change(function () {
		 $("#Chart1").ejChart("option", { "commonSeriesOptions": {highlightSettings:{pattern:$('#highpattern')[0].value}} });
          
        });
		$('#highmode').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": {highlightSettings:{mode:$('#highmode')[0].value}} });

        });

        $('#selpattern').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": {selectionSettings:{pattern:$('#selpattern')[0].value}} });

        });
        $('#selmode').change(function () {
           $("#Chart1").ejChart("option", { "commonSeriesOptions": {selectionSettings:{mode:$('#selmode')[0].value}} });

        });
        $('#selctionType').change(function () {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { selectionSettings: { type: $('#selctionType')[0].value } } });
        });
		 function onChange(args) {
            var color = args.value;
            var chart = $("#Chart1").ejChart("instance");

            for (var i = 0; i < chart.model.series.length; i++) {
                chart.model.series[i].highlightSettings.color = color;
                              
            }
        }
        function onChange1(args) {
            var color = args.value;
            var chart = $("#Chart1").ejChart("instance");

            for (var i = 0; i < chart.model.series.length; i++) {
                chart.model.series[i].selectionSettings.color = color;

            }
        }
    	
        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>


