<%@ Page Title="Diagram-Team-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates visualizing team management organizational chart with custom templates and ASP.NET WEB diagram's organizational chart layout algorithm." MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="TeamOrgChart.aspx.cs" Inherits="WebSampleBrowser.Diagram.TeamOrgChart" %>

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
            node.source = node.ImageUrl;
            node.labels[0].text = node.Name;
            node.labels[1].text = node.Designation;
        }
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="TeamChart" runat="server" Height="660px" Width="100%" EnableContextMenu="false" Tool="ZoomPan">
        <PageSettings ScrollLimit="Diagram" />
        <Layout Type="OrganizationalChart" MarginY="50" HorizontalSpacing="30" VerticalSpacing="30" />
        <SnapSettings SnapConstraints="None" />
        
    </ej:Diagram>
</asp:Content>

