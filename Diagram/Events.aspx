<%@ Page Title="Diagram-Events-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the ASP.NET WEB diagram’s available client-side events and when it will be triggered while editing in the diagram." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Diagram.Events" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(window).on("load", function () {
            if (ej.isMobile() && ej.isDevice()) {
                document.getElementsByClassName("symPalette_section")[0].style.display = "none";
                document.getElementsByClassName("middle_section")[0].style.display = "none";
                document.getElementsByClassName("diagram_section")[0].style.width = "100%";
                document.getElementsByClassName("control_section")[0].style.height = "100%";
            }
            onClear();
        });
    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
        <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/eventlog.js")%>' type="text/javascript"></script>

</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="control_section">
        <div class="symPalette_section">
            <ej:SymbolPalette ClientIDMode="Static" ID="symbolpalette" runat="server">
            </ej:SymbolPalette>
        </div>
        <div class="middle_section"></div>
        <div class="diagram_section">
            <ej:Diagram ClientIDMode="Static" ID="DiagramContent" runat="server" Height="100%" Width="100%">
                <PageSettings ScrollLimit="Diagram" />
            </ej:Diagram>
        </div>
    </div>
</asp:Content>
<asp:Content ID="eventsection" ContentPlaceHolderID="EventSection" runat="server">
     <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList  ID="selectControls" MinPopupHeight="300px" runat="server" SelectedItemIndex="0" Width="150px" ShowCheckbox="True"
                        CheckAll="True" ClientSideOnChange="evtpropscheckedevent">
                        <Items>
                            <ej:DropDownListItem Text="Selection Change" Value="selectionChange" />
                            <ej:DropDownListItem Text="Size Change" Value="sizeChange" />
                            <ej:DropDownListItem Text="connector Collection Change" Value="connectorCollectionChange" />
                            <ej:DropDownListItem Text="Node Collection Change" Value="nodeCollectionChange" />
                            <ej:DropDownListItem Text="Text Change" Value="textChange" />
                            <ej:DropDownListItem Text="Segment Change" Value="segmentChange" />
                            <ej:DropDownListItem Text="Rotation Change" Value="rotationChange" />
                            <ej:DropDownListItem Text="Connector Source Change" Value="connectorSourceChange" />
                            <ej:DropDownListItem Text="Connector Target Change" Value="connectorTargetChange" />
                            <ej:DropDownListItem Text="Scroll Change" Value="scrollChange" />
                            <ej:DropDownListItem Text="Double Click" Value="doubleClick" />
                            <ej:DropDownListItem Text="Drag Enter" Value="dragEnter" />
                            <ej:DropDownListItem Text="Drag Over" Value="dragOver" />
                            <ej:DropDownListItem Text="Drag Leave" Value="dragLeave" />
                            <ej:DropDownListItem Text="Drag" Value="drag" />
                            <ej:DropDownListItem Text="Drop" Value="drop" />
                            <ej:DropDownListItem Text="Group Change" Value="groupChange" />
                            <ej:DropDownListItem Text="History Change" Value="historyChange" />
                            <ej:DropDownListItem Text="Click" Value="click" />
                            <ej:DropDownListItem Text="Connection Change" Value="connectionChange" />
                            <ej:DropDownListItem Text="ContextMenu BeforeOpen" Value="contextMenuBeforeOpen" />
                            <ej:DropDownListItem Text="ContextMenu Click" Value="contextMenuClick" />
                            <ej:DropDownListItem Value="propertyChange" Text="Property Change"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseOver" Text="Mouse Over"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseEnter" Text="Mouse Enter"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseLeave" Text="Mouse Leave"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClear"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
 .control_section {
            height: 600px;
            width: 100%;
            background-color: transparent;
        }

        .diagram_section {
            width: calc(100% - 255px);
            height: 100%;
            float: left;
        }

        .middle_section {
            float: left;
            width: 5px;
            height: 100%;
        }

        .symPalette_section {
            width: 250px;
            height: 100%;
            float: left;
        }

        .svg-rotate-ie:hover
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate
        {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>

