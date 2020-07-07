<%@ Page Title="Diagram-Symbol Palette-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample illustrates ASP.NET WEB diagram's symbol palette feature that allows to predefining shapes in a palette and can be easily drag/drop into canvas." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SymbolPalette.aspx.cs" Inherits="WebSampleBrowser.Diagram.SymbolPalette" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <link href="../Content/diagram/symbolpalette/symbolpalette.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/symbolpalette.js")%>' type="text/javascript"></script>
    <script id="svgTemplate" type="text/x-jsrender">
        <svg version="1.0" xmlns="http://www.w3.org/2000/svg" width="225px" height="28px" viewBox="0 -5 225 28">
            <g visibility="visible" class="node-svg-template" >
                <image width="20px" height="20px" opacity="1" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="../Content/images/diagram/{{:name}}.png"></image>
                <text x="40" y="18" font-size="14" > 
                    <tspan>{{:name}}</tspan>
                </text>
            </g>
        </svg>
    </script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:SymbolPalette ID="SymbolPaletteControl" runat="server" ClientIDMode="Static" Height="500px" Width="300px" ShowPaletteItemText="true" SelectedPaletteName="Flow Shapes">
        <Palettes>
            <ej:DiagramPalette Name="Flow Shapes" Expanded="true" TemplateId="svgTemplate">
                <Items>
                    <ej:FlowShape Name="Process" Width="44" Height="40" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="Process"></ej:FlowShape>
                    <ej:FlowShape Name="Decision" Width="44" Height="40" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="Decision"></ej:FlowShape>
                    <ej:FlowShape Name="Sort" Width="44" Height="40" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="Sort"></ej:FlowShape>
                    <ej:FlowShape Name="Document" Width="44" Height="40" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="Document"></ej:FlowShape>
                    <ej:FlowShape Name="MultiDocument" Width="43" Height="40" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="MultiDocument"></ej:FlowShape>
                </Items>
            </ej:DiagramPalette>
            <ej:DiagramPalette Name="Connectors" Expanded="true" TemplateId="svgTemplate">
                <Items>
                    <ej:DiagramConnector Name="Link1">
                        <sourcepoint x="1" y="1"> </sourcepoint>
                        <targetpoint x="40" y="40"> </targetpoint>
                        <paletteitem enablescale="false" height="45" width="57"></paletteitem>
                        <segments> <ej:DiagramSegment Type="Orthogonal"> </ej:DiagramSegment>
                         </segments>
                        <TargetDecorator Shape="arrow"></TargetDecorator>
                        <SourceDecorator Shape="None"></SourceDecorator>
                    </ej:DiagramConnector>
                    <ej:DiagramConnector Name="Link2">
                        <sourcepoint x="1" y="1"> </sourcepoint>
                        <targetpoint x="40" y="40"> </targetpoint>
                        <paletteitem enablescale="false" height="45" width="57"></paletteitem>
                        <segments> <ej:DiagramSegment Type="Orthogonal"> </ej:DiagramSegment>
                         </segments>
                        <TargetDecorator Shape="None"></TargetDecorator>
                        <SourceDecorator Shape="None"></SourceDecorator>
                    </ej:DiagramConnector>
                    <ej:DiagramConnector Name="Link3">
                        <sourcepoint x="1" y="1"> </sourcepoint>
                        <targetpoint x="40" y="40"> </targetpoint>
                        <paletteitem enablescale="false" height="45" width="57"></paletteitem>
                        <segments> <ej:DiagramSegment Type="Straight"> </ej:DiagramSegment>
                         </segments>
                        <TargetDecorator Shape="arrow"></TargetDecorator>
                        <SourceDecorator Shape="None"></SourceDecorator>
                    </ej:DiagramConnector>
                    <ej:DiagramConnector Name="Link4">
                        <sourcepoint x="1" y="1"> </sourcepoint>
                        <targetpoint x="40" y="40"> </targetpoint>
                        <paletteitem enablescale="false" height="45" width="57"></paletteitem>
                        <segments> <ej:DiagramSegment Type="Straight"> </ej:DiagramSegment>
                         </segments>
                        <TargetDecorator Shape="None"></TargetDecorator>
                        <SourceDecorator Shape="None"></SourceDecorator>
                    </ej:DiagramConnector>
                </Items>

            </ej:DiagramPalette>
            <ej:DiagramPalette Name="Basic Shapes" Expanded="true" TemplateId="svgTemplate">
                <Items>
                    <ej:BasicShape Name="Rectangle1" Width="80" Height="160" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="Rectangle">
                        <paletteitem enablescale="false">
                              <margin left="4" right="4" top="12" bottom="10"></margin>
                          </paletteitem>
                    </ej:BasicShape>
                    <ej:BasicShape Name="Rectangl2" Width="70" Height="70" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="Rectangle"></ej:BasicShape>
                    <ej:BasicShape Name="Ellipse" Width="70" Height="70" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="ellipse"></ej:BasicShape>
                    <ej:BasicShape Name="Hexagon" Width="70" Height="70" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="polygon">
                        <PointCollection>
                            <ej:ShapePoints X="25" Y="1"></ej:ShapePoints>
                            <ej:ShapePoints X="75" Y="1"></ej:ShapePoints>
                            <ej:ShapePoints X="100" Y="50"></ej:ShapePoints>
                            <ej:ShapePoints X="75" Y="100"></ej:ShapePoints>
                            <ej:ShapePoints X="25" Y="100"></ej:ShapePoints>
                            <ej:ShapePoints X="1" Y="50"></ej:ShapePoints>
                        </PointCollection>
                    </ej:BasicShape>
                    <ej:BasicShape Name="Triangle" Width="70" Height="70" BorderWidth="1" OffsetX="20" OffsetY="20" Shape="polygon">
                        <PointCollection>
                            <ej:ShapePoints X="50" Y="1"></ej:ShapePoints>
                            <ej:ShapePoints X="100" Y="100"></ej:ShapePoints>
                            <ej:ShapePoints X="1" Y="100"></ej:ShapePoints>
                        </PointCollection>
                    </ej:BasicShape>
                </Items>
            </ej:DiagramPalette>
        </Palettes>
    </ej:SymbolPalette>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div>
            <div class="row">
                <div class="col-md-3">
                    <b>Symbol Palette</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Header Height
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ClientIDMode="Static" ID="numeric" Value="30" Name="numeric" MinValue="20" MaxValue="100" Width="88px" ClientSideOnChange="setHeaderHeight" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Item Text
                </div>
                <div class="col-md-3 aligntop">
                    <ej:CheckBox ClientIDMode="Static" ID="itemtext" runat="server" Checked="true" ClientSideOnChange="change"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Selected Palette
                </div>
                <div class="col-md-3 aligntop">
                    <ej:DropDownList ClientIDMode="Static" ID="selectedpalette" SelectedIndex="1" ClientSideOnChange="selectedPaletteChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="Basic Shapes" Text="Basic Shapes"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="Flow Shapes" Text="Flow Shapes"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="Connectors" Text="Connectors"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <b>Palette</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Header Visiblity
                </div>
                <div class="col-md-3 aligntop">
                    <ej:CheckBox ClientIDMode="Static" ID="headervisibility" runat="server" Checked="true" ClientSideOnChange="change"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Expandable
                </div>
                <div class="col-md-3 aligntop">
                    <ej:CheckBox ClientIDMode="Static" ID="headerinteraction" runat="server" Checked="true" ClientSideOnChange="change"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Visiblilty
                </div>
                <div class="col-md-3 aligntop">
                    <ej:CheckBox ClientIDMode="Static" ID="visiblepalette" runat="server" Checked="true" ClientSideOnChange="change"></ej:CheckBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


