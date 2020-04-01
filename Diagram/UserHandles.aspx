<%@ Page Title="Diagram-UserHandles-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates a quick commands behavior and its customization in ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="UserHandles.aspx.cs" Inherits="WebSampleBrowser.Diagram.UserHandlesDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="500px" Width="100%" EnableContextMenu="false">
        <PageSettings ScrollLimit="Diagram" />
        <SnapSettings SnapConstraints="None" />
    </ej:Diagram>
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
                    Shape
                </div>
                <div class="col-md-6">
                    <input type="text" id="shape" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    OffsetX
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="offsetx" MinValue="0" IncrementStep="0.1" MaxValue="1" Enabled="true" Width="120px" CssClass="offsetx" Value="1" DecimalPlaces="1" ClientSideOnChange="changed" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    OffsetY
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="offsety" MinValue="0" IncrementStep="0.1" MaxValue="1" Enabled="true" Width="120px" CssClass="offsety" Value="1" DecimalPlaces="1" ClientSideOnChange="changed" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    H Align
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ClientIDMode="Static" ID="horizontalalignment" Width="120px" CssClass="horizontalalignment" Enabled="true" Text="Center" ClientSideOnChange="changed" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Left" Value="left" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Right" Value="right" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Center" Value="center" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    V Align
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ClientIDMode="Static" ID="verticalalignment" Width="120px" CssClass="verticalalignment" Enabled="true" Text="Center" ClientSideOnChange="changed" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Top" Value="top" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bottom" Value="bottom" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Center" Value="center" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Size
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="size" Enabled="true" CssClass="size" Width="120px" Value="30" MinValue="0" MaxValue="100" ClientSideOnChange="changed" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    BG Color
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ClientIDMode="Static" ID="backgroundcolor" runat="server" DataSourceID="ObjectDataSource1" DataTextField="text" DataValueField="text" CssClass="backgroundcolor" Enabled="true" Text="Black" Value="value" Width="120px" ClientSideOnChange="changed"></ej:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="Colors" SelectMethod="GetColors"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Border Color
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ClientIDMode="Static" ID="bordercolor" runat="server" DataSourceID="ObjectDataSource2" DataTextField="text" DataValueField="text" CssClass="bordercolor" Enabled="true" Text="Black" Value="value" Width="120px" ClientSideOnChange="changed"></ej:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" TypeName="Colors" SelectMethod="GetColors"></asp:ObjectDataSource>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Border Width
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ClientIDMode="Static" ID="borderwidth" CssClass="borderwidth" Width="120px" Value="30" MinValue="0" MaxValue="100" Name="numeric" ClientSideOnChange="changed" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Path Color
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ClientIDMode="Static" ID="pathcolor" runat="server" DataSourceID="ObjectDataSource3" DataTextField="text" DataValueField="text" CssClass="pathcolor" Enabled="true" Text="Black" Value="value" Width="120px" ClientSideOnChange="changed"></ej:DropDownList>
                    <asp:ObjectDataSource ID="ObjectDataSource3" runat="server" TypeName="Colors" SelectMethod="GetColors"></asp:ObjectDataSource>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/UserHandles.js")%>' type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .eimg {
            margin: 0;
            padding: 3px 10px 3px 3px;
            border: 0 none;
            width: 17px;
            height: 17px;
            float: left;
        }
         .row .cols-prop-area {
            display: none;
        }
    </style>
</asp:Content>

