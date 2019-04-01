<%@ Page Title="Diagram-Organizational Chart-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample illustrates visualizing a simple organizational chart with an external data source and ASP.NET WEB diagram’s organizational chart algorithm." MasterPageFile="~/Samplebrowser.Master" CodeBehind="ProjectManagementOrgChart.aspx.cs" Inherits="WebSampleBrowser.Diagram.ProjectManagementOrgChart" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #resizeBorder {
            stroke: black;
            stroke-width: 3px;
            stroke-dasharray: none;
            opacity: 1;
        }

        #nw-resize, #n-resize, #ne-resize, #w-resize, #e-resize, #sw-resize, #s-resize, #se-resize {
            fill: none;
            stroke: transparent;
        }

        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/OrganizationalChart.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="ProjectChart" runat="server" Height="470px" Width="100%" EnableContextMenu="false">
        <PageSettings ScrollLimit="Diagram" />
        <Layout Type="OrganizationalChart" MarginY="50" HorizontalSpacing="30" VerticalSpacing="30" GetLayoutInfo="getLayoutInfo" />
        <SnapSettings SnapConstraints="None" />

    </ej:Diagram>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties" style="float: left">
        <div class="prop-grid">
            <div class="row">
                <b>Layout Settings</b>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Orientation
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ClientIDMode="Static" ID="shapes" Width="140px" ClientSideOnChange="changeOrientation" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="toptobottom" Text="TOP-BOTTOM"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="bottomtotop" Text="BOTTOM-TOP"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="righttoleft" Text="RIGHT-LEFT"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="lefttoright" Text="LEFT-RIGHT"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    MarginX
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="marginX" Width="120px" Value="0" MinValue="0" MaxValue="100" ClientSideOnChange="changeMarginX" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    MarginY
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="marginY" Width="120px" Value="50" MinValue="0" MaxValue="100" ClientSideOnChange="changeMarginY" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <b>Spacing</b>
            </div>
            <br />
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Horizontal
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="Horizontal" Width="120px" Value="30" MinValue="0" MaxValue="100" ClientSideOnChange="changeHorizontalSpacing" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Vertical
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="Vertical" Width="120px" Value="30" MinValue="0" MaxValue="100" ClientSideOnChange="changerVerticalSpacing" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row" id="expandHide">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Expand
                </div>
                <div class="col-md-6">
                    <input id="expand" />
                </div>
            </div>
            <div class="row" id="orientationHide">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Orientation
                </div>
                <div class="col-md-6">
                    <input id="orientation" />
                </div>
            </div>
            <div class="row" id="typeAlter">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Type
                </div>
                <div class="col-md-3">
                    <input id="typeAlternate" />
                </div>
            </div>
            <div class="row" id="typeCenter">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Type
                </div>
                <div class="col-md-6">
                    <input id="typeCentered" />
                </div>
            </div>
        </div>
           <div id="horizontalVertical">
            <ul>
                <li value="horizontal">HORIZONTAL</li>
                <li value="vertical">VERTICAL</li>
            </ul>
        </div>
        <div id="rightLeftCenter">
            <ul>
                <li value="right">RIGHT</li>
                <li value="left">LEFT</li>
                <li value="center">CENTER</li>
            </ul>
        </div>
        <div id="rightLeftAlternate">
            <ul>
                <li value="right">RIGHT</li>
                <li value="left">LEFT</li>
                <li value="alternate">ALTERNATE</li>
            </ul>
        </div>
    </div>
</asp:Content>

