<%@ Page Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET Pivot Grid  control illustrates the events that are triggered during drill-down or drill-up operation" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Events" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotGrid ID="PivotGrid1" runat="server" IsResponsive="true" ClientIDMode="Static" OnDrillSuccess="PivotGridEvent" OnColumnHeaderHyperlinkClick="PivotGridEvent" OnRowHeaderHyperlinkClick="PivotGridEvent" OnValueCellHyperlinkClick="PivotGridEvent" OnSummaryCellHyperlinkClick="PivotGridEvent" OnCellContext="PivotGridEvent" EnableCellContext="true">
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
        <ClientSideEvents Load="onLoad" />
        <HyperlinkSettings EnableColumnHeaderHyperlink="true" EnableRowHeaderHyperlink="true" EnableSummaryCellHyperlink="true" EnableValueCellHyperlink="true" />
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
                    <div class="EventLog" id="EventLog" runat="server"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGrid1 {
            height: 350px; 
            width: 100%; 
            overflow: auto;
            float:left;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
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
