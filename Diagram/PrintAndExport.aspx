<%@ Page Title="Diagram-Print And Export-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates ASP.NET WEB diagram’s printing and exporting behavior and its customization." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PrintAndExport.aspx.cs" Inherits="WebSampleBrowser.Diagram.PrintAndExport" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
       <div>
          <ej:Toolbar ID="Toolbar1" runat="server" Width="700px" CssClass="toolblock3rightBorderVisible toolcolors">
            <Items>
                <ej:ToolbarItem Id="text">
                    <Template>
                        <div style="padding:5px">Export As Image: </div>
                    </Template>
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="spltbutton">
                    <Template>
                        <div style="padding-top: 3px;padding-right:5px; border-color:#bbbbbb">
                            <ej:SplitButton ID="SplitButton" ClientIDMode="Static" ShowRoundedCorner="true" runat="server" Size="Mini" Height="30px" Text="JPG" ClientSideOnClick="ButtonImg_Click" ClientSideOnItemSelected="ButtonImg_ItemSelect">
                                <Items>
                                    <ej:SplitItem Id="jpg" Text="JPG"></ej:SplitItem>
                                    <ej:SplitItem Id="png" Text="PNG"></ej:SplitItem>
                                    <ej:SplitItem Id="bmp" Text="BMP"></ej:SplitItem>
                                </Items>
                            </ej:SplitButton>
                        </div>
                    </Template>
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="button1">
                    <Template>
                        <div style="padding-top: 3px;padding-right:2px;margin-left:3px">
                            <ej:Button ID="svgbutton" ShowRoundedCorner="true" Height="30px" Type="Button" runat="server" Width="120px" Text="Export AS SVG" ClientSideOnClick="Buttonsvg_Click"></ej:Button>
                        </div>
                    </Template>
                </ej:ToolbarItem>
                <ej:ToolbarItem Id="button2">
                    <Template>
                        <div style="padding-top: 3px;padding-right:2px;margin-left:3px">
                            <ej:Button ID="printbutton" ShowRoundedCorner="true" Height="30px" Type="Button" runat="server" Width="80px" Text="Print" ClientSideOnClick="Buttonprint_Click"></ej:Button>
                        </div>
                    </Template>
                </ej:ToolbarItem>
            </Items>
        </ej:Toolbar>
    </div>
    <div>
        <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="400px" Width="850px">
            <PageSettings ScrollLimit="Diagram" />
            <SnapSettings SnapConstraints="None" />
        </ej:Diagram>
    </div>
        
    
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function ButtonImg_Click(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.exportDiagram({ format: args.text });
        }
        function ButtonImg_ItemSelect(args) {
            $("#SplitButton").ejSplitButton({ text: args.text });
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.exportDiagram({ format: args.ID });
        }
        function Buttonsvg_Click(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.exportDiagram({
                fileName: "diagram",
                mode: "download",
                format: "svg"
            });
        }
        function Buttonprint_Click(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.print({
                pageOrientation:"landscape"
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .toolcolors {
            border-bottom-color: #bbbbbb;
            background-color: #ebeced;
            border-top-style: none;
            border-left-style: none;
            border-right-style: none;
            border-width: 1px;
        }

        .e-toolbar > .e-horizontal .e-hover, .e-toolbar > .e-vertical > .e-hover,
        .e-toolbar > .e-horizontal .e-active, .e-toolbar > .e-vertical > .e-active {
            background: transparent;
            border-color: transparent;
        }

        .e-toolbar > .e-horizontal > .e-active > div {
            color: black;
        }
        .e-btn.e-select {
            background: #fcfcfc;
            color: #333;
            border-color: #cecece;
        }
    </style>
</asp:Content>

