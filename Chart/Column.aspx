<%@ Page Title="Chart-Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure column series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Column.aspx.cs" Inherits="WebSampleBrowser.Chart.Column" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="690" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Countries" />
            <PrimaryYAxis Title-Text="Medals" />
            <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="true" 
                Tooltip-Format="#point.x# : #point.y# #series.name# Medals" >
                 <Marker>
                  <DataLabel Visible="True" ShowEdgeLabels="true" EnableContrastColor="true">
                   </DataLabel>
                </Marker>
				</CommonSeriesOptions>
            <Series>
                  <ej:Series Name="Gold" XName="Xvalue" YName="YValue1" Fill="rgba(135,206,235,1)"></ej:Series>
                  <ej:Series Name="Silver" XName="Xvalue" YName="YValue2" Fill="rgba(255,255,0,0.7)"></ej:Series>
                  <ej:Series Name="Bronze" XName="Xvalue" YName="YValue3" Fill="rgba(255,204,153,1)"></ej:Series>
            </Series>
            <Title Text="Olympic Medals"></Title>
            <Legend Position="Top"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    
    <div id="sampleProperties">
    <div class="prop-grid">
    <div class="row">           
            <div class="col-md-3" style="width:200px;">
               <input type="checkbox" id="sidebyside" name="sidebyside" checked> Side by Side Series Placement      
           </div>
    </div>
	<div class="row">                        
                        <div class="col-md-3" style="width:200px;">
                            <input type="checkbox" id="showOutsideLabels" name="outsideLabels" checked> Show Edge Labels <br/>       
                        </div>                        
					</div>
    <div class="row" style="margin: 10px 0;">
		<div class="col-md-3">
			Column Width
		</div>
		<div class="col-md-3 aligntop">
			<input type="text" id="columnWidth" value = "0.7" />
		</div>
	</div>
	<div class="row">
		<div class="col-md-3">
			Coloumn Spacing
		</div>
		<div class="col-md-3 aligntop">
			<input type="text" id="columnSpacing" value = "0"/>
		</div>
	</div>
    <div class="row" style="margin: 20px 0;">
        <div class="col-md-3">
			Corner Radius
		</div>
        <div class="col-md-3 aligntop">
			<input type="text" id="cornerRadius" value = "0" />
		</div>
    </div>
    <div class="row" style="margin: 10px 0;">
		<div class="col-md-3">
			Column Facet
		</div>
		<div class="col-md-3">
             <div id="dropdown">
                  <select id="optColumnFacet">
                       <option value="rectangle">Rectangle</option>
                       <option value="cylinder">Cylinder</option>
                  </select>
             </div>
         </div>
	</div>
    </div>
    </div>
        <script type="text/javascript" >
           
            $('#sidebyside').click(function () {
                var chart = $("#Chart1").ejChart("instance");
                if ($("#sidebyside").is(":checked"))                                       
                    chart.model.sideBySideSeriesPlacement = true;              
                else
                    chart.model.sideBySideSeriesPlacement = false;
                chart.redraw();
            });
        $('#showOutsideLabels').change(function () 
        {
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { marker: { dataLabel: { showEdgeLabels: $('#showOutsideLabels').is(":checked") } } } });
        });
		function changeColumnWidth(e) 
		{
			$('#Chart1').ejChart('option', { commonSeriesOptions: { columnWidth: e.value } });
    	}
		function changeColumnSpacing(e) 
		{
			$('#Chart1').ejChart('option', { commonSeriesOptions: { columnSpacing: e.value } });
		}
		function columnFacetChanged(e) {
		    $('#Chart1').ejChart('option', { commonSeriesOptions: { columnFacet: e.value } });
		}
		function changecornerRadius(e) {
		    $('#Chart1').ejChart('option', { commonSeriesOptions: { cornerRadius: e.value } });
		}
		$("#optColumnFacet").ejDropDownList({ "change": "columnFacetChanged", width: "110px", selectedItemIndex: 0 });

		$("#columnWidth").ejNumericTextbox({
		    value: 0.7, width: "70px", minValue: 0, maxValue: 1, incrementStep: 0.1, decimalPlaces: 1, change: "changeColumnWidth",
		});

		$("#columnSpacing").ejNumericTextbox({
		    value: 0, width: "70px", minValue: 0, maxValue: 1, incrementStep: 0.1, decimalPlaces: 1, change: "changeColumnSpacing"
		});
		$("#cornerRadius").ejNumericTextbox({
		    value: 0, width: "70px", minValue: 0, maxValue: 12, incrementStep: 1, decimalPlaces: 1, change: "changecornerRadius",
		});
        $("#sampleProperties").ejPropertiesPanel();
            </script>
    </asp:Content>

