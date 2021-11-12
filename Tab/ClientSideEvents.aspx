<%@ Page Language="C#" Title="Tab-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like create, beforeActive, onActive and beforeAjaxLoad in a ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

     <div class="controlframe">
        <ej:Tab ID="eventTab" ClientSideOnActive="onClientActive" ClientSideOnCreate="onClientCreate" ClientSideOnBeforeActive="onClientBeforeActive" ClientSideOnAjaxLoad="onClientLoad" ClientSideOnAjaxBeforeLoad="onClientBeforeLoad" SelectedItemIndex="0" runat="server">
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
                <ej:TabItem ID="Grid" Url="../Tab/AjaxContents/wpfcontent.html" Text="WPF">
                </ej:TabItem>
            </Items>
        </ej:Tab>
    </div>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EventSection" runat="server">
    <%--<asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Always" runat="server">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="ajaxBeforeLoad" Text="onajaxBeforeLoad"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="ajaxLoad" Text="onajaxLoad"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeActive" Text="onClientBeforeActive"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemActive" Text="onClientActive"></ej:DropDownListItem>
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
                    <ej:Button ID="Clear" Text="Clear" Type="Button" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
    <%--            </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var tabObj;

        // declaration


        // Event wire and unwire
        function evtpropscheckedevent(args) {
            tabObj = $("#<%=eventTab.ClientID%>").data("ejTab");
            if (args.isChecked) {
                switch (args.data.itemValue) {
                    case "ajaxBeforeLoad": tabObj.option(args.data.itemValue, "onClientBeforeLoad"); break;
                    case "ajaxLoad": tabObj.option(args.data.itemValue, "onClientLoad"); break;
                    case "beforeActive": tabObj.option(args.data.itemValue, "onClientBeforeActive"); break;
                    case "itemActive": tabObj.option(args.data.itemValue, "onClientActive"); break;
                }
            }
            else tabObj.option(args.data.itemValue, null);
        }

        function onClientBeforeLoad(e) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeLoad</span> event is fired.</br>");
        }
        function onClientLoad(e) {
            jQuery.addEventLog("Ajax content has been <span class='eventTitle'>loaded</span>.</br>");
        }
        function onClientCreate(e) {
            jQuery.addEventLog("Tab is <span class='eventTitle'>created</span>. </br>");
        }
        function onClientActive(e) {
            jQuery.addEventLog("Index " + e.activeIndex + " is <span class='eventTitle'>activated</span>. </br>");
        }
        function onClientBeforeActive(e) {
            jQuery.addEventLog("<span class='eventTitle'>BeforeActive </span>event is fired. </br>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>

