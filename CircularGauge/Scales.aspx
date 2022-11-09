<%@ Page Title="CircularGauge-Scales-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates the scale of the circular gauge in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scales.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Scales" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
           <ej:CircularGauge Load="loadGaugeTheme" IsResponsive="true"  ClientIDMode="Static" runat="server" ID="ScaleCircularGauge" BackgroundColor="transparent" EnableAnimation="false" >
        <Scales>
           <ej:CircularScales ShowRanges="true" SweepAngle="296"   StartAngle="122" Radius="130" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
               <Border  Width="0.5"></Border>
               <PointerCap Radius="12"></PointerCap>
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
                       <Border  Color="#f5b43f"></Border>
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

        function pointerchange(args) {
            var pointerval = $("#ScaleCircularGauge").data("ejCircularGauge");
            pointerval.setPointerValue(0, 0, args.value);
        }

        function onchange(args) {
            var gaugeval = $("#ScaleCircularGauge").data("ejCircularGauge");
            if (args.id == "scalesize") {
                gaugeval.setScaleBarSize(0, args.value);
            }
            else if (args.id == "scaleradius") {
                gaugeval.setScaleRadius(0, args.value);
            }
            else if (args.id == "borderwidth") {
                gaugeval.setScaleBorderWidth(0, args.value);
            }
            else if (args.value == "clockwise") {
                gaugeval.setScaleDirection(0, args.text);
            }
            else if (args.value == "counterclockwise") {
                gaugeval.setScaleDirection(0, args.text);
            }
        }
     </script>
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   ScaleBar Size
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="scalesize" runat="server" SliderType="MinRange" Value="1" Height="10" Width="120" MinValue="0" MaxValue="10" EnableAnimation="true" ClientSideOnChange="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Scale Radius
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="scaleradius" runat="server" SliderType="MinRange" Value="130" Height="10" Width="120" MinValue="120" MaxValue="131" EnableAnimation="true" ClientSideOnChange="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Border Width
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="borderwidth" runat="server" SliderType="MinRange" Value="0.5" Height="10" Width="120" MinValue="0" MaxValue="5" EnableAnimation="true" ClientSideOnChange="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="60" Height="10" Width="120" MinValue="0" MaxValue="120" EnableAnimation="true" ClientSideOnChange="pointerchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Scale Direction
                </div>
                <div class="col-md-3 aligntop">
                   <ej:DropDownList ClientIDMode="Static" ID="ddlScaleDirection" runat="server" Width="115px" SelectedItemIndex="0" ClientSideOnChange="onchange">
                       <Items>
                           <ej:DropDownListItem  Text="clockwise" Value="clockwise"/>
                           <ej:DropDownListItem  Text="counterclockwise" Value="counterclockwise"/>
                       </Items>
                   </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

