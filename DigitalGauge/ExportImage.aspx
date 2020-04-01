<%@ Page Title="DigitalGauge-Export Image-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates the export functionality in the Syncfusion ASP.NET Web Forms Digital Gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ExportImage.aspx.cs" Inherits="WebSampleBrowser.DigitalGauge.ExportImage" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models"
    TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
        <ej:DigitalGauge ClientIDMode="Static" runat="server" IsResponsive="true" ID="CoreExportImage" Height="300" Load="loadGaugeTheme">
            <Items>
                <ej:DigitalGaugeItems Value="Syncfusion">
                    <SegmentSettings Width="2" Spacing="0" />
                    <CharacterSettings Opacity="0.8" />
                    <Position X="52" Y="52" />
                </ej:DigitalGaugeItems>
            </Items>
        </ej:DigitalGauge>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#btnExportImage").ejButton({ width: "100px", click: "buttonclickevent" });
        });

        function buttonclickevent() {
            var hit = false;
            var fileName = $("#fileName").val().trim() == "" ? "DigitalGauge" : $("#fileName").val();
            var specialChars = '<>:"/\|?*';
            for (i = 0; i < specialChars.length; i++) {
                if (fileName.indexOf(specialChars[i]) > -1) {
                    hit = true;
                }
            }
            if (!hit) {
                var fileFormat = $("#ddlImageFormat").ejDropDownList("option", "value");
                var flag = $("#CoreExportImage").ejDigitalGauge("exportImage", fileName, fileFormat);
                if (!flag)
                    alert("Sorry for the inconvenience. Export is currently not supported in Internet Explorer 9 and below version");
            }
            else
                alert("Your file name contains illegal characters");
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    File Name
                </div>
                <div class="col-md-3 aligntop">
                    <input type="text" class="ejinputtext" id="fileName" value="" style="width: 106px" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    File Type
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlImageFormat" Width="115px" SelectedItemIndex="0">
                        <Items>
                            <ej:DropDownListItem Text="PNG" Value="PNG" />
                            <ej:DropDownListItem Text="JPEG" Value="JPEG" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <input id="btnExportImage" type="button" value="Export" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

