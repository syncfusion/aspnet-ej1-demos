<%@ Page Title="PivotChart-WCF-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot chart control describes how to bind the pivot data through WCF service" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RelationalWCF.aspx.cs" Inherits="WebSampleBrowser.PivotChart.RelationalWCF" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotChart ID="PivotChart1" runat="server" Url="../wcf/RelationalChartService.svc" IsResponsive="true" ClientIDMode="Static">
        <CommonSeriesOptions Type="Column" EnableAnimation="True" Tooltip-Visible="true" />
        <ClientSideEvents Load="loadTheme" />
        <Size Width="100%" Height="460px"></Size>
        <PrimaryYAxis>
            <Title Text="Amount"></Title>
        </PrimaryYAxis>
		<Zooming EnableScrollbar="true" />
        <Legend RowCount="1"></Legend>
    </ej:PivotChart>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1 {
            min-height: 275px;
            min-width: 525px;
            height: 460px;
            width: 100%;
            float: left;
        }

        .row .cols-sample-area {
            width: 100%;
        }
    </style>
</asp:Content>

