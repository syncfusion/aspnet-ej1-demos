<%@ Page Title="CircularGauge-Ranges-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates the clock by using ranges in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Ranges.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Ranges" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
           <ej:CircularGauge ClientIDMode="Static" IsResponsive="true" EnableAnimation="false" runat="server" ID="RangeCircularGauge" BackgroundColor="transparent" Load="loadGaugeTheme">
       <Scales>
           <ej:CircularScales ShowRanges="true" SweepAngle="296" StartAngle="122" Radius="130" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
               <Border Width="0.5"></Border>
               <PointerCap Radius="12"></PointerCap>
               <PointerCollection>
                   <ej:Pointers Value="60" ShowBackNeedle="true" Length="95" Width="7" BackNeedleLength="19" ></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major" Height="16" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor" Height="8" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
               </LabelCollection>
               <RangeCollection>
                   <ej:CircularRanges distanceFromScale="-28" StartValue="0" EndValue="50">
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#fc0606" distanceFromScale="-28" StartValue="50" EndValue="100">
                       <Border Color="#fc0606"></Border>
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#f5b43f" distanceFromScale="-28" StartValue="100" EndValue="120">
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
        });
        $(document).ready(function () {
            var rangetarg = $("#rangeid").data("ejDropDownList");
            rangetarg.option({ selectedItemIndex: 0 });
        });

        function pointerchange(args) {
            var pointerg = $("#RangeCircularGauge").data("ejCircularGauge");
            pointerg.setPointerValue(0,0,args.value);
        }

        function onchange1(args) {
            var startslide = $("#startvalue").data("ejSlider");
            var endslide = $("#endvalue").data("ejSlider");
            var gaugestart = $("#RangeCircularGauge").data("ejCircularGauge");

            if (args.text == "Range1") {
                startslide.setModel({ maxValue: gaugestart.model.scales[0].ranges[0].startValue, value: gaugestart.model.scales[0].ranges[0].startValue });
                endslide.setModel({ minValue: gaugestart.model.scales[0].ranges[0].endValue, value: gaugestart.model.scales[0].ranges[0].endValue });
            }
            else if (args.text == "Range2") {
                startslide.setModel({ maxValue: gaugestart.model.scales[0].ranges[1].endValue, value: gaugestart.model.scales[0].ranges[1].startValue });
                endslide.setModel({ minValue: gaugestart.model.scales[0].ranges[1].startValue, value: gaugestart.model.scales[0].ranges[1].endValue });
            }
            else if (args.text == "Range3") {
                startslide.setModel({ maxValue: gaugestart.model.scales[0].ranges[2].endValue, value: gaugestart.model.scales[0].ranges[2].startValue });
                endslide.setModel({ minValue: gaugestart.model.scales[0].ranges[2].startValue, value: gaugestart.model.scales[0].ranges[2].endValue });
            }
        }

        function onchange(args) {
            var rangetarget = $("#rangeid").data("ejDropDownList");
            var target1 = $("#RangeCircularGauge").data("ejCircularGauge");
            var endslide = $("#endvalue").data("ejSlider");
            var startslide = $("#startvalue").data("ejSlider");
            if (args.id == "startvalue") {
                endslide.setModel({ minValue: args.value });
                target1.setRangeStartValue(0, rangetarget.selectedIndexValue, args.value);
            }
            else if (args.id == "endvalue") {
                startslide.setModel({ maxValue: args.value });
                target1.setRangeEndValue(0, rangetarget.selectedIndexValue, args.value);
            }
            if (args.id == "rangesize") {
                for (var i = 0; i <= 2; i++) {
                    target1.setRangeSize(0, i, args.value);
                }
            }
            else if (args.id == "distancefromscale") {
                for (var j = 0; j <= 2; j++) {
                    target1.setRangeDistanceFromScale(0, j, args.value);
                }
            }
        }
     </script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Range Size
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="rangesize" runat="server" SliderType="MinRange" Value="7" Height="10" Width="110" MinValue="2" MaxValue="12" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Range Distance
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="distancefromscale" runat="server" SliderType="MinRange" Value="-28" Height="10" Width="110" MinValue="-30" MaxValue="0" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="60" Height="10" Width="110" MinValue="0" MaxValue="120" EnableAnimation="true" ClientSideOnChange="pointerchange" ClientSideOnSlide="pointerchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Select Range
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="rangeid" Width="115px" SelectedItemIndex="0" ClientSideOnChange="onchange1">
                        <Items>
                            <ej:DropDownListItem Value="Range1" Text="Range1"/>
                            <ej:DropDownListItem Value="Range2" Text="Range2"/>
                            <ej:DropDownListItem Value="Range3" Text="Range3"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Start Value
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="startvalue" runat="server" SliderType="MinRange" Value="0" Height="10" Width="110" MinValue="0" MaxValue="50" EnableAnimation="true" ClientSideOnChange="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   End Value
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="endvalue" runat="server" SliderType="MinRange" Value="50" Height="10" Width="110" MinValue="0" MaxValue="120" EnableAnimation="true" ClientSideOnChange="onchange"/> 
                </div>
            </div>
        </div>
    </div>
</asp:Content>

