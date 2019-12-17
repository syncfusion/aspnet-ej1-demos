<%@ Page Title="Diagram-University-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample demonstrates a generating university management organizational chart with an external data source and ASP.NET WEB diagram’s built-in org chart layout algorithm." MasterPageFile="~/Samplebrowser.Master" CodeBehind="UniversityOrgChart.aspx.cs" Inherits="WebSampleBrowser.Diagram.UniversityOrgChart" %>

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
            node.labels[0].text = node.Role;
            node.fillColor = node.Color;
        }
        function getLayoutInfo(diagram, node, options) {
            if (node.labels[0].text == "University President") {
                options.assistants.push(options.children[0]);
                options.children.splice(0, 1);
            }

            if (!options.hasSubTree) {
                if (node.ChartType) {
                    options.type = node.ChartType
                }
            }
        }
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="UniversityChart" runat="server" Height="650px" Width="100%" EnableContextMenu="false" Tool="ZoomPan">
        <PageSettings ScrollLimit="Diagram" />
        <Layout Type="OrganizationalChart" MarginY="20" HorizontalSpacing="40" VerticalSpacing="40" />
        <SnapSettings SnapConstraints="None" />
        
    </ej:Diagram>
</asp:Content>

