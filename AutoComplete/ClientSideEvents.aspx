<%@ Page Title="Example of using client-side events in ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates client-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.ClientSideEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <ej:Autocomplete ID="selectColor" runat="server" Width="100%" ClientSideOnChange="onChange" ClientSideOnFocusOut="onFocusOut" ClientSideOnFocusIn="onFocusIn" ClientSideOnCreate="onCreate" ClientSideOnSelect="onSelect" ClientSideOnOpen="onOpen" ClientSideOnClose="onClose" WatermarkText="Choose a color"></ej:Autocomplete>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="focusIn" Text="focusIn"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="focusOut" Text="focusOut"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="select" Text="select"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="Change"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="open" Text="Open"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="close" Text="Close"></ej:DropDownListItem>
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
                <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function evtpropscheckedevent(args) {
            var autocompleteObj = $("#<%=selectColor.ClientID%>").data("ejAutocomplete");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "focusIn": autocompleteObj.option(args.selectedValue, "onFocusIn"); break;
                    case "focusOut": autocompleteObj.option(args.selectedValue, "onFocusOut"); break;
                    case "select": autocompleteObj.option(args.selectedValue, "onSelect"); break;
                    case "change": autocompleteObj.option(args.selectedValue, "onChange"); break;
                    case "open": autocompleteObj.option(args.selectedText, "onOpen"); break;
                    case "close": autocompleteObj.option(args.selectedText, "onClose"); break;
                }
            }
            else autocompleteObj.option(args.selectedValue, null);
        }
        // Client side Events
        function onCreate(args) {
            jQuery.addEventLog("Autocomplete has been <span class='eventTitle'>created</span>.");
        }
        function onFocusIn(args) {
            jQuery.addEventLog("Autocomplete  is in <span class='eventTitle'>focus</span>. ");
        }
        function onFocusOut(args) {
            jQuery.addEventLog("Autocomplete  is out of <span class='eventTitle'>focus</span>.");
        }
        function onSelect(args) {
            jQuery.addEventLog("The value '" + args.value + "' has been <span class='eventTitle'>selected</span>.");
        }
        function onChange(args) {
            jQuery.addEventLog("The value has been <span class='eventTitle'>changed</span> to '" + args.value + "'.");
        }
        function onOpen(args) {
            jQuery.addEventLog("Suggestion List has been <span class='eventTitle'>opened</span>.");
        }
        function onClose(args) {
            jQuery.addEventLog("Suggestion List has been <span class='eventTitle'>closed</span>.");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>



