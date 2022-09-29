<%@ Page Title="Dialog-Client-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates client-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms Dialog component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.Dialog.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Button ID="btnOpen" Type="Button" runat="server" ClientSideOnClick="btnclick" Text="Click to open dialog" CssClass="e-btn"></ej:Button>
        <ej:Dialog ID="eventDialog" Title="Facebook" IsResponsive="True" runat="server" ClientSideOnCreate="onCreate" ClientSideOnBeforeClose="onBeforeClose" ClientSideOnClose="onDialogClose"
            ClientSideOnBeforeOpen="onBeforeOpen" ClientSideOnOpen="onOpen" ClientSideOnDrag="onDrag" ClientSideOnDragStart="onDragStart" ClientSideOnDragStop="onDragStop"
            ClientSideOnResize="onResize" ClientSideOnResizeStart="onResizeStart" ClientSideOnResizeStop="onResizeStop" Containment=".control" Width="550">
            <DialogContent>
                <div class="cnt">
                   Facebook is an online social networking service headquartered in Menlo Park, California. Its website was launched on February 4, 2004, by Mark Zuckerberg with his Harvard College roommates and fellow students Eduardo Saverin, Andrew McCollum, Dustin Moskovitz and Chris Hughes.The founders had initially limited the website's membership to Harvard students, but later expanded it to colleges in the Boston area, the Ivy League, and Stanford University. It gradually added support for students at various other universities and later to high-school students.
                   
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <div id="Event-Tracer" class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="beforeClose" Text="beforeClose"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="close" Text="close"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeOpen" Text="beforeOpen"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="open" Text="open"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="drag" Text="drag"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="dragStart" Text="dragStart"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="dragStop" Text="dragStop"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="resize" Text="resize"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="resizeStart" Text="resizeStart"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="resizeStop" Text="resizeStop"></ej:DropDownListItem>
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
                    <ej:Button ID="clearbutton" Type="Button" CssClass="eventclear e-btn" Text="Clear" ClientSideOnClick="onClear" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        var dialogObj;
        $(function () {
            dialogObj = $("#<%=eventDialog.ClientID%>").data("ejDialog");
            $(".e-dialog-icon,.e-icon e-close").click(function () {
                $("#<%=btnOpen.ClientID%>").show();
            });
        });

        function btnclick() {
            dialogObj.open();
            $("#<%=btnOpen.ClientID%>").hide();
        }
        function onCreate(args) {
            jQuery.addEventLog("Dialog has been <span class='eventTitle'>created</span>.");
        }
        function onBeforeClose(args) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeClose</span> event is fired for Dialog.");
        }
        function onDialogClose(args) {
            jQuery.addEventLog("Dialog is <span class='eventTitle'>closed</span>.");
            $("#<%=btnOpen.ClientID%>").show();
        }
        function onBeforeOpen(args) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeOpen</span> event is fired for Dialog.");
        }
        function onOpen(args) {
            jQuery.addEventLog("Dialog is <span class='eventTitle'>opened</span>.");
        }
        function onDrag(args) {
            jQuery.addEventLog("Dialog is being <span class='eventTitle'>dragged</span>.");
        }
        function onDragStart(args) {
            jQuery.addEventLog("Dialog dragging has been <span class='eventTitle'>started</span>.");
        }
        function onDragStop(args) {
            jQuery.addEventLog("Dialog dragging has been <span class='eventTitle'>stopped</span>.");
        }
        function onResize(args) {
            jQuery.addEventLog("Dialog is being <span class='eventTitle'>resized</span>.");
        }
        function onResizeStart(args) {
            jQuery.addEventLog("Dialog resizing has been <span class='eventTitle'>started</span>.");
        }
        function onResizeStop(args) {
            jQuery.addEventLog("Dialog resizing has been <span class='eventTitle'>stopped</span>.");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            var dpObj = $("#<%=eventDialog.ClientID%>").data("ejDialog");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "beforeClose": dpObj.option(args.selectedValue, "onBeforeClose"); break;
                    case "open": dpObj.option(args.selectedValue, "onOpen"); break;
                    case "close": dpObj.option(args.selectedValue, "onDialogClose"); break
                    case "beforeOpen": dpObj.option(args.selectedValue, "onBeforeOpen"); break;
                    case "drag": dpObj.option(args.selectedValue, "onDrag"); break;
                    case "dragStart": dpObj.option(args.selectedValue, "onDragStart"); break;
                    case "dragStop": dpObj.option(args.selectedValue, "onDragStop"); break
                    case "resize": dpObj.option(args.selectedValue, "onResize"); break;
                    case "resizeStart": dpObj.option(args.selectedValue, "onResizeStart"); break;
                    case "resizeStop": dpObj.option(args.selectedValue, "onResizeStop"); break;
                }
            }
            else {
                dpObj.option(args.selectedValue, null);
            }
        }
    </script>
    <style type="text/css">
        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        .control {
            height: 450px;
            position: relative;
        }

        #Event-Tracer {
            height: 450px;
        }

        #EventLog {
            height: 340px;
        }

        .cnt {
            text-align: justify;
        }
    </style>
</asp:Content>


