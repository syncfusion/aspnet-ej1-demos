<%@ Page Title="CircularGauge-Image Pointer-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the short-put distance covered by the athletes by using the image pointer in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PointerImage.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.PointerImage" %>
<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center"  style="height:auto">
<ej:CircularGauge runat="server" ID="CircularGauge1" Radius="80" Width="700" Height="600" EnableAnimation="false"  BackgroundColor="#e0e0e0" DrawLabels="drawLabels" DrawPointers="drawpointers">
  <Scales>
      <ej:CircularScales ShowScaleBar="false" ShowRanges="true" ShowIndicators="true" ShowTicks="false" Radius="80" SweepAngle="300" StartAngle="120" Opacity="1" MinorIntervalValue="10">
          <RangeCollection>
              <ej:CircularRanges StartValue="0" EndValue="80" Size="40" DistanceFromScale="-73" BackgroundColor="#bc4b4b">
                  <Border Color="#bc4b4b" Width="2"/>
              </ej:CircularRanges>
              <ej:CircularRanges StartValue="0" EndValue="70" Size="40" DistanceFromScale="-132" BackgroundColor="#21a56f">
                  <Border Color="#21a56f" Width="2"/>
              </ej:CircularRanges>
              <ej:CircularRanges StartValue="0" EndValue="90" Size="40" DistanceFromScale="-190" BackgroundColor="#2bafbc">
                  <Border Color="#2bafbc" Width="2"/>
              </ej:CircularRanges>
          </RangeCollection>
          <LabelCollection>
              <ej:CircularLabels Color="transparent">
              </ej:CircularLabels>
          </LabelCollection>
          <IndicatorCollection>
              <ej:CircularIndicators Height="10" Width="10" Type="text">
                  <StateRangeCollection>
                      <ej:CircularStateRanges EndValue="100" StartValue="0" TextColor="#8c8c8c" >
                          <Font Size="12px"></Font>
                      </ej:CircularStateRanges>
                  </StateRangeCollection>
              </ej:CircularIndicators>
               <ej:CircularIndicators Height="10" Width="10" Type="text">
                  <StateRangeCollection>
                      <ej:CircularStateRanges EndValue="100" StartValue="0" TextColor="#8c8c8c" >
                          <Font Size="12px"></Font>
                      </ej:CircularStateRanges>
                  </StateRangeCollection>
              </ej:CircularIndicators>
               <ej:CircularIndicators Height="10" Width="10" Type="text">
                  <StateRangeCollection>
                      <ej:CircularStateRanges EndValue="100" StartValue="0" TextColor="#8c8c8c" >
                          <Font Size="12px"></Font>
                      </ej:CircularStateRanges>
                  </StateRangeCollection>
              </ej:CircularIndicators>
          </IndicatorCollection>
          <Border Width="0"/>
          <CustomLabelCollection>
              <ej:CircularCustomLabel Value="SPORTS" Color="#333333">
                  <Position X="350" Y="280"/>
                  <Font Size="24px" FontFamily="Segoe UI" FontStyle="Bold"></Font>
              </ej:CircularCustomLabel>
              <ej:CircularCustomLabel Value="Fans Ratio" Color="#333333">
                  <Position X="350" Y="310"/>
                  <Font Size="18px" FontFamily="Segoe UI"></Font>
              </ej:CircularCustomLabel>
              <ej:CircularCustomLabel Value="(in millions)" Color="#333333">
                  <Position X="350" Y="330"/>
                  <Font Size="12px" FontFamily="Segoe UI"></Font>
              </ej:CircularCustomLabel>
          </CustomLabelCollection>
          <PointerCollection>
              <ej:Pointers Type="Marker" MarkerType="Image" Value="80" DistanceFromScale="10" Placement="Far" Length="42" Width="43" BackgroundColor="transparent" ImageUrl="../Content/images/gauge/golfball.png">
                  <Border Width="0"/>
              </ej:Pointers>
              <ej:Pointers Type="Marker" MarkerType="Image" Value="70" DistanceFromScale="69" Placement="Far" Length="42" Width="43" BackgroundColor="transparent" ImageUrl="../Content/images/gauge/basketball.png">
                  <Border Width="0"/>
              </ej:Pointers>
              <ej:Pointers Type="Marker" MarkerType="Image" Value="90" DistanceFromScale="126" Placement="Far" Length="42" Width="43" BackgroundColor="transparent" ImageUrl="../Content/images/gauge/football.png">
                  <Border Width="0"/>
              </ej:Pointers>
          </PointerCollection>
      </ej:CircularScales>
  </Scales>
</ej:CircularGauge>
</div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        function drawLabels(args) {
            if (args.pointerValue != 100 && args.pointerValue != 0)
                args.style.textValue = "";
        }
        function drawpointers(args) {
            var i = args.pointer.index;
            args.model.scales[0].indicators[i].stateRanges[0].text = args.pointer.pointerValue.toString();
            args.model.scales[0].indicators[i].position.x = args.position.startX + 20;
            args.model.scales[0].indicators[i].position.y = args.position.startY + 50;
        }
     </script>
</asp:Content>

