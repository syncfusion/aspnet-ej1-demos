<%@ Page Title="TimePicker-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the various clientside events like create, change, focusIn and focusout in a ASP.NET Web Forms TimePicker" AutoEventWireup="true" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.TimePicker.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <asp:UpdatePanel ID="Update" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="frame">
                <div class="control">
                    <ej:TimePicker runat="server" ID="time" Width="100%" ClientSideOnCreate="oncreate" ClientSideOnFocusIn="onFocusIn" ClientSideOnChange="timeValChange" ClientSideOnFocusOut="onFocusOut"></ej:TimePicker>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="focusIn" Text="focusIn"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="focusOut" Text="focusOut"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>
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
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var timeObj;

        function evtpropscheckedevent(args) {
            timeObj = $("#<%=time.ClientID%>").data("ejTimePicker");
            if (args.isChecked) {
                switch (args.data.itemValue) {
                    case "focusOut": timeObj.option(args.data.itemValue, "onFocusOut"); break;
                    case "focusIn": timeObj.option(args.data.itemValue, "onFocusIn"); break;
                    case "create": timeObj.option(args.data.itemValue, "oncreate"); break;
                    case "change": timeObj.option(args.data.itemValue, "timeValChange"); break;
                }
            }
            else timeObj.option(args.data.itemValue, null);
        }
        // Client side Events
        function oncreate(args) {
            jQuery.addEventLog("TimePicker has been <span class='eventTitle'>created</span>.");
        }
        function timeValChange(args) {
            jQuery.addEventLog("TimePicker value has been <span class='eventTitle'>changed</span> to " + args.value + ".</br>");
        }
        function onFocusIn(args) {
            jQuery.addEventLog("TimePicker is in <span class='eventTitle'>Focus</span>");
        }
        function onFocusOut(args) {
            jQuery.addEventLog("TimePicker is out of <span class='eventTitle'>Focus</span>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            margin: 0 auto;
        }
    </style>
</asp:Content>

