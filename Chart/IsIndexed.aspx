<%@ Page Title="Chart-Indexed Category Axis-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure indexed axis using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="IsIndexed.aspx.cs" Inherits="WebSampleBrowser.Chart.IsIndexed" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Days" IsIndexed="true" LabelIntersectAction="trim" LabelPlacement="betweenticks" CrosshairLabel-Visible="true" />
            <PrimaryYAxis Title-Text="Sales" LabelFormat="{value}$" />
            <CommonSeriesOptions  Type="Column" >  

            </CommonSeriesOptions>
            <Series>
                  <ej:Series Name="Product X" XName="Xvalue" YName="YValue1" Opacity="0.8" ></ej:Series>
                  <ej:Series Name="Product Y" XName="Xvalue" YName="YValue2"  ></ej:Series>
                  <ej:Series Name="Product Z" XName="Xvalue" YName="YValue3"  ></ej:Series>
            </Series>
            <Crosshair visible="true" type="trackball"></Crosshair>
            <Title Text="Weekly Products Sales Comparison"></Title>
            <Legend visible="true" Position="Bottom"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                 <div class="col-md-3 aligntop">
                      Indexed : <input type="checkbox" checked onchange="isindex(this)" />
                 </div>
             </div>	
        
			 </div>
        </div>
        <script type="text/javascript" >
            function isindex(tis) {
                var chart = $("#Chart1").ejChart("instance");
                chart.model.primaryXAxis.isIndexed = tis.checked;
                $("#Chart1").ejChart("redraw");
            }
            $("#sampleProperties").ejPropertiesPanel();
            </script>
    
    </asp:Content>

