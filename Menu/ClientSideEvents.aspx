<%@ Page Language="C#" Title="Menu-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like create, keydown, mouseover, mouseout and click in a ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.ClientSideEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
        <div class="controlframe" style="width: 364px;">
    <ej:Menu ID="menuEvents" MenuType="NormalMenu" ClientSideOnCreate="onCreate" ClientSideOnKeyDown="keyDown" ClientSideOnMouseOver="mouseOver" ClientSideOnMouseOut="mouseOut" ClientSideOnClick="menuClick" runat="server">
        <Items>
            <ej:MenuItem Id="File" Text="File">
                <Items>
                    <ej:MenuItem Id="New" Text="New"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Open" Text="Open"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Save" Text="Save"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="PrintPreview" Text="PrintPreview"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Print" Text="Print"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Edit" Text="Edit">
                <Items>
                    <ej:MenuItem Id="Undo" Text="Undo"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Redo" Text="Redo"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Cut" Text="Cut"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Copy" Text="Copy"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Paste" Text="Paste"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="SelectAll" Text="Select All"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="View" Text="View">
                <Items>
                    <ej:MenuItem Id="PrintLayout" Text="Print Layout"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Showruler" Text="Show ruler"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Showspellingsuggestion" Text="Show spelling suggestion"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Compactcontrols" Text="Compact controls"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Fullscreen" Text="Full screen"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Insert" Text="Insert">
                <Items>
                    <ej:MenuItem Id="Image" Text="Image"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Link" Text="Link"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Comments" Text="Comments"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Footnote" Text="Foot note"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Header" Text="Header"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="Footer" Text="Footer"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Help" Text="Help">
                <Items>
                    <ej:MenuItem Id="DocsHelp" Text="Docs Help"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="UserForums" Text="User Forums"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="ReportanIssue" Text="Report an Issue"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Id="KeyboardShortcuts" Text="Keyboard Shortcuts"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
            </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        /* Events script for Menu */
        var menuObj;
        $(function () {
            menuObj = $("#<%=menuEvents.ClientID%>").data("ejMenu");
       });
       function onCreate(args) {
           jQuery.addEventLog("Menu has been <span class='eventTitle'>created</span>.");
       }
       function mouseOver(sender) {
           jQuery.addEventLog("Menu item has been <span class='eventTitle'>hovered-in</span>.</br>");
       }
       function mouseOut(sender) {
           jQuery.addEventLog("Menu item has been <span class='eventTitle'>hovered-out</span>.</br>");
       }
       function menuClick(sender) {
           jQuery.addEventLog("Menu item is <span class='eventTitle'>clicked</span>.</br>");
       }
       function keyDown(sender) {
           jQuery.addEventLog("Menu item has been changed by <span class='eventTitle'>keys</span>.</br>");
       }
       function onClear() {
           jQuery.clearEventLog();
       }
       function evtpropscheckedevent(args) {
           if (args.isChecked) {
               switch (args.data.itemValue) {
                   case "click": menuObj.option(args.data.itemValue, "menuClick"); break;
                   case "mouseover": menuObj.option(args.data.itemValue, "mouseOver"); break;
                   case "mouseout": menuObj.option(args.data.itemValue, "mouseOut"); break;
                   case "keydown": menuObj.option(args.data.itemValue, "keyDown"); break;
               }
           }
           else menuObj.option(args.data.itemValue, null);
       }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
      <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
    <style type="text/css">
        #<%=menuEvents.ClientID%> {
            margin-left: 70px;
        }

        .e-menu-res-wrap {
            height: 32px;
            overflow: hidden;
        }
		.office-365 .controlframe{
            width: 383px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <%--<asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Always" runat="server">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="click" Text="click"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseover" Text="mouseOver"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseout" Text="mouseOut"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="keydown" Text="keyDown"></ej:DropDownListItem>
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
                    <ej:Button ID="ClearButton" Type="Button" ClientSideOnClick="onClear" runat="server" Text="Clear"></ej:Button>
                </div>
            </div>
        </div>
    </div>
    <%--	 </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

