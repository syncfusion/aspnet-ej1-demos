<%@ Page Title="Diagram-Network Diagram-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to build a network diagram by using ASP.NET WEB diagram's native nodes (SVG) feature." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Network.aspx.cs" Inherits="WebSampleBrowser.Diagram.nativeNode" %>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control_section">
        <div class="symPalette_section">
            <ej:SymbolPalette ClientIDMode="Static" ID="symbolpalette" runat="server">
            </ej:SymbolPalette>
        </div>
        <div class="middle_section"></div>
        <div class="diagram_section" style="border: 1px solid #D9DEDD">
            <ej:Diagram ClientIDMode="Static" ID="DiagramContent" runat="server" Height="100%" Width="100%">
                <PageSettings ScrollLimit="Diagram" />
            </ej:Diagram>
        </div>
    </div>
    <script type="text/javascript">
        function created(args) {
            var diagram = diagram = $("#DiagramContent").ejDiagram("instance");
            function CreateDiagramNode(name, width, height, fillColor, rotate, text, x, y, path) {
                var node = { name: name, width: width, height: height, offsetX: x, offsetY: y, borderColor: "black", fillColor: fillColor, rotateAngle: rotate, shape: ej.datavisualization.Diagram.BasicShapes.Path, pathData: "M 0 26.4576 L 26.4576 0 L 26.4576 0 L 26.4576 17.46239 L 26.4576 17.46239 L 113.3856 17.46239 L 113.3856 17.46239 L 113.3856 35.45279 L 113.3856 35.45279 L 26.4576 35.45279 L 26.4576 35.45279 L 26.4576 52.91519 L 26.4576 52.91519 L 0 26.4576 Z" }
                return node;
            }
            diagram.add(CreateDiagramNode("arrow1", 60, 30, "white", 270, "", 99, 175, true));
            diagram.add(CreateDiagramNode("arrow2", 60, 30, "white", 0, "", 250, 125, true));
            diagram.add(CreateDiagramNode("arrow3", 60, 30, "white", 270, "", 99, 300, true));
            diagram.add(CreateDiagramNode("arrow4", 60, 30, "white", 270, "", 178, 435, true));
            diagram.add(CreateDiagramNode("arrow5", 60, 30, "white", 270, "", 378, 435, true));
            diagram.add(CreateDiagramNode("arrow6", 60, 30, "white", 0, "", 370, 380, true));
            diagram.clearSelection();
        }
    </script>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src="../Scripts/Diagram/networkshapetemplates.js" type="text/javascript"></script>
    <script  type="text/javascript">
        getTemplates();
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
     <link href="../Content/diagram/network/network.css" rel="stylesheet" />
    <style type="text/css">
        .control_section {
            height: 600px;
            width: 100%;
        }

        .diagram_section {
            width: calc(98% - 255px);
            height: 100%;
            float: left;
        }

        .middle_section {
            float: left;
            width: 5px;
            height: 100%;
        }

        .symPalette_section {
            width: 250px;
            height: 100%;
            float: left;
        }
    </style>
</asp:Content>


