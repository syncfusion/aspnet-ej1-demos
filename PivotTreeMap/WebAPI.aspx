<%@ Page Title="PivotTreeMap-WebAPI-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot tree map control describes how to bind the OLAP cube data from SSAS (XML/A) through Web API service" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="WebAPI.aspx.cs" Inherits="WebSampleBrowser.PivotTreeMap.WebAPI" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="height:auto; min-width: 200px; width:auto ;white-space:nowrap; overflow:hidden">PivotTreeMap showing customer count over a period of fiscal years across different customer geographic locations.</div>
    <ej:PivotTreeMap ID="PivotTreeMap1" runat="server" Url="../api/OlapTreeMap" IsResponsive="true" ClientIDMode="Static">
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


