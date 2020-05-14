<%@ Page Title="CircularGauge-Legend-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the wind speed using the legend in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scales.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Scales" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <style type="text/css">
        .col-md-3 .e-ddl .e-input {
            line-height:20px;
        }
    </style>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
           <ej:CircularGauge runat="server" ClientIDMode="Static" ID="LegendCircularGauge" EnableAnimation="false" BackgroundColor="transparent" Width="500" OuterCustomLabelPosition="Top" Load="loadGaugeTheme" IsResponsive="true">
               <Legend Visible="true">
                   <Size Width="300" />
               </Legend>
               <Scales>
                   <ej:CircularScales ShowRanges="true" Radius="130" StartAngle="122" SweepAngle="296" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
                       <Border Width="0.5" />
                       <PointerCollection>
                           <ej:Pointers Value="60" ShowBackNeedle="true" BackNeedleLength="20" Length="80" Width="7">
                           </ej:Pointers>
                       </PointerCollection>
                       <LabelCollection>
                           <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                       </LabelCollection>
                       <CustomLabelCollection>
                           <ej:CircularCustomLabel Value="Measure of wind speed in km/h" CustomLabelPositionType="Outer">
                               <Font FontFamily="Segoe UI" FontStyle="normal" Size="15"></Font>
                           </ej:CircularCustomLabel>
                       </CustomLabelCollection>
                       <TickCollection>
                           <ej:CircularTicks Type="Major" DistanceFromScale="2" Height="16" Width="1" Color="#8c8c8c"/>
                           <ej:CircularTicks Type="Minor" DistanceFromScale="2" Height="8" Width="1" Color="#8c8c8c"/>
                       </TickCollection>
                       <RangeCollection>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="0" EndValue="5" BackgroundColor="#ccffff" LegendText="Light air">
                               <Border Color="#ccffff" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="5" EndValue="11" BackgroundColor="#99ffff" LegendText="Light breeze">
                               <Border Color="#99ffff" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="11" EndValue="19" BackgroundColor="#99ff99" LegendText="Gentle breeze">
                               <Border Color="#99ff99" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="19" EndValue="28" BackgroundColor="#79ff4d" LegendText="Moderate breeze">
                               <Border Color="#79ff4d" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="28" EndValue="49" BackgroundColor="#c6ff1a" LegendText="Strong breeze">
                               <Border Color="#c6ff1a" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="49" EndValue="74" BackgroundColor="#e6ac00" LegendText="Gale">
                               <Border Color="#e6ac00" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="74" EndValue="102" BackgroundColor="#ff6600" LegendText="Strom">
                               <Border Color="#ff6600" />
                           </ej:CircularRanges>
                           <ej:CircularRanges DistanceFromScale="-28" StartValue="102" EndValue="120" BackgroundColor="#ff0000" LegendText="Hurricane force">
                               <Border Color="#ff0000" />
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

        function position(sender) {
            var gauge = $("#LegendCircularGauge").ejCircularGauge("instance");
            gauge.model.legend.position = sender.text.toLowerCase();
		    gauge.refresh();
		    var pointerLength = gauge.model.scales[0].radius - gauge.model.scales[0].ticks[0].height - (parseInt(gauge.model.scales[0].labels[0].font.size) + 5);
            gauge.setPointerLength(0, 0, pointerLength); 
        }

        function alignment(sender) {
            var gauge = $("#LegendCircularGauge").ejCircularGauge("instance");
            gauge.model.legend.alignment = sender.text.toLowerCase();
            gauge.refresh();
        }

        function shape(sender) {
            var gauge = $("#LegendCircularGauge").ejCircularGauge("instance");
            gauge.model.legend.shape = sender.text.toLowerCase();
            gauge.refresh();
        }

      
     </script>
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Position
                </div>
                <div class="col-md-3">
                     <ej:DropDownList ClientIDMode="Static" ID="legendposition" runat="server" Width="110px" Height="22px"
                          SelectedItemIndex="1" ClientSideOnChange="position">
                         <Items>
                             <ej:DropDownListItem Text="Top" Value="top"></ej:DropDownListItem>
                             <ej:DropDownListItem Text="Bottom" Value="bottom"></ej:DropDownListItem>
                             <ej:DropDownListItem Text="Left" Value="left"></ej:DropDownListItem>
                             <ej:DropDownListItem Text="Right" Value="right"></ej:DropDownListItem>
                         </Items>
                     </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Alignment
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="legendalignment" runat="server" Width="110px" Height="22px" SelectedIndex="1" ClientSideOnChange="alignment">
                        <Items>
                            <ej:DropDownListItem Text="Near" Value="near"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Center" Value="center"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Far" Value="far"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                        
                </div>
           </div>
           <div class="row">
                <div class="col-md-3">
                    Shape
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="legendshape" runat="server" Width="110px" Height="22px" SelectedIndex="0" ClientSideOnChange="shape">
                        <Items>
                            <ej:DropDownListItem Text="Circle" Value="circle"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Diamond" Value="diamond"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Rectangle" Value="rectangle"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Triangle" Value="triangle"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Slider" Value="slider"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Wedge" Value="wedge"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Pentagon" Value="pentagon"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Trapezoid" Value="trapezoid"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Line" Value="line"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
           </div>
        </div>
    </div>
</asp:Content>

