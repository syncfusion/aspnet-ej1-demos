<%@ Page Title="PivotGauge-Pointer Options-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot gauge control describes the various properties to customize the pointers." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Pointer.aspx.cs" Inherits="WebSampleBrowser.Pointers" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
     <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <ej:PivotGauge ID="PivotGauge1" runat="server" ClientIDMode="Static" IsResponsive="true" EnableTooltip="true" BackgroundColor="transparent">
        <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
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
        <ClientSideEvents  RenderSuccess="loadPivotGaugeTheme" Load="onLoad" BeforeServiceInvoke="onBeforeServiceCall" AfterServiceInvoke="onAfterServiceCall"  />
        <Scales>
            <ej:CircularScales ShowRanges="true" Radius="150" ShowScaleBar="true" Size="1" ShowIndicators="true" ShowLabels="true">
                <Border Width="0.5" />
                <PointerCollection>
                    <ej:Pointers ShowBackNeedle="true" BackNeedleLength="20" Length="125" Width="7">
                       
                    </ej:Pointers>
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
                    Pointer Length
                </div>
                <div class="col-md-3 aligntop">
                    <div id="pointerlength"></div>
                </div>
                <div class="col-md-3">
                    Pointer Width
                </div>
                <div class="col-md-3 aligntop">
                    <div id="pointerwidth"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Marker Width
                </div>
                <div class="col-md-3 aligntop">
                    <div id="markerwidth"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Needle Length
                </div>
                <div class="col-md-3 aligntop">
                    <div id="needlelength"></div>
                </div>
                <div class="col-md-3">
                    Cap Radius
                </div>
                <div class="col-md-3 aligntop">
                    <div id="pointercapradius"></div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" style="margin-top:7px; line-height:2">
                    Needle Style
                </div>
                <div class="col-md-3" style="margin-top: 4px">
                    <input type="text" id="needlestyle" class="needlestyle" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3" style="margin-top:9px; line-height:2">
                    Marker Style
                </div>
                <div class="col-md-3 aligntop">
                    <input type="text" id="markerstyle" class="markerstyle" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();

            $("#pointerlength").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 125,
                height: 10,
                width: 110,
                minValue: 50,
                maxValue: 130,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });

            $("#pointerwidth").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 7,
                height: 10,
                width: 110,
                minValue: 2,
                maxValue: 15,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });

            $("#markerwidth").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 15,
                height: 10,
                width: 110,
                minValue: 10,
                maxValue: 30,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });

            $("#needlelength").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 19,
                height: 10,
                width: 110,
                minValue: 10,
                maxValue: 20,
                animate: true,
                slide: "onchange",
                change: "onchange"
            });

            $("#pointercapradius").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 12,
                height: 10,
                width: 110,
                minValue: 9,
                maxValue: 15,
                animate: true,
                change: "onchange"
            });

            $('#needlestyle').ejDropDownList({
                dataSource: ["Triangle", "Trapezoid", "Arrow", "Rectangle"],
                select: "onchange1", width: "110px", selectedIndices : [0]
            });

            $('#markerstyle').ejDropDownList({
                dataSource: ["Diamond", "Rectangle", "Triangle", "Ellipse", "Pentagon", "Circle", "Slider", "Pointer", "Wedge", "Trapezoid", "RoundedRectangle"],
                select: "onchange1", width: "110px", selectedIndices : [0]
            });
        });
         function onLoad(args) {
           args.model.dataSource.rows[0].filterItems = { values: ["[Date].[Fiscal].[Fiscal Year].&amp;[2004]"] };
       }
        function onchange1(args) {
            pivotGauges = $("#PivotGauge1").find(".e-circulargauge");
            if (this._id == "needlestyle") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setNeedleStyle(0, 0, args.text.toLowerCase());
                });
            }
            else if (this._id == "markerstyle") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setMarkerStyle(0, 1, args.text.toLowerCase());
                });
            }
        }

        function onchange(args) {
            pivotGauges = $("#PivotGauge1").find(".e-circulargauge");

            if (args.id == "pointerlength") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setPointerLength(0, 0, args.value);
                });
            }
            else if (args.id == "pointerwidth") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setPointerWidth(0, 0, args.value);
                });
            }
            else if (args.id == "markerwidth") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setPointerWidth(0, 1, args.value);
                });
            }
            else if (args.id == "needlelength") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setBackNeedleLength(0, 0, args.value);
                });
            }
            else if (args.id == "pointercapradius") {
                $.each(pivotGauges, function (index, value) {
                    gaugeval = $("#" + value.id).data("ejCircularGauge");
                    for (var i = 0; i <= 2; i++)
                        gaugeval.setPointerCapRadius(0, args.value);
                });
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGauge1 {
            height: 300px;
            width: 100%;
            float: left;
            overflow: auto;
        }

         .drop-down {
            line-height: 22px!important;
        }

        .row .cols-prop-area {
            min-height: 346px;
            width:25%;
        }

         .row .cols-sample-area {
    width: 72%;
}
    </style>
</asp:Content>

