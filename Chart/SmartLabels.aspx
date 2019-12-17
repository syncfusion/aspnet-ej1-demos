<%@ Page Title="Chart-Smart Labels-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This sample demonstrates how to render smart data labels for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SmartLabels.aspx.cs" Inherits="WebSampleBrowser.Chart.SmartLabels" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
  <div id="container">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
      <ej:Chart ID="Chart1" runat="server" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" >
           <PrimaryXAxis Title-Text="Years" EdgeLabelPlacement="hide"/>
           <PrimaryYAxis LabelFormat="{value}%" Title-Text="Profit percentage"/>
           <CommonSeriesOptions Type="Line" Border-Width="2" Tooltip-Visible="true" Marker-Size-Height="8" 
               Marker-Size-Width="8" Marker-DataLabel-Visible="true" Marker-DataLabel-EnableContrastColor="true"
                Marker-DataLabel-Shape="rectangle"  Marker-DataLabel-ConnectorLine-Width="1" Marker-Visible="true" EnableAnimation="True"/>
           <Series>
             <ej:Series EnableSmartLabels="True" Name="Profit percentage" Fill="#1ab0b0" XName="Xvalue" YName="YValue1"></ej:Series>
           </Series>
          <Title Text="Sum of profit percentage from various share investments"></Title>
          <Legend Visible="false"></Legend>
      </ej:Chart>
  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">

</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
     <div class="row">
          <div><br/><center>
               <input type="checkbox" id="enableSmartLabels" value="enableSmartLabels" checked> EnableSmartLabels
             </center>
          </div>
      </div>
     </div>
    <script type="text/javascript">
        $("#enableSmartLabels").change(function () {
            var chart = $(".e-datavisualization-chart").ejChart("instance");
            if ($("#enableSmartLabels").is(":checked"))
                chart.model.series[0].enableSmartLabels = true;
            else 
                chart.model.series[0].enableSmartLabels = false;
            chart.redraw();
        });

        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>

