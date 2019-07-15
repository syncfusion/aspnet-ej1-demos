<%@ Page Title="Chart-100% Stacked Bar-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render 100% 3D stacked bar series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StackingBar1003D.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingBar1003D" %>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="chartLoad" Depth="100" WallSize="2" Tilt="0" 
            Rotation="34" PerspectiveAngle="90" SideBySideSeriesPlacement="true" EnableRotation="true" 
            Enable3D="true"  IsResponsive="true">
            <Title Text="Money savings by year"></Title>
            <Legend Visible="true"/>
            <PrimaryXAxis>
                 <AxisLine Visible="false" />                
                 <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
            </PrimaryXAxis>
            <PrimaryYAxis >               
                 <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
            </PrimaryYAxis>
            <Series>
                <ej:Series Name="John">
                    <points>
                        <ej:points X="2006" Y="8000"/>
                        <ej:points X="2007" Y="12000"/>
                        <ej:points X="2008" Y="20000"/>
                        <ej:points X="2009" Y="21000"/>
                        <ej:points X="2010" Y="28000"/>
                        <ej:points X="2011" Y="29000"/>
                    </points>
                </ej:Series>
                <ej:Series Name="Andrew">
                    <points>
                        <ej:points X="2006" Y="5000"/>
                        <ej:points X="2007" Y="15000"/>
                        <ej:points X="2008" Y="19000"/>
                        <ej:points X="2009" Y="25000"/>
                        <ej:points X="2010" Y="26000"/>
                        <ej:points X="2011" Y="30000"/>
                    </points>
                </ej:Series>
                  <ej:Series Name="Thomas">
                    <points>
                        <ej:points X="2006" Y="1400"/>
                        <ej:points X="2007" Y="1350"/>
                        <ej:points X="2008" Y="12000"/>
                        <ej:points X="2009" Y="14000"/>
                        <ej:points X="2010" Y="11000"/>
                        <ej:points X="2011" Y="20000"/>
                    </points>
                </ej:Series>
                    <ej:Series Name="Hendry">
                    <points>
                        <ej:points X="2006" Y="1700"/>
                        <ej:points X="2007" Y="1600"/>
                        <ej:points X="2008" Y="9000"/>
                        <ej:points X="2009" Y="12000"/>
                        <ej:points X="2010" Y="14000"/>
                        <ej:points X="2011" Y="19000"/>
                    </points>
                </ej:Series>
            </Series>
            <CommonSeriesOptions  Type="StackingBar100">
                <Tooltip Visible="true" 
                    Format="#series.name#  <br/> X : #point.x# <br/> Y : #point.y# <br/> Percentage : #point.percentage#%" />
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

