<%@ Page Title="Chart-Smart Axis Labels-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render smart axis labels using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SmartAxisLabel.aspx.cs" Inherits="WebSampleBrowser.Chart.SmartAxisLabel" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis  Title-Text="Countries" LabelIntersectAction="MultipleRows" />
            <PrimaryYAxis Title-Text="People (in millions)" />
            <CommonSeriesOptions Type="Column" EnableAnimation="true" Tooltip-Visible="true" />
            <Series>
                <ej:Series  XName="Xvalue" YName="YValue1" Tooltip-Visible="true"  ></ej:Series>
            </Series>
            <Title Text="Internet users"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
<div id="sampleProperties">
					<div class="prop-grid">
						<div class="row">
							<div class="col-md-3">
								<b>X-Axis</b>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								 Edge Label Placement
							</div>
							<div class="col-md-3 aligntop">
								<select name="edgesupport1" autocomplete="off" id="edgeLabelX">
									<option value="0">None</option>
									<option value="1">Shift</option>
									<option value="2">Hide</option>
								</select>
							</div>
						</div>
						<div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								  Label Intersect Action
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="optXaxisChange">
									<option value="0">Rotate45</option>
									<option value="1">Rotate90</option>
									<option value="2">Wrap</option>
									<option value="3">WrapByWord</option>
									<option value="4">Trim</option>
									<option value="5">Hide</option>
									<option value="6" selected>MultipleRows</option>
									<option value="7">None</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Tick Lines Position
							</div>
							<div class="col-md-3 aligntop">
								 <select name="xtickline" autocomplete="off" id="xticklines">
									<option value="0">Outside</option>
									<option value="1">Inside</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Label Position
							</div>
							<div class="col-md-3 aligntop">
								<select name="xlabel" id="xlabels" autocomplete="off">
									<option value="0">Outside</option>
									<option value="1">Inside</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Enable Trim
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="optXaxisChange1">
									<option value="0">False</option>
									<option value="1">True</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Maximum Label Width
							</div>
							<div class="col-md-3 aligntop">
								<input type="text" id="maximumLabelWidth" style="width:100px; height:22px;" value="" />
							</div>
						</div><br/>
						<div class="row">
							<div class="col-md-3">
								   <b>Y-Axis</b>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Edge Label Placement
							</div>
							<div class="col-md-3 aligntop">
								<select name="edgesupport2" id="edgeLabelY" autocomplete="off">
									<option value="0">None</option>
									<option value="1">Shift</option>
									<option value="2">Hide</option>
								</select>
							</div>
						</div>
						<div class="row"  style="margin: 10px 0;">
							<div class="col-md-3">
								   Label Intersect Action
							</div>
							<div class="col-md-3 aligntop">
								<select name="disableItem" id="optYaxisChange" autocomplete="off">
									<option value="0">None</option>
									<option value="1">Hide</option>
									<option value="2">MultipleRows</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Tick Lines Position
							</div>
							<div class="col-md-3 aligntop">
								<select name="ytickline" id="yticklines" autocomplete="off">
									<option value="0">Outside</option>
									<option value="1">Inside</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Label Position
							</div>
							<div class="col-md-3 aligntop">
								<select name="ylabel" id="ylabels" autocomplete="off">
									<option value="0">Outside</option>
									<option value="1">Inside</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Enable Trim
							</div>
							<div class="col-md-3 aligntop">
								<select name="enableTrim" id="optYaxisChange1" autocomplete="off">
									<option value="0">False</option>
									<option value="0">True</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Maximum Label Width
							</div>
							<div class="col-md-3 aligntop">
								<input type="text" id="maximumLabelWidth1" style="width:100px; height:22px;" value="" />
							</div>
						</div><br/>
					</div>
				</div>
    <script>
        $("#maximumLabelWidth").bind("change",maximumLabelWidth);
        $("#maximumLabelWidth1").bind("change",maximumLabelWidthYAxis);
        $("#maximumLabelWidth2").bind("change", maximumLabelWidthYAxis);
	
        $('#optXaxisChange').change(function () {
            var option = $("#optXaxisChange option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option) {
                case 'None':
                    chart.model.primaryXAxis.labelIntersectAction = 'none';
                    chart.redraw();
                    break;
                case 'Rotate90':
                    chart.model.primaryXAxis.labelIntersectAction = 'rotate90';
                    chart.redraw();
                    break;
                case 'Rotate45':
                    chart.model.primaryXAxis.labelIntersectAction = 'rotate45';
                    chart.redraw();
                    break;
                case 'Wrap':
                    chart.model.primaryXAxis.labelIntersectAction = 'wrap';
                    chart.redraw();
                    break;
				case 'WrapByWord':
                    chart.model.primaryXAxis.labelIntersectAction = 'wrapByWord';
                    chart.redraw();
                    break;
                case 'Hide':
                    chart.model.primaryXAxis.labelIntersectAction = 'hide';
                    chart.redraw();
                    break;
                case 'Trim':
                    chart.model.primaryXAxis.labelIntersectAction = 'trim';
                    chart.redraw();
                    break;
                case 'MultipleRows':
                    chart.model.primaryXAxis.labelIntersectAction = 'multiplerows';
                    chart.redraw();
                    break;
                default:

            }
        });
        $('#optXaxisChange1').change(function () {
            var option = $("#optXaxisChange1 option:selected").text().toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option) {
                case 'true':
                    chart.model.primaryXAxis.enableTrim = true;
                    chart.redraw();
                    break;
                case 'false':
                    chart.model.primaryXAxis.enableTrim= false;
                    chart.redraw();	
                    break;                 
            }
        });
        $('#optYaxisChange1').change(function () {
            var option = $("#optYaxisChange1 option:selected").text().toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option) {
					
                case 'false':
                    chart.model.primaryYAxis.enableTrim = false;
                    chart.redraw();
                    break;
                case 'true':
                    chart.model.primaryYAxis.enableTrim = true;
                    chart.redraw();
                    break;
	
            }
        }); 
        $('#optYaxisChange2').change(function () {
            var option = $("#optYaxisChange2 option:selected").text().toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option) {
					
                case 'false':
                    chart.model.axes[0].enableTrim = false;
                    chart.redraw();
                    break;
                case 'true':
                    chart.model.axes[0].enableTrim = true;
                    chart.model.axes[0].maximumLabelWidth = parseFloat($("#maximumLabelWidth2").val());
                    chart.redraw();
                    break;
            }
        });
        $('#optYaxisChange3').change(function () {
            var option = $("#optYaxisChange3 option:selected").text().toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option) {
					
                case 'false':
                    chart.model.primaryXAxis.opposedPosition = false;
                    chart.redraw();
                    break;
                case 'true':
                    chart.model.primaryXAxis.opposedPosition = true;
                    chart.redraw();
                    break;
            }
        }); 
        $('#optYaxisChange4').change(function () {
            var option = $("#optYaxisChange4 option:selected").text().toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option) {
					
                case 'false':
                    chart.model.primaryYAxis.opposedPosition = false;
                    chart.redraw();
                    break;
                case 'true':
                    chart.model.primaryYAxis.opposedPosition = true;
                    chart.redraw();
                    break;
	
            }
        }); 
        $('#optYaxisChange').change(function () {
            var option1 = $("#optYaxisChange option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case 'None':
                    chart.model.primaryYAxis.labelIntersectAction = 'none';
                    chart.redraw();
                    break;
                case 'Hide':
                    chart.model.primaryYAxis.labelIntersectAction = 'hide';
                    chart.redraw();
                    break;
                case 'Trim':
                    chart.model.primaryYAxis.labelIntersectAction = 'trim';
                    chart.redraw();
                    break;
                case 'MultipleRows':
                    chart.model.primaryYAxis.labelIntersectAction = 'multiplerows';
                    chart.redraw();
                    break;
                default:
            }
        });
        $('#edgeLabelX').change(function () {
            var option2 = $("#edgeLabelX option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option2) {
                case 'None':
                    chart.model.primaryXAxis.edgeLabelPlacement = 'none';
                    chart.redraw();
                    break;
                case 'Shift':
                    chart.model.primaryXAxis.edgeLabelPlacement = 'shift';
                    chart.redraw();
                    break;
                case 'Hide':
                    chart.model.primaryXAxis.edgeLabelPlacement = 'hide';
                    chart.redraw();
                    break;
                default:
            }
        });

        $('#edgeLabelY').change(function () {
            var option3 = $("#edgeLabelY option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option3) {
                case 'None':
                    chart.model.primaryYAxis.edgeLabelPlacement = 'none';
                    chart.redraw();
                    break;
                case 'Shift':
                    chart.model.primaryYAxis.edgeLabelPlacement = 'shift';
                    chart.redraw();
                    break;
                case 'Hide':
                    chart.model.primaryYAxis.edgeLabelPlacement = 'hide';
                    chart.redraw();
                    break;
                default:
            }
        });



        $('#xticklines').change(function () {
            var option4 = $("#xticklines option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option4) {
                case 'None':
                    chart.model.primaryXAxis.tickLinesPosition = 'outside';
                    chart.redraw();
                    break;
                case 'Inside':
                    chart.model.primaryXAxis.tickLinesPosition = 'inside';
                    chart.redraw();
                    break;
                case 'Outside':
                    chart.model.primaryXAxis.tickLinesPosition = 'outside';
                    chart.redraw();
                    break;
                default:
            }
        });


        $('#yticklines').change(function () {
            var option5 = $("#yticklines option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option5) {
                case 'None':
                    chart.model.primaryYAxis.tickLinesPosition = 'outside';
                    chart.redraw();
                    break;
                case 'Inside':
                    chart.model.primaryYAxis.tickLinesPosition = 'inside';
                    chart.redraw();
                    break;
                case 'Outside':
                    chart.model.primaryYAxis.tickLinesPosition = 'outside';
                    chart.redraw();
                    break;
                default:
            }
        });

        $('#xlabels').change(function () {
            var option6 = $("#xlabels option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option6) {
                case 'None':
                    chart.model.primaryXAxis.labelPosition = 'outside';
                    chart.redraw();
                    break;
                case 'Inside':
                    chart.model.primaryXAxis.labelPosition = 'inside';
                    chart.redraw();
                    break;
                case 'Outside':
                    chart.model.primaryXAxis.labelPosition = 'outside';
                    chart.redraw();
                    break;
                default:
            }
        });


        $('#ylabels').change(function () {
            var option7 = $("#ylabels option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (option7) {
                case 'None':
                    chart.model.primaryYAxis.labelPosition = 'outside';
                    chart.redraw();
                    break;
                case 'Inside':
                    chart.model.primaryYAxis.labelPosition = 'inside';
                    chart.redraw();
                    break;
                case 'Outside':
                    chart.model.primaryYAxis.labelPosition = 'outside';
                    chart.redraw();
                    break;
                default:
            }
        });		
        function maximumLabelWidth() {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model._axes[0].maximumLabelWidth = parseFloat($("#maximumLabelWidth").val());
            chartObj.redraw();
        }
        function maximumLabelWidthYAxis() {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model._axes[1].maximumLabelWidth = parseFloat($("#maximumLabelWidth1").val());
            chartObj.redraw();
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:content>


