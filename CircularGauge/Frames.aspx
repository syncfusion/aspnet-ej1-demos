<%@ Page Title="CircularGauge-Frames and Angles-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the frame and angle in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Frames.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Frames" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
          <ej:CircularGauge ClientIDMode="Static" runat="server" ID="FrameCircularGauge" EnableAnimation="false" BackgroundColor="transparent" Width="500" Load="loadGaugeTheme">
              <Scales>
                  <ej:CircularScales ShowRanges="true" StartAngle="122" SweepAngle="296" Radius="130" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
                      <Border Width="0.5"/>
                      <PointerCollection>
                          <ej:Pointers Value="60" ShowBackNeedle="true" BackNeedleLength="5" Length="95" Width="7">
                          </ej:Pointers>
                      </PointerCollection>
                      <PointerCap Radius="12">
                      </PointerCap>
                      <TickCollection>
                          <ej:CircularTicks Type="Major" Height="16" Width="1" DistanceFromScale="2" Color="#8c8c8c" />
                          <ej:CircularTicks Type="Minor" Height="8" Width="1" DistanceFromScale="2" Color="#8c8c8c" />
                      </TickCollection>
                      <LabelCollection>
                          <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                      </LabelCollection>
                      <RangeCollection>
                          <ej:CircularRanges BackgroundColor="green" StartWidth="10" StartValue="0" EndValue="40" EndWidth="20" DistanceFromScale="10" Placement="Far">
                              <Border Color="green" Width="0" />
                          </ej:CircularRanges>
                           <ej:CircularRanges BackgroundColor="Yellow" StartWidth="20" StartValue="40" EndValue="80" EndWidth="30" DistanceFromScale="10" Placement="Far">
                              <Border Width="0" Color="Yellow" />
                          </ej:CircularRanges>
                           <ej:CircularRanges BackgroundColor="Red" StartWidth="30" StartValue="80" EndValue="120" EndWidth="35" DistanceFromScale="10" Placement="Far">
                              <Border Width="0" Color="Red" />
                          </ej:CircularRanges>
                      </RangeCollection>
                  </ej:CircularScales>
              </Scales>
               
        </ej:CircularGauge>
        </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
     $(document).ready(function () {
         $("#sampleProperties").ejPropertiesPanel();
     });

     function onchange(args) {
         if (args.type == "select" && args.text == "Semi - Circular") {
             $("#frameStartAngle").ejDropDownList("option", "enabled", true);
             $("#frameStartAngle").ejDropDownList("option", "selectedItemIndex", 2);
             $("#FrameCircularGauge").ejCircularGauge("option", "frame", { frameType: "halfcircle", halfCircleFrameStartAngle: 180 });
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ startAngle: 180, sweepAngle: 180 }]);
             $("#startAngle").ejSlider("option", "enabled", false);
             $("#startAngle").ejSlider("option", "value", 180);
             $("#sweepAngle").ejSlider("option", "maxValue", 180);
             $("#sweepAngle").ejSlider("option", "value", 180);
         }
         else if (args.type == "select" && args.text == "Full - Circular") {
             $("#frameStartAngle").ejDropDownList("option", "enabled", false);
             $("#FrameCircularGauge").ejCircularGauge("option", "frame", { frameType: "fullcircle" });
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ startAngle: 122, sweepAngle: 296 }]);
             $("#startAngle").ejSlider("option", "enabled", true);
             $("#startAngle").ejSlider("option", "value", 122);
             $("#sweepAngle").ejSlider("option", "value", 296);
             $("#sweepAngle").ejSlider("option", "maxValue", 360);
         }
         else if (args.type == "select" && args.text == "Far") {
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ ranges: [{ placement: "far" }, { placement: "far" }, { placement: "far" }] }]);
         }
         else if (args.type == "select" && args.text == "Near") {
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ ranges: [{ placement: "near" }, { placement: "near" }, { placement: "near" }] }]);
         }
         else if (args.type == "select") {
             $("#FrameCircularGauge").ejCircularGauge("option", "frame", { halfCircleFrameStartAngle: parseInt(args.text), halfCircleFrameEndAngle: parseInt(args.text) + 180 });
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ startAngle: parseInt(args.text), sweepAngle: 180 }]);
             $("#startAngle").ejSlider("option", "value", parseInt(args.text));
             $("#sweepAngle").ejSlider("option", "value", 180);
         }
         else if (!ej.isNullOrUndefined(args.isChecked)) {
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ direction: args.isChecked ? "clockwise" : "counterclockwise" }]);
         }
         else if (args.id == "rangeDistance") {
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ ranges: [{ distanceFromScale: args.value }, { distanceFromScale: args.value }, { distanceFromScale: args.value }] }]);
         }
         else if (args.id == "startAngle") {
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ startAngle: args.value }]);
         }
         else if (args.id == "sweepAngle") {
             $("#FrameCircularGauge").ejCircularGauge("option", "scales", [{ sweepAngle: args.value }]);
         }
     }

   
</script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">

            <div class="row">
                <div class="col-md-3"> Frame Type</div>
                <div class="col-md-3 aligntop">
                   <ej:DropDownList ClientIDMode="Static" ID="frameType" Width="110px" runat="server" SelectedItemIndex="0" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Value="Full - Circular" Text="Full - Circular" />
                            <ej:DropDownListItem Value="Semi - Circular" Text="Semi - Circular" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Range Placement</div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="rangePlacement" Width="110px" runat="server" SelectedItemIndex="0" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Value="Far" Text="Far" />
                            <ej:DropDownListItem Value="Near" Text="Near" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Start Angle</div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="startAngle" runat="server" SliderType="MinRange" Value="122" Height="10" Width="110" MinValue="0" MaxValue="360" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Sweep Angle</div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="sweepAngle" runat="server" SliderType="MinRange" Value="296" Height="10" Width="110" MinValue="90" MaxValue="360" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
             <div class="row">
                <div class="col-md-3">Frame start angle</div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="frameStartAngle" Width="110px" runat="server" SelectedItemIndex="2" ClientSideOnSelect="onchange" Enabled="false">
                        <Items>
                            <ej:DropDownListItem Value="0" Text="0" />
                            <ej:DropDownListItem Value="90" Text="90" />
                            <ej:DropDownListItem Value="180" Text="180" />
                            <ej:DropDownListItem Value="270" Text="270" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">clockwise direction</div>
                <div class="col-md-3 aligntop">
                   <ej:CheckBox  runat="server" ID="chkclockwise"  Checked="true" ClientSideOnChange="onchange"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">Range Distance</div>
                <div class="col-md-3 aligntop">
                   <ej:Slider ClientIDMode="Static" ID="rangeDistance" runat="server" SliderType="MinRange" Value="10" Height="10" Width="110" MinValue="0" MaxValue="15" EnableAnimation="true" ClientSideOnChange="onchange" ClientSideOnSlide="onchange" />
                </div>
            </div>
           













        </div>
    </div>
</asp:Content>


