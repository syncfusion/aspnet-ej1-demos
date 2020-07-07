<%@ Page Title="DateTimePicker-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This example demonstrates the various clientside events like create, change, open and close in a ASP.NET Web Forms DateTimePicker" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.DateTimePicker.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <asp:UpdatePanel ID="UpadteDTP" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="frame">
                <div class="control">
                    <ej:DateTimePicker ID="dateTime" ClientSideOnCreate="onCreate" ClientSideOnOpen="onOpen" ClientSideOnChange="timeValChange" ClientSideOnClose="onClose" runat="server" Width="100%" Value="05/28/2018 2:47 AM"></ej:DateTimePicker>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <%--    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Always" runat="server">
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
    </div>
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        function onCreate(args) {
            jQuery.addEventLog("DateTimePicker has been <span class='eventTitle'>created.</span>");
        }
        function timeValChange(args) {
            jQuery.addEventLog(args.value + " was <span class='eventTitle'>selected.</span>");
        }
        function onOpen(args) {
            jQuery.addEventLog("DateTimePicker popup has been <span class='eventTitle'>opened.</span>");
        }
        function onClose(args) {
            jQuery.addEventLog("DateTimePicker popup has been <span class='eventTitle'>closed.</span>");
        }

        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            var dateTimeObj = $("#<%=dateTime.ClientID%>").data("ejDateTimePicker");
              if (args.isChecked) {
                  switch (args.selectedValue) {
                      case "change": dateTimeObj.option(args.selectedValue, "timeValChange"); break;
                      case "open": dateTimeObj.option(args.selectedValue, "onOpen"); break;
                      case "close": dateTimeObj.option(args.selectedValue, "onClose"); break
                      case "create": dateTimeObj.option(args.selectedValue, "onCreate"); break;
                  }
              }
              else {
                  dateTimeObj.option(args.selectedValue, null);
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

