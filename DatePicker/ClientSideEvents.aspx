<%@ Page Title="DatePicker-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true"MetaDescription="This example demonstrates the various clientside events like created, selected, open and close in a ASP.NET Web Forms DatePicker" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.DatePicker.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <asp:UpdatePanel ID="Update" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="frame">
                <div class="control">
                    <ej:DatePicker ID="datepickerevent" ClientSideOnSelect="onSelected" ClientSideOnCreate="onCreate" ClientSideOnClose="onClose" ClientSideOnOpen="onOpen" Width="100%"  runat="server"></ej:DatePicker>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <%--    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="open" Text="open"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="close" Text="close"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="select" Text="select"></ej:DropDownListItem>
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
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        function onCreate(args) {
            jQuery.addEventLog("DatePicker has been <span class='eventTitle'>created.</span>");
        }
        function onSelected(args) {
            jQuery.addEventLog(args.value + " was <span class='eventTitle'>selected.</span>");
        }
        function onOpen(args) {
            jQuery.addEventLog("DatePicker popup has been <span class='eventTitle'>opened.</span>");
        }
        function onClose(args) {
            jQuery.addEventLog("DatePicker popup has been <span class='eventTitle'>closed.</span>");
        }

        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            var dpObj = $("#<%=datepickerevent.ClientID%>").data("ejDatePicker");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "select": dpObj.option(args.selectedValue, "onSelected"); break;
                    case "open": dpObj.option(args.selectedValue, "onOpen"); break;
                    case "close": dpObj.option(args.selectedValue, "onClose"); break
                    case "create": dpObj.option(args.selectedValue, "onCreate"); break;
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
        .frame{
           padding:50px;
           width:30%;
        }
    </style>
</asp:Content>

