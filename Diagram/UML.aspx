<%@ Page Title="Diagram-UML Diagram-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample visualizes a UML class diagram of hospital management system and its designed with ASP.NET WEB diagram's built-in UML class diagram shapes." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="UML.aspx.cs" Inherits="WebSampleBrowser.Diagram.UML" %>

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
            if (node.className) {
                node.type = "umlclassifier";
                node.classifier = "class";
                node.class = { name: node.className };
                node.minWidth = 0;
                node.minHeight = 0;
                if (node.properties && node.properties.length > 0)
                    node.class.attributes = node.properties;
                if (node.methods && node.methods.length > 0)
                    node.class.methods = node.methods;
                node.labels = [{ fontColor: "white" }, { fontColor: "white" }];
            }
        }
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="700px" Width="100%" EnableContextMenu="false" Tool="SingleSelect,ZoomPan">
        <PageSettings ScrollLimit="Diagram" />
    </ej:Diagram>
</asp:Content>

