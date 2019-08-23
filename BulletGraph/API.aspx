<%@ Page Title="BulletGraph-API's-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the API’s used for customization in the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.API" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / API</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:BulletGraph ClientIDMode="Static" ID="BulletGraph1" Width="620" Height="540" runat="server">
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
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="row">
                    <div class="col-md-3">
                        Label Prefix
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" autocomplete="off" id="labelprefix" onchange="AddPrefix(this)" 
                            style="width: 100px; height: 22px;" value="" />
                    </div>
                    <div class="col-md-3">
                        Label Suffix
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" autocomplete="off" id="labelsuffix" onchange="AddSuffix(this)" 
                            style="width: 100px; height: 22px;" value="" />
                    </div>
                    <div class="col-md-3">
                        Range Stroke to Ticks
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="checkbox" id="chkStrokeToTicks" class="e-chkbox" value="StrokeToTicks" />
                    </div>

                    <div class="col-md-3">
                        Range Stroke to Labels
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="checkbox" id="chkStrokeToLabels" class="e-chkbox" value="StrokeToLabels" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        Enable Animation
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="checkbox" id="chkEnableAnimation" class="e-chkbox" value="EnableAnimation" />
                    </div>
                    <div class="col-md-3">
                        Featured Measure
                    </div>
                    <div class="col-md-3 aligntop">
                        <div id="featureMeasureValue"></div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        Comparative Measure
                    </div>
                    <div class="col-md-3 aligntop">
                        <div id="comparativeMeasureValue"></div>
                    </div>
                    <div class="col-md-3">
                        Range1 Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="range1Stroke" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        Range2 Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="range2Stroke" />
                    </div>
                    <div class="col-md-3">
                        Range3 Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="range3Stroke" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        Orientation
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="orientation" />
                    </div>
                    <div class="col-md-3">
                        Flow Direction
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="flowDirection" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        MajorTick Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="majorTickStroke" />
                    </div>
                    <div class="col-md-3">
                        MinorTick Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="minorTickStroke" />
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3">
                        FeatureMeasure Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="featureMeasureStroke" />
                    </div>
                    <div class="col-md-3">
                        Comparative Symbol Stroke
                    </div>
                    <div class="col-md-3 aligntop">
                        <input type="text" id="comparativeSymbolStroke" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#BulletGraph1").ejBulletGraph({
                height:540,
                qualitativeRangeSize: 32, load: "loadBulletTheme",
                quantitativeScaleLength: 475, tooltipSetings: { template: "Tooltip", visible: true },
                orientation: ej.datavisualization.BulletGraph.Orientation.Horizontal,
                flowDirection: ej.datavisualization.BulletGraph.FlowDirection.Forward,
                quantitativeScaleSettings: {
                    location: { x: 110, y: 150 },
                    minimum: 0,
                    maximum: 10,
                    interval: 1,
                    minorTicksPerInterval: 4,
                    majorTickSettings: {
                        size: 13,
                        width: 1,
                        stroke: 'gray'
                    },
                    minorTickSettings: {
                        size: 5,
                        width: 1,
                        stroke: 'gray'
                    },
                    tickPosition: ej.datavisualization.BulletGraph.TickPosition.Far,
                    labelSettings: {
                        position: ej.datavisualization.BulletGraph.LabelPosition.Below, offset: 14, size: 10
                    },
                    featuredMeasureSettings: { width: 5 },
                    comparativeMeasureSettings: {
                        width: 5
                    },
                    featureMeasures: [{ value: 8, comparativeMeasureValue: 6.7 }]
                },
                qualitativeRanges: [{
                    rangeEnd: 4.3
                }, {
                    rangeEnd: 7.3
                }, {
                    rangeEnd: 10
                }],
                captionSettings: {
                    textAngle: 0, textPosition: 'left', textAlignment: 'center', enableTrim:false,
                    location: { x: 17, y: 160 }, text: "Revenue YTD",
                    font: {
                        color: null, fontFamily: 'Segoe UI', fontStyle: ej.datavisualization.BulletGraph.FontStyle.Normal,
                        size: '12px', fontWeight: ej.datavisualization.BulletGraph.FontWeight.Normal, opacity: 1
                    }, //'#707070'
                    subTitle: {
                        textAngle: 0, textPosition: 'left', textAlignment:'center',
                        text: "$ in Thousands", location: { x: 10, y: 175 },
                        font: {
                            color: null, fontFamily: 'Segoe UI', fontStyle: ej.datavisualization.BulletGraph.FontStyle.Normal,
                            size: '12px', fontWeight: ej.datavisualization.BulletGraph.FontWeight.Normal, opacity: 1
                        } //'#707070'
                    }
                }
            });
        });

        function AddPrefix(sender) {
            $("#BulletGraph1").ejBulletGraph("option", "quantitativeScaleSettings.labelSettings", { labelPrefix: sender.value });
        }

        function AddSuffix(sender) {
            $("#BulletGraph1").ejBulletGraph("option", "quantitativeScaleSettings.labelSettings", { labelSuffix: sender.value });
        }

        $(function () {
            $("#featureMeasureValue").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 8,
                height: 10,
                minValue: 1,
                maxValue: 9,
                width: 110,
                enableAnimation: true,
                slide: "onValuechange",
                change: "onValuechange"
            });

            $("#comparativeMeasureValue").ejSlider({
                sliderType: ej.SliderType.MinRange,
                value: 6.7,
                height: 10,
                minValue: 1,
                maxValue: 9,
                width: 110,
                enableAnimation: true,
                slide: "onValuechange",
                change: "onValuechange"
            });

            $("#chkStrokeToTicks").ejCheckBox({ "change": "onTickStroke" });
            $("#chkStrokeToLabels").ejCheckBox({ "change": "onLabelStroke" });
            $("#chkEnableAnimation").ejCheckBox({ "change": "onAnimateClick", checked: true });

            $('#range1Stroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onRangeStroke1change", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $('#range2Stroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onRangeStroke2change", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $('#range3Stroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onRangeStroke3change", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $('#orientation').ejDropDownList({
                dataSource: ["horizontal", "vertical"],
                select: "onOrientationchange", width: "110px", height: "22px"
            });

            $('#flowDirection').ejDropDownList({
                dataSource: ["forward", "backward"],
                select: "onFlowDirectionchange", width: "110px", height: "22px"
            });

            $('#majorTickStroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onMajorTickchange", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $('#minorTickStroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onMinorTickchange", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $('#featureMeasureStroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onFeaturebarchange", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $('#comparativeSymbolStroke').ejDropDownList({
                dataSource: ["--Select--", "red", "yellow", "green"],
                select: "onComparativechange", width: "110px", selectedItemIndex: 0, height: "22px"
            });

            $("#sampleProperties").ejPropertiesPanel();
        });

        $(document).ready(function () {

            orienttarg = $("#orientation").data("ejDropDownList");
            orienttarg.option('selectedItemIndex', 0);

            flowDirect = $("#flowDirection").data("ejDropDownList");
            flowDirect.option('selectedItemIndex', 0);
        });

        function onTickStroke(args) {
            if (args.isChecked)
                $("#BulletGraph1").ejBulletGraph("option", "applyRangeStrokeToTicks", true);
            else
                $("#BulletGraph1").ejBulletGraph("option", "applyRangeStrokeToTicks", false);
        };

        function onLabelStroke(args) {
            if (args.isChecked)
                $("#BulletGraph1").ejBulletGraph("option", "applyRangeStrokeToLabels", true);
            else
                $("#BulletGraph1").ejBulletGraph("option", "applyRangeStrokeToLabels", false);
        }

        function onAnimateClick(args) {
            if (args.isChecked)
                $("#BulletGraph1").ejBulletGraph("option", "enableAnimation", true);
            else
                $("#BulletGraph1").ejBulletGraph("option", "enableAnimation", false);
        }

        function onValuechange(args) {
            var dat = $("#BulletGraph1").data("ejBulletGraph");
            if (dat) {
                if (args.id == "featureMeasureValue")
                    dat.setFeatureMeasureBarValue(0, args.value);
                else if (args.id == "comparativeMeasureValue")
                    dat.setComparativeMeasureSymbol(0, args.value);
            }
        }

        function onRangeStroke1change(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "qualitativeRanges", [{ rangeStroke: args.text }]);
        }

        function onRangeStroke2change(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "qualitativeRanges", [{}, { rangeStroke: args.text }]);
        }

        function onRangeStroke3change(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "qualitativeRanges", [{}, {}, { rangeStroke: args.text }]);
        }

        function onMajorTickchange(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "quantitativeScaleSettings.majorTickSettings", { stroke: args.text });
        }

        function onMinorTickchange(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "quantitativeScaleSettings.minorTickSettings", { stroke: args.text });
        }

        function onFeaturebarchange(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "quantitativeScaleSettings.featuredMeasureSettings", { stroke: args.text });
        }

        function onComparativechange(args) {
            if (args.itemId != 0)
                $("#BulletGraph1").ejBulletGraph("option", "quantitativeScaleSettings.comparativeMeasureSettings", { stroke: args.text });
        }

        function onOrientationchange(args) {
            var dat = $("#BulletGraph1").data("ejBulletGraph");
            if (dat) {
                $("#BulletGraph1").ejBulletGraph("option", "orientation", args.text);
                if (args.text == "vertical") {
                    $("#BulletGraph1").ejBulletGraph("option", "height", 595);
                    $("#BulletGraph1").ejBulletGraph("option", "width", 540);
                }
                else {
                    $("#BulletGraph1").ejBulletGraph("option", "height", 540);
                    $("#BulletGraph1").ejBulletGraph("option", "width", 595);
                }
            }
        }

        function onFlowDirectionchange(args) {
            var dat = $("#BulletGraph1").data("ejBulletGraph");
            if (dat)
                $("#BulletGraph1").ejBulletGraph("option", "flowDirection", args.text);
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

