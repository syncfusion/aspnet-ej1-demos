
<%@ Page Title="Diagram-Label-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates label’s alignment behavior and customizing the label appearance in the ASP.NET WEB diagram." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LabelDiagram.aspx.cs" Inherits="WebSampleBrowser.Diagram.LabelDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Label.js")%>' type="text/javascript"></script>
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
    <ej:Diagram ClientIDMode="Static" OnClientSelectionChange="" ID="DiagramWebControl1" runat="server">
    </ej:Diagram>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Label Collection
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="labelcollection" Width="120px" WatermarkText="labelName" Enabled="false" ClientSideOnChange="labelcollectionChange" runat="server">
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
                    Rotate Angle
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ClientIDMode="Static" ID="rotateAngle" MinValue="0" Enabled="false" Width="120px" CssClass="rotateAngle" Value="0" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Font Color
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="fontcolor" Width="120px" CssClass="fontColor" Enabled="false" Text="Black" ClientSideOnChange="propertyChange" runat="server">
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
                    Font Size
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ClientIDMode="Static" ID="fontsize" MinValue="12" Enabled="false" Width="120px" CssClass="fontSize" Value="12" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Font Family
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="fontfamily" Width="120px" CssClass="fontFamily" Enabled="false" Text="Arial" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Arial" Value="Arial" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Aharoni" Value="Aharoni" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bell MT" Value="Bell MT" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Fantasy" Value="Fantasy" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Times New Roman" Value="Times New Roman" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Segoe UI" Value="Segoe UI" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Verdona" Value="Verdona" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Horizontal Alignment
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="horizontalalignment" Width="120px" CssClass="horizontalAlignment" Enabled="false" Text="Center" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Left" Value="left" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Right" Value="right" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Center" Value="center" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Vertical Alignment
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="verticalalignment" Width="120px" CssClass="verticalAlignment" Enabled="false" Text="Center" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Top" Value="top" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bottom" Value="bottom" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Center" Value="center" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Text Decoration
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="textdecoration" Width="120px" CssClass="textDecoration" Enabled="false" Text="None" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None" Value="none" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Underline" Value="underline" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Overline" Value="overline" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Line-Through" Value="line-through" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Text Wrapping
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" ID="textwrapping" Width="120px" CssClass="wrapping" Enabled="false" Text="WrapWithOverflow" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="WrapWithOverflow" Value="wrapwithoverflow" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="NoWrap" Value="nowrap" runat="server"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Wrap" Value="wrap" runat="server"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row hideNewText">
                <div class="col-md-3" id="textcontainer">
                    Text
                </div>
                <div class="col-md-3">
                    <input clientidmode="Static" type="text" id="text" style="width: 120px;" />
                </div>
            </div>
            <div class="row hideNewText">
                <div class="col-md-3">
                </div>
                <div class="col-md-3">
                    <ej:Button ID="submit" ShowRoundedCorner="true" Type="Button" runat="server" Width="50px" Text="Add" ClientSideOnClick="addnewlabel"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


