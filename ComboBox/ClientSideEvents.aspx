<%@ Page Title="ComboBox-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like created, select, change, open and close events etc in a ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.ClientSideEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <ej:ComboBox ID="selectColor" runat="server" Width="100%" DataTextField="text" ClientSideOnChange="onChange" ClientSideOnBlur="onBlur" ClientSideOnFocus="onFocus" ClientSideOnCreate="onCreate" ClientSideOnSelect="onSelect" ClientSideOnOpen="onOpen" ClientSideOnClose="onClose" Placeholder="Choose a color"></ej:ComboBox>
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
                            <ej:DropDownListItem Value="focus" Text="focus"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="blur" Text="blur"></ej:DropDownListItem>
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
            var comboboxObj = $("#<%=selectColor.ClientID%>").data("ejComboBox");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "focus": comboboxObj.option(args.selectedValue, "onFocus"); break;
                    case "blur": comboboxObj.option(args.selectedValue, "onBlur"); break;
                    case "select": comboboxObj.option(args.selectedValue, "onSelect"); break;
                    case "change": comboboxObj.option(args.selectedValue, "onChange"); break;
                    case "open": comboboxObj.option(args.selectedText, "onOpen"); break;
                    case "close": comboboxObj.option(args.selectedText, "onClose"); break;
                }
            }
            else comboboxObj.option(args.selectedValue, null);
        }
        // Client side Events
        function onCreate(args) {
            jQuery.addEventLog("ComboBox has been <span class='eventTitle'>created</span>.");
        }
        function onFocus(args) {
            jQuery.addEventLog("ComboBox  is in <span class='eventTitle'>focus</span>. ");
        }
        function onBlur(args) {
            jQuery.addEventLog("ComboBox  is out of <span class='eventTitle'>focus</span>.");
        }
        function onSelect(args) {
            jQuery.addEventLog("The value '" + args.itemData.text + "' has been <span class='eventTitle'>selected</span>.");
        }
        function onChange(args) {
            jQuery.addEventLog("The value has been <span class='eventTitle'>changed</span> to '" + args.model.value + "'.");
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



