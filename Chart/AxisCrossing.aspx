<%@ Page Title="Chart-Axis Crossing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render axis crossing Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AxisCrossing.aspx.cs" Inherits="WebSampleBrowser.Chart.AxisCrossing" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" OnClientLoad="onChartLoad" OnClientToolTipInitialize="tooltipInit" Width="700" Height="600" IsResponsive="true">
           <Margin Left="20" />
            <CommonSeriesOptions EnableAnimation="true">
                <Tooltip Visible="true"></Tooltip>
            </CommonSeriesOptions>
            <PrimaryXAxis CrossesAt="0">
                <Range Min="1998" Max="2012" Interval="2" />
            </PrimaryXAxis>
            <PrimaryYAxis LabelFormat="p0" Name="primaryYAxis" CrossesAt="2005">
                <Title Text="Profit / loss percentage"></Title>
                <Range Min="-1" Max="1" Interval="0.25" />
            </PrimaryYAxis>
            <Series>
                <ej:Series Name="Sales" Opacity="0.7" YAxisName="primaryYAxis" Type="Bubble">
                    <Points>
                        <ej:Points X="2000" Y="-.33" Fill="#E94649" Size="5"/>
                        <ej:Points X="2000.5" Y=".81" Fill="#F6B53F" Size="5"/>
                        <ej:Points X="2001" Y=".4" Fill="#6FAAB0" Size="5"/>
                        <ej:Points X="2001.5" Y="-.48" Fill="#C4C24A" Size="5"/>
                        <ej:Points X="2002" Y="-.19" Fill="#FB954F" Size="5"/>
                        <ej:Points X="2003" Y=".50" Fill="#D9CEB2" Size="5"/>
                        <ej:Points X="2006" Y=".62" Fill="#FF8D8D" Size="5"/>
                        <ej:Points X="2007" Y=".39" Fill="#69D2E7" Size="5"/>
                        <ej:Points X="2008" Y=".7" Fill="#E27F2D" Size="5"/>
                        <ej:Points X="2009" Y=".22" Fill="#6A4B82" Size="5"/>
                        <ej:Points X="2010" Y=".48" Fill="#4B4B82" Size="5"/>
			            <ej:Points X="2006.5" Y="-.62" Fill="#CF8D8D" Size="1"/>
			            <ej:Points X="2007.5" Y="-.39" Fill="#B9D2E7" Size="9"/>
                        <ej:Points X="2008.5" Y="-.7" Fill="#A27F2D" Size="6"/>
                        <ej:Points X="2009.5" Y="-.22" Fill="#CA4D82" Size="7"/>
                        <ej:Points X="2010.5" Y="-.48" Fill="#B64A82" Size="7"/>
                    </Points>
                </ej:Series>
            </Series>
            <Title Text="Sales Analysis">
                <SubTitle Text="Profit till 2010" TextAlignment="Center"></SubTitle>
            </Title>

            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
    <script type="text/javascript">
        function tooltipInit(args) {
            var point = args.model.series[args.data.seriesIndex].points[args.data.pointIndex];
            args.data.currentText = 'Sales in year ' + point.x + '<br/>Cost: ' + point.size + ' million(s)<br/>' + (point.y < 0 ? -point.y * 100 + ' % loss' : point.y * 100 + ' % profit');
        }
    </script>
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
								 Crosses At
							</div>
							<div class="col-md-3 aligntop">
							     <ej:NumericTextBox ID="xCrossingValue"  Value="0" MinValue="-100" MaxValue="100"  DecimalPlaces="0" IncrementStep ="25" Width="80px" Name="numeric" runat="server" ClientSideOnChange="xCrossingValue"/>
								
							</div>
						</div>
						<div class="row">
						<div class="col-md-3" style="width:80px">
								  Show Next to Axis Line
							</div>
							<div class="col-md-3 aligntop">
								  <input type="checkbox" style="margin-left:25px" id="myCheck1" name="ShowNextToAxisLine" onchange="axisCrossing()" checked >
							</div>
						</div>						
						<br/>
						<div class="row">
							<div class="col-md-3">
								   <b>Y-Axis</b>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								   Crosses At
							</div>
							<div class="col-md-3 aligntop">
								<ej:NumericTextBox ID="yCrossingValue" GroupSeparator='' Value="2005" MinValue="1998" MaxValue="2012"  DecimalPlaces="0"  Width="80px" Name="numeric" runat="server" ClientSideOnChange="yCrossingValue"/>
							</div>
						</div>					
						<div class="row">
						<div class="col-md-3" style="width:80px">
								  Show Next to Axis Line
							</div>
							<div class="col-md-3 aligntop">
								  <input type="checkbox" style="margin-left:25px" id="myCheck2" name="ShowNextToAxisLine" onchange="axisCrossing()" checked >
							</div>
						</div>
						<br/>
					</div>
</div>
    <script type="text/javascript">
       
	        function xCrossingValue(sender) {
			
		        $("#Chart1").ejChart("option", { primaryXAxis: { crossesAt :parseInt(sender.value)/100} });
           }

            function yCrossingValue(sender) {
    		    $("#Chart1").ejChart("option", { primaryYAxis: { crossesAt : parseInt(sender.value)} });
            }
			function axisCrossing()
			{
			    var chartobj = $("#Chart1").ejChart("instance");
				var xCrossValue = document.getElementById('xCrossingValue');
				var yCrossValue = document.getElementById('yCrossingValue');		
				if ($("#myCheck1").is(":checked"))
					chartobj.model.primaryXAxis.showNextToAxisLine = true;
				else 
					chartobj.model.primaryXAxis.showNextToAxisLine = false;		 		
				if ($("#myCheck2").is(":checked"))
					chartobj.model.primaryYAxis.showNextToAxisLine = true;
				else 
					chartobj.model.primaryYAxis.showNextToAxisLine = false;	
				$("#Chart1").ejChart("redraw");
			}
       
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:content>

