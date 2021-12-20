<%@ Page Title="Chart-Bar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render 3D bar series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Bar3D.aspx.cs" Inherits="WebSampleBrowser.Chart.Bar3D" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ID="Chart1" runat="server" Width="970"  Height="600" OnClientLoad="chartLoad" Depth="100" WallSize="2" Tilt="0" Rotation="34" PerspectiveAngle="90" SideBySideSeriesPlacement="true" EnableRotation="true" Enable3D="true"  IsResponsive="true">
            <Title Text="Employees In Self Insured Plans, 2013"></Title>
            <Legend Visible="true"/>
            <PrimaryXAxis>
                <AxisLine Visible="true" />
                <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />                
            </PrimaryXAxis>
            <PrimaryYAxis>
                <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
                <Title Text="% of Employees"/>
            </PrimaryYAxis>
              <Series>
                <ej:Series Name="California" Type="Bar">
                    <points>
                        <ej:points X="All Plans" Y="36"/>
                        <ej:points X="HMO" Y="18"/>
                        <ej:points X="PPO" Y="59"/>
                        <ej:points X="POS" Y="40"/>
                        <ej:points X="HDHP" Y="34"/>
                        <ej:points X="SO" Y="44"/>
                    </points>
                </ej:Series>
                <ej:Series Name="United States" Type="Bar">
                    <points>
                        <ej:points X="All Plans" Y="61"/>
                        <ej:points X="HMO" Y="31"/>
                        <ej:points X="PPO" Y="70"/>
                        <ej:points X="POS" Y="31"/>
                        <ej:points X="HDHP" Y="60"/>
                        <ej:points X="SO" Y="62"/>
                    </points>
                </ej:Series>
             </Series>
            <CommonSeriesOptions>
                <Tooltip Visible="true" Format="#series.name#  <br/>  #point.x# : #point.y#%" />
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

 

