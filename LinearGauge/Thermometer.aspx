<%@ Page Title="LinearGauge-Thermometer-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample depicts a thermometer in the Syncfusion ASP.NET Web Forms Linear gauge control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Thermometer.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Thermometer" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
   <ej:LinearGauge ClientIDMode="Static" runat="server" ID="thermoLinear" Height="550" Width="500" LabelColor="#8c8c8c" Load="loadGaugeTheme" DrawLabels="DrawLabel" DrawCustomLabel="DrawCustomLabel" EnableAnimation="false">
            <Scales>
                <ej:Scales Type="Thermometer" MinorIntervalValue="5" ShowCustomLabels="true" Width="30" Minimum="-10" Maximum="110" BackgroundColor="transparent" ShowMarkerPointers="true" Length="355">
                    <Border Width="0.5"></Border>
                    <Position x="50" Y="18"/>
                    <MarkerPointerCollection>
                        <ej:MarkerPointers MarkerOpacity="0"></ej:MarkerPointers>
                    </MarkerPointerCollection>
                    <BarPointerCollection>
                        <ej:BarPointers BarPointerdistanceFromScale="-0.5"  BarPointerValue="100" Width="10" BarPointerBackgroundColor="#DB3738"></ej:BarPointers>
                    </BarPointerCollection>
                    <LabelCollection>
                        <ej:Labels><DistanceFromScale X="-13"></DistanceFromScale>
                            <Font FontFamily="Segoe UI" FontStyle="Normal" Size="11px"></Font>
                        </ej:Labels>
                        <ej:Labels Placement="Far"><DistanceFromScale X="10"></DistanceFromScale>
                        </ej:Labels>
                    </LabelCollection>
                    <TickCollection>
                        <ej:LinearTicks Type="MajorInterval" Height="8" Width="1" Color="#8c8c8c"></ej:LinearTicks>
                        <ej:LinearTicks Type="MinorInterval" Height="4" Width="1" Color="#8c8c8c"></ej:LinearTicks>
                        <ej:LinearTicks Placement="Far" Type="MajorInterval" Height="8" Width="1" Color="#8c8c8c"></ej:LinearTicks>
                        <ej:LinearTicks Placement="Far" Type="MinorInterval" Height="4" Width="1" Color="#8c8c8c"></ej:LinearTicks>
                    </TickCollection>
                    <CustomLabelCollection>
                        <ej:CustomLabel Value="(° C)" Color="#666666" >
                            <Position X="44" Y="78"/>
                            <Font FontFamily="Segoe UI" FontStyle="Bold" Size="12px"></Font>
                        </ej:CustomLabel>
                        <ej:CustomLabel Value="(° F)" Color="#666666" >
                            <Position X="56" Y="78"/>
                            <Font FontFamily="Segoe UI" FontStyle="Bold" Size="12px"></Font>
                        </ej:CustomLabel>
                        <ej:CustomLabel Color="#666666" >
                            <Position X="51" Y="90"/>
                            <Font FontFamily="Segoe UI" FontStyle="Bold" Size="13px"></Font>
                        </ej:CustomLabel>
                    </CustomLabelCollection>
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
        function DrawLabel(args) {
            if (args.label.index == 1) {
                args.style.textValue = (args.label.value * (9 / 5)) + 32;
                args.style.font = "Normal 10px Segoe UI";
            }
        }
        function DrawCustomLabel(args) {
            if (args.customLabelIndex == 2) {
                var temp = args.scaleElement.barPointers[0].value;
                var fahValue = (temp * (9 / 5)) + 32;
                if (temp == -10) {
                    args.style.textValue = "Very Cold Weather" + "(" + fahValue.toFixed(1) + "° F)";
                }
                else if ((temp > -10 && temp < 0) || (temp > 0 && temp < 15)) {
                    args.style.textValue = "Cool Weather" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp == 0) {
                    args.style.textValue = "Freezing point of Water" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp >= 15 && temp < 30) {
                    args.style.textValue = "Room Temperature" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp == 30) {
                    args.style.textValue = "Beach Weather" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp == 37) {
                    args.style.textValue = "Body Temperature" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp == 40) {
                    args.style.textValue = "Hot Bath Temperature" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp > 40 && temp < 100) {
                    args.style.textValue = "Very Hot Temperature" + " (" + fahValue.toFixed(1) + "° F)";
                }
                else if (temp == 100) {
                    args.style.textValue = "Boiling point of Water" + " (" + fahValue.toFixed(1) + "° F)";
                }
            }
        }
        function onchange(args) {
            var slider = $("#pointervalue").data("ejSlider");
            var thermotarget = $("#thermoLinear").data("ejLinearGauge");
            if (args.id == "pointervalue") {
                thermotarget.setBarPointerValue(0, 0, args.value);
            }
            else if (args.text == "Boiling Point") {
                thermotarget.setBarPointerValue(0, 0, 100);
            }

            else if (args.text == "Hot Bath") {
                thermotarget.setBarPointerValue(0, 0, 40);
            }

            else if (args.text == "Body Temp") {
                thermotarget.setBarPointerValue(0, 0, 37);
            }

            else if (args.text == "Beach Weather") {
                thermotarget.setBarPointerValue(0, 0, 30);
            }

            else if (args.text == "Cool Day") {
                thermotarget.setBarPointerValue(0, 0, 10);
            }

            else if (args.text == "Freezing Point") {
                thermotarget.setBarPointerValue(0, 0, 0);
            }

            else if (args.text == "Extreme Cold") {
                thermotarget.setBarPointerValue(0, 0, -10);
            }
            slider.option({ value: thermotarget.getBarPointerValue(0, 0) });
        }
     </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Temperature Type
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlTempType" Width="115px" SelectedItemIndex="0" ClientSideOnSelect="onchange" ClientSideOnChange="onchange">
                        <Items>
                            <ej:DropDownListItem  Text="Boiling Point" Value="Boiling Point"/>
                            <ej:DropDownListItem  Text="Hot Bath" Value="Hot Bath"/>
                            <ej:DropDownListItem  Text="Body Temp" Value="Body Temp"/>
                            <ej:DropDownListItem  Text="Beach Weather" Value="Beach Weather"/>
                            <ej:DropDownListItem  Text="Cool Day" Value="Cool Day"/>
                            <ej:DropDownListItem  Text="Freezing Point" Value="Freezing Point"/>
                            <ej:DropDownListItem  Text="Extreme Cold" Value="Extreme Cold"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="100" Height="10" Width="110" MinValue="-10" MaxValue="110" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

