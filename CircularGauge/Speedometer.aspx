<%@ Page Title="CircularGauge-Speedometer-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates a speedometer in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Speedometer.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Speedometer" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
 <ej:CircularGauge Load="loadGaugeTheme"  ClientIDMode="Static" runat="server" IsResponsive="true" ID="CircularGauge1" BackgroundColor="transparent" EnableAnimation="false">
       <Scales>
           <ej:CircularScales ShowScaleBar="true" Radius="140" Size="0.3" ShowRanges="true" MinorIntervalValue="5">
               <PointerCollection>
                   <ej:Pointers ShowBackNeedle="true" Length="90" Width="8" BackNeedleLength="12"></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major"  Width="1" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor"  Height="7" Width="1" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c">
                       <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                   </ej:CircularLabels>
               </LabelCollection>
               <RangeCollection>
                   <ej:CircularRanges distanceFromScale="-30" StartValue="0" EndValue="50">
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#fc0606" distanceFromScale="-30" StartValue="50" EndValue="80">
                       <Border Color="#fc0606"></Border>
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#f5b43f" distanceFromScale="-30" StartValue="80" EndValue="100">
                       <Border Color="#f5b43f"></Border>
                   </ej:CircularRanges>
               </RangeCollection>
               <CustomLabelCollection>
                   <ej:CircularCustomLabel Value="0" Color="#666666">
                       <Position X="180" Y="270"/>
                       <Font FontFamily="Segoe UI" FontStyle="Bold" Size="15px"></Font>
                   </ej:CircularCustomLabel>
                   <ej:CircularCustomLabel Value="KM / H" Color="#666666">
                       <Position X="180" Y="290"/>
                       <Font FontFamily="Segoe UI" FontStyle="Normal" Size="12px"></Font>
                   </ej:CircularCustomLabel>
               </CustomLabelCollection>
           </ej:CircularScales>
       </Scales>
        </ej:CircularGauge>
        </div>
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
      var currentValue = 0;
        var isSetValue = true;
        var timer2;
        function setMeter() {
            if (isSetValue) {
                if (currentValue < 75) {
                    currentValue = currentValue + 1;
                }
                if (currentValue >= 75) {
                    isSetValue = false;
                    window.clearInterval(timer1);
                    timer2 = window.setInterval("decreaseMeter()", 70);
                }
                var speed = $("#CircularGauge1").data("ejCircularGauge");
                if (speed != undefined) {
                    speed.setPointerValue(0, 0, currentValue);
                    speed.setCustomLabelValue(0, 0, currentValue.toFixed(0));
                }
            }
        }

        function decreaseMeter() {
            if (!isSetValue) {
                window.clearInterval(timer1);
                if (currentValue > 0) {
                    currentValue = currentValue - 1;

                }
                if (currentValue <= 0) {
                    isSetValue = true;
                    window.clearInterval(timer2);
                    timer1 = window.setInterval("setMeter()", 70);
                }
                var speed = $("#CircularGauge1").data("ejCircularGauge");
                if (speed != undefined) {
                    speed.setPointerValue(0, 0, currentValue);
                    speed.setCustomLabelValue(0, 0, currentValue.toFixed(0));
                }
            }
        }
        var timer1;
        $(document).ready(function () {
            timer1 = window.setInterval("setMeter()", 70);
        });

     </script>
</asp:Content>

