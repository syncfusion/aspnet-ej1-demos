<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / SSRS</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">     
    <div style="width:100%;height:100%;">                  
        <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportServerUrl="http://104.207.134.201/reportserver"  ReportPath="/SSRSSamples2/Territory Sales new">
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
