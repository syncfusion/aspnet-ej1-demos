<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DocumentMap.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.DocumentMap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / DocumentMap</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">     
    <div style="width:100%;height:100%;">                  
        <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportPath="~/App_Data/Reports/Product Catalog.rdlc" ProcessingMode="Local">
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
