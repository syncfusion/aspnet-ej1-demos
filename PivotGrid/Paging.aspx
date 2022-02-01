<%@ Page Title="PivotGrid-Paging-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control demonstrates the paging and virtual scrolling option to load large records." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="WebSampleBrowser.Paging" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control">
    <ej:PivotGrid ID="PivotGrid1" runat="server" EnableVirtualScrolling="true" ClientIDMode="Static">
        <DataSource>
            <Rows>
                <ej:Field FieldName="Country" FieldCaption="Country"></ej:Field>
                <ej:Field FieldName="State" FieldCaption="State"></ej:Field>
            </Rows>
            <Columns>
                <ej:Field FieldName="Product" FieldCaption="Product"></ej:Field>
            </Columns>
            <Values>
                <ej:Field FieldName="Amount" FieldCaption="Amount"></ej:Field>
                <ej:Field FieldName="Quantity" FieldCaption="Quantity"></ej:Field>
            </Values>
            <PagerOptions CategoricalPageSize="5" SeriesPageSize="5" CategoricalCurrentPage="1" SeriesCurrentPage="1" />
        </DataSource>
        <ClientSideEvents Load="onLoad" />
    </ej:PivotGrid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <table>
                    <tr>
                        <td class="chkrad">DataSource:
                        </td>
                        <td class="chkrad">
                            <input type="radio" name="dataSource" id="rdbRelational" checked="checked" /><label for="rdbRelational" class="radioBtnLabel">Relational</label>
                        </td>
                        <td class="chkrad" colspan="2">
                            <input type="radio" name="dataSource" id="rdbOlap" /><label for="rdbOlap" class="radioBtnLabel">OLAP</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row" style="margin-top: 10px;">
                <table>
                    <tr>
                        <td class=" chkrad">Mode :
                        </td>
                        <td class="chkrad">
                            <input type="radio" name="dataMode" id="rdbClient" checked /><label for="rdbClient" class="radioBtnLabel">Client</label>
                        </td>
                        <td class="chkrad" colspan="2">
                            <input type="radio" name="dataMode" id="rdbServer" /><label for="rdbServer" class="radioBtnLabel">Server</label>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="row" style="margin-top: 10px;">
                <table>
                    <tr>
                        <td class="chkrad">Paging Type :
                        </td>
                        <td class="chkrad">
                            <input type="radio" name="type" id="vScrolling" checked="checked" /><label for="vScrolling" class="radioBtnLabel">Virtual Scrolling</label>
                        </td>
                        <td class="chkrad" colspan="2">
                            <input type="radio" name="type" id="paging" /><label for="paging" class="radioBtnLabel">Paging</label>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var vScrolling, paging, rdbClient, rdbServer, rdbRelational, rdbOlap, pGridObj;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#vScrolling,#paging,#rdbRelational,#rdbOlap,#rdbClient,#rdbServer").ejRadioButton({ change: "renderPivotGrid" });
            vScrolling = $('#vScrolling').data("ejRadioButton"); paging = $('#paging').data("ejRadioButton"); rdbClient = $('#rdbClient').data("ejRadioButton"); rdbServer = $('#rdbServer').data("ejRadioButton");
            rdbRelational = $('#rdbRelational').data("ejRadioButton"); rdbOlap = $('#rdbOlap').data("ejRadioButton");
        });
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
        };
        function renderPivotGrid(args) {
            $(".e-pivotgrid").remove();
            $(".e-pivotpager").remove();
            var clientData = "";
            if (rdbClient.model.checked) {
                clientData = rdbRelational.model.checked ? {
                    data: pivot_dataset,
                    cube: "",
                    rows: [{ fieldName: "Country", fieldCaption: "Country" }, { fieldName: "State", fieldCaption: "State" }],
                    columns: [{ fieldName: "Product", fieldCaption: "Product" }],
                    values: [{ fieldName: "Amount", fieldCaption: "Amount" }, { fieldName: "Quantity", fieldCaption: "Quantity" }],
                    filters: [],
                    pagerOptions: {
                        categoricalPageSize: 5,
                        seriesPageSize: 5,
                        categoricalCurrentPage: 1,
                        seriesCurrentPage: 1
                    }
                } : {
                    data: "//bi.syncfusion.com/olap/msmdpump.dll",
                    catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works",
                    rows: [{ fieldName: "[Customer].[Customer Geography]" }], columns: [{ fieldName: "[Date].[Date]" }],
                    values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]" }], axis: "columns" }],
                    filters: [],
                    pagerOptions: {
                        categoricalPageSize: 5,
                        seriesPageSize: 5,
                        categoricalCurrentPage: 1,
                        seriesCurrentPage: 1
                    }
                }
            }
            var gridPanel = ej.buildTag("div#PivotGrid", "", { height: paging.model.checked ? "auto" : "290px", width: "100%" })[0].outerHTML;
            if (paging.model.checked) {
                var pagerDiv = ej.buildTag("div#Pager", "", { "margin-top": "10px" })[0].outerHTML;
                $(gridPanel).appendTo(".control");
                $(pagerDiv).appendTo(".control");
                if (clientData == "")
                    $("#PivotGrid").ejPivotGrid({ url: rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/Paging", enablePaging: true, customObject: { isPaging: true } });
                else
                    $("#PivotGrid").ejPivotGrid({ dataSource: clientData, enablePaging: true });
                $("#Pager").ejPivotPager({
                    mode: ej.PivotPager.Mode.Both,
                    targetControlID: "PivotGrid"
                });
            }
            else {

                $(gridPanel).appendTo(".control");
                $(".control").children().eq(0).height("330");
                if (clientData == "") {
                    $("#PivotGrid").ejPivotGrid({ url: rdbRelational.model.checked ? "../api/RelationalGrid" : "../api/Paging", enableVirtualScrolling: true, customObject: { isPaging: true } });
                }
                else {
                    $("#PivotGrid").ejPivotGrid({ dataSource: clientData, enableVirtualScrolling: true });
                }
            }
        }
        window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
                var pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
                if (pivotGridElement && pivotGridElement.getJSONRecords() != null)
                    pivotGridElement.renderControlFromJSON();
            }, 2500);
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .e-pivotgrid {
            height: 330px;
            width: 100%;
            overflow: auto;
            float: left;
        }

        .radioBtnLabel {
            margin-left: 5px;
        }

        .row .cols-sample-area {
            width: 100%;
        }

        .cols-prop-area .content {
            width: auto;
        }

        .row .cols-prop-area {
            min-height: 170px;
            width: auto;
        }
    </style>
</asp:Content>

