<%@ Page Title="BulletGraph-Indicator-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample indicate the sale review based on thousand people in the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Indicator.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.Indicator" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / API</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:BulletGraph ClientIDMode="Static" Height="400" ID="BulletGraph1" runat="server">
        <QuantitativeScaleSettings Minimum="0" Maximum="10" Interval="1">
            <Location X="110" Y="150" />
            <MajorTickSettings width="1" stroke="gray" size="13"/>
            <MinorTickSettings width="1" stroke="gray" size="5"/>
            <LabelSettings offset="14" size="10" />
            <FeaturedMeasureSettings Width="5" />
            <ComparativeMeasureSettings Width="5" />
            <FeatureMeasures>
                <ej:FeatureMeasures Value="8" ComparativeMeasure="6.7" />
            </FeatureMeasures>
        </QuantitativeScaleSettings>
        <QualitativeRanges>
            <ej:QualitativeRanges RangeEnd="4.3" />
            <ej:QualitativeRanges RangeEnd="7.3" />
            <ej:QualitativeRanges RangeEnd="10" />
        </QualitativeRanges>
        <CaptionSettings Text="RevenueYTD">
            <Location X="17" Y="160" />
            <SubTitle Text="$ in thousands">
                <Location X="10" Y="175" />
            </SubTitle>
            <Indicator Visible="true" Text=" $ 1.3K" TextSpacing="8">
                <Location X="15" Y="190" />
                <Font FontColor="green" Size="13" FontWeight="bold"></Font>
                <Symbol Shape="Triangle" Color="green">
                    <Size Width="10" Height="10" />
                </Symbol>
            </Indicator>
        </CaptionSettings>
    </ej:BulletGraph>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
    <div class="prop-grid">
                    <div class="row">
                        <div class="row">
                        <div class="col-md-3">
                            Symbol Shape
                        </div>
                        <div class="col-md-3 aligntop">
                            <select style="max-width:90%" autocomplete="off"  id="symShape" onchange="ChangeBulletSymbol(this)">
                                <option>circle</option>
                                <option>uparrow</option>
                                <option>downarrow</option>
                                <option>leftarrow</option>
                                <option>rightarrow</option>
                                <option>cross</option>
                                <option>horizontalline</option>
                                <option>verticalline</option>
                                <option selected="selected">triangle</option>
                                <option>invertedtriangle</option>
                                <option>hexagon</option>
                                <option>wedge</option>
                                <option>pentagon</option>
                                <option>star</option>
                                <option>rectangle</option>
                                <option>trapezoid</option>
                                <option>diamond</option>
                                <option>ellipse</option>
                            </select>
                        </div>                        
                    </div>
                </div>
    </div>
      <script type="text/javascript">
          function ChangeBulletSymbol(sender) {
              $("#BulletGraph1").ejBulletGraph("option", "captionSettings.indicator.symbol", { shape: sender.value });
          }
    </script>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
      <script type="text/javascript">
          $(function () {
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

