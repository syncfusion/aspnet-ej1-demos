<%@ Page Title="PivotGauge-Scale Options-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot gauge control describes the various properties to customize scale"  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scale.aspx.cs" Inherits="WebSampleBrowser.Scale" %>

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
        <ClientSideEvents DrawLabels="onLabelDraw" Load="onLoad" RenderSuccess="loadPivotGaugeTheme" BeforeServiceInvoke="onBeforeServiceCall" AfterServiceInvoke="onAfterServiceCall" />
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
                        <div class="col-md-3" style="width:95px">
                            ScaleBar Size
                        </div>
                        <div class="col-md-3 aligntop">
                            <div id="scalesize">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width:95px">
                            Scale Radius
                        </div>
                        <div class="col-md-3 aligntop">
                            <div id="scaleradius">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width:95px">
                            Border Width
                        </div>
                        <div class="col-md-3 aligntop">
                            <div id="borderwidth">
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3" style="width:95px; line-height:2">
                            Scale Direction
                        </div>
                        <div class="col-md-3">
                            <input type="text" id="scaledirection" class="scaledirection" />
                        </div>
                    </div>
                </div>
        </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#scalesize").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 1,
                height: 10,
                mintValue: 0,
                maxValue: 10,
                width: 110,
                animate: true,
                change: "onchange"
            });
            $("#scaleradius").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 150,
                height: 10,
                width: 110,
                minValue: 120,
                maxValue: 170,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });
            $("#borderwidth").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 0.5,
                height: 10,
                minValue: 0,
                maxValue: 5,
                width: 110,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });
            $('#scaledirection').ejDropDownList({
                dataSource: ["Clockwise", "CounterClockwise"],
                select: "onchange", width: "130px", selectedIndices: [0]
            });
        });
        function onchange(args) {
            pivotGauges = $(".e-pivotgauge").find(".e-circulargauge");
            if (args.id == "scalesize") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setScaleBarSize(0, args.value);
                });

            }
            else if (args.id == "scaleradius") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setScaleRadius(0, args.value);
                });
            }
            else if (args.id == "borderwidth") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setScaleBorderWidth(0, args.value);
                });
            }
            else if (args.text) {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setScaleDirection(0, args.text.toLowerCase());
                });
            }
        } function onLoad(args) {
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
            min-height: 220px;
            width:25%;
        }   
        
         .row .cols-sample-area {
    width: 72%;
}           
    </style>
</asp:Content>

