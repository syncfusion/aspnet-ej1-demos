<%@ Page Title="PivotTreeMap-Named Sets-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo for ASP.NET pivot tree map control describes a named set, which is a set of dimension members predefined in the OLAP cube." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NamedSets.aspx.cs" Inherits="WebSampleBrowser.PivotTreeMap.NamedSets" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="height:auto; min-width: 200px; width:auto ;white-space:nowrap; overflow:hidden">PivotTreeMap showing internet sales amount over different customer geographic locations across core product group.</div>
    <ej:PivotTreeMap ID="PivotTreeMap1" runat="server" IsResponsive="true" ClientIDMode="Static">
        <DataSource Catalog="Adventure Works DW 2008 SE" Cube="Adventure Works" Data="//bi.syncfusion.com/olap/msmdpump.dll">
                <Columns>
                    <ej:Field FieldName="[Customer].[Customer Geography]"></ej:Field>
                </Columns>
                <Rows>
                    <ej:Field FieldName="[Core Product Group]" isNamedSets="true"></ej:Field>
                </Rows>
                <Values>
                    <ej:Field Axis="Column">
                        <Measures>
                            <ej:MeasuresItems FieldName="[Measures].[Internet Sales Amount]" />
                        </Measures>
                    </ej:Field>
                </Values>
            </DataSource>
    </ej:PivotTreeMap>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <!--Tooltip labels can be localized here-->
    <script id="tooltipTemplate" type="application/jsrender"> 
        <div style="background:White; color:black; font-size:12px; font-weight:normal; border: 1px solid #4D4D4D; white-space: nowrap;border-radius: 2px; margin-right: 25px; min-width: 110px;padding-right: 5px; padding-left: 5px; padding-bottom: 2px ;width: auto; height: auto;">
            <div>Measure(s) : {{:~Measures(#data)}}</div><div>Row : {{:~Row(#data)}}</div><div>Column : {{:~Column(#data)}}</div><div>Value : {{:~Value(#data)}}</div>
        </div>
    </script>   
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotTreeMap1 {
            min-height: 275px; 
            min-width: 525px; 
            height: 460px; 
            width: 100%;
            float:left;
        }
        .cols-sample-area{
            overflow:auto;
        }
    </style>
</asp:Content>

