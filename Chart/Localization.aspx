<%@ Page Title="Chart-Localization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to localize texts using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Localization.aspx.cs" Inherits="WebSampleBrowser.Chart.Localization" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
    <div>
    <script src="../Scripts/cultures/ej.culture.en-US.min.js"></script>
    <script src="../Scripts/cultures/ej.culture.fr-FR.min.js"></script>
    <script src="../Scripts/cultures/ej.culture.vi-VN.min.js"></script>
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" Locale="en-US" IsResponsive="true" Height="600" OnClientLoad="chartload"
             OnClientDisplayTextRendering="ondataLabel" runat="server" Width="690">
            <Title Text="Metrics based on day of the week" />
            <Legend Visible="true" Position="Right" Alignment="Near" />
            <PrimaryXAxis LabelFormat="dddd" ValueType="Category" IsInversed="true" />
            <PrimaryYAxis Title-Text="Open and Click Rate(%)" RangePadding="Additional" />
            <CommonSeriesOptions EnableAnimation="True"></CommonSeriesOptions>
            <Series>
             <ej:Series Name="Open" XName="Xvalue" YName="YValue1" Type="Bar" Tooltip-Visible="true"  
                 Marker-DataLabel-EnableContrastColor="true"
                 Marker-DataLabel-Font-FontStyle="Italic"  Marker-DataLabel-Font-FontSize="13" 
                  Marker-DataLabel-TextPosition="Top" Marker-DataLabel-Visible="true"
                  Marker-DataLabel-Offset="3"></ej:Series>
             <ej:Series Name="Click" XName="Xvalue" YName="YValue2" Type="Bar" Tooltip-Visible="true" 
                 Marker-DataLabel-EnableContrastColor="true"
                 Marker-DataLabel-Font-FontStyle="Italic"  Marker-DataLabel-Font-FontSize="13"
                  Marker-DataLabel-TextPosition="Top" Marker-DataLabel-Visible="true"
                 Marker-DataLabel-Offset="3"></ej:Series>      
           </Series>
        </ej:Chart>
        <script>

            var data;
            function chartload(sender) {
                onChartLoad(sender);
                loadTheme(sender);
                data = GetData();
                sender.model.series[0].dataSource = data.Ser1;
                sender.model.series[0].xName = "x";
                sender.model.series[0].yName = "y";
                sender.model.series[1].dataSource = data.Ser2;
                sender.model.series[1].xName = "x";
                sender.model.series[1].yName = "y";
            }
            function GetData() {

                var series1 = [];
                var series2 = [];
                var value = 100;
                var value1 = 120;

                series1.push({ x: new Date(2000, 03, 10), y: 33.85 });
                series1.push({ x: new Date(2000, 03, 11), y: 32.77 });
                series1.push({ x: new Date(2000, 03, 12), y: 33.97 });
                series1.push({ x: new Date(2000, 03, 13), y: 32.96 });
                series1.push({ x: new Date(2000, 03, 14), y: 35.19 });

                series2.push({ x: new Date(2000, 03, 10), y: 18.52 });
                series2.push({ x: new Date(2000, 03, 11), y: 18.96 });
                series2.push({ x: new Date(2000, 03, 12), y: 19.85 });
                series2.push({ x: new Date(2000, 03, 13), y: 19.72 });
                series2.push({ x: new Date(2000, 03, 14), y: 19.24 });

                data = { Ser1: series1, Ser2: series2 };
                return data;
            }
            function ondataLabel(sender) {
                sender.data.text = sender.data.text + "%";
                sender.data.location.x = sender.data.location.x + 8;
            }
        </script>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
<div id="sampleProperties">
        <div class="prop-grid">
               <div class="row">
                     <div class="col-md-3">
                           Localization
                     </div>
                      <div class="col-md-3">
                          <select id="options" autocomplete="off">                                       
                             <option value="en-US">en-US</option>
                             <option value="vi-VN">vi-VN</option>                                     
                             <option value="fr-FR">fr-FR</option>
                          </select>
                      </div>
                </div>
        </div>
</div>
    <script>
      $('#options').change(function (args) {
            var cul = args.target.value;
            $("#Chart1").ejChart("option", { "model": { locale: cul } });

        });
        $("#sampleProperties").ejPropertiesPanel();
     </script>
</asp:Content>

