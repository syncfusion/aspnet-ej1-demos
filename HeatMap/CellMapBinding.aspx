<%@ Page Title="HeatMap-Cell Mapping-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CellMapBinding.aspx.cs" Inherits="WebSampleBrowser.HeatMap.CellMapBinding" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="border-width: 2px; opacity: 0.7; width: 290px; text-align: center;">
        <label style="color: Black; font-size: 22px; height: 25px; font-weight: Normal;">Product Sales by Year</label><br />
        <label style="color: Black; font-size: 22px; margin-top: -2px; height: 25px; font-weight: Normal;">(In Percentage)</label>
    </div>
    <br />
    <div class="control_section">
        <div style="width: 100%; margin: 0 auto; text-align: center;">
            <ej:HeatMap runat="server" ID="heatmap" IsResponsive="true" Width="100%">
                <ColorMappingCollection>
                    <ej:HeatMapColorMapping Color="#8ec8f8" Value="0">
                        <label text="0"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#0d47a1" Value="100">
                        <label text="100"></label>
                    </ej:HeatMapColorMapping>
                </ColorMappingCollection>
            </ej:HeatMap>
            <div style="height: 15px; width: 100%;"></div>
            <ej:HeatMapLegend runat="server" ID="heatmapLegend" Height="50px" Width="75%" ClientIDMode="static" legendmode="Gradient" orientation="Horizontal" IsResponsive="true">
                <ColorMappingCollection>
                    <ej:HeatMapColorMapping Color="#8ec8f8" Value="0">
                        <label text="0"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#0d47a1" Value="100">
                        <label text="100"></label>
                    </ej:HeatMapColorMapping>
                </ColorMappingCollection>
            </ej:HeatMapLegend>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #heatmapLegend {
            margin-left: 120px;
        }

        /*.row [class*="cols-"]:first-child > div:first-child {
            margin: 0px;
        }*/
    </style>
</asp:Content>


