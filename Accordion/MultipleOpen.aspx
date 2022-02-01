<%@ Page Language="C#" Title="Expand/Collapse multiple sections in ASP.NET Accordion | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="MultipleOpen.aspx.cs" MetaDescription="This sample demonstrates how to open multiple panels in Syncfusion ASP.NET WebForms Accordion control." Inherits="WebSampleBrowser.Accordion.MultipleOpen" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
        <ej:Accordion ID="MultiAccordion" EnableMultipleOpen="true" runat="server">

            <Items>
           <ej:AccordionItem Text="ASP.NET">
                    <ContentSection>
                    Microsoft ASP.NET is a set of technologies in the Microsoft .NET Framework for building Web applications and XML Web services. ASP.NET pages execute on the server and generate markup such as HTML, WML, or XML that is sent to a desktop or mobile browser. ASP.NET pages use a compiled, event-driven programming model that improves performance and enables the separation of application logic and user interface.
                    </ContentSection>
                </ej:AccordionItem>
                <ej:AccordionItem Text="ASP.NET MVC">
                    <ContentSection>
                      The Model-View-Controller (MVC) architectural pattern separates an application into three main components: the model, the view, and the controller. The ASP.NET MVC framework provides an alternative to the ASP.NET Web Forms pattern for creating Web applications. The ASP.NET MVC framework is a lightweight, highly testable presentation framework that (as with Web Forms-based applications) is integrated with existing ASP.NET features, such as master pages and membership-based authentication.
                   </ContentSection>
               </ej:AccordionItem>
                <ej:AccordionItem Text="Javascript">
                    <ContentSection>
                         JavaScript (JS) is an interpreted computer programming language. 
                                    It was originally implemented as part of web browsers so that client-side scripts could interact with the user, control the browser, 
                                    communicate asynchronously, and alter the document content that was displayed.More recently, however, 
                                    it has become common in both game development and the creation of desktop applications.
                    </ContentSection>
                </ej:AccordionItem>
            </Items>
        </ej:Accordion>
    </div>
</asp:Content>



