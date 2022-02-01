<%@ Page Title="LinearGauge-Ranges-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the ranges behavior in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Ranges.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Ranges" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
  <ej:LinearGauge ClientIDMode="Static" runat="server" IsResponsive="true" ID="RangeGauge" LabelColor="#8c8c8c" Load="loadGaugeTheme">
            <Scales>
                <ej:Scales Width="4" BackgroundColor="transparent" ShowMarkerPointers="false" ShowRanges="true" Length="310" >
                    <Border Color="transparent" Width="0"></Border>
                    <Position x="50" Y="50"/>
                    <BarPointerCollection>
                        <ej:BarPointers BarPointerValue="100" Width="4" BarPointerBackgroundColor="#6FAAB0"></ej:BarPointers>
                    </BarPointerCollection>
                    <LabelCollection>
                        <ej:Labels><DistanceFromScale X="-13"></DistanceFromScale>
                            <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                        </ej:Labels>
                    </LabelCollection>
                    <TickCollection>
                        <ej:LinearTicks Type="MajorInterval" Width="1" Color="#8c8c8c"/>
                    </TickCollection>
                    <RangeCollection>
                        <ej:Ranges DistanceFromScale="16" StartValue="0" EndValue="50" RangeBackgroundColor="#F6B53F" EndWidth="18" StartWidth="3"><Border Color="#F6B53F"></Border></ej:Ranges>
                        <ej:Ranges DistanceFromScale="16" StartValue="70" EndValue="100" RangeBackgroundColor="#E94649" EndWidth="3" StartWidth="18"><Border Color="#E94649"></Border></ej:Ranges>
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
        });
        $(document).ready(function () {
            var placement = $("#ddlRangePlacement").data("ejDropDownList");
            placement.option({ selectedItemIndex: 0 });
            var rangeid = $("#rangeid").data("ejDropDownList");
            rangeid.option({ selectedItemIndex: 0 });
        });

        function onchange1(args) {
            var startslide = $("#startvalue").data("ejSlider");
            var endslide = $("#endvalue").data("ejSlider");
            var startwidth = $("#startwidth").data("ejSlider");
            var endwidth = $("#endwidth").data("ejSlider");
            var gaugestart = $("#RangeGauge").data("ejLinearGauge");
            startslide.setModel({ maxValue: gaugestart.model.scales[0].ranges[args.itemId].endValue, value: gaugestart.model.scales[0].ranges[args.itemId].startValue });
            endslide.setModel({ minValue: gaugestart.model.scales[0].ranges[args.itemId].startValue, value: gaugestart.model.scales[0].ranges[args.itemId].endValue });
            startwidth.setModel({ value: gaugestart.model.scales[0].ranges[args.itemId].startWidth });
            endwidth.setModel({ value: gaugestart.model.scales[0].ranges[args.itemId].endWidth });
        }

        function onchange(args) {
            var gaugetarget = $("#RangeGauge").data("ejLinearGauge");
            var target1 = $("#rangeid").data("ejDropDownList");
            var endslide = $("#endvalue").data("ejSlider");
            var startslide = $("#startvalue").data("ejSlider");
            if (args.id == "startvalue") {
                endslide.setModel({ minValue: args.value });
                gaugetarget.setRangeStartValue(0, target1.selectedIndexValue, args.value);
            }
            else if (args.id == "endvalue") {
                startslide.setModel({ maxValue: args.value });
                gaugetarget.setRangeEndValue(0, target1.selectedIndexValue, args.value);
            }
            if (args.id == "startwidth")
                gaugetarget.setRangeStartWidth(0, target1.selectedIndexValue, args.value);
            if (args.id == "endwidth")
                gaugetarget.setRangeEndWidth(0, target1.selectedIndexValue, args.value);
            if (args.id == "pointervalue") {
                gaugetarget.setBarPointerValue(0, 0, args.value);
            }
            if (args.text == "far" || args.text == "near" || args.text == "center") {
                gaugetarget.setRangePosition(0, 0, args.text);
                gaugetarget.setRangePosition(0, 1, args.text);
            }
        }
     </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Select Range
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="rangeid" Width="115px" SelectedItemIndex="0" ClientSideOnChange="onchange1">
                        <Items>
                            <ej:DropDownListItem Value="Range1" Text="Range1"/>
                            <ej:DropDownListItem Value="Range2" Text="Range2"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Start Width
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="startwidth" runat="server" SliderType="MinRange" Value="3" Height="10" Width="110" MinValue="0" MaxValue="20" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   End Width
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="endwidth" runat="server" SliderType="MinRange" Value="18" Height="10" Width="110" MinValue="0" MaxValue="20" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
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
                    <ej:Slider ClientIDMode="Static" ID="endvalue" runat="server" SliderType="MinRange" Value="50" Height="10" Width="110" MinValue="0" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="100" Height="10" Width="110" MinValue="0" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Placement
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlRangePlacement" Width="115px" SelectedItemIndex="1" ClientSideOnChange="onchange">
                        <Items>
                            <ej:DropDownListItem Value="far" Text="far"/>
                            <ej:DropDownListItem Value="near" Text="near"/>
                            <ej:DropDownListItem Value="center" Text="center"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

