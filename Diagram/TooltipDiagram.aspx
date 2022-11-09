<%@ Page Title="Diagram-Tooltip-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates ASP.NET WEB diagram's tooltip functionality and its customization in the diagram." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TooltipDiagram.aspx.cs" Inherits="WebSampleBrowser.Diagram.TooltipDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Tooltip.js")%>' type="text/javascript"></script>
    <script type="text/x-jsrender" id="mouseovertoolTipId">
        <div style="background-color: #f4f4f4; color: black; border-width: 1px; border-style: solid; border-color: #d3d3d3; border-radius: 8px; corner-radius: 2px; white-space: nowrap;">
            <span style="margin: 10px;">{{:addInfo.Description}} </span>
        </div>
    </script>

    <script type="text/x-jsrender" id="mouseovertoolTipId1">
        <div style="background-color: #f4f4f4; color: black; border-style: solid; border-width: 1px; border-color: #d3d3d3; border-radius: 4px; white-space: nowrap;">
            <span style="margin: 10px;">{{:addInfo.Description}} </span>
        </div>
    </script>

    <script type="text/x-jsrender" id="mouseovertoolTipId2">
        <div style="background-color: #f4f4f4; color: black; border-style: solid; border-width: 1px; border-color: #d3d3d3; border-radius: 2px; white-space: nowrap;">
            <span style="margin: 10px;">{{:addInfo.Description}} </span>
        </div>
    </script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="450px" Width="100%" EnableContextMenu="false">
        <PageSettings ScrollLimit="Diagram" />
        <SnapSettings SnapConstraints="None" />
    </ej:Diagram>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties" style="float: left">
        <div class="prop-grid">
            <div class="row">

                <b>Tooltip</b>

            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                    Position
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ID="shapes" SelectedItemIndex="0" Width="120px" ClientSideOnChange="changeoptions" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Object" Value="Object"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Mouse" Value="Mouse"></ej:DropDownListItem>

                        </Items>
                    </ej:DropDownList>
                </div>
                <div class="col-md-3">
                    Margin
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="cornerRadius" Width="120px" Value="0" MinValue="0" MaxValue="1000" ClientSideOnChange="changemargin" Name="numeric" runat="server" />
                </div>
             
                <div class="row">

                    <b>Alignment</b>

                </div>
                <br />
                <div class="col-md-3">
                    Horizontal
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ID="horizontalalign" SelectedItemIndex="0" Width="120px" ClientSideOnChange="changehorizontalalign" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Center" Value="center"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Left" Value="left"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Right" Value="right"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
                <div class="col-md-3">
                    Vertical
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ID="verticalalign" SelectedItemIndex="0" Width="120px" ClientSideOnChange="changeverticalalign" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Bottom" Value="bottom"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Top" Value="top"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

        </div>
    </div>  
</asp:Content>


