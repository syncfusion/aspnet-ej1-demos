<%@ Page Title="ReportViewer-SalesDashboard-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SalesDashboard.aspx.cs" Inherits="WebSampleBrowser.ReportViewer.SalesDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportViewer / Sales Dashboard</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">     
    <div style="width:100%;height:100%;">                  
        <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportPath="~/App_Data/Reports/Sales Dashboard.rdl" ProcessingMode="Remote">
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

