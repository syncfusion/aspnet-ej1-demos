<%@ Page Title="Chart-100% Stacked Column-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render 100% 3D stacked column series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="StackingColumn1003D.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingColumn1003D" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
<script type="text/javascript" src="../Scripts/ChartData.js"></script>
       <ej:Chart ID="Chart1" runat="server" Width="970" OnClientLoad="chartLoad" Height="600" Depth="100" WallSize="2" Tilt="0" 
           Rotation="34" PerspectiveAngle="90" SideBySideSeriesPlacement="true" EnableRotation="true" 
           Enable3D="true"  IsResponsive="true">
            <Title Text="Smartphone Penetration in Asia"></Title>
            <Legend Visible="true"/>
            <PrimaryXAxis>
                <AxisLine Visible="false" />
                <Title Text="Year" />
                <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
             </PrimaryXAxis>
             <PrimaryYAxis>                
                 <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
             </PrimaryYAxis>
             <Series>
                <ej:Series Name="India" >
                    <points>
                        <ej:points X="2006" Y="80000 "/>
                        <ej:points X="2007" Y="22000"/>
                        <ej:points X="2008" Y="60000"/>
                        <ej:points X="2009" Y="39000"/>
                        <ej:points X="2010" Y="62000"/>
                        <ej:points X="2011" Y="90000"/>
                       
                    </points>
                </ej:Series>
                <ej:Series Name="China" >
                    <points>
                        <ej:points X="2006" Y="50000"/>
                        <ej:points X="2007" Y="41000"/>
                        <ej:points X="2008" Y="52000"/>
                        <ej:points X="2009" Y="43000"/>
                        <ej:points X="2010" Y="47000"/>
                        <ej:points X="2011" Y="93000"/>
                       
                    </points>
                </ej:Series>
                <ej:Series Name="Japan" >
                    <points>
                        <ej:points X="2006" Y="14000"/>
                        <ej:points X="2007" Y="14040"/>
                        <ej:points X="2008" Y="12000"/>
                        <ej:points X="2009" Y="7000"/>
                        <ej:points X="2010" Y="18000"/>
                        <ej:points X="2011" Y="40000"/>
                       
                    </points>
                </ej:Series>
                <ej:Series Name="Pakistan" >
                    <points>
                        <ej:points X="2006" Y="17000"/>
                        <ej:points X="2007" Y="16020"/>
                        <ej:points X="2008" Y="14000"/>
                        <ej:points X="2009" Y="11000"/>
                        <ej:points X="2010" Y="17000"/>
                        <ej:points X="2011" Y="38000"/>
                        
                    </points>
                </ej:Series>
              </Series>
            <CommonSeriesOptions EnableAnimation="true" Type="StackingColumn100">
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

