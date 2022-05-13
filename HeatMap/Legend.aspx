<%@ Page Title="HeatMap-Legend-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Legend.aspx.cs" Inherits="WebSampleBrowser.HeatMap.Legend" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#Propertiespanel").ejPropertiesPanel();
        });

        function checkBoxChecked(args) {
            if (args && args.id) {
                if (args.id === "check2" && args.checked) {
                    $("#check1")[0].checked = false;
                    $("#LegendHeatmapLegend").ejHeatMapLegend({ legendMode: "list" });
                }
                if (args.id === "check1" && args.checked) {
                    $("#check2")[0].checked = false;
                    $("#LegendHeatmapLegend").ejHeatMapLegend({ legendMode: "gradient" });
                }
            }
        }
    </script>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="border-width: 2px; opacity: 0.7; width: 290px; text-align: center;">
        <label style="color: Black; font-size: 22px; height: 25px; font-weight: Normal;">Employee Rating in a Year</label>
    </div>
    <br />
    <div class="control_section">
        <div style="width: 100%; margin: 0 auto; text-align: center;">
            <ej:HeatMap runat="server" ID="LegendHeatmap" Width="100%" Height="auto" IsResponsive="true">
                <ColorMappingCollection>
                    <ej:HeatMapColorMapping Color="#fe0002" Value="0">
                        <label text="Poor"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#ffff01" Value="3">
                        <label text="Average"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#13ab11" Value="6">
                        <label text="Good"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#005ba2" Value="10">
                        <label text="Excellent"></label>
                    </ej:HeatMapColorMapping>
                </ColorMappingCollection>
            </ej:HeatMap>
            <div style="height: 15px; width: 100%;"></div>
            <ej:HeatMapLegend runat="server" ClientIDMode="static" ID="LegendHeatmapLegend" Height="50px" Width="75%" legendmode="Gradient" orientation="Horizontal" IsResponsive="true">
                <ColorMappingCollection>
                    <ej:HeatMapColorMapping Color="#fe0002" Value="0">
                        <label text="Poor"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#ffff01" Value="3">
                        <label text="Average"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#13ab11" Value="6">
                        <label text="Good"></label>
                    </ej:HeatMapColorMapping>
                    <ej:HeatMapColorMapping Color="#005ba2" Value="10">
                        <label text="Excellent"></label>
                    </ej:HeatMapColorMapping>
                </ColorMappingCollection>
            </ej:HeatMapLegend>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="Propertiespanel">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-2">
                    <b>Legend Type</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Gradient
                </div>
                <div class="col-md-3">
                    <input type="radio" id="check1" checked="checked" onclick="checkBoxChecked(this)" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    List
                </div>
                <div class="col-md-3">
                    <input type="radio" id="check2" onclick="checkBoxChecked(this)" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
        #LegendHeatmapLegend {
            margin-left: 100px;
        }
    </style>
</asp:Content>


