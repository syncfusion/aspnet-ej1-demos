<%@ Page Title="Diagram-Remote Data-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample demonstrates generating a hierarchical tree by fetching data from the server and diagram’s built-in layout algorithm." MasterPageFile="~/Samplebrowser.Master" CodeBehind="RemoteDataBinding.aspx.cs" Inherits="WebSampleBrowser.Diagram.RemoteDataBinding" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .svg-rotate-ie:hover
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function nodeTemplate(diagram, node) {
            node.labels[0].text = node.FirstName;
        }

        function getLayoutInfo(diagram, node, options) {
            if (options.level === 3) { node.fillColor = "#3c418d"; }
            if (options.level === 2) {
                node.fillColor = "#108d8d";
                options.type = "center";
                options.orientation = "horizontal";
            }
            if (options.level === 1) { node.fillColor = "#822b86" }

        }
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="RemoteChart" runat="server" Height="490px" NodeTemplate="nodeTemplate" Width="100%" EnableContextMenu="false" Tool="ZoomPan">
        <PageSettings ScrollLimit="Diagram" />
        <Layout Type="OrganizationalChart" MarginY="20" HorizontalSpacing="30" VerticalSpacing="70" GetLayoutInfo="getLayoutInfo" />
        <SnapSettings SnapConstraints="None" />
        <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true" />
        <DataSourceSettings Query="ej.Query().from('Employees').select('EmployeeID,ReportsTo,FirstName')" Id="EmployeeID" Parent="ReportsTo" TableName="Employees" />        
    </ej:Diagram>
</asp:Content>

