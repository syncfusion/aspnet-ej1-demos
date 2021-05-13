<%@ Page Title="RadialMenu-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to create the Syncfusion ASP.NET Web Forms Radial Menu component with menu items arranged in a circular manner." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.RadialMenu.DefaultFunctionalities" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            if (!(ej.browserInfo().name == "msie" && ej.browserInfo().version < 9)) {
                $("#radialtargetone").parent().css("position", "relative");
                }
                else {
                    $("#contentDiv").html("Radial Menu is only supported from Internet Explorer Versioned 9 and above.").css({ "font-size": "20px", "color": "red" });
                }
				$(window).resize(function(){
					if(ej.isMobile() && ej.isPortrait())
						$('#defaultradialmenu').css({"left":25})
				});
            });
            var rteObj, rteEle = $('#<%=rteSampleone.ClientID%>'), radialEle = $('#<%=defaultradialmenu.ClientID%>'), action = 0, forRedo = 0;
            function rteCreate(e) {
                rteObj = this;
            }
            function radialShow(e) {
                var target = $("#radialtargetone"), radialRadius = 150, radialDiameter = 2 * radialRadius,
                // To get Iframe positions
                iframeY = e.event.clientY, iframeX = e.event.clientX,
                // To set Radial Menu position within target
                x = iframeX > target.width() - radialRadius ? target.width() - radialDiameter : (iframeX > radialRadius ? iframeX - radialRadius : 0),
                y = iframeY > target.height() - radialRadius ? target.height() - radialDiameter : (iframeY > radialRadius ? iframeY - radialRadius : 0);
                $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("setPosition", x, y);
				$('iframe').contents().find('body').blur();
            }
            function click(e) {
                $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("hideMenu");
            }
        function rteChange(e) {
                   $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("enableItem", "Undo");
            }
            function bold(e) {
                rteObj.executeCommand("bold");
                data = rteObj._getSelectedHtmlString() ? true : false;
                if (data) action += 1;
                forRedo = action;
            }
            function italic(e) {
                rteObj.executeCommand("italic");
                data = rteObj._getSelectedHtmlString() ? true : false;
                if (data) action += 1;
                forRedo = action;
            }
            function undo(e) {
                rteObj.executeCommand("undo");
                action -= 1;
                if (action == 0)  $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("disableItem", "Undo");
                $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("enableItem", "Redo");
            }
            function redo(e) {
                rteObj.executeCommand("redo");
                action += 1;
                if (forRedo == action)  $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("disableItem", "Redo");
                $('#<%=defaultradialmenu.ClientID%>').ejRadialMenu("enableItem", "Undo");
            }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #rteSampleone {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div id="contentDiv">
        <div id="radialtargetone" class="content-container-fluid">
            <div class="row">
                    <ej:RTE ID="rteSampleone" runat="server" Width="100%" MinWidth="10px" ShowContextMenu="false"  ClientSideOnChange="rteChange" ClientSideOnCreate="rteCreate" ClientSideOnSelect="radialShow" ShowToolBar="false">
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
         <ej:RadialMenu ID="defaultradialmenu" runat="server" TargetElementId="radialtargetone" >         
            <Items>
           
                <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/font.png" Click="bold" Text="Bold"></ej:RadialMenuItems>
                <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/f1.png" Text="Italic" Click="italic"></ej:RadialMenuItems>
                <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/redo.png" Text="Redo" Click="redo" Enabled="false"></ej:RadialMenuItems>
                <ej:RadialMenuItems ImageURL="../Content/images/RadialMenu/undo.png" Text="Undo" Click="undo" Enabled="false"></ej:RadialMenuItems>
            
            </Items>

        </ej:RadialMenu>
    </div>
</asp:Content>


