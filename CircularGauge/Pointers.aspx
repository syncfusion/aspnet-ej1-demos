<%@ Page Title="CircularGauge-Needle Pointer-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the needle pointer behavior of the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Pointers.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Pointers" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
           <ej:CircularGauge Load="loadGaugeTheme" IsResponsive="true" ClientIDMode="Static" runat="server" ID="PointerCircularGauge" BackgroundColor="transparent" EnableAnimation="false" >
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
        });

        function pointerchange(args) {

            var circular = $("#PointerCircularGauge").data("ejCircularGauge");
            var currentValue = circular.model.scales[0].pointers[0].value;
            var handleValue = Math.round(args.value);
            var timer = setInterval(function pointerchan() {
                if (currentValue < handleValue) {
                    currentValue = currentValue + 1;
                    circular.setPointerValue(0, 0, currentValue);
                }
                else if (currentValue > handleValue) {
                    currentValue = currentValue - 1;
                    circular.setPointerValue(0, 0, currentValue);
                }
                else if (currentValue == handleValue) {
                    window.clearInterval(timer);
                }
            }, 1);
        }

        function onchange1(args) {
            var circular = $("#PointerCircularGauge").data("ejCircularGauge");
            circular.setNeedleStyle(0, 0, args.value);
        }

        function onchange(args) {
            var circular = $("#PointerCircularGauge").data("ejCircularGauge");

            if (args.id == "pointerlength") {
                circular.setPointerLength(0, 0, args.value);
            }
            else if (args.id == "pointerwidth") {
                circular.setPointerWidth(0, 0, args.value);
            }
            else if (args.id == "needlelength") {
                circular.setBackNeedleLength(0, 0, args.value);
            }
            else if (args.id == "pointercapradius") {
                circular.setPointerCapRadius(0, args.value);
            }
        }
     </script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Pointer Length
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="pointerlength" runat="server" SliderType="MinRange" Value="90" Height="10" Width="120" MinValue="50" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Width
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="pointerwidth" runat="server" SliderType="MinRange" Value="7" Height="10" Width="120" MinValue="2" MaxValue="14" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Back Needle Length
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="needlelength" runat="server" SliderType="MinRange" Value="19" Height="10" Width="120" MinValue="10" MaxValue="20" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Cap Radius
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="pointercapradius" runat="server" SliderType="MinRange" Value="12" Height="10" Width="120" MinValue="9" MaxValue="15" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="40" Height="10" Width="120" MinValue="0" MaxValue="120" EnableAnimation="true" ClientSideOnChange="pointerchange" ClientSideOnSlide="pointerchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Needle Style
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="ddlNeedleType" Width="115px" runat="server" SelectedItemIndex="0" ClientSideOnSelect="onchange1">
                        <Items>
                            <ej:DropDownListItem Value="triangle" Text="Triangle" />
                            <ej:DropDownListItem Value="arrow" Text="Arrow" />
                            <ej:DropDownListItem Value="trapezoid" Text="Trapezoid" />
                            <ej:DropDownListItem Value="rectangle" Text="Rectangle" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

