<%@ Page Title="PivotGrid-RTL-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to render the control from right to left (RTL)." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.RTL" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">

    <ej:PivotGrid ID="PivotGrid1" IsResponsive="true" runat="server"  EnableRTL="true" EnableGroupingBar="true" PivotTableFieldListID="PivotSchemaDesigner1" ClientIDMode="Static">
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
        <ClientSideEvents Load="onLoad"/>
    </ej:PivotGrid>
       <ej:PivotSchemaDesigner ID="PivotSchemaDesigner1"  EnableRTL="true" runat="server" ClientIDMode="Static">
    </ej:PivotSchemaDesigner>
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

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGrid1 {
            height: 350px; 
            width: 50%; 
            overflow: auto;
            float:left;
        }
        .e-pivotschemadesigner{
		width: 40% !important; 
        min-width:230px;
		}
    </style>
</asp:Content>

