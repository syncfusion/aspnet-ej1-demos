<%@ Page Title="Chart-Pyramid-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render pyramid series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Pyramid.aspx.cs" Inherits="WebSampleBrowser.Chart.Pyramid" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <Title Text="Sales Distribution of Car by Region"></Title>
            <Series>
                <ej:Series Name="India" Type="Pyramid" Marker-DataLabel-Visible="True" LabelPosition="Outside" Marker-DataLabel-EnableContrastColor="true"
                    Marker-DataLabel-Shape="Rectangle"  Marker-DataLabel-Font-FontSize="15px" >
                    <points>
                        <ej:points Text="India 24%" X="India" Y="24"/>
                        <ej:points Text="Japan 25%" X="Japan" Y="25"/>
                        <ej:points Text="Australia 20%" X="Australia" Y="20"/>
                        <ej:points Text="USA 35%" X="USA" Y="35"/>
                        <ej:points Text="China 23%" X="China" Y="23"/>
                        <ej:points Text="Germany 27%" X="Germany" Y="27"/>
                        <ej:points Text="France 22%" X="France" Y="22"/>
                    </points>
                </ej:Series>
            </Series>
            <Legend Position="Top"></Legend>
        </ej:Chart>
    </div>
</asp:Content>


