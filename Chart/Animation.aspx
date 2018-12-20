<%@ Page Title="Chart-Animation-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to animate Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="WebSampleBrowser.Chart.Animation" %>


<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
        label{
		margin-bottom : -25px !important ;
		text-align :center !important;
		}
        .tooltipDiv {
            background-color:#E94649;        
            color: white;
			width:130px;
        }
        #Tooltip >div:first-child {
            float: left;
        }
        #Tooltip #value {
            float: right;
            height: 50px;
            width: 60px;
        }
        #Tooltip #value >div {
            margin: 5px 5px 5px 5px;            
        }
        #Tooltip #no-of-airports {
            font-size: 20px;
            font-family: segoe ui;
			padding-left: 2px;
			color: #ffffff;
        }
         #Tooltip #airport {
            font-size: 12px;
            font-family: segoe ui;
			color: #ffffff;
        }
        #airplaneicon {			
            background-image: url("../Content/images/chart/airplane.png");
            height: 60px;           
            width: 60px;
            background-repeat: no-repeat;
        }		 
    </style>
    
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
     <div id="Tooltip" style="display: none;">
		<div id="icon">	
            <div id="airplaneicon">
			</div>
	    </div>
        <div id="value">
            <div>
                <label id="no-of-airports">&nbsp;#point.y#
			   </label>
               <label id="airport">Airports
			   </label>
            </div>
        </div>
    </div>
    <div>
      <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
      <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" >
           <PrimaryXAxis Title-Text="Countries" LabelIntersectAction="Trim"/>
           <PrimaryYAxis Title-Text="Number of airports"/>
            <Series>
             <ej:Series Name="Airports" DrawType="Column"  XName="Xvalue" YName="YValue1" EnableAnimation="true" Type="Spline" Fill="#5e35b1">
                 <Tooltip Visible="true" Template="Tooltip"></Tooltip>
                 <Marker Shape="Circle" Size-Width="10" Size-Height="10" Visible="true"></Marker>
                 <Points>
                     <ej:Points Size="1.8" X="Australia" Y="480"/> 
                        <ej:Points  Size="2" X="China" Y="507"/>  
                        <ej:Points Size="1.7" X="France" Y="464"/>  
                        <ej:Points Size="2.4" X="Germany" Y="539"/>  
                        <ej:Points Size="1" X="India" Y="346"/>  
                        <ej:Points Size="3" X="Indonesia" Y="663"/>  
                        <ej:Points Size="0.6" X="Saudi Arabia" Y="214"/>  
                        <ej:Points Size="2.6" X="South Africa" Y="566"/>  
                        <ej:Points Size="1.7" X="United Kingdom" Y="460"/>  
                        <ej:Points Size="1.6"  X="Venezuela" Y="444"/>  
                       
                 </Points>
             </ej:Series>            
           </Series>
           <Legend Visible="false"></Legend>
          <Title Text="Total number of Airports in various countries"></Title>
      </ej:Chart>
  </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Series Type
                        </div>
                        <div class="col-md-3">
                            <select name="selectIndex" autocomplete="off" id="seriestype">
								<option value="spline">Spline</option>
                                <option value="area">Area</option>
								<option value="column">Column</option>
								<option value="bar">Bar</option>
								<option value="scatter">Scatter</option>
								<option value="bubble">Bubble</option>
                                <option value="pie">Pie</option>
								<option value="doughnut">Doughnut</option>
								<option value="polar">Polar</option>
                            </select>
                        </div>
                    </div>
					<div class="row">
						<div class="col-md-3">
							 Series Animation
						</div>
						<div class="col-md-3 aligntop">
                            <input type="checkbox" checked="checked" id="series"/>
						</div>
					</div>					
                    <div class="row">
						<div class="col-md-3">
							 Animation Duration
						</div>
						<div class="col-md-3 aligntop">
                           <ej:NumericTextBox ID="duration" GroupSeparator='' Value="2000" MinValue="0" MaxValue="5000" IncrementStep ="500" Width="85px" Name="numeric" runat="server" ClientSideOnChange="animationDuration" />
						</div>
					</div>	
				</div>
			</div>	
    <script type="text/javascript">
        $('#seriestype').change(function () {
            var chart = $("#Chart1").ejChart('instance');
            var type = $('#seriestype')[0].value;
            chart.model.series[0].type = type;
            if (type == 'column' || type == "bar" || type == "bubble" || type == "polar")
                chart.model.series[0].marker.visible = false;
            else
                chart.model.series[0].marker.visible = true;
            chart.redraw();
        });

        $('#series').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].enableAnimation = $('#series').is(":checked");
            if ($('#series').is(":checked"))
                chart.animate();
        });

        function animationDuration(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].animationDuration = parseInt(sender.value);
            chart.animate();
        }
        $("#sampleProperties").ejPropertiesPanel();
     </script>
</asp:Content>

