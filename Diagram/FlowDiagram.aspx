<%@ Page Title="Diagram-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the flowchart diagram of an order placed using credit card and its designed with ASP.NET WEB diagram's built-in flow shapes feature." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FlowDiagram.aspx.cs" Inherits="WebSampleBrowser.Diagram.FlowDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(window).on("load", function () {
            if (ej.isMobile() && ej.isDevice()) {
                document.getElementsByClassName("symPalette_section")[0].style.display = "none";
                document.getElementsByClassName("middle_section")[0].style.display = "none";
                document.getElementsByClassName("diagram_section")[0].style.width = "100%";
                document.getElementsByClassName("control_section")[0].style.height = "100%";
            }
        });

        function nodeCollectionChange(args) {
            if (args.state === "changing" && args.elementType === "node") {
                args.element.fillColor = "#1BA0E2";
            }
        }
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <div class="control_section">
        <div class="symPalette_section">
            <ej:SymbolPalette ClientIDMode="Static" ID="symbolpalette" runat="server">
            </ej:SymbolPalette>
        </div>
        <div class="middle_section"></div>
        <div class="diagram_section">
            <ej:Diagram ClientIDMode="Static" ID="DiagramContent" runat="server" Height="100%" Width="100%" OnClientNodeCollectionChange="nodeCollectionChange">
                <PageSettings ScrollLimit="Diagram" />
            </ej:Diagram>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
       .control_section
        {
            height: 600px;
            width: 100%;
        }

        .diagram_section
        {
            width: 710px;
            height: 100%;
            float: left;
        }

        .middle_section
        {
            float: left;
            width: 5px;
            height: 100%;
        }

        .symPalette_section
        {
            width: 250px;
            height: 100%;
            float: left;
        }

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

