<%@ Page Title="ScrollBar-Methods-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This example demonstrates the various methods like scrollX, scrollY, enable and disable in a ASP.NET Web Forms Scroller" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Methods1.aspx.cs" Inherits="WebSampleBrowser.ScrollBar.Methods" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Scroller ID="scrollcontent" runat="server" Height="300" Width="100%" ScrollTop="0" ScrollLeft="20" ButtonSize="20" AutoHide="false">
            <ScrollerContent>
                <div>
                    <div class="sampleContent">
                        <h3 style="font-size: 20px;">MVC</h3>
                        <div>
                            <p>
                                Model–view–controller (MVC) is a software architecture pattern which separates the
                                            representation of information from the user's interaction with it.
                                            The model consists of application data, business rules, logic, and functions. A view can be any
                                            output representation of data, such as a chart or a diagram. Multiple views of the same data
                                            are possible, such as a bar chart for management and a tabular view for accountants.
                                            The controller mediates input, converting it to commands for the model or view.The central
                                            ideas behind MVC are code reusability and n addition to dividing the application into three
                                            kinds of components, the MVC design defines the interactions between them.
                            </p>
                            <ul>
                                <li>
                                    <b>A controller </b>can send commands to its associated view to change the view's presentation of the model (e.g., by scrolling through a document). 
                                                It can also send commands to the model to update the model's state (e.g., editing a document).
                                </li>
                                <li>
                                    <b>A model</b> notifies its associated views and controllers when there has been a change in its state. This notification allows the views to produce updated output, and the controllers to change the available set of commands. 
                                                A passive implementation of MVC omits these notifications, because the application does not require them or the software platform does not support them.
                                </li>
                                <li>
                                    <b>A view</b> requests from the model the information that it needs to generate an output representation to the user.
                                </li>
                            </ul>
                            <p>
                                JavaScript, also known as ECMAScript (the untrademarked name used for the standard), is a dynamic programming language.
                                            It is most commonly used as part of web browsers, whose implementations allow client-side scripts to interact with the user,
                                            control the browser, communicate asynchronously, and alter the document content that is displayed.
                                            It is also used in server-side network programming with runtime environments such as Node.js, game development and the creation of desktop and mobile applications.
                            </p>
                            <p>
                                JavaScript is also used in environments that aren't web-based, such as PDF documents, site-specific browsers, and desktop widgets.
                                            Newer and faster JavaScript virtual machines (VMs) and platforms built upon them have also increased the popularity of JavaScript for server-side web applications.
                                            On the client side, JavaScript has been traditionally implemented as an interpreted language, but more recent browsers perform just-in-time compilation.
                            </p>
                        </div>
                    </div>
                </div>
            </ScrollerContent>
        </ej:Scroller>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enable / Disable
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="enabled" runat="server" ClientSideOnChange="onEnabled" DefaultText="Disable" ActiveText="Enable" Width="90px"></ej:ToggleButton>
                </div>

            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    ScrollX
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="ScrollX" runat="server" WatermarkText="ScrollX" ClientSideOnChange="setscrollX" ShowSpinButton="false" MinValue="0" Width="90px">
                    </ej:NumericTextBox>

                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-xs-4">
                    ScrollY
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:NumericTextBox ID="ScrollY" runat="server" WatermarkText="ScrollY" ClientSideOnChange="setscrollY" ShowSpinButton="false" MinValue="0" Width="90px">
                    </ej:NumericTextBox>

                </div>
            </div>


            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Destroy
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="destroy" runat="server" ClientSideOnChange="onDestroyRestore" DefaultText="False" ActiveText="True" Width="90px"></ej:ToggleButton>
                </div>

            </div>

            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Autohide
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="autohide" runat="server" ClientSideOnChange="onAutohide" DefaultText="False" ActiveText="True" Width="90px"></ej:ToggleButton>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(window).on('load',function() {
            $("#sampleProperties").ejPropertiesPanel();
            var scrollObj = $("#<%=scrollcontent.ClientID%>").ejScroller("instance");
            scrollObj.refresh();
        });
        var scrollobj;
        $(function () {
            scrollobj =  $("#<%=scrollcontent.ClientID%>").data("ejScroller");
            $(window).on('resize', function () {
			  if (scrollobj && scrollobj.model) {
             var scrollobj =  $("#<%=scrollcontent.ClientID%>").data("ejScroller");
             scrollobj.refresh();
			 }
            });
        });
        function setscrollX(args) {
            if(args.value!== null) scrollobj.scrollX(args.value);
        }
        function setscrollY(args) {
            if(args.value!== null) scrollobj.scrollY(args.value);
        }

        $("#sampleProperties").ejPropertiesPanel({});
        function onEnabled(args) {
            if (args.isChecked) {
                scrollobj.disable();
            }
            else {
                scrollobj.enable();
            }
        }
        function onDestroyRestore(args) {
            if (args.isChecked) {
                scrollobj.destroy();
                enableOrDisableButtons(false);
            }
            else {
                $("#LayoutSection_ControlsSection_scrollcontent").ejScroller({ height: 300, width: "100%" });
                scrollobj = $("#LayoutSection_ControlsSection_scrollcontent").ejScroller('instance');
                enableOrDisableButtons(true);
            }
        }
        function enableOrDisableButtons(argsVal) {
            if (argsVal) {
                $(".e-prop input.e-togglebutton[id!='LayoutSection_PropertySection_destroy']").ejToggleButton("enable");
                $(".e-prop input.e-numerictextbox").ejNumericTextbox("enable");
            }
            else {
                $(".e-prop input.e-togglebutton[id!='LayoutSection_PropertySection_destroy']").ejToggleButton("disable");
                $(".e-prop input.e-numerictextbox").ejNumericTextbox("disable");
            }
        }
        function onAutohide(args) {
            if (args.isChecked) {
                scrollobj.option("autoHide", true);
            }
            else {
                scrollobj.option("autoHide", false);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content9" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            border: 1px solid #bbbcbb;
            color: gray;
            width: 65%;
            height: 100%;
        }

        .sampleContent {
            width: 700px;
            padding: 15px;
        }
    </style>

</asp:Content>

