<%@ Page Title="Chart-Doughnut-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure doughnut series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="doughnut.aspx.cs" Inherits="WebSampleBrowser.Chart.doughnut" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <Title Text="Project Cost Breakdown"></Title>
            <series>
                <ej:Series EnableAnimation="True" Name="New York" XName="Xvalue" YName="YValue1" Type="Doughnut" Explode="True" 
                    LabelPosition="Inside" DoughnutSize="0.9" Marker-DataLabel-Visible="True" Marker-DataLabel-EnableContrastColor="true"
                    Marker-DataLabel-Font-FontSize="30px" 
                    Marker-DataLabel-Font-FontWeight="Lighter">
                    <Points>
                        <ej:Points Text="28%" X="Labour" Y="28"/>
                        <ej:Points Text="10%" X="Legal" Y="10"/>
                        <ej:Points Text="20%" X="Production" Y="20"/>
                        <ej:Points Text="15%" X="License" Y="15"/>
                        <ej:Points Text="23%" X="Facilities" Y="23"/>
                        <ej:Points Text="17%" X="Taxes" Y="17"/>
                        <ej:Points Text="12%" X="Insurance" Y="12"/>
                    </Points>
                </ej:Series>
              </series>
            <Legend Position="Top" />
        </ej:Chart>
    </div>
</asp:Content>


