<%@ Page Title="PivotGrid-Hyperlink-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to retrieve information or navigate from a particular cell" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Hyperlink.aspx.cs" Inherits="WebSampleBrowser.Hyperlink" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" runat="server" IsResponsive="true" ClientIDMode="Static">        
        <ClientSideEvents ValueCellHyperlinkClick="valueCellClick" RowHeaderHyperlinkClick="rowHeaderClick" ColumnHeaderHyperlinkClick="columnHeaderClick" SummaryCellHyperlinkClick="summaryCellClick" Load="onLoad" />
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
        </DataSource>
        <HyperlinkSettings EnableColumnHeaderHyperlink="true" EnableValueCellHyperlink="true" EnableRowHeaderHyperlink="true" EnableSummaryCellHyperlink="true" />
    </ej:PivotGrid>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog"></div>
                </div>
                <div class="evtbtn">
                    <input type="button" class="eventclear e-btn" value="Clear" onclick="onClear()" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        valueCellClick = function (evt) {
            jQuery.addEventLog("ValueCellClick event is fired");
        },
        rowHeaderClick = function (evt) {
            jQuery.addEventLog("RowHeaderCellClick event is fired");
        },
        columnHeaderClick = function (evt) {
            jQuery.addEventLog("ColumnHeaderCellClick event is fired");
        },
        summaryCellClick = function (evt) {
            jQuery.addEventLog("SummaryCellClick event is fired");
        },
        onClear = function () {
            jQuery.clearEventLog();
        }
        function onLoad(args) {
            args.model.dataSource.data = pivot_dataset;
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

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGrid1 {
            height: 350px; 
            width: 100%; 
            overflow: auto;
            float:left;
        }

         .row .cols-sample-area {
    width: 72%;
}
        .row .cols-prop-area {
   
    width: 24%;
}
    </style>
</asp:Content>



