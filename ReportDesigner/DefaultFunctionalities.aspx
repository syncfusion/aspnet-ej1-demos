<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.ReportDesigner.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">ReportDesigner / Default</span>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeadSection">
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.min.css")%>'/>
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/show-hint.min.css")%>'/>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width:100%;height:100%;">
        <ej:ReportDesigner ClientIDMode="Static" ID="ReportDesigner1" runat="server" ServiceUrl="../api/ReportDesigner" OnClientCreate="controlInitialized">
        </ej:ReportDesigner>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/show-hint.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/sql.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/sql-hint.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        $(window).on("load", function () {
            if ((ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                alert("ReportDesigner will not be supported in IE Version < 9");
            }
        });

        function controlInitialized(senderObj) {
            var designer = $('#ReportDesigner1').data('ejReportDesigner');
            designer.openReport('/Catagory2/Tickets Sales Analysis');
        }
    </script>

    <style type="text/css">
    #ReportDesigner1 {
        width: 980px;
        height:653px;
    }
</style>
</asp:Content>
