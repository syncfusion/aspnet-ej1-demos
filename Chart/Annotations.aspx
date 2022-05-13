<%@ Page Title="Chart-Annotations-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This sample demonstrates how to render annotation for series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Annotations.aspx.cs" Inherits="WebSampleBrowser.Chart.Annotations" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ Chart Customization / Annotations</span>
</asp:Content> 
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div id= "watermark" style="font-size:100px; display:none">2014</div>

<div id= "hightemp" style="display:none" align="center">
<img style="width:50px;" src="../Content/images/chart/sun_annotation.png" />
<div>Highest<br/>Temperature</div>
</div>

<div id= "lowtemp" style="display:none;"align="center">
<img style="width:50px;" src="../Content/images/chart/rain_annotation.png">
<div>Lowest<br/>Temperature</div>
</div>
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Month" />
            <PrimaryYAxis Title-Text="Temperature (Fahrenheit)" />
            <CommonSeriesOptions EnableAnimation="True" Tooltip-Visible="false" 
                Tooltip-Format="#point.x# : #point.y# #series.name# Medals" PieCoefficient="0.5"  />
            <Series>
                  <ej:Series Name="Temperature" Fill="#55AAFF" XName="Xvalue" YName="YValue1" Marker-DataLabel-Visible="true" Marker-DataLabel-EnableContrastColor="true"
                      Marker-DataLabel-TextPosition="Middle"  Marker-DataLabel-VerticalTextAlignment="Near"> </ej:Series>
            </Series>
            <Title Text="Temperature flow over months"></Title>
            <Annotations>
                <ej:Annotations Visible="True" Content="watermark" Opacity="0.2" Region="Series"></ej:Annotations>
                <ej:Annotations Visible="True" Content="lowtemp" CoordinateUnit="Points" VerticalAlignment="Top" Margin-Bottom="5"></ej:Annotations> 
                  <ej:Annotations Visible="True" Content="hightemp" CoordinateUnit="Points" VerticalAlignment="Top" Margin-Bottom="5"></ej:Annotations> 
            </Annotations>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

