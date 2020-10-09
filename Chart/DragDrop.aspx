<%@ Page Title="Chart-Data Editing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to perform drag and drop for series types using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DragDrop.aspx.cs" Inherits="WebSampleBrowser.Chart.DragDrop" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ User Interaction / Drag and Drop</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">  
    <div>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="chartLoad">           
            <PrimaryXAxis  Title-Text="Months" ValueType="Datetime" LabelFormat="MMM/yyyy" IntervalType="Months" EdgeLabelPlacement="Shift"/>
            <PrimaryYAxis Title-Text="Sales Count" />
            <CommonSeriesOptions Type="Line" EnableAnimation="true" Tooltip-Visible="true" Marker-Visible="true">
                <DragSettings Enable="true" />
            </CommonSeriesOptions>
            <Series>                
				<ej:Series Name="Product 1" XName="XValue1" YName="YValue1" Size="Size1"></ej:Series>
				<ej:Series Name="Product 2" XName="XValue2" YName="YValue2" Size="Size2"></ej:Series>
            </Series>                     
            <Title Text="Sales Prediction of Products"></Title>
            <Legend Visible="True"></Legend>
        </ej:Chart> 
    </div> 
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">				
						<div class="row" style="margin: 10px 0;">
                            <div class="col-md-3">
                                Allow Drag
                            </div>
                            <div class="col-md-3 aligntop">
                                <input type="checkbox" checked="checked"  id="enabledrag"/>
                            </div>
                            </div>
						<div class="row" style="margin: 10px 0;">
                            <div class="col-md-3">
								  Drag Type
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="dragtype" style="width:100px;">
									<option value="XY">XY</option>
									<option value="X">X</option>
									<option value="Y">Y</option>
								</select>
							</div>
							
						</div>
						
                    	<div class="row" style="margin: 10px 0;">
							<div class="col-md-3">
								 Series Type
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" autocomplete="off" id="charttype">
									<option value=0>Line</option>
                                    <option value=1>Spline</option>
                                    <option value=2>Area</option>
                                    <option value=3>Column</option>
                                    <option value=4>Bar</option>
                                    <option value=5>Bubble</option>
                                    <option value=6>Scatter</option>
                                    <option value=7>Step Area</option>
                                    <option value=8>Step Line</option>
                                    <option value=9>Spline Area</option>
								</select>
							</div>
						</div>			    
        </div>
    </div>
    				
    <script type="text/javascript">
       
        $('#enabledrag').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            for (var i = 0; i < chart.model.series.length; i++) {
                if ($("#enabledrag").is(":checked"))
                    chart.model.series[i].dragSettings.enable = true;
                else
                    chart.model.series[i].dragSettings.enable = false;
            }
            chart.redraw();
        });        
        $('#dragtype').change(function () {
            var option = $("#dragtype option:selected").text();
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { dragSettings: { type: option } } });
        });
        $('#charttype').change(function () {
            var option = $("#charttype option:selected").text();
            option = option.replace(/\s/g, '');
            var seriestype = option.toLowerCase();
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { type: option } });
            if (seriestype == "bar" || seriestype == "column" || seriestype == "bubble")
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { marker: { visible: false } } });
            else if (seriestype == "scatter")
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { marker: { size: { height: 10, width: 10 } } } });
            else
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { marker: { visible: true, size: { height: 6, width: 6 } } } });
        });

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>

