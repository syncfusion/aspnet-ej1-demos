<%@ Page Title="Chart-Bubble-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render bubble series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Bubble.aspx.cs" Inherits="WebSampleBrowser.Chart.Bubble" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" CanResize="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Literacy Rate" />
            <PrimaryYAxis Title-Text="GDP Growth Rate" />
            <Title Text="World Countries Details"></Title>
            <Series>
                <ej:Series Name="Pound" Type="Bubble" EnableAnimation="True" Tooltip-Visible="True" 
                    Tooltip-Format="#point.text#<br/>Literacy Rate : #point.x#%<br/>GDP Annual Growth Rate : #point.y#<br/>Population : #point.size# Billion" 
                    Opacity="0.7">
                    <Points >
                        <ej:Points Fill="#E94649" Size="1.347" Text="China" X="92.2" Y="7.8"/> 
                        <ej:Points Fill="#F6B53F" Size="1.241" Text="India" X="74" Y="6.5"/>  
                        <ej:Points Fill="#6FAAB0" Size="0.238" Text="Indonesia" X="90.4" Y="6.0"/>  
                        <ej:Points Fill="#C4C24A" Size="0.312" Text="US" X="99.4" Y="2.2"/>  
                        <ej:Points Fill="#FB954F" Size="0.197" Text="Brazil" X="88.6" Y="1.3"/>  
                        <ej:Points Fill="#D9CEB2" Size="0.177" Text="Pakistan" X="54.9" Y="3.7"/>  
                        <ej:Points Fill="#FF8D8D" Size="0.0818" Text="Germany" X="99" Y="0.7"/>  
                        <ej:Points Fill="#69D2E7" Size="0.0826" Text="Egypt" X="72" Y="2.0"/>  
                        <ej:Points Fill="#E27F2D" Size="0.143" Text="Russia" X="99.6" Y="3.4"/>  
                        <ej:Points Fill="#6A4B82" Size="0.128" Text="Japan" X="99" Y="0.2"/>  
                        <ej:Points Fill="#F6B53F" Size="0.115" Text="Mexico" X="86.1" Y="4.0"/>  
                        <ej:Points Fill="#C4C24A" Size="0.096" Text="Philippines" X="92.6" Y="6.6"/>  
                        <ej:Points Fill="#FF8D8D" Size="0.162" Text="Nigeria" X="61.3" Y="14.5"/>  
                        <ej:Points Fill="#69D2E7" Size="0.151" Text="Bangladesh" X="56.8" Y="6.1"/>     
                    </Points>
                </ej:Series>
            </Series>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>



