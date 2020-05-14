<%@ Page Title="CircularGauge-Export Image-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the export functionality in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExportImage.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.ExportImage" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
 <ej:CircularGauge  ClientIDMode="Static" runat="server" IsResponsive="true" ID="CoreExportGauge" BackgroundColor="transparent" Load="loadGaugeTheme" >
       <Scales>
           <ej:CircularScales ShowRanges="true"  SweepAngle="296" StartAngle="122" Radius="130" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
               <PointerCap Radius="12"></PointerCap>
               <Border Width="0.5"></Border>
               <PointerCollection>
                   <ej:Pointers Value="60"  ShowBackNeedle="true" Length="95" Width="7" BackNeedleLength="20" ></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major" Height="16" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor" Height="8" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
               </LabelCollection>
               <RangeCollection>
                   <ej:CircularRanges distanceFromScale="-30" StartValue="0" EndValue="70">
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#fc0606" distanceFromScale="-30" StartValue="70" EndValue="110">
                       <Border Color="#fc0606"></Border>
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#f5b43f" distanceFromScale="-30" StartValue="110" EndValue="120">
                       <Border Color="#f5b43f"></Border>
                   </ej:CircularRanges>
               </RangeCollection>
           </ej:CircularScales>
       </Scales>
        </ej:CircularGauge>
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
            var fileName = $("#fileName").val().trim() == "" ? "CircularGauge" : $("#fileName").val();
            var specialChars = '<>:"/\|?*';
            for (i = 0; i < specialChars.length; i++) {
                if (fileName.indexOf(specialChars[i]) > -1) {
                    hit = true;
                }
            }
            if (!hit) {
                var fileFormat = $("#ddlExportImage").ejDropDownList("option", "value");
                var flag = $("#CoreExportGauge").ejCircularGauge("exportImage", fileName, fileFormat);
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
                    <ej:DropDownList ClientIDMode="Static" ID="ddlExportImage" runat="server" Width="115px" SelectedItemIndex="0" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem  Value="PNG" Text="PNG"/>
                            <ej:DropDownListItem  Value="JPEG" Text="JPEG"/>
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

