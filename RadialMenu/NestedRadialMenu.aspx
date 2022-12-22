<%@ Page Title="RadialMenu-Nested Radial Menu-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to create parent and child items in the Syncfusion ASP.NET Web Forms Radial Menu component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NestedRadialMenu.aspx.cs" Inherits="WebSampleBrowser.RadialMenu.NestedRadialMenu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            if (!(ej.browserInfo().name == "msie" && ej.browserInfo().version < 9)) {
                $("#radialtargettwo").parent().css("position", "relative");
                }
                else {
                    $("#contentDiv").html("Radial Menu is only supported from Internet Explorer Versioned 9 and above.").css({ "font-size": "20px", "color": "red" });
                }
				$(window).resize(function(){
					if(ej.isMobile() && ej.isPortrait())
						$('#defaultradialmenu').css({"left":25})
				});
            });
            var rteObj, rteEle = $('#<%=rteSampletwo.ClientID%>'), radialEle = $('#<%=nestedradialmenu.ClientID%>');
            function rteCreate(e) {
                rteObj = this;
            }
            function radialShow(e) {
                var target = $("#radialtargettwo"), radialRadius = 150, radialDiameter = 2 * radialRadius,
                // To get Iframe positions
                iframeY = e.event.clientY, iframeX = e.event.clientX,
                // To set Radial Menu position within target
                x = iframeX > target.width() - radialRadius ? target.width() - radialDiameter : (iframeX > radialRadius ? iframeX - radialRadius : 0),
                y = iframeY > target.height() - radialRadius ? target.height() - radialDiameter : (iframeY > radialRadius ? iframeY - radialRadius : 0);
                $('#<%=nestedradialmenu.ClientID%>').ejRadialMenu("setPosition", x, y);
				$('iframe').contents().find('body').blur();
            }
            function rteChange(e) {
                radialEle.ejRadialMenu("enableItem", "Undo");
            }
            function copy(e) {
                rteObj.executeCommand("copy");
            }
            function paste(e) {
                if (ej.browserInfo().name == 'msie')
                rteObj.executeCommand("paste");
                else
                rteObj._openAlert("Your browser doesn't support direct access to the clipboard. Please use the Ctrl+V keyboard shortcut instead of paste opertion.");
            }
            function italic(e) {
                rteObj.executeCommand("italic");
            }
            function bold(e) {
                rteObj.executeCommand("bold");
            }
            function center(e) {
                rteObj.executeCommand("justifyCenter");
            }
            function left(e) {
                rteObj.executeCommand("justifyLeft");
            }
            function right(e) {
                rteObj.executeCommand("justifyRight");
            }
            function undo(e) {
                rteObj.executeCommand("undo");
                radialEle.ejRadialMenu("disableItem", "Undo");
                radialEle.ejRadialMenu("enableItem", "Redo");
            }
            function redo(e) {
                rteObj.executeCommand("redo");
                radialEle.ejRadialMenu("disableItem", "Redo");
                radialEle.ejRadialMenu("enableItem", "Undo");
            }
            function unorderedList(e) {
                rteObj.executeCommand("insertunorderedList");
            }
            function orderedList(e) {
                rteObj.executeCommand("insertorderedList");
            }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #rteSampletwo {
            width: 100%;
        }

        .e-radialmenu .imageclass {
            background-image: url("../Content/images/RadialMenu/main.png");
        }

        .e-radialmenu .backimageclass {
            background-image: url("../Content/images/RadialMenu/Back_button.png");
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div id="contentDiv">
        <div id="radialtargettwo" class="content-container-fluid">
            <div class="row">
               <ej:RTE ID="rteSampletwo" runat="server" Width="100%" MinWidth="10px" ShowContextMenu="false"  ClientSideOnChange="rteChange" ClientSideOnCreate="rteCreate" ClientSideOnSelect="radialShow" ShowToolBar="false">
                    <RTEContent>
<p>Model–view–controller (MVC) is a software architecture pattern which separates the representation of information from the user's interaction with it.
The model consists of application data, business rules, logic, and functions. A view can be any output representation of data, such as a chart or a diagram.
Multiple views of the same data are possible, such as a bar chart for management and a tabular view for accountants.
The controller mediates input, converting it to commands for the model or view.The central ideas behind MVC are code reusability and in addition to dividing the application into three kinds of components, the MVC design defines the interactions between them.</p>

<p>A controller can send commands to its associated view to change the view's presentation of the model (e.g., by scrolling through a document). It can also send commands to the model to update the model's state (e.g., editing a document).</p>

<p>A model notifies its associated views and controllers when there has been a change in its state. This notification allows the views to produce updated output, and the controllers to change the available set of commands. A passive implementation of MVC omits these notifications, because the application does not require them or the software platform does not support them.</p>

<p>A view requests from the model the information that it needs to generate an output representation to the user.</p>
                   </RTEContent></ej:RTE>
            </div>
        </div>
        <ej:RadialMenu ID="nestedradialmenu" runat="server" ImageClass="imageclass" BackImageClass="backimageclass" TargetElementId="radialtargettwo" ClientSideOnClick="click">
            <Items>
                <ej:RadialMenuItems Text="Copy" ImageURL="../Content/images/RadialMenu/copy.png" Click="copy">
                </ej:RadialMenuItems>
                <ej:RadialMenuItems Text="Font" ImageURL="../Content/images/RadialMenu/font.png" Click="bold">
                    <Items>
                        <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/f1.png" Text="Italic" Click="italic"></ej:RadialMenuItems>
                        <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/font.png" Text="Bold" Click="bold"></ej:RadialMenuItems>
                    </Items>
                </ej:RadialMenuItems>
                <ej:RadialMenuItems Text="List" ImageURL="../Content/images/RadialMenu/list.png" Click="orderedlist">
                    <Items>
                        <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/list.png" Text="Bullets" Click="unorderedList"></ej:RadialMenuItems>
                        <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/l5.png" Text="Numbering" Click="orderedList"></ej:RadialMenuItems>
                    </Items>
                </ej:RadialMenuItems>
                <ej:RadialMenuItems Text="Paste" ImageURL="../Content/images/RadialMenu/paste.png" Click="paste"></ej:RadialMenuItems>
                <ej:RadialMenuItems Text="Undo" ImageURL="../Content/images/RadialMenu/undo.png" Click="undo">
                    <Items>
                 <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/redo.png" Text="Redo" Click="redo" Enabled="false"></ej:RadialMenuItems>
                <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/undo.png" Text="Undo" Click="undo" Enabled="false"></ej:RadialMenuItems>
                </Items>
                </ej:RadialMenuItems>
                <ej:RadialMenuItems Text="Alignment" ImageURL="../Content/images/RadialMenu/align.png" Click="center">
                    <Items>
                        <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/a1.png" Text="Left" Click="left"></ej:RadialMenuItems>
                        <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/a2.png" Text="Right" Click="right"></ej:RadialMenuItems>
                    </Items>
                </ej:RadialMenuItems>
            </Items>
        </ej:RadialMenu>
    </div>
</asp:Content>


