<%@ Page Title="Chart-Tooltip Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to customize tooltip template of Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TooltipTemplate.aspx.cs" Inherits="WebSampleBrowser.Chart.TooltipTemplate" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
 <script type="text/javascript" src="../Scripts/ChartData.js"></script>
<div id="Tooltip" style="display: none;">
	<div id="icon">	
       <div id="grain"></div>
	</div>
        <div id="value">
            <div>
            <div id="efpercentage">#point.x#</div>
            <div id="ef">#point.y#</div>
            </div>
        </div>
    </div>
 <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" OnClientLoad="onChartLoad" Width="970" Height="600" IsResponsive="true" 
            BackgroundImgUrl="../Content/images/chart/wheat.png">
            <PrimaryXAxis AxisLine-Color="#EFEFEF" AxisLine-Width="3" MajorGridLines-Visible="false" Font-Color="white"
                 Font-FontSize="15px" HidePartialLabels="true" MajorTickLines-Visible="true" />
            <PrimaryYAxis LabelFormat="{value}" Title-Text="Billion Bushels" Title-Font-Color="white" 
                Font-FontSize="15px" Font-Color="#ffffff" MajorGridLines-Width="2" MajorGridLines-Color="#EFEFEF" 
                MajorTickLines-Visible="true" AxisLine-Color="#EFEFEF" AxisLine-Width="3" />
            <CommonSeriesOptions Type="Line" EnableAnimation="true" Border-Width="3" Fill="#333333" 
                Marker-Shape="Circle" Marker-Size-Width="6" Marker-Size-Height="6" Marker-Visible="true"
                Marker-Fill="#C1272D" Marker-Border-Color="#333333" Marker-Border-Width="2" />
           <Series>
              <ej:Series Name="India" XName="Xvalue" YName="YValue1" Tooltip-Visible="true" Tooltip-Template="Tooltip">
              </ej:Series>
             </Series>
            <Title Text="USA wheat production" Font-Color="#333333"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
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
            height: 50px;
            width: 50px;
            background-color:#C1272D
        }
        #Tooltip #value >div {
            margin: 3px 5px 5px 5px;
            
        }
        #Tooltip #efpercentage {
            font-size: 12px;
            font-family: segoe ui;
            color:#E7C554;
			font-weight: bold;
        }
         #Tooltip #ef {
             font-size: 20px;
             font-family: segoe ui;
			 font-weight: bold;
             
        }
        #grain {
            background-image: url("../Content/images/chart/grain.png");
            height: 50px;
            width: 50px;
            background-repeat: no-repeat;
        }
</style>
</asp:Content>

