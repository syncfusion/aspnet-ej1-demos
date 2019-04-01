<%@ Page Title="Diagram-PageSettings-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates ASP.NET WEB diagram’s page setting behavior and its customization in the diagram." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PageSettings.aspx.cs" Inherits="WebSampleBrowser.Diagram.PageSettings" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<%@ Register TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" Assembly="Syncfusion.EJ.Web" %>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/PageSettings.js")%>' type="text/javascript"></script>
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
                    <b>Page Settings</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Width
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="width" Width="120px" CssClass="pageWidth" Value="500" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Height
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="height" Width="120px" CssClass="pageHeight" Value="500" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Multiple Page
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="multiplepage" ClientIDMode="Static" runat="server" Checked="true" CssClass="multiplePage" ClientSideOnChange="propertyChange"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Border Width
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="borderwidth" Width="120px" Value="1" CssClass="pageBorderWidth" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Background Color
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="background" SelectedItemIndex="0" CssClass="pageBackgroundColor" Width="120px" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="White" Value="white"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Black" Value="black"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Goldenrod" Value="goldenrod"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Indigo" Value="indigo"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Chocolate" Value="chocolate"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="DarkGoldenRod" Value="darkgoldenrod"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="FireBrick" Value="firebrick"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Border Color
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="bordercolor" CssClass="pageBorderColor" SelectedItemIndex="1" Width="120px" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="White" Value="white"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Black" Value="black"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Goldenrod" Value="goldenrod"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Indigo" Value="indigo"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Chocolate" Value="chocolate"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="DarkGoldenRod" Value="darkgoldenrod"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="FireBrick" Value="firebrick"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Margin
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="margin" CssClass="pageMargin" Width="120px" Value="20" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Page Break
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="pagebreak" ClientIDMode="Static" runat="server" Checked="true" CssClass="showPageBreak" ClientSideOnChange="propertyChange"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Orientation
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="orientation" CssClass="pageOrientation" SelectedItemIndex="0" Width="120px" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Portrait" Value="portrait"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Landscape" Value="landscape"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Boundary Constraints
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="boundaryconstraints" CssClass="boundaryConstraints" SelectedItemIndex="0" Width="120px" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Diagram" Value="diagram"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Infinity" Value="infinity"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Page" Value="page"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <b>Snap Settings</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Snap
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="snaping" ClientIDMode="Static" runat="server" Checked="true" CssClass="enableSnapToObject" ClientSideOnChange="propertyChange"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Snap Angle
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="snapangle" CssClass="snapAngle" Width="120px" Value="1" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Snap Distance
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="snapdistance" CssClass="snapObjectDistance" Width="120px" Value="10" ClientSideOnChange="propertyChange" Name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Snap Constraints
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="snapconstraints" CssClass="snapConstraints" SelectedItemIndex="0" Width="120px" ClientSideOnChange="propertyChange" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None" Value="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="SnapToHorizontalLines" Value="SnapToHorizontalLines"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="SnapToVerticalLines" Value="SnapToVerticalLines"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="SnapToLines" Value="SnapToLines"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ShowHorizontalLines" Value="ShowHorizontalLines"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ShowVerticalLines" Value="ShowVerticalLines"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ShowLines" Value="ShowLines"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="All" Value="All"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>

                </div>
            </div>
        </div>
    </div>
</asp:Content>


