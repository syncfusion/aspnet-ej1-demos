<%@ Page Title="Chart-Stacked Bar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render 3D stacked bar series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="StackingBar3D.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingBar3D" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="chartLoad" Depth="100" WallSize="2" Tilt="0"
             Rotation="34" PerspectiveAngle="90" SideBySideSeriesPlacement="true" EnableRotation="true"
             Enable3D="true"  IsResponsive="true">
            <Title Text="Forecast:Real-Time Bidding Digital Ad Sales"></Title>
            <Legend Visible="true"/>
            <PrimaryXAxis>
                 <AxisLine Visible="false" />                
                 <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
            </PrimaryXAxis>
            <PrimaryYAxis LabelFormat="${value}">
                 <Title Text="Digital Ad Sales in Billion"/>
                 <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
            </PrimaryYAxis>
            <Series>
                <ej:Series Name="Desktop Display">
                    <points>
                        <ej:points X="2009" Y="2.9"/>
                        <ej:points X="2010" Y="3.8"/>
                        <ej:points X="2011" Y="4.9"/>
                        <ej:points X="2012" Y="6.5"/>
                        <ej:points X="2013" Y="7.1"/>
                        <ej:points X="2014" Y="7.5"/>
                    </points>
                </ej:Series>
                <ej:Series Name="Mobile">
                    <points>
                        <ej:points X="2009" Y="0.1"/>
                        <ej:points X="2010" Y="0.5"/>
                        <ej:points X="2011" Y="1.4"/>
                        <ej:points X="2012" Y="2.9"/>
                        <ej:points X="2013" Y="4.9"/>
                        <ej:points X="2014" Y="6.8"/>
                    </points>
                </ej:Series>
                  <ej:Series Name="Video">
                    <points>
                        <ej:points X="2009" Y="0.1"/>
                        <ej:points X="2010" Y="0.5"/>
                        <ej:points X="2011" Y="1.1"/>
                        <ej:points X="2012" Y="2.0"/>
                        <ej:points X="2013" Y="3.1"/>
                        <ej:points X="2014" Y="3.9"/>
                    </points>
                </ej:Series>
            </Series>
            <CommonSeriesOptions  Type="StackingBar">
                <Tooltip Visible="true" Format="#series.name#  <br/> Year #point.x# : #point.y# Billions" />
            </CommonSeriesOptions>
      </ej:Chart>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script>
        function chartLoad(sender) {
		    onChartLoad(sender);
            loadTheme(sender);
            sender.model.primaryXAxis.majorGridLines.color = "#a9a9a9";
            sender.model.primaryXAxis.majorGridLines.opacity = 0.12;
            sender.model.primaryYAxis.majorGridLines.color = "#a9a9a9";
            sender.model.primaryYAxis.majorGridLines.opacity = 0.12;
        }
    </script>
</asp:Content>
 

 

