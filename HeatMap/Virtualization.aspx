<%@ Page Title="HeatMap-Virtualization-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Virtualization.aspx.cs" Inherits="WebSampleBrowser.HeatMap.Virtualization" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="border-width: 2px; opacity: 0.7; width: 290px; text-align: center;">
        <label style="color: Black; font-size: 22px; height: 25px; font-weight: Normal;">Product Sales by Month</label><br />
        <label style="color: Black; font-size: 22px; margin-top: -2px; height: 25px; font-weight: Normal;">(In Percentage)</label>
    </div>
    <br />
    <div class="control_section">
        <div style="margin: 0 auto; text-align: center;">
            <ej:HeatMap runat="server" ID="VirtualHeatmap" Width="1000" Height="300" IsResponsive="true" EnableVirtualization="true">
                <ColorMappingCollection>
                    <ej:HeatMapColorMapping Color="#fe0002" Value="0">
                        <label text="0"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#ffff01" Value="30">
                        <label text="30"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#13ab11" Value="60">
                        <label text="60"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#005ba2" Value="100">
                        <label text="100"></label>
                    </ej:HeatMapColorMapping>
                </ColorMappingCollection>
            </ej:HeatMap>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
</asp:Content>


