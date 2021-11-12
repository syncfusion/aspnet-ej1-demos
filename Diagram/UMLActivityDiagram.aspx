<%@ Page Title="Diagram-UML Activity Diagram-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example demonstrates an email communication processing UML activity diagram and its designed with ASP.NET WEB diagram’s built-in UML activity shapes." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="UMLActivityDiagram.aspx.cs" Inherits="WebSampleBrowser.Diagram.UMLActivityDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(window).on("load", function () {
            setToolTip(true);
        });
        function setToolTip(isLoad) {
            var paletteItems;
            if (isLoad)
                paletteItems = $(".e-paletteItem");
            for (m = 0; m < paletteItems.length; m++) {
                var title = "";
                var wWord = ((paletteItems[m].id).split("_")[0]);
                if (wWord) {
                    if (wWord.split(/(?=[A-Z])/)[0])
                        title += " " + wWord.split(/(?=[A-Z])/)[0];
                    if (wWord.split(/(?=[A-Z])/)[1])
                        title += " " + wWord.split(/(?=[A-Z])/)[1];
                    if (wWord.split(/(?=[A-Z])/)[2])
                        title += " " + wWord.split(/(?=[A-Z])/)[2];
                    if (wWord.split(/(?=[A-Z])/)[3])
                        title += " " + wWord.split(/(?=[A-Z])/)[3];
                    if (wWord.split(/(?=[A-Z])/)[4])
                        title += " " + wWord.split(/(?=[A-Z])/)[4];
                }
                paletteItems[m].setAttribute("title", title);
            }
        }
    </script>
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
                <SnapSettings SnapConstraints="None" />
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

         .diagram_section {
            width: calc(100% - 235px);
            height: 600px;
            float: left;
        }

        .middle_section {
            float: left;
            width: 5px;
            height: 600px;
        }

        .symPalette_section {
            width: 230px;
            height: 600px;
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

