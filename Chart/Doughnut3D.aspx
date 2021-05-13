<%@ Page Title="Chart-Doughnut-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render 3D doughnut series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Doughnut3D.aspx.cs" Inherits="WebSampleBrowser.Chart.Doughnut3D" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
         <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="SeriesRender"  Depth="30" WallSize="10" Tilt="-30" 
             Rotation="-30" PerspectiveAngle="90" SideBySideSeriesPlacement="false" EnableRotation="true" 
             Enable3D="true"  IsResponsive="true">
            <Title Text="People's Hobbies"></Title>
            <Legend Visible="false"/>
              <Series>
                <ej:Series Type="Doughnut" DoughnutCoefficient="0.5" DoughnutSize="0.8" ExplodeIndex="4">
                    <points>
                        <ej:points Text="Watching TV" X="Watching TV" Y="56"/>
                        <ej:points Text="Socializing" X="Socializing" Y="26"/>
                        <ej:points Text="Reading" X="Reading" Y="3"/>
                        <ej:points Text="Sports" X="Sports" Y="7"/>
                        <ej:points Text="Others" X="Others" Y="8"/>
                    </points>
                    <Border Width="2" Color="White" />
                </ej:Series>
             </Series>
            <CommonSeriesOptions LabelPosition="Outside">
                <Tooltip Visible="true" Format="#point.x# : #point.y#%" />
                <Marker>
                    <DataLabel Shape="None" Visible="true" TextPosition="Top">
                        <Border Width="1" />
                        <ConnectorLine Height="30" Color="black"/>
                    </DataLabel>
                </Marker>
            </CommonSeriesOptions>

        </ej:Chart>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script>
        function SeriesRender(sender) {
            onChartLoad(sender);
            loadTheme(sender);
            if (sender.model.theme == "flatdark" || sender.model.theme == "gradientdark")
                sender.model.commonSeriesOptions.marker.dataLabel.connectorLine.stroke = "white";
        }
    </script>
</asp:Content>
 

