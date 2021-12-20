<%@ Page Title="DigitalGauge-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the default rendering of the Syncfusion ASP.NET Web Forms Digital Gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.DigitalGauge.Default" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models"
    TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
        <ej:DigitalGauge  ClientIDMode="Static" IsResponsive="true" runat="server" ID="DigitalCore" Height="300" Load="loadGaugeTheme">
            <Items>
                <ej:DigitalGaugeItems Value="123456789">
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
        });

        $(document).ready(function () {
            var textBox = $("#labeltext");
            $(textBox).bind("keyup", function () {
                var val = $("#labeltext").val();
                var digitarget = $("#DigitalCore").data("ejDigitalGauge");
                digitarget.setValue(0, val);
            });

        });

        function onchange(args) {
            var digitaltarget = $("#DigitalCore").data("ejDigitalGauge");
            var charSpacing = $("#charspacing").data("ejSlider");
            if (args.id == "segmentspacing") {
                digitaltarget.model.items[0].segmentSettings.spacing = args.value;
            }
            else if (args.id == "segmentwidth") {
                digitaltarget.model.items[0].segmentSettings.width = args.value;
            }
            else if (args.id == "charspacing") {
                digitaltarget.model.items[0].characterSettings.spacing = args.value;
            }
            if (args.value == "sevensegment" || args.value == "fourteensegment" || args.value == "sixteensegment") {
                digitaltarget.model.items[0].segmentSettings.length = 8;
                digitaltarget.model.items[0].characterSettings.spacing = 10;
                digitaltarget.model.items[0].characterSettings.type = args.value;
                charSpacing.model.minValue = 7;
                charSpacing.model.maxValue = 12;
                charSpacing.setModel({ value: digitaltarget.model.items[0].characterSettings.spacing });
            }
            else if (args.value == "eightcrosseightdotmatrix" || args.value == "eightcrosseightsquarematrix") {
                digitaltarget.model.items[0].segmentSettings.length = 2;
                digitaltarget.model.items[0].characterSettings.spacing = 2;
                digitaltarget.model.items[0].characterSettings.type = args.value;
                charSpacing.model.minValue = 1;
                charSpacing.model.maxValue = 4;
                charSpacing.setModel({ value: digitaltarget.model.items[0].characterSettings.spacing });
            }
            digitaltarget._setModel(digitaltarget.model.items);

        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Segment Spacing
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider  ClientIDMode="Static" runat="server" ID="segmentspacing" SliderType="MinRange" Value="-1" Height="10"
                        Width="110" MinValue="-2" MaxValue="1" EnableAnimation="true" ClientSideOnChange="onchange"
                        ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Segment Width
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider  ClientIDMode="Static" runat="server" ID="segmentwidth" SliderType="MinRange" Value="2" Height="10"
                        Width="110" MinValue="1" MaxValue="3" EnableAnimation="true" ClientSideOnChange="onchange"
                        ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Character Spacing
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider  ClientIDMode="Static" runat="server" ID="charspacing" SliderType="MinRange" Value="2" Height="10"
                        Width="110" MinValue="1" MaxValue="4" EnableAnimation="true" ClientSideOnChange="onchange"
                        ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Label Text
                </div>
                <div class="col-md-3 aligntop">
                    <input type="text" class="ejinputtext" id="labeltext" value="123456789" style="width: 106px" />
                </div>
            </div>
              <div class="row">
                <div class="col-md-3">
                    Character Type
                </div>
                  </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    <ej:DropDownList  ClientIDMode="Static" ID="ddlCharacterType" runat="server" ClientSideOnSelect="onchange"
                        SelectedItemIndex="3" Width="200px">
                        <Items>
                            <ej:DropDownListItem Text="7 Segment" Value="sevensegment"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="14 Segment" Value="fourteensegment"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="16 Segment" Value="sixteensegment"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="8x8 DotMatrix" Value="eightcrosseightdotmatrix">
                            </ej:DropDownListItem>
                            <ej:DropDownListItem Text="8x8 SquareMatrix" Value="eightcrosseightsquarematrix">
                            </ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

