<%@ Page Title="CircularGauge-Tooltip-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample displays the ranges value in the tooltip of Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Tooltip.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Tooltip" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div id="Tooltip" style="height: 60px; display: none;">
        <div id="icon">
            <div id="eficon"></div>
        </div>
        <div id="value">
            <div>
                <label id="efpercentage">&nbsp;#label#</label>
            </div>
        </div>
    </div>
    <div align="center">
           <ej:CircularGauge Load="loadGaugeTheme"  ClientIDMode="Static" IsResponsive="true" runat="server" ID="circularGaugeTooltip" BackgroundColor="transparent" EnableAnimation="false">
               <Tooltip ShowCustomLabelTooltip="true" ShowLabelTooltip="true" TemplateID="Tooltip"/>
       <Scales>
           <ej:CircularScales ShowRanges="true" SweepAngle="296" StartAngle="122" Radius="130" ShowScaleBar="true" Size="1" Maximum="120" MajorIntervalValue="20" MinorIntervalValue="10">
               <Border Width="0.5"></Border>
               <PointerCap Radius="12"></PointerCap>
               <PointerCollection>
                   <ej:Pointers Value="60" ShowBackNeedle="true" Length="95" Width="7" BackNeedleLength="19" ></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major" Height="16" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor" Height="8" Width="1" DistanceFromScale="2" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
               </LabelCollection>
               <CustomLabelCollection>
                   <ej:CircularCustomLabel Value="0 9 5 4 3 5">
                       <Position X="180" Y="250"/>
                       <Font Size="14px"></Font>
                   </ej:CircularCustomLabel>
               </CustomLabelCollection>
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
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onLabelTooltipChange(args) {
            if (args.isChecked)
                $("#circularGaugeTooltip").ejCircularGauge("option", "tooltip", { showLabelTooltip: true });
            else
                $("#circularGaugeTooltip").ejCircularGauge("option", "tooltip", { showLabelTooltip: false });
        };
        function onCustomLabelTooltipChange(args) {
            if (args.isChecked)
                $("#circularGaugeTooltip").ejCircularGauge("option", "tooltip", { showCustomLabelTooltip: true });
            else
                $("#circularGaugeTooltip").ejCircularGauge("option", "tooltip", { showCustomLabelTooltip: false });
        };
        function onTooltipTemplateChange(args) {
            if (args.isChecked)
                $("#circularGaugeTooltip").ejCircularGauge("option", "tooltip", { templateID: "Tooltip" });
            else
                $("#circularGaugeTooltip").ejCircularGauge("option", "tooltip", { templateID: null });
        };
     </script>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
           <div class="row">
                        <div class="col-md-3">
                            Enable Label tooltip
                        </div>
                        <div class="col-md-3 aligntop">
                            <ej:Checkbox   runat="server" Checked="true" ID="chkEnableLabelTooltip" ClientSideOnChange="onLabelTooltipChange"></ej:Checkbox>
                        </div>
                        <div class="col-md-3">
                            Enable Custom Label tooltip
                        </div>
                        <div class="col-md-3 aligntop">
                            <ej:Checkbox  runat="server" Checked="true" ID="chkEnableCustomLabelTooltip" ClientSideOnChange="onCustomLabelTooltipChange"></ej:Checkbox>
                        </div>
                    </div>



                    <div class="row">
                        <div class="col-md-3">
                            Enable tooltip template
                        </div>
                        <div class="col-md-3 aligntop">
                            <ej:Checkbox  runat="server" Checked="true" ID="chkEnableTooltipTemplate" ClientSideOnChange="onTooltipTemplateChange"></ej:Checkbox>
                        </div>
                    </div>
        </div>
    </div>
</asp:Content>
<asp:Content ContentPlaceHolderID="StyleSection" ID="StyleSection1" runat="server">
     <style type="text/css">
        .col-md-3 .e-ddl .e-input {
            line-height:20px;
        }
        label{
		margin-bottom : -25px !important ;
		text-align :center !important;
		}
        .tooltipDiv {
            background-color:#E94649;        
            color: white;
        }
        #Tooltip >div:first-child {
            float: left;
        }
        #Tooltip #value {
            float: right;
            height: 50px;
            width: auto;
            font-stretch:condensed;
            text-align:left !important;
        }
        #Tooltip #value >div {
            margin: 5px 5px 5px 5px;
            text-align:left !important;
            
        }
        #Tooltip #efpercentage {
            font-size: 20px;
            font-family: segoe ui;
			padding-left: 2px;
            width:auto;
            font-stretch:condensed;
            text-align:left !important;
        }
         #Tooltip #ef {
             font-size: 12px;
             font-family: segoe ui;
             text-align:left !important;
        }
        #eficon {
            background-image: url("../Content/images/chart/eficon.png");
            height: 60px;
            width: 60px;
            background-repeat: no-repeat;
        }
    </style>
</asp:Content>

