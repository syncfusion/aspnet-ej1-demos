<%@ Page Title="Chart-Stacked Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render 3D stacked column series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="StackingColumn3D.aspx.cs" Inherits="WebSampleBrowser.Chart.StackingColumn3D" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
 <script type="text/javascript" src="../Scripts/ChartData.js"></script>
       <ej:Chart ID="Chart1" runat="server" Width="970" OnClientLoad="chartLoad" Height="600" Depth="100" WallSize="2" Tilt="0" 
           Rotation="34" PerspectiveAngle="90" SideBySideSeriesPlacement="true" EnableRotation="true" 
           Enable3D="true"  IsResponsive="true">
            <Title Text="Passenger Car Sales"></Title>
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
                <ej:Series Name="India" StackingGroup="Asia Continent">
                    <points>
                        <ej:points X="2006" Y="8"/>
                        <ej:points X="2007" Y="5"/>
                        <ej:points X="2008" Y="4"/>
                        <ej:points X="2009" Y="12"/>
                        <ej:points X="2010" Y="16"/>
                        <ej:points X="2011" Y="6"/>
                        <ej:points X="2012" Y="13"/>
                    </points>
                </ej:Series>
                <ej:Series Name="China" StackingGroup="Asia Continent">
                    <points>
                        <ej:points X="2006" Y="5"/>
                        <ej:points X="2007" Y="6"/>
                        <ej:points X="2008" Y="7"/>
                        <ej:points X="2009" Y="10"/>
                        <ej:points X="2010" Y="14"/>
                        <ej:points X="2011" Y="14"/>
                        <ej:points X="2012" Y="15"/>
                    </points>
                </ej:Series>
                <ej:Series Name="Canada" StackingGroup="North America Continent">
                    <points>
                        <ej:points X="2006" Y="14"/>
                        <ej:points X="2007" Y="14"/>
                        <ej:points X="2008" Y="13"/>
                        <ej:points X="2009" Y="13"/>
                        <ej:points X="2010" Y="13"/>
                        <ej:points X="2011" Y="13"/>
                        <ej:points X="2012" Y="12"/>
                    </points>
                </ej:Series>
                <ej:Series Name="USA" StackingGroup="North America Continent">
                    <points>
                        <ej:points X="2006" Y="17"/>
                        <ej:points X="2007" Y="16"/>
                        <ej:points X="2008" Y="13"/>
                        <ej:points X="2009" Y="10"/>
                        <ej:points X="2010" Y="12"/>
                        <ej:points X="2011" Y="13"/>
                        <ej:points X="2012" Y="14"/>
                    </points>
                </ej:Series>
                
            </Series>
            <CommonSeriesOptions EnableAnimation="true" Type="StackingColumn">
                <Tooltip Visible="true" Format="#series.name#  <br/> Year #point.x# : #point.y# Millions" />
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
 

 

