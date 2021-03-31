<%@ Page Title="Diagram-Model-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates model’s behavior in the ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Model.aspx.cs" Inherits="WebSampleBrowser.Diagram.DiagramModelSample" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">

    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Model.js")%>' type="text/javascript"></script>

</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:diagram clientidmode="Static" id="Diagrammodel" runat="server" height="600px" width="100%" enablecontextmenu="true">
        <PageSettings ScrollLimit="Diagram" />
        <SnapSettings SnapConstraints="None" />
    </ej:diagram>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">

    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6">
                    <b>Model</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Width
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox clientidmode="Static" id="width" width="110px" value="690" clientsideonchange="changeWidth" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Height
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox clientidmode="Static" id="cornerRadius" width="110px" value="500" clientsideonchange="changeHeight" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Context Menu
                </div>
                <div class="col-md-6">
                    <ej:checkbox id="contextMenu" clientidmode="Static" runat="server" checked="true" cssclass="example" clientsideonchange="contextMenu"></ej:checkbox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Background Color
                </div>
                <div class="col-md-6">
                    <ej:dropdownlist clientidmode="Static" id="bgColor" selecteditemindex="0" width="110px" clientsideonchange="changeColor" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None" Value="none"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Black" Value="Black"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="WhiteSmoke" Value="WhiteSmoke"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="White" Value="White"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Goldenrod" Value="GoldenRod"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Indigo" Value="Indigo"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Choclate" Value="Choclate"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="DarkGoldenrod" Value="DarkGoldenRod"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="FireBrick" Value="FireBrick"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="DarkRed" Value="DarkRed"></ej:DropDownListItem>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Bridge Direction
                </div>
                <div class="col-md-6">
                    <ej:dropdownlist clientidmode="Static" id="direction" selecteditemindex="0" width="110px" clientsideonchange="changeDirection" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Top" Value="top"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bottom" Value="bottom"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Left" Value="left"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Right" Value="right"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="None" Value="none"></ej:DropDownListItem>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Constraints
                </div>
                <div class="col-md-6">
                    <ej:dropdownlist id="Constraints" clientidmode="Static" width="110px" clientsideonchange="constraintschecked" showcheckbox="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None" Value="None" Selected="false" ></ej:DropDownListItem>
                            <ej:DropDownListItem Text="PageEditable" Value="PageEditable"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Zoomable" Value="Zoomable"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Pannable" Value="Pannable"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Undoable" Value="Undoable"></ej:DropDownListItem>
                            
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6" style="width: 126px">
                    <b>Background Image</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Alignment
                </div>
                <div class="col-md-6">
                    <ej:dropdownlist clientidmode="Static" Value="xminymid" id="Alignment" selecteditemindex="0" width="110px" clientsideonchange="changeAlignment" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="XminYmin" Value="xminymin"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XminYmid" Value="xminymid"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmaxYmax" Value="xmaxymax"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmidYmin" Value="xmidymin"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmidYmid" Value="xmidymid"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmidYmax" Value="xmidymax"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmaxYmin" Value="xmaxymin"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmaxYmid" Value="xmaxymid"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="XmaxYmax" Value="xmaxymax"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="None" Value="none"></ej:DropDownListItem>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Scale
                </div>
                <div class="col-md-6">
                    <ej:dropdownlist clientidmode="Static" id="Scale" selecteditemindex="0" width="110px" clientsideonchange="changeScale" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Meet" Value="meet"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Slice" Value="slice"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="None" Value="none"></ej:DropDownListItem>
                            
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
        </div>
    </div>

</asp:Content>


