<%@ Page Title="Chart-Funnel-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure funnel series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Funnel.aspx.cs" Inherits="WebSampleBrowser.Chart.Funnel" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div style="width:700px">
     <div>
         <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server"  Height="600"  IsResponsive="true" OnClientLoad="onChartLoad">
            <Title Text="Web Site Visitor"></Title>
            <Series>
                <ej:Series Name="WebSite" Type="Funnel" FunnelHeight="20%" FunnelWidth="15%" LabelPosition="Inside">
                    <points>
                        <ej:points Text="18.25%" X="Renewed" Y="18.25"/>
                        <ej:points Text="24%" X="Subscribe" Y="24.3"/>
                        <ej:points Text="55.9%" X="Support" Y="55.9"/>
                        <ej:points Text="75.7%" X="Downloaded" Y="75.7"/>
                        <ej:points Text="100%" X="Visited" Y="100"/>
                    </points>
                    <Marker>
                        <DataLabel Visible="true" Shape="None" EnableContrastColor="true">
                            <Font FontSize="12px"></Font>
                        </DataLabel>
                    </Marker>
                </ej:Series>
            </Series>
            <Legend Position="Top"></Legend>
        </ej:Chart>
    </div>
    </div>
</asp:Content>
 

 

