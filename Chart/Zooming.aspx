<%@ Page Title="Chart-Zooming and Panning-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to zoom Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Zooming.aspx.cs" Inherits="WebSampleBrowser.Chart.Zooming" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ User Interaction / Zooming</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart ID="container" ClientIDMode="Static" OnClientLoad="chartload" IsResponsive="true" Height="600" runat="server" Width="970">
        <PrimaryXAxis Title-Text="Date" ValueType="Datetime" />
        <PrimaryYAxis LabelFormat="{value}%" Title-Text="CPU Load" />
        <Series>
            <ej:Series Name="Server" EnableAnimation="true" Type="Line"></ej:Series>
         </Series>
        <Legend Visible="false" />
        <Zooming Enable="true" EnableMouseWheel="true" Type="x" EnableScrollbar="true" EnableDeferredZoom="false" />
        <Title Text="Server CPU Load" />
    </ej:Chart>
    </asp:content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
   <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Zoom Type
                        </div>
                        <div class="col-md-3">
                            <select name="selectIndex"  id="zoomtype">
								<option value="x">X</option>
                                <option value="y">Y</option>
								<option value="x,y">XY</option>
							</select>
                        </div>
                    </div>
					<div class="row">
						<div class="col-md-3">
							 Enable Zooming
						</div>
						<div class="col-md-3 aligntop">
                            <input type="checkbox" checked="checked" id="zoom"/>
						</div>
					</div>	
					<div class="row">
						<div class="col-md-3">
							 Mouse Wheel Zoom
						</div>
						<div class="col-md-3 aligntop">
                            <input type="checkbox" checked="checked" id="mouseZoom"/>
						</div>
					</div>	
					<div class="row">
						<div class="col-md-3">
							 Pinch Zoom
						</div>
						<div class="col-md-3 aligntop" >
                            <input type="checkbox" checked="checked" id="pinchZoom"/>
						</div>
					</div>					
					<div class="row">
						<div class="col-md-3">
							 Deferred Zoom
						</div>
						<div class="col-md-3 aligntop">
                            <input type="checkbox" id="deferredZoom"/>
						</div>
					</div>
					<div class="row">
						<div class="col-md-3">
							 Enable Scrollbar
						</div>
						<div class="col-md-3 aligntop">
                            <input type="checkbox" checked="checked" id="scrollbar"/>
						</div>
					</div>	
				</div>
				</div>	

    <script type="text/javascript">
        function chartload(sender) {
		    onChartLoad(sender);
            loadTheme(sender);
            var data = GetData();
            sender.model.series[0].dataSource = data.Open;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].yName = "YValue";
        }
        function GetData() {
            var series1 = [];
            var value = 100;
            for (var i = 1; i < 250; i++) {

                if (Math.random() > .5) {
                    value += Math.random();
                } else {
                    value -= Math.random();
                }
                var point = { XValue: new Date(1970, i + 2, i), YValue: value };
                series1.push(point);
            }

            var data = { Open: series1 };
            return data;
        }
        $('#zoomtype').change(function () {
            var chart = $("#container").ejChart('instance');
            var type = $('#zoomtype')[0].value;
            chart.model.zooming.type = type;
            chart.redraw();
        });

        $('#zoom').change(function () {
            var chart = $("#container").ejChart("instance");
            chart.model.zooming.enable = $('#zoom').is(":checked");
        });
        $('#mouseZoom').change(function () {
            var chart = $("#container").ejChart("instance");
            chart.model.zooming.enableMouseWheel = $('#mouseZoom').is(":checked");
        });
        $('#pinchZoom').change(function () {
            var chart = $("#container").ejChart("instance");
            chart.model.zooming.enablePinching = $('#pinchZoom').is(":checked");
        });
        $('#deferredZoom').change(function () {
            var chart = $("#container").ejChart("instance");
            chart.model.zooming.enableDeferredZoom = $('#deferredZoom').is(":checked");
        });

        $('#scrollbar').change(function () {
            var chart = $("#container").ejChart("instance");
            chart.model.zooming.enableScrollbar = $('#scrollbar').is(":checked");
            chart.redraw();
        });
        $("#sampleProperties").ejPropertiesPanel();
</script>     
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style class="cssStyles">
           
       .e-scrollbar .e-hscroll {
         border:1px solid #c8c8c8;
		 height:100%;
       }
       .e-scroller .e-hscroll .e-hup.e-button {
        width:16px !important;
       }
       .e-scrollbar .e-hscroll .e-icon { 
        height:15px !important;
       }
     </style>  
</asp:Content>

