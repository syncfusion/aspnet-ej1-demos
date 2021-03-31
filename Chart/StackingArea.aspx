<%@ Page Title="Chart-Stacked Area-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render stacked area series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="StackingArea.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingArea" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
 <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" ClientIDMode="Static" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Year" AxisLine-Visible="false" MajorGridLines-Visible="false" MajorTickLines-Visible="false" />
            <PrimaryYAxis Title-Text="Production in %" LabelFormat="{value} %" />
            <CommonSeriesOptions EnableAnimation="True" Type="StackingArea" Opacity="0.5" Border-Color="transparent" />
            <Series>
             <ej:Series Name="US" XName="Xvalue" YName="YValue1" Fill="#C4C24A"></ej:Series>
             <ej:Series Name="Indonesia" XName="Xvalue" YName="YValue2" Fill="#69D2E7"></ej:Series>
             <ej:Series Name="Russia" XName="Xvalue" YName="YValue3" Fill="#6A4B82"></ej:Series>
             <ej:Series Name="Bangladesh" XName="Xvalue" YName="YValue4" Fill="#E7B0B2"></ej:Series>
            </Series>
            <Title Text="Industrial Production Growth"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                    Series Type
                </div>
                <div class="col-md-3">
                    <div id="dropdown">
                        <select id="seriestype">
                            <option value="stackingarea">Stacked Area</option>
                            <option value="stackingsplinearea">Stacked Spline Area</option>
                            <option value="stackingsplinearea100">100% Stacked Spline Area</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">

        function changeSeriestype(e) {
            if (e.value == "stackingsplinearea100")
                $('#Chart1').ejChart('option', { primaryYAxis: { range: { min: 0, max: 100, interval: 10 } } });
            else
                $('#Chart1').ejChart('option', { primaryYAxis: { range: { min: 0, max: 30, interval: 5 } } });
            $('#Chart1').ejChart('option', { commonSeriesOptions: { type: e.value } });
        }

        $("#seriestype").ejDropDownList({ "change": "changeSeriestype", width: "100px", selectedItemIndex: 0 });

        $("#sampleProperties").ejPropertiesPanel();

        
    </script>
  </asp:Content> 


