<%@ Page Title="Diagram-Zoom And Pan-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates zooming and panning behavior of ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ZoomAndPan.aspx.cs" Inherits="WebSampleBrowser.Diagram.ZoomAndPan" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/ZoomAndPan.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        function onItemclick(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            var zoomFactor = $("#zoomFactor").ejNumericTextbox("instance");
            var zoom1 = ej.datavisualization.Diagram.Zoom();
            zoom1.zoomFactor = zoomFactor.model.value;
            switch (args.currentTarget.id) {
                case "zoomIn":
                    zoom1.zoomCommand = ej.datavisualization.Diagram.ZoomCommand.ZoomIn;
                    diagram.zoomTo(zoom1);
                    break;
                case "zoomOut":
                    zoom1.zoomCommand = ej.datavisualization.Diagram.ZoomCommand.ZoomOut;
                    diagram.zoomTo(zoom1);
                    break;
                case "pan":
                    diagram.update({ tool: ej.datavisualization.Diagram.Tool.ZoomPan });
                    break;
                case "reset":
                    diagram.refresh();
                    break;
            }
        }
        function changevscroll(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.update({ scrollSettings: { verticalOffset: args.value } });
        }
        function changezoomfactor(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            var zoom1 = ej.datavisualization.Diagram.Zoom();
            zoom1.zoomFactor = args.value
            diagram.zoomTo(zoom1);
        }
        function changehscroll(args) {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.update({ scrollSettings: { horizontalOffset: args.value } });
        }
    </script>

</asp:Content>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="StyleSection">
    
    <style type="text/css">
        .e-toolbar > .e-horizontal.e-ul > li {
            width: 36px;
            height: 30px;
        }

        .toolBarIconStyle {
            margin-top: 2px;
            margin-left: 4px;
        }

        .row .cols-sample-area {
            width: 67%;
        }

        .row .cols-prop-area {
            width: 31%;
        }
    </style>
    <link href='<%= Page.ResolveClientUrl("~/Content/diagram/zoomandpan/style.css")%>' rel="stylesheet" type="text/css" />
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Toolbar ID="ToolbarItem" runat="server" ClientSideOnClick="onItemclick" EnableSeparator="true" CssClass="toolblock3rightBorderVisible toolcolors">
        <Items>
            <ej:ToolbarItem Id="zoomIn" TooltipText="ZoomIn" SpriteCssClass="sf-icon-ZoomIn toolBarIconStyle">
            </ej:ToolbarItem>
            <ej:ToolbarItem Id="zoomOut" TooltipText="Zoom Out" SpriteCssClass="sf-icon-ZoomOut toolBarIconStyle">
            </ej:ToolbarItem>
            <ej:ToolbarItem Id="pan" TooltipText="Pan Tool" SpriteCssClass="sf-icon-PanTool toolBarIconStyle">
            </ej:ToolbarItem>
            <ej:ToolbarItem Id="reset" TooltipText="Reset" SpriteCssClass="sf-icon-Reset toolBarIconStyle">
            </ej:ToolbarItem>
        </Items>
    </ej:Toolbar>
    <div>
        <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server">
            <SnapSettings SnapConstraints="None" />
        </ej:Diagram>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>Properties</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Zoom Factor
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="zoomFactor" Width="120px" Value="1" MinValue="0.2" MaxValue="30" DecimalPlaces="2" ClientSideOnChange="changezoomfactor" IncrementStep="1" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Horizontal Scroll
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ID="hscroll" Width="120px" Value="0" MinValue="0" MaxValue="1000" IncrementStep="1" ClientSideOnChange="changehscroll" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Vertical Scroll
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ID="vscroll" Width="120px" Value="0" MinValue="0" MaxValue="1000" IncrementStep="1" ClientSideOnChange="changevscroll" Name="numeric" runat="server" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>



