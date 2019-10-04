<%@ Page Title="Diagram-Connectors-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the connector’s bridging and editing behavior and also how to customize the connector appearance in ASP.NET WEB diagram." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Connectors.aspx.cs" Inherits="WebSampleBrowser.Diagram.Connectors" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">

    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Connectors.js")%>' type="text/javascript"></script>

</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="600px" Width="100%" EnableContextMenu="false">
        <PageSettings ScrollLimit="Diagram" />
        <SnapSettings SnapConstraints="None" />
    </ej:Diagram>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>Connectors</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Segment
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ID="segment" SelectedItemIndex="0" Width="120px" ClientSideOnChange="changeSegment" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Orthogonal" Value="orthogonal"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Straight" Value="straight"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bezier" Value="bezier"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Corner Radius
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ID="cornerRadius" Width="120px" Value="10" MinValue="0" MaxValue="10" ClientSideOnChange="changeCornerRadius" Name="numeric" runat="server" />
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Bridging
                </div>
                <div class="col-md-6">
                    <ej:CheckBox ID="bridge" ClientIDMode="Static" runat="server" Checked="true" CssClass="example" ClientSideOnChange="changeLineBridge"></ej:CheckBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Bridge Obstacle
                </div>
                <div class="col-md-6">
                    <ej:CheckBox ID="bridgeobstacle" ClientIDMode="Static" runat="server" Checked="true" CssClass="example" ClientSideOnChange="changeBridgeObstacle"></ej:CheckBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Bridge Direction
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ID="direction" SelectedItemIndex="0" Width="120px" ClientSideOnChange="changeDirection" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Top" Value="top"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bottom" Value="bottom"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Left" Value="left"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Right" Value="right"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>Drag</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Connector
                </div>
                <div class="col-md-6">
                    <ej:CheckBox ID="dragable" ClientIDMode="Static" runat="server" Checked="true" CssClass="example" ClientSideOnChange="changeDrag"></ej:CheckBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Source
                </div>
                <div class="col-md-6">
                    <ej:CheckBox ID="dragablesource" ClientIDMode="Static" runat="server" Checked="true" CssClass="example" ClientSideOnChange="dragSource"></ej:CheckBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Target
                </div>
                <div class="col-md-6">
                    <ej:CheckBox ID="dragabletarget" ClientIDMode="Static" runat="server" Checked="true" CssClass="example" ClientSideOnChange="dragTarget"></ej:CheckBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -10px;">
                    Segments
                </div>
                <div class="col-md-6">
                    <ej:CheckBox ID="dragablesegment" ClientIDMode="Static" runat="server" Checked="true" CssClass="example" ClientSideOnChange="dragSegment"></ej:CheckBox>
                </div>
            </div>

        </div>
    </div>
</asp:Content>


