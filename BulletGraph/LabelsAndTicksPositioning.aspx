<%@ Page Title="BulletGraph-Label & Tick Positioning-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates label and tick positioning in the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LabelsAndTicksPositioning.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.LabelsAndTicksPositioning" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / API</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:BulletGraph ClientIDMode="Static" ID="BulletGraph1" Value="8" ComparativeMeasureValue="5" 
        QualitativeRangeSize="50" Width="650" Height="650" runat="server">
        <QuantitativeScaleSettings Minimum="0" Maximum="10" Interval="1">
            <Location X="110" Y="150" />
            <MajorTickSettings width="1" stroke="gray" size="13"/>
            <MinorTickSettings width="1" stroke="gray" size="5"/>
            <LabelSettings LabelPrefix="$" LabelSuffix=" K" offset="14" size="10" />
        </QuantitativeScaleSettings>
        <CaptionSettings Text="RevenueYTD">
            <Location X="17" Y="168" />
            <SubTitle Text="$ in thousands">
                <Location X="10" Y="182" />
            </SubTitle>
        </CaptionSettings>
    </ej:BulletGraph>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
     <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Direction

                        </div>
                        <div class="col-md-3">
                            <select autocomplete="off"  onchange="BulletFlow(this)">
                                <option value="forward">Forward</option>
                                <option value="backward">Backward</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            Orientation
                        </div>
                        <div class="col-md-3">
                            <select autocomplete="off"  onchange="BulletOrientation(this)">
                                <option value="horizontal">Horizontal</option>
                                <option value="vertical">Vertical</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            Tick Position
                        </div>
                        <div class="col-md-3">
                            <select autocomplete="off"  onchange="BulletTickPos(this)">
                                <option value="far">Far</option>
                                <option value="center">Center</option>
                                <option value="near">Near</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            Tick Placement
                        </div>
                        <div class="col-md-3">
                            <select autocomplete="off"  onchange="BulletTickPlacement(this)">
                                <option value="outside">Outside</option>
                                <option value="inside">Inside</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            Label Position
                        </div>
                        <div class="col-md-3">
                            <select autocomplete="off" onchange="BulletLabelPosition(this)">
                                <option value="below">Below</option>
                                <option value="above">Above</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            Label Placement
                        </div>
                        <div class="col-md-3">
                            <select autocomplete="off" onchange="BulletLabelPlacement(this)">
                                <option value="outside">Outside</option>
                                <option value="inside">Inside</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            Label Offset
                        </div>
                        <div class="col-md-3" style="height:15px">
                            <div id="featureMeasureValue"></div>
                        </div>
                    </div>
                </div>
            </div>
      <script type="text/javascript">

          function BulletTickPos(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'quantitativeScaleSettings.tickPosition', sender.value
              );
          }

          function BulletLabelPlacement(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'quantitativeScaleSettings.labelSettings.labelPlacement', sender.value
              );
          }

          function BulletTickPlacement(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'quantitativeScaleSettings.tickPlacement', sender.value
              );
          }

          function BulletLabelPosition(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'quantitativeScaleSettings.labelSettings.position', sender.value
              );
          }

          function BulletLabelOffset(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'quantitativeScaleSettings.labelSettings.offset', parseFloat(sender.value)
              );
          }

          function BulletFlow(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'flowDirection', sender.value
              );
          }

          function BulletOrientation(sender) {
              $("#BulletGraph1").ejBulletGraph(
                  'option', 'orientation', sender.value
              );
          }
    </script>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
      <script type="text/javascript">
          $(function () {
              
              $("#featureMeasureValue").ejSlider({
                  sliderType: ej.SliderType.MinRange,
                  minValue: -85,
                  maxValue: 25,
                  change: "BulletLabelOffset",
                  value: 10                
              });
              $("#sampleProperties").ejPropertiesPanel();
          });

    </script>
      
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
     <style>
        .aligntop .e-ddl .e-input {
            line-height:20px;
        }
    </style>
</asp:Content>

