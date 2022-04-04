<%@ Page Title="CircularGauge-Half Circular-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the rendering of half-circular gauge in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="semicircular.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.semicircular" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center" style="background:none;">
     <ej:CircularGauge ClientIDMode="Static" runat="server" ID="SemiCircularGauge" IsResponsive="true" BackgroundColor="transparent" Width="500" Radius="130" RenderComplete="pointerrange" ReadOnly="false" EnableAnimation="false" MouseClickUp="pointerrange" GaugePosition="TopCenter" DistanceFromCorner="10">
         <Frame FrameType="HalfCircle" HalfCircleFrameEndAngle="360" HalfCircleFrameStartAngle="180"/>
       <Scales>
           <ej:CircularScales  ShowRanges="true" SweepAngle="180" StartAngle="180" Radius="130" ShowScaleBar="true" BackgroundColor="#CBCFCE" Size="10" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
               <Border Color="#FEA501" Width="2"></Border>
               <PointerCap Radius="10" BorderColor="#FEA501" BackgroundColor="#0000F0"></PointerCap>
               <PointerCollection>
                   <ej:Pointers Value="70" ShowBackNeedle="false" Length="85" Width="10" BackgroundColor="#FEA501" >
                       <Border Color="#FEA501"/>
                   </ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major" Height="16" Width="3" Color="#FEA501"/>
                   <ej:CircularTicks Type="Minor" Height="8" Width="2" Color="#FEA501"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="Red" DistanceFromScale="0" AutoAngle="true"></ej:CircularLabels>
               </LabelCollection>
               <RangeCollection>
                   <ej:CircularRanges BackgroundColor="#0000F0" distanceFromScale="30" StartValue="0" EndValue="70">
                       <Border Color="#0000F0"></Border>
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
        });
        function pointerrange(args) {
            if ((ej.browserInfo().name === "msie") ? parseFloat(ej.browserInfo().version) > 8 : true) {
                var speed = $("#SemiCircularGauge").data("ejCircularGauge");
                speed.setRangeEndValue(0, 0, args.model.scales[0].pointers[0].value);
            }
        }
        function onchange(args) {
            if (args.id == "distanceFromCorner") {
                $("#SemiCircularGauge").ejCircularGauge("option", "distanceFromCorner", args.value);
            }
            else if (args.type == "select") {
                $("#SemiCircularGauge").ejCircularGauge("option", "gaugePosition", args.value);
            }
            else if (args.type == "change") {
                $("#SemiCircularGauge").ejCircularGauge("option", "scales", [{ labels: [{ autoAngle: args.isChecked }] }]);
            }
        }
     </script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Gauge Position
                        </div>
                        <div class="col-md-3 aligntop">
                    <ej:DropDownList  ClientIDMode="Static" ID="gaugePosition" Width="115px" runat="server" SelectedItemIndex="3" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Value="center" Text="center" />
                            <ej:DropDownListItem Value="topright" Text="topright" />
                            <ej:DropDownListItem Value="topleft" Text="topleft" />
                            <ej:DropDownListItem Value="topcenter" Text="topcenter" />
                            <ej:DropDownListItem Value="middleleft" Text="middleleft" />
                            <ej:DropDownListItem Value="middleright" Text="middleright" />
                            <ej:DropDownListItem Value="bottomleft" Text="bottomleft" />
                            <ej:DropDownListItem Value="bottomright" Text="bottomright" />
                            <ej:DropDownListItem Value="bottomcenter" Text="bottomcenter" />
                        </Items>
                    </ej:DropDownList>
                        </div>
                    </div>
                      <div class="row">
                        <div class="col-md-3">
                            Distance from corner
                        </div>
                        <div class="col-md-3 aligntop">
                             <ej:Slider  ClientIDMode="Static" ID="distanceFromCorner" runat="server" SliderType="MinRange" Value="10" Height="10" Width="110" MinValue="10" MaxValue="30" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                        </div>
                    </div>
                     <div class="row">
                        <div class="col-md-3">
                            Label Auto Angle
                        </div>
                        <div class="col-md-3 aligntop">
                            <ej:CheckBox  ID="chkAutoAngle" runat="server" Checked="true" ClientSideOnChange="onchange"></ej:CheckBox>
                        </div>
                    </div>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ID="Style" ContentPlaceHolderID="StyleSection">
    <style>
         canvas{
            border:1px solid #8c8c8c;
        }
    </style>
</asp:Content>

