<%@ Page Title="Chart-Multiple Axes-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render multiple axes using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultipleAxes.aspx.cs" Inherits="WebSampleBrowser.Chart.MultipleAxes" %>
<%@ Register Assembly="Syncfusion.EJ.Web" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <RowDefinitions>
                <ej:RowDefinitions Unit="percentage" RowHeight="48" LineWidth="10" LineColor="gray" />
                <ej:RowDefinitions Unit="percentage" RowHeight="48" LineWidth="5" LineColor="#A8A8A8" />
            </RowDefinitions>
            <PrimaryXAxis Title-Text="Month" />
            <PrimaryYAxis AxisLine-Visible="false" Title-Text="Temperature(Fahrenheit)" LabelFormat="{value}F" />
            <Axes>
                <ej:Axis MajorGridLines-Visible="false" Orientation="Vertical" RowIndex="1" OpposedPosition="true" 
                    AxisLine-Visible="false" Name="yAxis" LabelFormat="{value}C" Title-Text="Temperature(Celsius)" />
                <ej:Axis RowIndex="1" PlotOffset="15" Orientation="Vertical" OpposedPosition="false" 
                    AxisLine-Visible="false" Name="yAxis1" LabelFormat="{value}K" Title-Text="Temperature(Kelvin)" />
            </Axes>
            <CommonSeriesOptions EnableAnimation="True"></CommonSeriesOptions>
           <Series>
             <ej:Series Name="Germany" XName="Xvalue" YName="YValue1"  Fill="#69D2E7" 
                  Tooltip-Visible="true" Tooltip-Format="#series.name#  <br/> #point.x# : #point.y#"></ej:Series>
             <ej:Series Name="India" XName="Xvalue" YName="YValue2" Type="Line" YAxisName="yAxis"
                  Marker-Size-Width="6" Marker-Size-Height="6" Marker-Visible="true" Marker-Shape="Circle" 
                  Tooltip-Visible="true" Tooltip-Format="#series.name#  <br/> #point.x# : #point.y# "></ej:Series>
             <ej:Series Name="Canada" XName="Xvalue" YName="YValue3" Type="Line" YAxisName="yAxis" 
                  Marker-Size-Width="6" Marker-Size-Height="6" Marker-Visible="true" Marker-Shape="Circle" 
                  Tooltip-Visible="true" Tooltip-Format="#series.name#  <br/> #point.x# : #point.y# "></ej:Series>
           </Series>
            <Title Text="Weather Report"></Title>
        </ej:Chart>
    </div>
</asp:Content>


