<%@ Page Title="ReportViewer-Local Data-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBindingLocal.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.DataBindingLocal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / DataBindingLocal</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">     
    <div style="width:100%;height:100%;">                  
        <ej:ReportViewer ClientIDMode="Static" id="ReportViewer1" runat="server" reportpath="~/App_Data/Reports/IndicatorReport.rdlc" ProcessingMode="Local"> 
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


