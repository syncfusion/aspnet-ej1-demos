<%@ Page Title="Chart-Line-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure line series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Chart.DefaultFunctionalities" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div id="Tooltip" style="display: none;">
		<div id="icon">	
          <div id="eficon"></div>
	    </div>
        <div id="value">
             <div>
                <label id="efpercentage">&nbsp;#point.y#</label>
                <label id="ef">Efficiency</label>
             </div>
        </div>

    </div>
  <div id="container">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
      <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
      <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" >
           <PrimaryXAxis Title-Text="Year" Valuetype="Category"/>
           <PrimaryYAxis LabelFormat="{value}%" RangePadding="Round" Title-Text="Efficiency"/>
           <CommonSeriesOptions Type="Line" DoughnutSize="0.2" Tooltip-Visible="true" Tooltip-Template="Tooltip" Marker-Size-Height="10" 
               Marker-Size-Width="10" Marker-Border-Width="2"  Marker-Visible="true" EnableAnimation="True"/>
           <Series>
             <ej:Series Name="India" XName="Xvalue" YName="YValue1"></ej:Series>
             <ej:Series Name="Germany" XName="Xvalue" YName="YValue2"></ej:Series>
             <ej:Series Name="England" XName="Xvalue" YName="YValue3"></ej:Series>
             <ej:Series Name="France" XName="Xvalue" YName="YValue4"></ej:Series>
           </Series>
           <Legend Visible="true"></Legend>
          <Title Text="Efficiency of oil-fired power production"></Title>
      </ej:Chart>
  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
        label {
		margin-bottom : -25px !important ;
		text-align :center !important;
		}
        .tooltipDivChart1 {
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
            width: 68px;
        }
        #Tooltip #value >div {
            margin: 5px 5px 5px 5px;
            
        }
        #Tooltip #efpercentage {
            font-size: 20px;
            font-family: segoe ui;
			padding-left: 2px;
        }
         #Tooltip #ef {
             font-size: 12px;
             font-family: segoe ui;
        }
        #eficon {
            background-image: url("../Content/images/chart/eficon.png");
            height: 60px;
           
            width: 60px;
            background-repeat: no-repeat;
        }
       
     </style>
</asp:Content>

