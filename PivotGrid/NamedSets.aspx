<%@ Page Title="PivotGrid-Named Sets-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for ASP.NET pivot grid control describes a named set, which is a set of dimension members predefined in the OLAP cube" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NamedSets.aspx.cs" Inherits="WebSampleBrowser.Olap" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">    
        <ej:PivotGrid ID="PivotGrid1" runat="server" ClientIDMode="Static">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Core Product Group]" isNamedSets="true"></ej:Field>
                </Columns>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                        </Measures>
                    </ej:Field>
                </Values>
            </DataSource>
        </ej:PivotGrid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var pivotGrid;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            $("#rdbServer, #rdbClient").ejRadioButton({ change: "renderGrid" });
            pivotGrid = $("#PivotGrid1").data("ejPivotGrid");
        });
        function renderGrid(args) {
            $(pivotGrid.element).html("");
            if (args.model.id == "rdbClient") {
                pivotGrid.model.url = "";
                pivotGrid.model.operationalMode = "clientmode";
                pivotGrid.model.dataSource = { data: "//bi.syncfusion.com/olap/msmdpump.dll", catalog: "Adventure Works DW 2008 SE", cube: "Adventure Works", rows: [{ fieldName: "[Date].[Fiscal]" }], columns: [{ fieldName: "[Core Product Group]", isNamedSets: true }], values: [{ measures: [{ fieldName: "[Measures].[Internet Sales Amount]", }], axis: "columns" }] };
                }
            else {
                pivotGrid.model.dataSource = { data: null, cube: "" };
                pivotGrid.model.operationalMode = "servermode";
                pivotGrid.model.url = "../api/NamedSet";
            }
            pivotGrid._load();
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
            width: 100%; 
            overflow: auto;
            float:left;
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
             <div class="row">
                 <div class="col-md-3" style="width:20%">
                     Mode :
                 </div>
                 <div class="col-md-3" style="width:30%">
                     <input type="radio" name="dftView" id="rdbClient" checked="checked" /><label for="rdbClient" class="clslab">Client</label>
                 </div>
                 <div class="col-md-3" style="width:30%">
                     <input type="radio" name="dftView" id="rdbServer" /><label for="rdbServer" class="clslab">Server</label>
                 </div>
             </div>
         </div>
     </div>
</asp:Content>


