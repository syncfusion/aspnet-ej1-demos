<%@ Page Title="LinearGauge-Pointers-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the pointer behavior in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Pointers.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Pointers" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
<ej:LinearGauge ClientIDMode="Static" runat="server" IsResponsive="true" ID="PointerGauge" LabelColor="#8c8c8c" Load="loadGaugeTheme" EnableAnimation="false">
            <Scales>
                <ej:Scales Width="4" BackgroundColor="transparent" ShowRanges="true" Length="310">
                    <Border Color="transparent" Width="0"></Border>
                    <Position x="51" Y="50"/>
                    <MarkerPointerCollection>
                        <ej:MarkerPointers Value="60" Length="10" MarkerdistanceFromScale="8" Width="10" MarkerBackgroundColor="#4D4D4D"><Border Color="#4D4D4D"></Border></ej:MarkerPointers>
                    </MarkerPointerCollection>
                    <BarPointerCollection>
                        <ej:BarPointers BarPointerValue="60" Width="4" BarPointerdistanceFromScale="8" BarPointerBackgroundColor="#6FAAB0"></ej:BarPointers>
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
                        <ej:Ranges StartValue="0" EndValue="60" RangeBackgroundColor="#F6B53F" EndWidth="4" StartWidth="4"><Border Color="#F6B53F"></Border></ej:Ranges>
                        <ej:Ranges StartValue="60" EndValue="100" RangeBackgroundColor="#E94649" EndWidth="4" StartWidth="4"><Border Color="#E94649"></Border></ej:Ranges>
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
        function onchange(args) {
            var linearpointer = $("#PointerGauge").data("ejLinearGauge");

            if (args.id == "pointerwidth") {
                linearpointer.setPointerWidth(0, 0, args.value);
            }
            else if (args.id == "pointervalue") {
                linearpointer.setPointerValue(0, 0, args.value);
                linearpointer.setBarPointerValue(0, 0, args.value);
            }
            else if (args.value == "far" || args.value == "near" || args.value == "center") {
                linearpointer.setPointerPlacement(0, 0, args.value);
            }
            else if (args.value == "diamond" || args.value == "rectangle" || args.value == "triangle" || args.value == "ellipse" || args.value == "pentagon" || args.value == "circle" || args.value == "star" || args.value == "slider" || args.value == "pointer" || args.value == "wedge" || args.value == "trapezoid" || args.value == "Rounded Rect") {
                if (args.text == "Rounded Rect")
                    linearpointer.setMarkerStyle(0, 0, "roundedrectangle");
                else
                    linearpointer.setMarkerStyle(0, 0, args.value);
            }
        }
     </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Pointer width
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="pointerwidth" runat="server" SliderType="MinRange" Value="15" Height="10" Width="120" MinValue="10" MaxValue="25" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" /> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider  ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="60" Height="10" Width="120" MinValue="0" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Placement
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlPointerPlacement" SelectedItemIndex="0" Width="115px" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Text="Far" Value="far"/>
                            <ej:DropDownListItem Text="Near" Value="near"/>
                            <ej:DropDownListItem Text="Center" Value="center"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Marker Style
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlMarkerStyle" SelectedItemIndex="2" Width="115px" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Text="Diamond" Value="diamond"/>
                            <ej:DropDownListItem Text="Rectangle" Value="rectangle"/>
                            <ej:DropDownListItem Text="Triangle" Value="triangle"/>
                            <ej:DropDownListItem Text="Ellipse" Value="ellipse"/>
                            <ej:DropDownListItem Text="Pentagon" Value="pentagon"/>
                            <ej:DropDownListItem Text="Circle" Value="circle"/>
                            <ej:DropDownListItem Text="Star" Value="star"/>
                            <ej:DropDownListItem Text="Slider" Value="slider"/>
                            <ej:DropDownListItem Text="Pointer" Value="pointer"/>
                            <ej:DropDownListItem Text="Wedge" Value="wedge"/>
                            <ej:DropDownListItem Text="Trapezoid" Value="trapezoid"/>
                            <ej:DropDownListItem Text="Rounded Rect" Value="Rounded Rect"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

