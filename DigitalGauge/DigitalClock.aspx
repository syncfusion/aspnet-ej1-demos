<%@ Page Title="DigitalGauge-DigitalClock-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample simulates the digital clock using the Syncfusion ASP.NET Web Forms Digital Gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DigitalClock.aspx.cs" Inherits="WebSampleBrowser.DigitalGauge.DigitalClock" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
   <ej:DigitalGauge ClientIDMode="Static" runat="server" IsResponsive="true" ID="DigitalGauge1" Height="300" Load="loadGaugeTheme">
    <Items>
        <ej:DigitalGaugeItems Value="">
        <SegmentSettings Width="2" Spacing="0" />
        <CharacterSettings Opacity="0.8" />
            <Position X="52" Y="52"/>
        </ej:DigitalGaugeItems>
    </Items>
</ej:DigitalGauge>
        </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
    $(document).ready(function () {
        window.setInterval("setClock()", 1);
    });

        function setClock() {

            var currentTime = new Date();
            var hours = currentTime.getHours();
            var minutes = currentTime.getMinutes();
            var seconds = currentTime.getSeconds();
            if (minutes < 10) {
                minutes = "0" + minutes;
            }
            if (seconds < 10) {
                seconds = "0" + seconds;
            }
            var orighour = hours;
            hours = ((hours + 11) % 12 + 1);
            var v = hours + ":" + minutes + ":" + seconds + " ";
            if (orighour > 11) {
                v += "PM";
            } else {
                v += "AM";
            }

            var digiclock = $("#DigitalGauge1").data("ejDigitalGauge");
            if (digiclock != undefined) {
                digiclock.setValue(0, v);
            }
        }
     </script>
</asp:Content>




