<%@ Page Title="Chart-Pie-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render 3D pie series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Pie3D.aspx.cs" Inherits="WebSampleBrowser.Chart.Pie3D" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:Chart ID="Chart1" runat="server" Width="970"  Height="600" Depth="30" OnClientLoad="chartLoad" WallSize="10" Tilt="-30" 
            Rotation="-30" PerspectiveAngle="90" SideBySideSeriesPlacement="false" EnableRotation="true" Enable3D="true"  
            IsResponsive="true">
            <Title Text="Expenditure shares on a child from birth through age 17"></Title>
            <Legend Visible="false"/>
            <Series>
                <ej:Series Type="Pie" Width="970" LabelPosition="Outside" PieCoefficient="0.7" 
                    StartAngle="145" ExplodeIndex="0">
                    <points>
                        <ej:points Text="Housing" X="Housing" Y="31"/>
                        <ej:points Text="Food" X="Food" Y="16"/>
                        <ej:points Text="Transporation" X="Transporation" Y="14"/>
                        <ej:points Text="Clothing" X="Clothing" Y="6"/>
                        <ej:points Text="Health care" X="Health care" Y="8"/>
                        <ej:points Text="Education" X="Education" Y="17"/>
                        <ej:points Text="Miscellaneous" X="Miscellaneous" Y="8"/>
                    </points>
                    <Border Width="2" Color="White" />
                </ej:Series>
           </Series>
            <CommonSeriesOptions  LabelPosition="Outside">
                <Tooltip Visible="true" Format="#point.x# : #point.y#%" />
                <Marker>
                    <DataLabel Shape="None" Visible="true" TextPosition="Top">
                        <Border Width="1" />
                        <ConnectorLine Height="70" Color="Black" />
                    </DataLabel>
                </Marker>
            </CommonSeriesOptions>
        </ej:Chart>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script>
        function chartLoad(sender) {
            onChartLoad(sender);
            loadTheme(sender);
            if (sender.model.theme == "flatdark" || sender.model.theme == "gradientdark")
                sender.model.commonSeriesOptions.marker.dataLabel.connectorLine.stroke = "white";
        }
    </script>
</asp:Content>
 
 

 

