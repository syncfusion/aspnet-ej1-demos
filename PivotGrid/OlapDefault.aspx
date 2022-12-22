<%@ Page Title="PivotGrid-Default Functionalities-OLAP-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot grid control describes how to bind the OLAP cube data from SSAS (XML/A)" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="OlapDefault.aspx.cs" Inherits="WebSampleBrowser.Olap" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>

<%@ Register Assembly="Syncfusion.EJ.Pivot" Namespace="Syncfusion.JavaScript.Models" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">    
        <ej:PivotGrid ID="PivotGrid1" runat="server">
            <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Rows>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Rows>
                <Columns>
                    <ej:Field FieldName="[Product].[Product Categories]"></ej:Field>
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
<script type="text/javascript">
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
    </style>
</asp:Content>


