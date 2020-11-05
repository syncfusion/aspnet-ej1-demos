<%@ Page Title="BulletGraph-Title-ASP.NET-SYNCFUSION"  Language="C#"  MetaDescription="This sample demonstrates the title position in the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TitlePositioning.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.TitlePositioning" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / Title Positioning</span>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
  <div id="sampleProperties">
                <div class="prop-grid">                    
                    <div class="row">
                        <div class="col-md-3">
                            Caption Position 
                        </div>
                        <div class="col-md-3">
                            <select onchange="BulletCapPosition(this)">
                                <option>Top</option>
                                <option>Left</option>
                                <option selected="selected">Right</option>
                                <option>Bottom</option>
                                <option>Float</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            Caption Alignment 
                        </div>
                        <div class="col-md-3">
                            <select onchange="BulletCapAlignment(this)">
                                <option>Near</option>
                                <option>Far</option>
                                <option>Center</option>
                            </select>
                        </div>
                    </div><br/>
                    <div class="row">                        
                        <div class="col-md-3">
                            Subtitle Position
                        </div>
                        <div class="col-md-3">
                            <select onchange="BulletSubtitlePosition(this)">
                                <option>Top</option>
                                <option>Left</option>
                                <option selected="selected">Right</option>
                                <option>Bottom</option>
                                <option>Float</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            Subtitle Alignment
                        </div>
                        <div class="col-md-3">
                            <select onchange="BulletSubtitleAlignment(this)">
                                <option>Near</option>
                                <option>Far</option>
                                <option>Center</option>
                            </select>
                        </div>
                    </div><br/>
                    <div class="row">
                        <div class="col-md-3" style="width:auto;">
                            <input type="checkbox" checked="checked" onchange="BulletTrim(this)" />
                         </div>
                         <div class="col-md-3">
                            Enable Trim
                        </div>
                      </div>
                </div>
            </div>

</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:BulletGraph ClientIDMode="Static" ID="BulletGraph1" Height="300" Width="650" runat="server">
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
            <ej:QualitativeRanges RangeEnd="3" RangeStroke="#61a301" />
            <ej:QualitativeRanges RangeEnd="7" RangeStroke="#fcda21" />
            <ej:QualitativeRanges RangeEnd="10" RangeStroke="#d61e3f" />
        </QualitativeRanges>
        <CaptionSettings TextPosition="Right" Text="Revenue YTD">
            <Location X="10" Y="160" />
            <SubTitle TextPosition="Right" Text="$ in thousands">
                <Location X="10" Y="180" />
            </SubTitle>
        </CaptionSettings>
    </ej:BulletGraph>
    <div id="Tooltip" style="display: none; width: 125px; padding-top: 10px; padding-bottom: 10px">
        <div align="center" style="font-weight: bold">
            Sales
        </div>
        <table>
            <tr>
                <td>Current</td>
                <td>: {{:currentValue}}</td>
            </tr>
            <tr>
                <td>Target</td>
                <td>: {{:targetValue}}</td>
            </tr>
        </table>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

        function BulletTrim(sender) {
            $("#BulletGraph1").ejBulletGraph('option', 'captionSettings.enableTrim', sender.checked);
        }

        function BulletCapAlignment(sender) {
            $("#BulletGraph1").ejBulletGraph('option', 'captionSettings.textAlignment', sender.value);
        }

        function BulletCapPosition(sender) {
            $("#BulletGraph1").ejBulletGraph('option', 'captionSettings.textPosition', sender.value);
        }

        function BulletSubtitleAlignment(sender) {
            $("#BulletGraph1").ejBulletGraph('option', 'captionSettings.subTitle.textAlignment', sender.value);
        }

        function BulletSubtitlePosition(sender) {
            $("#BulletGraph1").ejBulletGraph('option', 'captionSettings.subTitle.textPosition', sender.value);
        }

    </script>
      
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
        .aligntop .e-ddl .e-input {
            line-height: 20px;
        }
    </style>
</asp:Content>

