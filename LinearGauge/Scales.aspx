<%@ Page Title="LinearGauge-Scales-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates the scale of the Linear gauge in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scales.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Scales" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
<ej:LinearGauge ClientIDMode="Static" runat="server" IsResponsive="true" ID="ScaleGauge" LabelColor="#8c8c8c" Load="loadGaugeTheme" EnableAnimation="false">
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

            var lineartarget = $("#ScaleGauge").data("ejLinearGauge");
            if (args.id == "scalesize") {
                lineartarget.setScaleBarSize(0, args.value);
            }
            else if (args.id == "locationX") {
                lineartarget.setScaleLocation(0, { x: args.value, y: lineartarget.model.scales[0].position.y });
            }
            else if (args.id == "locationY") {
                lineartarget.setScaleLocation(0, { x: lineartarget.model.scales[0].position.x, y: args.value });
            }
            else if (args.id == "pointervalue") {
                lineartarget.setPointerValue(0, 0, args.value);
                lineartarget.setBarPointerValue(0, 0, args.value);
            }
            else if (args.value == "clockwise") {
                lineartarget.setScaleDirection(0, args.value);
            }
            else if (args.value == "counterclockwise") {
                lineartarget.setScaleDirection(0, args.value);
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
                    <ej:Slider ClientIDMode="Static" ID="scalesize" runat="server" SliderType="MinRange" Value="7" Height="10" Width="120" MinValue="5" MaxValue="15" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Scale Location X
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="locationX" runat="server" SliderType="MinRange" Value="51" Height="10" Width="120" MinValue="48" MaxValue="53" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" /> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Scale Location Y
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="locationY" runat="server" SliderType="MinRange" Value="50" Height="10" Width="120" MinValue="40" MaxValue="55" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" /> 
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Pointer Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:Slider ClientIDMode="Static" ID="pointervalue" runat="server" SliderType="MinRange" Value="50" Height="10" Width="120" MinValue="0" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Scale Orientation
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="ddlScaleDirection" runat="server" Width="115px" SelectedItemIndex="1" ClientSideOnChange="onchange">
                       <Items>
                           <ej:DropDownListItem  Text="Clockwise" Value="clockwise"/>
                           <ej:DropDownListItem  Text="CounterClockwise" Value="counterclockwise"/>
                       </Items>
                   </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

