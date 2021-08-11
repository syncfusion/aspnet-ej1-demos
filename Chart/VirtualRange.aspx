<%@ Page Title="Chart-Lazy Loading-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to configure virtual range for axis using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="VirtualRange.aspx.cs" Inherits="WebSampleBrowser.Chart.VirtualRange" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div style= "height:600px;">
        <ej:Chart  ID="container" runat="server" ClientIDMode="Static" OnClientLoad="chartload" OnClientScrollStart="scrollStart" OnClientScrollEnd="scrollEnd" Height="600" IsResponsive="true">
          <PrimaryXAxis ValueType="Datetime" LabelFormat="MMM-yy">
              <Title Text="Date"></Title>
          </PrimaryXAxis>
           <PrimaryYAxis LabelFormat="{value}MB">
               <Title Text="Server Load (MBytes)"></Title>
           </PrimaryYAxis>
           <Series>
                <ej:Series Name="Temperature" Type="Line" EnableAnimation="False"/>
           </Series>
           <Title Text="Network Load"></Title>
           <Legend Visible="false"></Legend>
            <Crosshair Visible="true" Type="Trackball"></Crosshair>
        </ej:Chart>
           
    </div>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
       .e-waitpopup-pane
			{
				background-color:transparent !important;
			}
    </style>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
   <div id="sampleProperties">
					<div class="prop-grid">
						 <div class="row">
							<div class="col-md-3">
								Lazy Load
							</div>
							<div class="col-md-3 aligntop">
								<select name="selectIndex" id="type">
									<option value="range">Range</option>
									<option value="length">Points Length</option>
								</select>
							</div>
						</div>
						<div class="row" id="sdt">                        
							<div class="col-md-3">
								Min
							</div>
							<div class="col-md-3">
                                <ej:DatePicker runat="server" ID="startDateTime" ClientIDMode="Static" Width=110  Value="1/1/2009" MinDate="1/1/2000" MaxDate="1/1/2009" ClientSideOnChange="startChange"></ej:DatePicker>
                           </div>  							
						</div>
						<div class="row"  id="edt">
							<div class="col-md-3">
								Max
							</div>
							<div class="col-md-3">
                                <ej:DatePicker runat="server" ID="endDateTime" ClientIDMode="Static" Width=110 Value="1/1/2014" MinDate="1/1/2009" MaxDate="1/1/2019" ClientSideOnChange="endChange"></ej:DatePicker>
							</div> 
						</div>
						<div class="row"  id="point" >
							<div class="col-md-3">
								Points Length
							</div>
							<div class="col-md-3 aligntop">
                                <ej:NumericTextBox Enabled="false" runat="server" ID="numeric" ClientIDMode="Static" Width=110 Value=1000 MinValue=1000 MaxValue=10000000 ClientSideOnChange="startPoints"></ej:NumericTextBox>
                           </div>
						</div>
					</div>
				</div>	
    				
    <script type="text/javascript">
        
        
       var startDate = "1/1/2009";
			var endDate = "1/1/2014";
			var pointLenght = 1000;
            function startPoints(e) {
			    var chart = $("#container").ejChart('instance');
			    chart.model.primaryXAxis.scrollbarSettings.range.min = null;
			    chart.model.primaryXAxis.scrollbarSettings.range.max = null;
			    chart.model.primaryXAxis.valueType = 'double';
			    chart.model.primaryXAxis.labelFormat = '';
			    pointLenght = e.value;
			    chart.model.primaryXAxis.scrollbarSettings.pointsLength = e.value;
			    var data = GetNumericData(0, 300);
			    chart.model.series[0].dataSource = data.Open;
			    chart.model.series[0].xName = "XValue";
			    chart.model.series[0].yName = "YValue";
			    chart.redraw();
			}

			$('#type').change(function () {
			    var chart = $("#container").ejChart("instance");
			    if ($('#type')[0].value.toLowerCase() == "range") {
			        $('#startDateTime').data('ejDatePicker').enable();
			        $('#endDateTime').data('ejDatePicker').enable();
			        $("#numeric").data("ejNumericTextbox").disable();
			        chart.model.primaryXAxis.scrollbarSettings.range.min = startDate;
			        chart.model.primaryXAxis.scrollbarSettings.range.max = endDate;
			        chart.model.primaryXAxis.valueType = 'datetime';
			        chart.model.primaryXAxis.labelFormat = 'MMM-yy';
			        chart.model.primaryXAxis.scrollbarSettings.pointsLength = null;
			        var data = GetDateTimeData(new Date(2009,0,1), new Date(2009,10,1));
			        chart.model.series[0].dataSource = data.Open;
			        chart.model.series[0].xName = "XValue";
			        chart.model.series[0].yName = "YValue";
			    }
			    else {
			        $('#startDateTime').data('ejDatePicker').disable();
			        $('#endDateTime').data('ejDatePicker').disable();
			        $("#numeric").data("ejNumericTextbox").enable();
			        chart.model.primaryXAxis.scrollbarSettings.range.min = null;
			        chart.model.primaryXAxis.scrollbarSettings.range.max = null;
			        chart.model.primaryXAxis.valueType = 'double';
			        chart.model.primaryXAxis.labelFormat = '';
			        chart.model.primaryXAxis.scrollbarSettings.pointsLength = pointLenght;
			        var data = GetNumericData(0, 300);
			        chart.model.series[0].dataSource = data.Open;
			        chart.model.series[0].xName = "XValue";
			        chart.model.series[0].yName = "YValue";
			    }
			    chart.redraw();

			});
			function startChange(e){
			    var chart = $("#container").ejChart('instance');
			    startDate = e.value;
					chart.model.primaryXAxis.scrollbarSettings.range.min = e.value;
					chart.redraw();
			}
			function endChange(e){
			
			    var chart = $("#container").ejChart('instance');
			    endDate = e.value;
					chart.model.primaryXAxis.scrollbarSettings.range.max = e.value;
					chart.redraw();
			
			}
			
			function chartload(sender) {
			    onChartLoad(sender);
			    loadTheme(sender);
			    var data = GetDateTimeData(new Date(2009,0,1), new Date(2009,10,1));
				sender.model.series[0].dataSource = data.Open;
				sender.model.series[0].xName = "XValue";
				sender.model.series[0].yName = "YValue";
			}
		
			function scrollStart(sender) {
				$("#container").ejWaitingPopup();
				$("#container").ejWaitingPopup("show");
			}
		
			function scrollEnd(sender) {
			    $("#container").ejWaitingPopup("hide");
			    var data;
                if(sender.data.axis.scrollbarSettings.pointsLength != null)
                    data = GetNumericData(sender.data.newRange.start, sender.data.newRange.end);
			    else
                    data = GetDateTimeData(new Date(sender.data.newRange.start), new Date(sender.data.newRange.end));
                sender.model.series[0].dataSource = data.Open;
               $("#container").ejChart("instance").redraw();
			}

			function GetNumericData(start, end) {
			    var series1 = [];
			    var value = 30;

			    for (var i = start; i <= end; i++) {
			        if (Math.random() > .5) {
			            value += (Math.random() * 10 - 5);
			        } else {
			            value -= (Math.random() * 10 - 5)
			        }
					if(value < 0)
						value = getRandomInt(20,40);
			        var point = { XValue: i, YValue: Math.round(value) };
			        series1.push(point);
			    }
			    var data = { Open: series1 };

			    return data;
			}
		
			function GetDateTimeData(start, end) {
				var series1 = [], date, data1;
				var value = 30;
	
				for (var i = 0; start <= end; i++) {
					date = Date.parse(start);
					if (Math.random() > .5) {
						value += (Math.random() * 10 - 5);
					} else {
						value -= (Math.random() * 10 - 5)
					}
					if(value < 0){
						value = getRandomInt(20,40);
					}
					var point1 = { XValue: new Date(date), YValue: Math.round(value) };
					new Date(start.setDate(start.getDate() + 1));
					series1.push(point1);
				}
		
				data1 = { Open: series1 };
				return data1;
			}
	
			function getRandomInt(min, max) {
				return Math.floor(Math.random() * (max - min + 1)) + min;
			}
		
			$(window).mouseup(function(){
				$("#container").ejWaitingPopup();
				$("#container").ejWaitingPopup("hide");
			});

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>


