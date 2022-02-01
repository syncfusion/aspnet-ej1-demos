<%@ Page Title="PivotGrid-WebAPI-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to bind the OLAP cube data from SSAS (XML/A) through Web API service." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="OlapWebAPI.aspx.cs" Inherits="WebSampleBrowser.OlapWebAPI" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" runat="server" url="../api/OlapGrid" EnableGroupingBar="true" PivotTableFieldListID="PivotSchemaDesigner" ClientIDMode="Static">
    </ej:PivotGrid>
    <ej:PivotSchemaDesigner ID="PivotSchemaDesigner" runat="server" ClientIDMode="Static"></ej:PivotSchemaDesigner>

</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var pivotGrid;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#chkGroupingBar,#chkFieldList").ejCheckBox({ size: "medium", checked: true, change: "renderPivotGrid" });
            chkGroupingBar = $('#chkGroupingBar').data("ejCheckBox"); chkFieldList = $('#chkFieldList').data("ejCheckBox");
            pivotGrid = $("#PivotGrid1").data("ejPivotGrid");
        });
        function renderPivotGrid(args) {
            var groupingBar, fieldlist = false, gridPanel = "", gridSchemaPanel = "";
            $(".e-pivotgrid").remove();
            $(".e-pivotschemadesigner").remove();
            groupingBar = chkGroupingBar.model.checked;
            fieldlist = chkFieldList.model.checked;
            gridPanel = ej.buildTag("div#PivotGrid1", "", { width: !chkFieldList.model.checked ? "90%" : "50%" })[0].outerHTML;
            if (chkFieldList.model.checked)
                gridSchemaPanel = ej.buildTag("div#PivotSchemaDesigner", "", { height: "650px", width: "40%", "float": "right", "display": "block", "margin-top": "20px" })[0].outerHTML;
            $(gridPanel).appendTo(".cols-sample-area");
            $(gridSchemaPanel).appendTo(".cols-sample-area");

            $("#PivotGrid1").ejPivotGrid({
                url: "../api/OlapGrid", enableGroupingBar: groupingBar, pivotTableFieldListID: fieldlist ? "PivotSchemaDesigner" : ""
            });
            if (fieldlist)
                $("#PivotSchemaDesigner").ejPivotSchemaDesigner();
        }
        window.loadPivotGridFrameTheme = function () {
            window.setTimeout(function () {
                var pivotGridElement = $("#PivotGrid1").data("ejPivotGrid");
                if (pivotGridElement && pivotGridElement.model.enableGroupingBar && pivotGridElement.getJSONRecords() != null)
                    pivotGridElement.renderControlFromJSON();
            }, 2500);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .e-pivotgrid {
            height: 350px; 
            width: 50%; 
            overflow: auto;
            float:left;
        }
		.e-pivotschemadesigner{
		width: 40% !important; 
		}
        .row .cols-prop-area {
            margin-top:30px;
            width: 30%;
            height: 120px;
            min-height: 0px;
        }
         .row .cols-sample-area {
             width: 100%;
         }
		 @media (min-width: 1920px) {.row .cols-prop-area { width: 21% !important; } }
    </style>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                    <div class="prop-grid">
                        <table>
                            <tr>
                                <td class="chkrad">
                                    <label for="chkGroupingBar">GroupingBar:  </label> <input type="checkbox" id="chkGroupingBar" />
                                     </td>
                                <td class="chkrad">
                                    <label for="chkFieldList">FieldList:  </label> <input type="checkbox" id="chkFieldList" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
</asp:Content>

