<%@ Page Title="ColorPicker-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This example demonstrates the various clientside events like create, change, select, open and close in a ASP.NET Web Forms colorpicker" Inherits="WebSampleBrowser.ColorPicker.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <asp:UpdatePanel ID="Update" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="frame">
                <div class="control">
                    <span> Choose Color</span>
                    <ej:ColorPicker ID="colorPickerEvent" Value="#278787" ClientSideOnSelect="onSelected" ClientSideOnCreate="onCreate" ClientSideOnClose="onClose" ClientSideOnOpen="onOpen" ClientSideOnChange="onChange" runat="server"></ej:ColorPicker>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                        <div class="pull-right">
                            <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                                <Items>
                                    <ej:DropDownListItem Value="open" Text="open"></ej:DropDownListItem>
                                    <ej:DropDownListItem Value="close" Text="close"></ej:DropDownListItem>
                                    <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>
                                    <ej:DropDownListItem Value="select" Text="select"></ej:DropDownListItem>
                                    <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
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
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        function onCreate(args) {
            jQuery.addEventLog("ColorPicker has been <span class='eventTitle'>created.</span>");
        }
        function onSelected(args) {
            jQuery.addEventLog(args.value + " was <span class='eventTitle'>selected.</span>");
        }
        function onChange(args) {
            jQuery.addEventLog("ColorPicker value has been changed to <span class='eventTitle'>" + args.value + ".</span>");
        }
        function onOpen(args) {
            jQuery.addEventLog("ColorPicker popup has been <span class='eventTitle'>opened.</span>");
        }
        function onClose(args) {
            jQuery.addEventLog("ColorPicker popup has been <span class='eventTitle'>closed.</span>");
        }

        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            var dpObj = $("#<%=colorPickerEvent.ClientID%>").data("ejColorPicker");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "select": dpObj.option(args.selectedValue, "onSelected"); break;
                    case "open": dpObj.option(args.selectedValue, "onOpen"); break;
                    case "close": dpObj.option(args.selectedValue, "onClose"); break
                    case "create": dpObj.option(args.selectedValue, "onCreate"); break;
                    case "change": dpObj.option(args.selectedValue, "onChange"); break;
                }
            }
            else {
                dpObj.option(args.selectedValue, null);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
         .control {
            margin-left: 40%;
        }
        .frame {
            margin: 0 auto;
        }
    </style>
</asp:Content>

