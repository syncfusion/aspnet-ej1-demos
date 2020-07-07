<%@ Page Language="C#" Title="Example of using server-side events in ASP.NET Accordion | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" MetaDescription="This example shows the events that trigger on specific actions in the ASP.NET Web Accordion." Inherits="WebSampleBrowser.Accordion.Events" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Accordion ID="Accordion1" runat="server" OnAccordionPaneClick="Accordion1_AccordionPaneClick">
       <Items>
           <ej:AccordionItem Text="ASP.NET">
                    <ContentSection>
                    Microsoft ASP.NET is a set of technologies in the Microsoft .NET Framework for building Web applications and XML Web services. ASP.NET pages execute on the server and generate markup such as HTML, WML, or XML that is sent to a desktop or mobile browser. ASP.NET pages use a compiled, event-driven programming model that improves performance and enables the separation of application logic and user interface
                    </ContentSection>
                </ej:AccordionItem>
                <ej:AccordionItem Text="ASP.NET MVC">
                    <ContentSection>
                      The Model-View-Controller (MVC) architectural pattern separates an application into three main components: the model, the view, and the controller. The ASP.NET MVC framework provides an alternative to the ASP.NET Web Forms pattern for creating Web applications. The ASP.NET MVC framework is a lightweight, highly testable presentation framework that (as with Web Forms-based applications) is integrated with existing ASP.NET features, such as master pages and membership-based authentication
                   </ContentSection>
               </ej:AccordionItem>
            <ej:AccordionItem Text="Javascript" AjaxUrl="../Content/samplecontent/jscontent.html">
            </ej:AccordionItem>
        </Items>
    </ej:Accordion>
</div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Clear" EventName="click" />
        </Triggers>
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                    </div>
                    <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog" runat="server">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <ej:Button ID="Clear" Type="Button" Text="Clear" OnClick="Clear_Click" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
               
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>








