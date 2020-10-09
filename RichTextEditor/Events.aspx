<%@ Page Language="C#" Title="RichTextEditor-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" MetaDescription="This sample demonstrates the various client side like change, keyup, keydown, create, prerender and execute in ASP.NET Web Forms RichTextEditor control." Inherits="WebSampleBrowser.RichTextEditor.Events" %>


<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    Events
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     
        <ej:RTE ID="RTEEvents" Width="100%" Height="352" runat="server" ClientSideOnPreRender="OnPreRender" ClientSideOnCreate="onCreate" ClientSideOnExecute="onExecute" ClientSideOnKeydown="onKeydown" ClientSideOnKeyup="onKeyup" ClientSideOnChange="onChange" MinWidth="200px">
            <RTEContent>
                <p><b>Description:</b></p>
        <p>The Rich Text Editor (RTE) control is an easy to render in
        client side. Customer easy to edit the contents and get the HTML content for
        the displayed content. A rich text editor control provides users with a toolbar
        that helps them to apply rich text formats to the text entered in the text
        area. </p>
       <p><b>Functional
        Specifications/Requirements:</b></p>
        <ol><li><p>Provide
        the tool bar support, it’s also customizable.</p></li><li><p>Options
        to get the HTML elements with styles.</p></li><li><p>Support
        to insert image from a defined path.</p></li><li><p>Footer
        elements and styles(tag / Element information , Action button (Upload, Cancel))</p></li><li><p>Re-size
        the editor support.</p></li><li><p>Provide
        efficient public methods and client side events.</p></li><li><p>Keyboard
        navigation support.</p></li></ol>
            </RTEContent>
        </ej:RTE>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="execute" Text="execute"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="keydown" Text="keydown"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="keyup" Text="keyup"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog" runat="server" clientidmode="Static">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/RichTextEditor/Events.js")%>' type="text/javascript"></script>
</asp:Content>

