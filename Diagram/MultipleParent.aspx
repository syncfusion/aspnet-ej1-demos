<%@ Page Title="Diagram-Multiple Parent-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates a generating complex hierarchical tree from an external data source and ASP.NET WEB diagram’s hierarchical tree algorithm." MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="MultipleParent.aspx.cs" Inherits="WebSampleBrowser.Diagram.MultipleParent" %>

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
<script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
<script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Multipleparent.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="450px" Width="100%" EnableContextMenu="false">
        <PageSettings ScrollLimit="Diagram" />
        <SnapSettings SnapConstraints="None" />
    </ej:Diagram>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>Layout Settings</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Orientation
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ID="orientation" Width="140px" Value="toptobottom" ClientSideOnChange="changeorientation" runat="server">
                        <Items>
                            <ej:DropDownListItem value="toptobottom" Text="TopToBottom"></ej:DropDownListItem>
                            <ej:DropDownListItem value="bottomtotop" Text="BottomToTop"></ej:DropDownListItem>
                            <ej:DropDownListItem value="righttoleft" Text="RightToLeft"></ej:DropDownListItem>
                            <ej:DropDownListItem value="lefttoright" Text="LeftToRight"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>Spacing</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Horizontal
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ID="horizontalSpacing" Width="120px" Value="40" WatermarkText="Horizontal Spacing" MinValue="1" MaxValue="10000" ClientSideOnChange="horizontalChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Vertical 
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ID="verticalSpacing" Width="120px" Value="40" WatermarkText="Vertical Spacing" MinValue="1" MaxValue="10000" ClientSideOnChange="verticalChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Margin X
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="marginX" Width="120px" Value="0" WatermarkText="Margin X" MinValue="0" MaxValue="10000" ClientSideOnChange="marginXChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Margin Y
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="marginY" Width="120px" Value="0" WatermarkText="Margin Y" MinValue="0" MaxValue="10000" ClientSideOnChange="marginYChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
            </div>
        </div>
    </div>
</asp:Content>

