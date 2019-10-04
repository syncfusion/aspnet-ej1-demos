<%@ Page Title="Chart-Trendlines-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure trendline series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true"  MasterPageFile="~/Samplebrowser.Master" CodeBehind="Trendlines.aspx.cs" Inherits="WebSampleBrowser.Chart.Trendlines" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
       <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
       <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="chartLoad">
           
            <PrimaryYAxis>
                <Title Text="Rupees against Dollars"></Title>
            </PrimaryYAxis>
          
              <Series>
                 <ej:Series Name="Rupees"  Fill="#0066FF"  Type="Scatter" EnableAnimation="true">
                     <Trendlines>
                         <ej:Trendlines Visibility="visible" Fill="#99CCFF" Name="Linear" Type="Linear" />
                     </Trendlines>
                     <Tooltip Visible="true"></Tooltip>
                 </ej:Series>
              </Series>
            <Title Text="Historical Indian Rupee Rate (INR USD)"></Title>
            <Legend Visible="true" Shape="SeriesType"></Legend>
        </ej:Chart> 
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
         <div id="sampleProperties">
        <div class="prop-grid">
				<div class="row">
				<div class="col-md-3">
						<div style="padding-top:5px">Trendline Type:</div>
					</div>
					<div class="col-md-3 aligntop">
						<select style="width:100px" name="Trendline" autocomplete="off" id="trendlineType">
							<option>Linear</option>
							<option>Exponential</option>
							<option>Logarithmic</option>
							<option>Power</option>
							<option>Polynomial</option>
                            <option>MovingAverage</option>
						</select>
					</div>
					</div>
			   <div class="row">
					<div class="col-md-3">
						<div style="padding-top:5px">Forward Forecast:</div>
					</div>
					<div class="col-md-3 aligntop">
					<input type="text" id="forwardCast" onchange="forwardForecast(this)" style="width:95px; height:22px;" value=0 />
					</div>
				</div>	
                <div class="row">
					<div class="col-md-3">
						Backward Forecast:
					</div>
					<div class="col-md-3 aligntop">
					<input type="text" id="backwardCast" onchange="backwardForecast(this)" style="width:95px; height:22px;" value=0 />
					</div>
				</div>	
               <div class="row">
					<div class="col-md-3">
						<div style="padding-top:5px">Polynomial Order:</div>
					</div>
					<div class="col-md-3 aligntop">
					<input type="text" id="polyOrder" disabled onchange="polynomialOrder(this)" style="width:95px; height:22px;" value=2 />
					</div>
				</div>
                 <div class="row">
					<div class="col-md-3">
						<div style="padding-top:5px">Period:</div>
					</div>
					<div class="col-md-3 aligntop">
					<input type="text" id="period" disabled onchange="periodChange(this)" style="width:95px; height:22px;" value=2 />
					</div>
				</div>
				</div>
         </div>				
    <script type="text/javascript">
       
	   var powerData = getPowerTrendData();
	   var data = getData();
        function chartLoad(sender) {
		    onChartLoad(sender);
            
            sender.model.series[0].dataSource = data.Open;
            sender.model.series[0].xName = "XValue";
            sender.model.series[0].yName = "YValue";
        }

        function getData() {
            var series1 = [];
            var yValue = [7.66, 8.03, 8.41, 8.97, 8.77, 8.20, 8.16, 7.89, 8.68, 9.48, 10.11, 11.36, 12.34, 12.60, 12.95, 13.91, 16.21, 17.50, 22.72, 28.14, 31.26, 31.39, 32.43, 35.52, 36.36,
                         41.33, 43.12, 45.00, 47.23, 48.62, 46.60, 45.28, 44.01, 45.17, 41.20, 43.41, 48.32, 45.65, 46.61, 53.34, 58.53];
            var j = 0;
            for (var i = 1973; i <= 2013; i++) {
                var point1 = { XValue: i, YValue: yValue[j] };
                series1.push(point1);
                j = j + 1;
            }
            var data = { Open: series1 };
            return data;
        }

		 function getPowerTrendData(){
		   var data = [
		   { XValue: 1, YValue: 10 },
		   { XValue: 2, YValue: 50 },
		   { XValue: 3, YValue: 80 },
		   { XValue: 4, YValue: 110 },
		   { XValue: 5, YValue: 180 },
		   { XValue: 6, YValue: 220 },
		   { XValue: 7, YValue: 300 },
		   { XValue: 8, YValue: 370 },
		   { XValue: 9, YValue: 490 },
		   { XValue: 10, YValue: 500 }
		              ];
		   return data;
		 }
		 
        //Change trendline type
        $('#trendlineType').change(function () {
           var type = $("#trendlineType option:selected").text();
           var chart = $("#Chart1").ejChart("instance");
		   chart.model.series[0].points = [];
		  if(type.toLowerCase() != "power"){
		     chart.model.series[0].dataSource = data.Open;
			 chart.model.series[0].name = "Rupees";
			 chart.model.series[0].trendlines[0].name = type;
			 chart.model.primaryXAxis.title.text = "Years";
			 chart.model.primaryYAxis.title.text = "Rupees against Dollars";
			 chart.model.title.text = 'Historical Indian Rupee Rate (INR USD)';
			 
		   }
		  else {	 
		     chart.model.series[0].dataSource = powerData;
			 chart.model.series[0].name = "Meters";
			 chart.model.series[0].trendlines[0].name = type + "(Meters)";
			  chart.model.primaryXAxis.title.text = "Seconds";
			  chart.model.primaryYAxis.title.text = "Meters";
			  chart.model.title.text = 'Distance Measurement';
		   }
		  
		  chart.model.series[0].trendlines[0].type = type.toLowerCase();
            if (type == "MovingAverage") {
                $("#forwardCast").attr("disabled", true);
                $("#backwardCast").attr("disabled", true);
                $("#polyOrder").attr("disabled", true);
                $("#period").attr("disabled", false);
            } else if (type == "Polynomial") {
                $("#forwardCast").attr("disabled", false);
                $("#backwardCast").attr("disabled", false);
                $("#polyOrder").attr("disabled", false);
                $("#period").attr("disabled", true);
            } else {
                $("#forwardCast").attr("disabled", false);
                $("#backwardCast").attr("disabled", false);
                $("#polyOrder").attr("disabled", true);
                $("#period").attr("disabled", true);
            }
            chart.redraw()
        });

        function forwardForecast(sender) {
            var chart = $("#Chart1").ejChart("instance");
           var value = (sender.value == "") ? 0 : sender.value;
       chart.model.series[0].trendlines[0].forwardForecast=parseFloat(value);
            chart.redraw();
        }
        function backwardForecast(sender) {
            var chart = $("#Chart1").ejChart("instance");
             var value = (sender.value == "") ? 0 : sender.value;
       chart.model.series[0].trendlines[0].backwardForecast=parseFloat(value);
            chart.redraw();
        }
        function polynomialOrder(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].trendlines[0].polynomialOrder = parseInt(sender.value);
            chart.redraw();
        }
        function periodChange(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].trendlines[0].period = parseInt(sender.value);
            chart.redraw();
        }
        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>


