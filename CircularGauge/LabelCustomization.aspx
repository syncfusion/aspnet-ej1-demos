<%@ Page Title="CircularGauge-Label Customization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the label customization in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LabelCustomization.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.LabelCustomization" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
     <ej:CircularGauge  ClientIDMode="Static" IsResponsive="true" runat="server" ID="CircularGauge1" BackgroundColor="transparent" Load="loadGaugeTheme">
       <Scales>
           <ej:CircularScales ShowRanges="true" SweepAngle="296" StartAngle="122" Radius="130" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
               <Border Width="0.5"></Border>
               <PointerCap Radius="12"></PointerCap>
               <PointerCollection>
                   <ej:Pointers Value="60"  ShowBackNeedle="true" Length="95" Width="7" BackNeedleLength="20" ></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major" Height="16" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor" Height="8" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c" UnitText=" KmpH" UnitTextPosition="Back"></ej:CircularLabels>
               </LabelCollection>
               <RangeCollection>
                   <ej:CircularRanges distanceFromScale="-30" StartValue="0" EndValue="70">
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#fc0606" distanceFromScale="-30" StartValue="70" EndValue="110">
                       <Border Color="#fc0606"></Border>
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#f5b43f" distanceFromScale="-30" StartValue="110" EndValue="120">
                       <Border Color="#f5b43f"></Border>
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

            if (args.type == "select" && args.text == "Kilometer/Hour") {
                $("#CircularGauge1").ejCircularGauge("option", "scales", [{ labels: [{ unitText: " KmpH" }] }]);
            }
            else if (args.type == "select" && args.text == "Meter/Hour") {
                $("#CircularGauge1").ejCircularGauge("option", "scales", [{ labels: [{ unitText: " MpH" }] }]);
            }
            else if (args.type == "select" && args.text == "Voltage/Hour") {
                $("#CircularGauge1").ejCircularGauge("option", "scales", [{ labels: [{ unitText: " VpH" }] }]);
            }

        }


</script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">

            
            <div class="row">
                <div class="col-md-3"> Label Customization</div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="rangePlacement" Width="110px" runat="server" SelectedItemIndex="0" ClientSideOnSelect="onchange">
                        <Items>
                            <ej:DropDownListItem Value="Kilometer/Hour" Text="Kilometer/Hour" />
                            <ej:DropDownListItem Value="Meter/Hour" Text="Meter/Hour" />
                            <ej:DropDownListItem Value="Voltage/Hour" Text="Voltage/Hour" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            
           
        </div>
    </div>
</asp:Content>



