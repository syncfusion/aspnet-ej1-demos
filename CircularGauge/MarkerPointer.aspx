<%@ Page Title="CircularGauge-Marker Pointer-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the marker pointer behavior of the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MarkerPointer.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.MarkerPointer" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
          <ej:CircularGauge Width="500" IsResponsive="true" ClientIDMode="Static" runat="server" ID="CoreCircularGauge" Radius= "100" Value= "55" BackgroundColor= "transparent"  DrawCustomLabel= "drawCustomLabels" EnableAnimation= "false">
               <Frame FrameType="HalfCircle" HalfCircleFrameEndAngle="360" HalfCircleFrameStartAngle="180"/>
       <Scales>
           <ej:CircularScales  StartAngle= "180" SweepAngle= "180" MajorIntervalValue= "100" ShowRanges= "true">
               <TickCollection>
                   <ej:CircularTicks Height= "0" Width= "0"/>
               </TickCollection>

               <PointerCollection>
                   <ej:Pointers  Type= "Marker" MarkerType="Diamond" Width= "40" Length= "20" DistanceFromScale= "10" BackgroundColor= "black">
                       <PointerValueText Angle="0" AutoAngle="false" Color="red" Distance="-5" Opacity="1" ShowValue="true">
                           <Font FontFamily="Arial" FontStyle="Normal" Size="15px">
                           </Font>
                       </PointerValueText>
                   </ej:Pointers>
               </PointerCollection>
               
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
               </LabelCollection>

               <RangeCollection>
                   <ej:CircularRanges Size= "40" StartValue= "0" EndValue= "50" BackgroundColor= "#1B4279">
                       <Border Color= "#1B4279"></Border>
                   </ej:CircularRanges>
                   <ej:CircularRanges Size= "40" StartValue= "50" EndValue= "100" BackgroundColor= "#91B8F3">
                       <Border Color="#91B8F3"></Border>
                   </ej:CircularRanges>
               </RangeCollection>
               <CustomLabelCollection>
                   <ej:CircularCustomLabel Value= "">
                       <Font  Size= "25px" FontFamily= "Arial" FontStyle= "Bold"></Font>
                       <Position X= "250" Y= "200" />
                   </ej:CircularCustomLabel>
               </CustomLabelCollection>
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

        function drawCustomLabels(args) {
            args.style.textValue = args.model.scales[0].pointers[0].value.toFixed(2).toString();
        }

        function onchange(args) {
            var marker = $("#CoreCircularGauge").data("ejCircularGauge");
            if (args.type == "select") {
                $("#CoreCircularGauge").ejCircularGauge("option", "scales", [{ pointers: [{ markerType: args.value }] }]);
            }
            else if (!ej.isNullOrUndefined(args.isChecked)) {
                $("#animationSpeed").ejSlider("option", "enabled", args.isChecked);
                $("#CoreCircularGauge").ejCircularGauge("option", "enableAnimation", args.isChecked);
            }
            else if (args.id == "pointerwidth") {
                $("#CoreCircularGauge").ejCircularGauge("option", "scales", [{ pointers: [{ length: args.value }] }]);
            }
            else if (args.id == "pointerlength") {
                $("#CoreCircularGauge").ejCircularGauge("option", "scales", [{ pointers: [{ width: args.value }] }]);
            }
            else if (args.id == "animationSpeed") {
                $("#CoreCircularGauge").ejCircularGauge("option", "animationSpeed", args.value);
            }
            else if (args.id == "distanceFromScale") {
                $("#CoreCircularGauge").ejCircularGauge("option", "scales", [{ pointers: [{ distanceFromScale: args.value }] }]);
            }
            else if (args.id == "pointerValue") {
                marker.model.value = args.value;
                marker.model.scales[0].pointers[0].value = args.value;
                marker.model.scales[0].pointers[0]._value = args.value;
                marker.refresh();
            }
        }
     </script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">Pointer Length</div>
                <div class="col-md-3">
                   <ej:Slider ClientIDMode="Static" ID="pointerlength" runat="server" SliderType="MinRange" Value="40" Height="10" width="110" MinValue="10" MaxValue="40"  EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Pointer Width</div>
                <div class="col-md-3">
                   <ej:Slider ClientIDMode="Static" ID="pointerwidth" runat="server" SliderType="MinRange" Value="20" Height="10" width="110" MinValue="5" MaxValue="35" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Enable Animation</div>
                <div class="col-md-3 aligntop">
                   <ej:CheckBox runat="server" ID="chkEnableAnimation"  Checked="false" ClientSideOnChange="onchange"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Animation Speed</div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="animationSpeed" runat="server" SliderType="MinRange" Value="500" Height="10" Width="110" MinValue="100" MaxValue="1000" EnableAnimation="true" ClientSideOnChange="onchange" enabled="false" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Distance from Scale</div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="distanceFromScale" runat="server" SliderType="MinRange" Value="10" Height="10" Width="110" MinValue="-50" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Pointer Value</div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="pointerValue" runat="server" SliderType="MinRange" Value="55" Height="10" Width="110" MinValue="0" MaxValue="100" EnableAnimation="true" ClientSideOnChange="onchange" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Marker Type</div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="markerType" Width="110px" runat="server" SelectedItemIndex="3" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Value="rectangle" Text="Rectangle" />
                            <ej:DropDownListItem Value="triangle" Text="Triangle" />
                            <ej:DropDownListItem Value="ellipse" Text="Ellipse" />
                            <ej:DropDownListItem Value="diamond" Text="Diamond" />
                            <ej:DropDownListItem Value="pentagon" Text="Pentagon" />
                            <ej:DropDownListItem Value="circle" Text="Circle" />
                            <ej:DropDownListItem Value="slider" Text="Slider" />
                            <ej:DropDownListItem Value="pointer" Text="Pointer" />
                            <ej:DropDownListItem Value="wedge" Text="Wedge" />
                            <ej:DropDownListItem Value="trapezoid" Text="Trapezoid" />
                            <ej:DropDownListItem Value="roundedrectangle" Text="RoundedRectangle" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

