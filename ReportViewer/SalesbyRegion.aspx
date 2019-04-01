<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SalesbyRegion.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.SalesbyRegion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / SalesbyRegion</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">     
    <div style="width:100%;height:100%;">                  
        <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportPath="~/App_Data/Reports/Sales_by_Region_2008.rdlc" ProcessingMode="Local">
        </ej:ReportViewer>
    </div>   
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <style type="text/css">
    #ReportViewer1 {
        height:650px;
    }
</style>
</asp:Content>
