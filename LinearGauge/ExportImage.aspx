<%@ Page Title="LinearGauge-Export Image-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the export functionality in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExportImage.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.ExportImage" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
          <ej:LinearGauge  ClientIDMode="Static" IsResponsive="true" runat="server" ID="CoreExportGauge" Load="loadGaugeTheme" LabelColor="#8c8c8c">
            <Scales>
                <ej:Scales Width="4" ShowBarPointers="false" ShowRanges="true" Length="310">
                    <Border Color="transparent" Width="0"></Border>
                    <Position X="52" Y="50"/>
                    <MarkerPointerCollection>
                        <ej:MarkerPointers Width="10" Length="10" Value="60" MarkerBackgroundColor="#4d4d4d">
                            <Border Color="#4d4d4d"></Border>
                        </ej:MarkerPointers>
                    </MarkerPointerCollection>
                    <LabelCollection>
                       <ej:Labels><DistanceFromScale X="-13"></DistanceFromScale>
                           <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                       </ej:Labels>
                    </LabelCollection>
                     <TickCollection>
                        <ej:LinearTicks Type="MajorInterval" Width="1" Color="#8c8c8c"/>
                    </TickCollection>
                    <RangeCollection>
                        <ej:Ranges StartValue="0" EndValue="50" RangeBackgroundColor="#F6B53F" EndWidth="4" StartWidth="4"><Border Color="#F6B53F"></Border></ej:Ranges>
                        <ej:Ranges StartValue="50" EndValue="100" RangeBackgroundColor="#E94649" EndWidth="4" StartWidth="4"><Border Color="#E94649"></Border></ej:Ranges>
                    </RangeCollection>
                </ej:Scales>
            </Scales>
        </ej:LinearGauge>

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
            var fileName = $("#fileName").val().trim() == "" ? "LinearGauge" : $("#fileName").val();
            var specialChars = '<>:"/\|?*';
            for (i = 0; i < specialChars.length; i++) {
                if (fileName.indexOf(specialChars[i]) > -1) {
                    hit = true;
                }
            }
            if (!hit) {
                var fileFormat = $("#ddlImageFormat").ejDropDownList("option", "value");
                var flag = $("#CoreExportGauge").ejLinearGauge("exportImage", fileName, fileFormat);
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
                   <ej:DropDownList  ClientIDMode="Static" runat="server" ID="ddlImageFormat" Width="115px" SelectedItemIndex="0">
                        <Items>
                            <ej:DropDownListItem  Text="PNG" Value="PNG"/>
                            <ej:DropDownListItem  Text="JPEG" Value="JPEG"/>
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

