<%@ Page Title="Tab-Server-Side Events-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs"  MetaDescription="This example demonstrates the server side event onTabItemActive in Syncfusion ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.Events" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

     <div class="controlframe">
        <ej:Tab ID="eventTab" Collapsible="true" OnTabItemActive="eventTab_TabItemActive" SelectedItemIndex="0" runat="server">
             <Items>
                <ej:TabItem ID="asp" Text="ASP.NET">
                    <ContentSection>
                        <div>
                                Microsoft ASP.NET is a set of technologies in the Microsoft .NET Framework for building Web applications and XML Web services. ASP.NET pages execute on the server and generate markup such as HTML, WML, or XML that is sent to a desktop or mobile browser. ASP.NET pages use a compiled, event-driven programming model that improves performance and enables the separation of application logic and user interface.

                        </div>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="mvc" Text="ASP.NET MVC">
                    <ContentSection>
                        <div>
                            The Model-View-Controller (MVC) architectural pattern separates an application into three main components: the model, the view, and the controller. The ASP.NET MVC framework provides an alternative to the ASP.NET Web Forms pattern for creating Web applications. The ASP.NET MVC framework is a lightweight, highly testable presentation framework that (as with Web Forms-based applications) is integrated with existing ASP.NET features, such as master pages and membership-based authentication.
                        </div>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="wpf" Url="../Tab/AjaxContents/wpfcontent.html" Text="WPF">
                </ej:TabItem>
            </Items>
        </ej:Tab>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
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
                            <ej:Button ID="Clear" Text="Clear" Type="Button" OnClick="Clear_Click" CssClass="eventclear e-btn" runat="server"></ej:Button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        function EndRequestHandler(sender, args) {
            if (args.get_error() != undefined) {
                args.set_errorHandled(true);
            }
        }
    </script>
</asp:Content>

