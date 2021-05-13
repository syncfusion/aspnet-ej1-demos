<%@ Page Title="Diagram-Radial Tree-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates visualizing the organizational structure in the circular style by using ASP.NET WEB diagram's radial tree layout algorithm." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RadialTree.aspx.cs" Inherits="WebSampleBrowser.Diagram.RadialTree" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script type="text/x-jsrender" id="mouseovertoolTipId">
        <svg style="position: relative; width: 150px; height: 75px;">
            <g>
                <path fill="#FFFFFF" d="M 147 75 H 3 c -1.7 0 -3 -1.3 -3 -2.8 V 2.8 C 0 1.3 1.3 0 3 0 h 144 c 1.7 0 3 1.3 3 2.8 v 69.4 C 150 73.7 148.7 75 147 75 Z" />
                <path d="M 147.2 74 H 2.8 c -1.3 0 -2.3 -0.6 -2.3 -1.4 V 68 h 149 v 4.6 C 149.5 73.3 148.4 74 147.2 74 Z" fill="{{:RatingColor}}" />
                <path style="fill: none; stroke: #D0D0D0; stroke-miterlimit: 10;" d="M 147.2 74.5 H 2.8 c -1.3 0 -2.3 -0.9 -2.3 -2.1 V 2.6 c 0 -1.2 1 -2.1 2.3 -2.1 h 144.5 c 1.3 0 2.3 0.9 2.3 2.1 v 69.8 C 149.5 73.5 148.4 74.5 147.2 74.5 Z" />
                <text transform="matrix(1 0 0 1 61.0801 16.0686)" style="fill: #2D2D2D; font-family: Segoe UI;font-weight:bold; font-size: 10px;">{{:Name}}</text>
                <text transform="matrix(1 0 0 1 61.0801 32.6208)" style="font-size: 10px; fill: #2D2D3A; font-family: Segoe UI;font-size: 9px;">{{:Designation:}}</text>
                <text transform="matrix(1 0 0 1 61.0801 44.4484)" style="font-size: 10px; fill: #2D2D3A; font-family: 'Segoe UI';font-size: 9px;">xyz@abc.com</text>
                <text transform="matrix(1 0 0 1 61.0801 57.987)" style="font-size: 10px; fill: #2D2D3A; font-family: 'Segoe UI';font-size: 9px;">456 789</text>
                <image style="overflow: visible; enable-background: new;" width="116" height="121" xlink:href="{{:ImageUrl}}" transform="matrix(0.3763 0 0 0.3798 6.2543 10.1381)">
                </image>
            </g></svg>
    </script>
    <script type="text/javascript">
        //creating the node template
        function nodeTemplate(diagram, node) {
            node.source = node.ImageUrl;
        }
        $(window).on("load", function () {
            $("#RadialChart").ejDiagram("instance").fitToPage()
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="RadialChart" runat="server" Height="600px" Width="100%" EnableContextMenu="false" Tool="ZoomPan">
        <pagesettings scrolllimit="Diagram" />
        <layout type="RadialTree" horizontalspacing="30" verticalspacing="30" />
        <snapsettings snapconstraints="None" />
    </ej:Diagram>
</asp:Content>

