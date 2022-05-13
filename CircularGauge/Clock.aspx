<%@ Page Title="CircularGauge-Clock-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates a real-time clock in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Clock.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Clock" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
  <ej:CircularGauge ClientIDMode="Static" IsResponsive="true" runat="server" ID="CircularGauge1" BackgroundColor="transparent" EnableAnimation="false" DrawLabels="LabelDraw" Load="loadGaugeTheme">
       <Scales>
           <ej:CircularScales StartAngle="270" SweepAngle="360" Radius="150" Minimum="0" Maximum="12" MajorIntervalValue="1" MinorIntervalValue="0.2">
               <PointerCollection>
                   <ej:Pointers Value="3" Length="70" Width="9" ></ej:Pointers>
                   <ej:Pointers Value="0" Length="95" Width="9" ></ej:Pointers>
                   <ej:Pointers Value="1.5" Length="95" Width="2" ></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major" Placement="Near" Height="12" Width="5" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor" Placement="Near" Height="7" Width="0.7" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c" DistanceFromScale="5" IncludeFirstValue="false"></ej:CircularLabels>
               </LabelCollection>
           </ej:CircularScales>
       </Scales>
        </ej:CircularGauge>
        </div>
</asp:Content>


<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
      <script type="text/javascript">


          function LabelDraw(args) {
              if (args.labelValue == 0) {
                  args.style.textValue = "";
              }
              else if (args.labelValue == 12 || args.labelValue == 3 || args.labelValue == 6 || args.labelValue == 9) {
                  args.style.font = "Bold 20px Segoe UI";
              }
          }

          function setClock() {
              var estDay, estTime, estHours;
              var time = new Date();
              var utcHours = time.getUTCHours();
              var utcMinutes = time.getUTCMinutes();
              var utcSeconds = time.getUTCSeconds();
              if (utcHours - 5 < 0) {
                  estHours = (utcHours - 5 + 24);
              } else {
                  estHours = (utcHours - 5); }
              if (estHours > 12) {
                  estDay = "PM";
                  estHours = estHours - 12;
              }
              else {
                  estDay = "AM";
              }

              utcSeconds = (utcSeconds / 60) * 12;
              utcMinutes = (utcMinutes / 60) * 12 + utcSeconds / 60;
              if (estHours == 12)
                  estHours = 0;
              estHours = estHours + (utcMinutes / 12) + 1;
              var estText = parseInt(estHours) == 0 ? 12 : parseInt(estHours);
              var utcmin = (parseInt(time.getUTCMinutes()) < 10) ? "0" + parseInt(time.getUTCMinutes()) : parseInt(time.getUTCMinutes());

              estTime = "EST Time : " + estText + ":" + utcmin + ":" + parseInt(time.getUTCSeconds()) + " " + estDay;

              var clockgauge = $("#CircularGauge1").data("ejCircularGauge");
              if (clockgauge != undefined) {
                  clockgauge.setPointerValue(0, 0, estHours);
                  clockgauge.setPointerValue(0, 1, utcMinutes);
                  clockgauge.setPointerValue(0, 2, utcSeconds);
              }
          }
          var timer;
          $(document).ready(function () {
              timer = window.setInterval("setClock()", 1);
          });
</script>
</asp:Content>



