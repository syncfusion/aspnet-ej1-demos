<%@ Page Language="C#" Title="Example of using client-side events in ASP.NET Accordion | Syncfusion" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This example shows the client side events that trigger on specific actions in the ASP.NET Web Accordion." Inherits="WebSampleBrowser.Accordion.ClientSideEvents" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="controlframe">
    <ej:Accordion ID="Accordion1" runat="server" ClientSideOnCreate="onCreate" ClientSideOnActivate="onActivate" ClientSideOnAjaxBeforeLoad="onBeforeLoad" ClientSideOnAjaxSuccess="onAjaxSuccess" ClientSideOnAjaxError="onError" ClientSideOnAjaxLoad="onLoad" ClientSideOnBeforeActivate="onBeforeActivate" ClientSideOnInActivate="onInActivate" ClientSideOnBeforeInActivate="onBeforeInActivate">
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
    <%-- <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Always" runat="server">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" TargetID="eventList" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="Create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeActivate" Text="Before Activate"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="activate" Text="Activate"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeInactivate" Text="Before InActivate"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="inActivate" Text="InActivate"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="ajaxBeforeLoad" Text="Ajax Before Load"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="ajaxLoad" Text="Ajax Load"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="ajaxSuccess" Text="Ajax Success"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="ajaxError" Text="Ajax Error"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
        <div class="prop-grid content">
            <div class="eventarea">
                <div class="EventLog" id="EventLog">
                </div>
            </div>
            <div class="evtbtn">
                <ej:Button ID="Clear" Type="Button" ClientSideOnClick="onClear" Text="Clear" CssClass="eventclear e-btn" runat="server"></ej:Button>
            </div>
        </div>
    </div>
    </div>
    <%--	  </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        // Client side Events
        function onCreate(args) {
            jQuery.addEventLog("Accordion has been <span class='eventTitle'>created</span>.");
        }
        function onBeforeActivate(args) {
            if (!ej.isNullOrUndefined(args.activeIndex))
                jQuery.addEventLog("<span class='eventTitle'>BeforeActiveClick</span> event is fired for Index " + args.activeIndex + ".");
        }
        function onActivate(args) {
            if (!ej.isNullOrUndefined(args.activeIndex))
                jQuery.addEventLog("<span class='eventTitle'>ActiveClick</span> event is fired for Index " + args.activeIndex + ".");
        }
        function onBeforeInActivate(args) {
            if (!ej.isNullOrUndefined(args.inActiveIndex))
                jQuery.addEventLog("Index " + args.inActiveIndex + " is on <span class='eventTitle'>BeforeInActive</span>.");
        }
        function onInActivate(args) {
            if (!ej.isNullOrUndefined(args.inActiveIndex))
                jQuery.addEventLog("Index " + args.inActiveIndex + " is on <span class='eventTitle'>inActive</span>.");
        }
        function onBeforeLoad(args) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeLoad</span> event is fired.");
        }
        function onLoad(args) {
            jQuery.addEventLog("Ajax content is <span class='eventTitle'>loaded</span>.");
        }
        function onAjaxSuccess(args) {
            jQuery.addEventLog("Ajax content is loaded <span class='eventTitle'>successfully</span>.");
        }
        function onError(args) {
            jQuery.addEventLog("Ajax content is loaded with an <span class='eventTitle'>error</span>.");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
        // Event wire and unwire
        function evtpropscheckedevent(args) {
            var acrdnObj = $("#<%=Accordion1.ClientID%>").data("ejAccordion");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create": acrdnObj.option(args.selectedValue, "onCreate"); break;
                    case "beforeActivate": acrdnObj.option(args.selectedValue, "onBeforeActivate"); break;
                    case "Activate": acrdnObj.option(args.selectedValue, "onActivate"); break;
                    case "beforeInactivate": acrdnObj.option(args.selectedValue, "onBeforeInActivate"); break;
                    case "inActivate": acrdnObj.option(args.selectedValue, "onInActivate"); break;
                    case "ajaxBeforeLoad": acrdnObj.option(args.selectedValue, "onBeforeLoad"); break;
                    case "ajaxLoad": acrdnObj.option(args.selectedValue, "onLoad"); break;
                    case "ajaxSuccess": acrdnObj.option(args.selectedValue, "onAjaxSuccess"); break;
                    case "ajaxError": acrdnObj.option(args.selectedValue, "onError"); break;
                }
            }
            else acrdnObj.option(args.selectedValue, null);
        }
    </script>
</asp:Content>

