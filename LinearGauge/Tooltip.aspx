<%@ Page Title="LinearGauge-Tooltip-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the ranges value in the tooltip in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Tooltip.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Tooltip" %>

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
    <div align="center" id="linearFrame" style="background-position:48%;" >
          <ej:LinearGauge ClientIDMode="Static" IsResponsive="true" runat="server" ID="LinearGaugeTooltip" LabelColor="#8c8c8c" Width="500" Load="loadGaugeTheme" EnableAnimation="false" DrawLabels="DrawLabel">
              <Tooltip ShowCustomLabelTooltip="true" ShowLabelTooltip="true" TemplateID="Tooltip"/>
              <Scales>
                  <ej:Scales Minimum="0" Maximum="1.5" MinorIntervalValue="0" MajorIntervalValue="0.25" ShowCustomLabels="true" Width="4" ShowBarPointers="false" ShowRanges="true" Length="310">
                      <Border Color="transparent" Width="0"/>
                      <Position X="52" Y="50"/>
                      <MarkerPointerCollection>
                          <ej:MarkerPointers Value="1.2" Length="10" Width="10" MarkerBackgroundColor="#4D4D4D">
                              <Border Color="#4D4D4D"/>
                          </ej:MarkerPointers>
                      </MarkerPointerCollection>
                      <TickCollection>
                          <ej:LinearTicks Type="MajorInterval" Color="#8c8c8c" Width="1"></ej:LinearTicks>
                      </TickCollection>
                      <LabelCollection>
                          <ej:Labels UnitText="$ " UnitTextPlacement="Front">
                              <Font FontFamily="Segoe UI" FontStyle="bold" Size="12px"></Font>
                              <DistanceFromScale X="-20"/>
                          </ej:Labels>
                      </LabelCollection>
                      <CustomLabelCollection>
                          <ej:CustomLabel Value="Fuel Cost $ / L" Color="#fc0606">
                              <Font FontFamily="Arial" FontStyle="bold" Size="12px"></Font>
                              <Position X="48" Y="100"/>
                          </ej:CustomLabel>
                      </CustomLabelCollection>
                      <RangeCollection>
                          <ej:Ranges StartWidth="4" EndWidth="4" StartValue="0" EndValue="0.75" RangeBackgroundColor="green">
                              <Border Color="green"/>
                          </ej:Ranges>
                          <ej:Ranges StartWidth="4" EndWidth="4" StartValue="0.75" EndValue="1" RangeBackgroundColor="yellow">
                              <Border Color="yellow"/>
                          </ej:Ranges>
                          <ej:Ranges StartWidth="4" EndWidth="4" StartValue="1" EndValue="1.5" RangeBackgroundColor="red">
                              <Border Color="red"/>
                          </ej:Ranges>
                      </RangeCollection>
                  </ej:Scales>
              </Scales>
          </ej:LinearGauge>
        </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript" class="jsScript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function DrawLabel(args) {
            args.style.textValue = args.label.value.toFixed(2);
        }
        function onLabelTooltipChange(args) {
            if (args.isChecked)
                $("#LinearGaugeTooltip").ejLinearGauge("option", "tooltip", { showLabelTooltip: true });
            else
                $("#LinearGaugeTooltip").ejLinearGauge("option", "tooltip", { showLabelTooltip: false });
        };
        function onCustomLabelTooltipChange(args) {
            if (args.isChecked)
                $("#LinearGaugeTooltip").ejLinearGauge("option", "tooltip", { showCustomLabelTooltip: true });
            else
                $("#LinearGaugeTooltip").ejLinearGauge("option", "tooltip", { showCustomLabelTooltip: false });
        };
        function onTooltipTemplateChange(args) {
            if (args.isChecked)
                $("#LinearGaugeTooltip").ejLinearGauge("option", "tooltip", { templateID: "Tooltip" });
            else
                $("#LinearGaugeTooltip").ejLinearGauge("option", "tooltip", { templateID: null });
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
                            <ej:Checkbox runat="server" Checked="true" ID="chkEnableLabelTooltip" ClientSideOnChange="onLabelTooltipChange"></ej:Checkbox>
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
         #linearFrame{
             background-position:47% center;
         }
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

