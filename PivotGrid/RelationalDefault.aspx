<%@ Page Title="PivotGrid-Default Functionalities-RelationalDB-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to bind the pivot data, which is in JSON format at script-side." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RelationalDefault.aspx.cs" Inherits="WebSampleBrowser.Default" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <ej:PivotGrid ID="PivotGrid1" runat="server" ClientIDMode="Static">
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
    </ej:PivotGrid>
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
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGrid1 {
            height: 350px; 
            width: 100%; 
            overflow: auto;
            float:left;
        }
    </style>
</asp:Content>


