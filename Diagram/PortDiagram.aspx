<%@ Page Title="Diagram-Port-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates port’s alignment and visibility behavior and also customizing the port appearance in the ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PortDiagram.aspx.cs" Inherits="WebSampleBrowser.Diagram.PortDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Port.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .row .cols-sample-area {
            width: 67%;
        }

        .row .cols-prop-area {
            width: 31%;
        }
    </style>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server"></ej:Diagram>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Port Collection
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="portcollection" Width="120px" WatermarkText="portName" Enabled="false" ClientSideOnChange="portcollectionChange" runat="server">
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Visibility
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ShowCheckbox="true" ID="visibility" Width="120px" Text="8" CssClass="visibility" Enabled="false" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Visible" Value="1" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Hidden" Value="2" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Hover" Value="4" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Connect" Value="8" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    OffsetX
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ClientIDMode="Static" ID="offsetX" MinValue="0" IncrementStep="0.1" MaxValue="1" Enabled="false" Width="120px" CssClass="offsetX" Value="0" DecimalPlaces="1" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    OffsetY
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ClientIDMode="Static" ID="offsetY" MinValue="0" IncrementStep="0.1" MaxValue="1" Enabled="false" Width="120px" CssClass="offsetY" Value="0" DecimalPlaces="1" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Border Width
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ClientIDMode="Static" ID="borderwidth" MinValue="1" Enabled="false" Width="120px" CssClass="borderWidth" Value="1" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Size
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ClientIDMode="Static" ID="portsize" MinValue="8" Enabled="false" Width="120px" CssClass="size" Value="8" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Fill Color
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="background" Width="120px" CssClass="fillColor" Enabled="false" Text="White" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="White" Value="white" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="#1a1a1a" Value="#1a1a1a" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Black" Value="black" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Goldenrod" Value="goldenrod" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Indigo" Value="indigo" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Chocolate" Value="chocolate" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="DarkGoldenRod" Value="darkgoldenrod" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="FireBrick" Value="firebrick" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Border Color
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="backgroundborder" Width="120px" CssClass="borderColor" Enabled="false" Text="Black" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Goldenrod" Value="goldenrod" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Indigo" Value="indigo" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Chocolate" Value="chocolate" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="DarkGoldenRod" Value="darkgoldenrod" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="White" Value="white" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="#1a1a1a" Value="#1a1a1a" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Black" Value="black" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="FireBrick" Value="firebrick" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-3">
                    Shape
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="portshape" Width="120px" CssClass="shape" Enabled="false" Text="Square" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Circle" Value="circle" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Square" Value="square" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="X" Value="x" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Path" Value="path" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <%--settool dropdown list--%>
            <div class="row">
                <div class="col-md-3">
                    ActiveTool
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="setTool" Width="120px" CssClass="setTool" Enabled="false"  Text="None" ClientSideOnChange="propertyChange"  runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None" Value="none" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Drag" Value="drag" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Draw" Value="draw" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row hideNewText">
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                    <ej:Button ID="submit" ShowRoundedCorner="true" Type="Button" runat="server" Width="50px" Text="Add" ClientSideOnClick="addnewport"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


