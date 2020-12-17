<%@ Page Title="PivotGauge-Range Options-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot gauge control describes the various properties to customize range."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Range.aspx.cs" Inherits="WebSampleBrowser.Range" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
     <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <ej:PivotGauge ID="PivotGauge1" runat="server" ClientIDMode="Static" IsResponsive="true" EnableTooltip="true" BackgroundColor="transparent">
         <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll" >
                <Rows>
                    <ej:Field  FieldName="[Date].[Fiscal]">
                    </ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                            <ej:MeasuresItems FieldName ="[Measures].[Internet Revenue Status]" />
                            <ej:MeasuresItems FieldName ="[Measures].[Internet Revenue Trend]" />
                            <ej:MeasuresItems FieldName ="[Measures].[Internet Revenue Goal]" />
                        </Measures>
                    </ej:Field>
                </Values>
        </DataSource>
        <ClientSideEvents DrawLabels="onLabelDraw" RenderSuccess="loadPivotGaugeTheme" Load="onLoad"/>
        <Scales>
            <ej:CircularScales ShowRanges="true" Radius="150" ShowScaleBar="true" Size="1" ShowIndicators="true" ShowLabels="true">
                <Border Width="0.5" />
                <PointerCollection>
                    <ej:Pointers ShowBackNeedle="true" BackNeedleLength="20" Length="125" Width="7"></ej:Pointers>
                    <ej:Pointers Type="Marker" MarkerType="Diamond" DistanceFromScale="5" Placement="Center" BackgroundColor="#29A4D9" Length="25" Width="15"></ej:Pointers>
                </PointerCollection>
                <TickCollection>
                    <ej:CircularTicks Type="Major" DistanceFromScale="2" Height="16" Width="1" Color="#8c8c8c" />
                    <ej:CircularTicks Type="Minor" Height="6" Width="1" DistanceFromScale="2" Color="#8c8c8c" />
                </TickCollection>
                <LabelCollection>
                    <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                </LabelCollection>
                <RangeCollection>
                    <ej:CircularRanges DistanceFromScale="-5" BackgroundColor="#fc0606" >
                        <Border Color="#fc0606" />
                    </ej:CircularRanges>
                    <ej:CircularRanges DistanceFromScale="-5"></ej:CircularRanges>
                </RangeCollection>
                <CustomLabelCollection>
                    <ej:CircularCustomLabel Color="#666666">
                        <Position X="180" Y="290" />
                        <Font Size="10px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                    </ej:CircularCustomLabel>
                    <ej:CircularCustomLabel Color="#666666">
                        <Position X="180" Y="320" />
                        <Font Size="10px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                    </ej:CircularCustomLabel>
                    <ej:CircularCustomLabel Color="#666666">
                        <Position X="180" Y="150" />
                        <Font Size="12px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                    </ej:CircularCustomLabel>
                </CustomLabelCollection>   
            </ej:CircularScales>
        </Scales>
        <LabelFormatSettings DecimalPlaces="2" />
    </ej:PivotGauge>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
    <div class="prop-grid">
                <div class="row">
                    <div class="col-md-3">
                        Range Size
                    </div>
                    <div class="col-md-3 aligntop">
                        <div id="rangesize"></div>
                    </div>
                    <div class="col-md-3">
                        Range Distance
                    </div>
                    <div class="col-md-3 aligntop">
                        <div id="distancefromscale"></div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#rangesize").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 5,
                height: 10,
                minValue: 2,
                maxValue: 12,
                width: 110,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });
            $("#distancefromscale").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: -5,
                height: 10,
                minValue: -20,
                maxValue: 0,
                width: 110,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onchange(args) {
            pivotGauges = $(".e-pivotgauge").find(".e-circulargauge");
            if (args.id == "rangesize") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setRangeSize(0, i, args.value);
                });
            }
            else if (args.id == "distancefromscale") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setRangeDistanceFromScale(0, i, args.value);
                });
            }
        }
        function onLoad(args) {
            args.model.dataSource.rows[0].filterItems = { values: ["[Date].[Fiscal].[Fiscal Year].&amp;[2004]"] };
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGauge1 {
            height: 350px;
            width: 100%;
            float: left;
            overflow: auto;
        }

         .row .cols-prop-area {
            min-height: 110px;
            width:25%;
        }

         .row .cols-sample-area {
    width: 72%;
}
    </style>
</asp:Content>

