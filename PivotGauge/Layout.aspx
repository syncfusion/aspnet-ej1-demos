<%@ Page Title="PivotGauge-Layout Options-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot gauge control describes options such as frame type and header labels to customize control layout."  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Layout.aspx.cs" Inherits="WebSampleBrowser.Gauge_Layout" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <ej:PivotGauge ID="PivotGauge1" runat="server" IsResponsive="true" EnableTooltip="true" BackgroundColor="transparent"  RowsCount="2" ColumnsCount="3" ClientIDMode="Static">
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
        <ClientSideEvents DrawLabels="onLabelDraw" RenderSuccess="loadPivotGaugeTheme" BeforeServiceInvoke="onBeforeServiceCall" AfterServiceInvoke="onAfterServiceCall"   />
        <Scales>
            <ej:CircularScales ShowRanges="true" Radius="150" ShowScaleBar="true" Size="1" ShowIndicators="true" ShowLabels="true">
                <Border Width="0.5" />
                <PointerCollection>
                    <ej:Pointers ShowBackNeedle="true" BackNeedleLength="20" Length="125" Width="7" ></ej:Pointers>
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

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Show Tooltip
                </div>
                <div class="col-md-3 aligntop">
                    <input type="checkbox" class="nodetext" id="check1" />
                </div>
                <div class="col-md-3">
                    Show Header Labels
                </div>
                <div class="col-md-3 aligntop">
                    <input type="checkbox" class="nodetext" id="check2" />
                </div>
            </div>
            <div class="row">
                    <div class="col-md-3">
                        Frame Type
                    </div>
                    <div class="col-md-3" style="margin-top: 8px;">
                        <input type="text" id="frameType" />
                    </div>
                    </div>
            <div class="row">
                <div class="col-md-3">
                    Row Count
                </div>
                <div class="col-md-3" style="margin-top: 4px;">
                    <input type="text" style="line-height:20px!important" id="rowscount" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Column Count
                </div>
                <div class="col-md-3 aligntop">
                    <input type="text" style="line-height:20px!important" id="columnscount" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        var rows = [{ option: "1", value: "1" }, { option: "2", value: "2" }, { option: "3", value: "3" }];
        var frames = [{ option: "Full - Circular", value: "Full - Circular" }, { option: "Semi - Circular", value: "Semi - Circular" }];
        $(function () {
            $("#check1").ejCheckBox({ change: "onchange", checked: true });
            $("#check2").ejCheckBox({ change: "onchange", checked: true });
            $('#frameType').ejDropDownList({
                dataSource: frames,
                fields: { text: "option", value: "value" },
                select: "onchange", width: "110px", selectedItemIndex: 0
            });

            $('#rowscount').ejDropDownList({
                dataSource: rows,
                fields: { text: "option", value: "value" },
                width: "110px", selectedIndices: [1], height: "22px"
            });
            $('#columnscount').ejDropDownList({
                dataSource: rows,
                fields: { text: "option", value: "value" },
                width: "110px", selectedIndices: [2], height: "22px"
            });
            var ddlTarget = $('#columnscount').data("ejDropDownList");
            $("#columnscount").ejDropDownList("option", "change", "onchange1");
            var ddlTarget1 = $('#rowscount').data("ejDropDownList");
            $("#rowscount").ejDropDownList("option", "change", "onchange1");
        });
        function onchange1(args) {
            pivotGauge = $("#PivotGauge1").data("ejPivotGauge");
            rowsCount = $("#rowscount").data("ejDropDownList");
            columnsCount = $("#columnscount").data("ejDropDownList");
            if (this._id == "rowscount" && (args.text != "0" || (columnsCount != undefined && columnsCount.model.text != 0))) {
                pivotGauge.model.rowsCount = args.text;
                pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
            }
            else if (this._id == "columnscount" && (args.text != "0" || rowsCount.model.text != 0)) {
                pivotGauge.model.columnsCount = args.text;
                pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
            }
            else if (args.text == "0" && (columnsCount != undefined && columnsCount.model.text == 0) && (rowsCount != undefined && rowsCount.model.text == 0)) {
                pivotGauge.model.columnsCount = 0;
                pivotGauge.model.rowsCount = 0;
                if (pivotGauge.getJSONRecords())
                    pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
            }
        }

        function onchange(args) {
            pivotGauge = $("#PivotGauge1").data("ejPivotGauge");
            if (this._id == "frameType") {
                if (args.type == "select" && args.text == "Semi - Circular") {
                    pivotGauge.model.frame.frameType = "halfcircle";
                    pivotGauge.model.frame.halfCircleFrameStartAngle = 180;
                    pivotGauge.model.scales[0].startAngle = 180;
                    pivotGauge.model.scales[0].sweepAngle = 180;
                    pivotGauge.model.scales[0].customLabels[2].position.y = 210
                    pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
                }
                else {
                    pivotGauge.model.frame.frameType = "fullcircle";
                    pivotGauge.model.scales[0].startAngle = 122;
                    pivotGauge.model.scales[0].sweepAngle = 296;
                    pivotGauge.model.scales[0].customLabels[2].position.y = 150
                    pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
                }
            }
            if (this._id == "check1" && !args.model.checked) {
                pivotGauge.model.enableTooltip = false;
                pivotGauge.refresh();
            }
            else if (this._id == "check1" && args.model.checked) {
                pivotGauge.model.enableTooltip = true;
                pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
            }
            else if (this._id == "check2" && !args.model.checked) {
                pivotGauge.model.showHeaderLabel = false;
                pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
            }
            else if (this._id == "check2" && args.model.checked) {
                pivotGauge.model.showHeaderLabel = true;
                pivotGauge._renderControlSuccess({ "PivotRecords": JSON.stringify(pivotGauge.getJSONRecords()), "OlapReport": pivotGauge.getOlapReport() });
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGauge1 {
            width: 100%;
            height: 360px;
            float: left;
            overflow:auto;
        } 
        
         .row .cols-prop-area {
            min-height: 216px;
            width:25%;
        }   
        
        .row .cols-sample-area {
    width: 72%;
}        
    </style>
</asp:Content>

