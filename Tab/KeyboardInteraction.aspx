<%@ Page Title="Tab-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardInteraction.aspx.cs" MetaDescription="This example demonstrates how the tab control supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms" Inherits="WebSampleBrowser.Tab.KeyboardInteraction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Tab ID="tabSample" runat="server">
        <Items>
            <ej:TabItem ID="ASPNET" Text=" ASP.NET">
                <ContentSection>
                     Microsoft ASP.NET is a set of technologies in the Microsoft .NET Framework for building Web applications and XML Web services. ASP.NET pages execute on the server and generate markup such as HTML, WML, or XML that is sent to a desktop or mobile browser. ASP.NET pages use a compiled, event-driven programming model that improves performance and enables the separation of application logic and user interface.
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="MVC" Text=" ASP.NET MVC">
                <ContentSection>
                    The Model-View-Controller (MVC) architectural pattern separates an application into three main components: the model, the view, and the controller. The ASP.NET MVC framework provides an alternative to the ASP.NET Web Forms pattern for creating Web applications. The ASP.NET MVC framework is a lightweight, highly testable presentation framework that (as with Web Forms-based applications) is integrated with existing ASP.NET features, such as master pages and membership-based authentication.
                </ContentSection>
            </ej:TabItem>
            <ej:TabItem ID="js" Text="Javascript">
                <ContentSection>
                   JavaScript (JS) is an interpreted computer programming language. 
                                    It was originally implemented as part of web browsers so that client-side scripts could interact with the user, control the browser, 
                                    communicate asynchronously, and alter the document content that was displayed.[5] More recently, however, 
                                    it has become common in both game development and the creation of desktop applications.
                </ContentSection>
            </ej:TabItem>
        </Items>
    </ej:Tab>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up / Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected previous item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down / Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected next item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Home
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected first item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    End
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected last item.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            // declaration
            $("#<%=tabSample.ClientID%>").ejTab();
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=tabSample.ClientID%> ul a").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });

    </script>
</asp:Content>

