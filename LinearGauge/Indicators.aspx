<%@ Page Title="LinearGauge-Indicators-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample indicates the interest based on loan amount in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Indicators.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Indicators" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="color:#8c8c8c" align="center" >
         <label id="lbl" align="center">Loan Amount = $ 1 Mill</label>
         <ej:LinearGauge ClientIDMode="Static" runat="server" ID="CoreLinearGauge" LabelColor="#8c8c8c" DrawIndicators="DrawIndicators" DrawMarkerPointers="DrawMarkerPointers" Orientation="Horizontal" ReadOnly="false" EnableAnimation="false" Width="900" DrawLabels="DrawLabel" Height="180">
             <Scales>
                 <ej:Scales Minimum="10000" Maximum="25000000" MinorIntervalValue="178500" MajorIntervalValue="1785000" Direction="Clockwise" Length="810" Type="RoundedRectangle" Width="50" ShowIndicators="true" ShowBarPointers="false">
                     <Border Color="#8c8c8c" Width="2"/>
                     <Position X="52" Y="50"/>
                     <MarkerPointerCollection>
                         <ej:MarkerPointers Value="7000000" MarkerdistanceFromScale="20" Type="Circle" Length="120" Width="100" Placement="Center" MarkerOpacity="0.8" MarkerBackgroundColor="#FFFFFF">
                             <Border Color="#8c8c8c"/>
                         </ej:MarkerPointers>
                     </MarkerPointerCollection>
                     <LabelCollection>
                         <ej:Labels Placement="Far" Angle="90">
                             <Font FontFamily="Arial" Size="16px" FontStyle="Normal"></Font>
                             <DistanceFromScale X="0" Y="30" />
                         </ej:Labels>
                     </LabelCollection>
                     <TickCollection>
                         <ej:LinearTicks Height="30" Width="0.3" Placement="Far" Color="Black" Type="MajorInterval"></ej:LinearTicks>
                         <ej:LinearTicks Height="15" Width="0.3" Placement="Far" Color="Black" Type="MinorInterval"></ej:LinearTicks>
                     </TickCollection>
                     <IndicatorCollection>
                         <ej:Indicators Type="text">
                             <Font FontFamily="Arial" FontStyle="Bold" Size="15px"></Font>
                             <TextLocation X="6" Y="53"/>
                             <StateRangeCollection>
                                 <ej:StateRanges StateRangeEndValue="25000000" StateRangeStartValue="10000" StateRangetext="1 Mill" StateRangetextColor="#8c8c8c"/>
                             </StateRangeCollection>
                         </ej:Indicators>
                         <ej:Indicators Type="Rectangle" Height="20" Width="20">
                             <TextLocation X="52" Y="95"/>
                             <Position X="40" Y="115"/>
                             <Font FontFamily="Arial" FontStyle="Bold" Size="15px"></Font>
                             <StateRangeCollection>
                                 <ej:StateRanges StateRangeBackgroundColor="Green" StateRangeBorderColor="Black" StateRangeEndValue="8000000" StateRangeStartValue="10000" StateRangetext="9.8 % interest per Annum" StateRangetextColor="#8c8c8c"/>
                                 <ej:StateRanges StateRangeBackgroundColor="Yellow" StateRangeBorderColor="Black" StateRangeEndValue="15000000" StateRangeStartValue="8000000" StateRangetext="10.5 % interest per Annum" StateRangetextColor="#8c8c8c"/>
                                 <ej:StateRanges StateRangeBackgroundColor="Red" StateRangeBorderColor="Black" StateRangeEndValue="25000000" StateRangeStartValue="15000000" StateRangetext="12.2 % interest per Annum" StateRangetextColor="#8c8c8c"/>
                             </StateRangeCollection>
                         </ej:Indicators>
                     </IndicatorCollection>
                 </ej:Scales>
                 
             </Scales>
         </ej:LinearGauge>

        </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        var text = "";
        var XPosition;
        function DrawLabel(args) {
            args.style.textValue = Math.round(args.label.value) == 25000000 ? "$ 25 Mills" : Math.round(args.label.value) == 10000 ? "$ 10,000" : "";
        }
        function DrawMarkerPointers(args) {
            XPosition = args.position.startX;
            text = Math.round(args.pointerValue) == 1000000 ? "1 Mill" : Math.round(args.pointerValue) > 1000000 ? (Math.round(args.pointerValue) / 1000000).toFixed(3) == 1 ? "1 Mill" : (Math.round(args.pointerValue) / 1000000).toFixed(3) + " Mills" : (Math.round(args.pointerValue) / 1000).toFixed(3).toString().replace(".", ",");
            var label = "Loan Amount = $ " + text;
            $("#lbl").text(label);
        }
        function DrawIndicators(args) {
            if (args.indicatorIndex == 0) {
                args.position.textLocation.x = XPosition;
                args.indicatorEl.stateRanges[0].text = text;
            }
        }
     </script>
</asp:Content>


