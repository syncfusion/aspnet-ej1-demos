<%@ Page Title="Chart-Trackball-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render trackball in Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Trackball.aspx.cs" Inherits="WebSampleBrowser.Chart.Trackball" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ User Interaction / Trackball</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
   <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div id="Tooltip" style="display: none;">
    <div id="icon">	
       <div id="sales"></div>
	</div>
        <div id="value">
            <div>
            <div id="efpercentage">#point.x#</div>
            <div id="ef">#point.y#</div>
            </div>
        </div>
    </div>
<ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
<ej:Chart ID="Chart1" OnClientLoad="onChartLoad" IsResponsive="true" Height="600" runat="server" Width="690">
    <PrimaryXAxis Title-Text="Year" ValueType="Datetime" IntervalType="Years" AxisLine-Visible="false" MajorGridLines-Visible="false" />
    <PrimaryYAxis Title-Text="Revenue" LabelFormat="{value}k" MajorTickLines-Visible="false" AxisLine-Visible="false" />
    <CommonSeriesOptions Type="Line" EnableAnimation="True" Width="3" Marker-Shape="Circle" Marker-Size-Height="6"
         Marker-Size-Width="6" Marker-Visible="true" Marker-Border-Color="white" Marker-Border-Width="3" />
    <Series>
           <ej:Series Name="John" XName="Xvalue" Tooltip-Visible="true"  YName="YValue1" />
           <ej:Series Name="Andrew" XName="Xvalue" Tooltip-Visible="true"  YName="YValue2" />
           <ej:Series Name="Thomas" XName="Xvalue" Tooltip-Visible="true"  YName="YValue3" />
           <ej:Series Name="Hendry" XName="Xvalue" Tooltip-Visible="true"  YName="YValue4" />
           <ej:Series Name="William" XName="Xvalue" Tooltip-Visible="true" YName="YValue5" />
    </Series>
    <Crosshair Visible="true" Type="Trackball" >
        <TrackballTooltipSettings Mode="Grouping">

        </TrackballTooltipSettings>
        </Crosshair>
    <Title Text="Average sales per person" />
    <Legend Visible="true" Shape="Circle" Position="Top" ItemStyle-Width="10" ItemStyle-Height="10" />
</ej:Chart>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
                 <div class="prop-grid">
                     <div class="row" style="margin: 10px 0;">
                         <div class="col-md-3">
                             Trackball Tooltip Mode
                         </div>
                         <div class="col-md-3 aligntop">
                             <select id="trackballmode" onchange="modeChange(this)">
                                 <option value="grouping">Grouping</option>
                                 <option value="float">Float</option>
                             </select>
                         </div>
                     </div>
                 </div>
            </div>
    
        <script type="text/javascript" >
           
            function modeChange(x) {
                var chartObj = $("#LayoutSection_ControlsSection_Chart1").ejChart("instance");
                chartObj.model.crosshair.trackballTooltipSettings.mode = x.value;
                if (x.value == "float") {
                    chartObj.model.crosshair.trackballTooltipSettings.tooltipTemplate = "Tooltip";
                } else {
                    chartObj.model.crosshair.trackballTooltipSettings.tooltipTemplate = null;
                }
                chartObj.redraw();
            }

        $("#sampleProperties").ejPropertiesPanel();
            </script>
    </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
          .tooltipDivChart1 {
            background-color:#C1272D !important;        
            color: white;
			width:100px;
        }
        #Tooltip >div:first-child {
            float: left;
        }
        #Tooltip #value {
            float: right;
            height: 38px;
            width: 60px;
        }
        #Tooltip #value >div {
            margin: 3px 5px 5px 5px;   
        }
        #Tooltip #efpercentage {
            font-size: 10px;
            font-family: segoe ui;
            color: white;
			font-weight: bold;
        }
         #Tooltip #ef {
             font-size: 10px;
             font-family: segoe ui;
			 font-weight: bold;
             color: white;
             
        }
         #sales {
            background-image: url("../Content/images/chart/buisnessman.png");
            height: 32px;
            width: 32px;
            background-repeat: no-repeat;
        }   
</style>
</asp:Content>

