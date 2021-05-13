<%@ Page Language="C#" Title="Keyboard interaction in ASP.NET Accordion | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="KeyboardInteraction.aspx.cs" MetaDescription="This example demonstrates how the Accordion supports the keyboard navigation(keyboard shortcuts) in a ASP.NET Web Forms." Inherits="WebSampleBrowser.Accordion.KeyboardInteraction" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Accordion ID="KeyAccordion" runat="server">
        <Items>
            <ej:AccordionItem Text="Twitter">
                <ContentSection>
                  Twitter is an online social networking service that enables users to send and read short 140-character messages called "tweets".
Registered users can read and post tweets, but those who are unregistered can only read them. Users access Twitter through the website interface, SMS or mobile device app Twitter Inc. is based in San Francisco and has more than 25 offices around the world.
Twitter was created in March 2006 by Jack Dorsey, Evan Williams, Biz Stone, and Noah Glass and launched in July 2006. The service rapidly gained worldwide popularity, with more than 100 million users posting 340 million tweets a day in 2012.The service also handled 1.6 billion search queries per day
                </ContentSection>
            </ej:AccordionItem>
        </Items>
        <Items>
            <ej:AccordionItem Text="Facebook">
                <ContentSection>
                    Facebook is an online social networking service headquartered in Menlo Park, California. Its website was launched on February 4, 2004, by Mark Zuckerberg with his Harvard College roommates and fellow students Eduardo Saverin, Andrew McCollum, Dustin Moskovitz and Chris Hughes.The founders had initially limited the website's membership to Harvard students, but later expanded it to colleges in the Boston area, the Ivy League, and Stanford University. It gradually added support for students at various other universities and later to high-school students.
                </ContentSection>
            </ej:AccordionItem>
        </Items>
        <Items>
            <ej:AccordionItem Text="WhatsApp">
                <ContentSection>
                    WhatsApp Messenger is a proprietary cross-platform instant messaging client for smartphones that operates under a subscription business model. It uses the Internet to send text messages, images, video, user location and audio media messages to other users using standard cellular mobile numbers.
As of February 2016, WhatsApp had a user base of up to one billion,[10] making it the most globally popular messaging application.
WhatsApp Inc., based in Mountain View, California, was acquired by Facebook Inc. on February 19, 2014, for approximately US$19.3 billion.
                </ContentSection>
            </ej:AccordionItem>
        </Items>
    </ej:Accordion>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
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
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected previous item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected previous item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Selected next item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
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
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        $(function () {
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=KeyAccordion.ClientID%>").focus();
                }
            });
            $("#sampleProperties").ejPropertiesPanel();
        });

    </script>
</asp:Content>



