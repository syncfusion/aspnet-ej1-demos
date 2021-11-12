<%@ Page Language="C#" Title="Rating-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs"  MetaDescription="This sample demonstrates the various client side events like mouseover, mouseclick, create and valueChange etc in a ASP.NET Web Forms Rating control." Inherits="WebSampleBrowser.Rating.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <ej:Rating ID="Rating1" runat="server" Value="4" ClientSideOnMouseOut="onClientOut" ClientSideOnValueChanged="onClientChage" ClientSideOnClick="onClientClick" ClientSideOnMouseOver="onClientOver" ClientSideOnCreate="onCreate" Precision="Exact"></ej:Rating>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="Create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="click" Text="click"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseover" Text="mouseover"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseout" Text="mouseout"></ej:DropDownListItem>
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
                    <ej:Button ID="Clear" Type="Button" ClientSideOnClick="onClear" Text="Clear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var raingObj;
        $(function () {
            // declaration

            raingObj = $("#<%=Rating1.ClientID%>").data("ejRating");
        });
        // Event wire and unwire
        function evtpropscheckedevent(args) {
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create": raingObj.option(args.selectedValue, "onCreate"); break;
                    case "click": raingObj.option(args.selectedValue, "onClientClick"); break;
                    case "mouseover": raingObj.option(args.selectedValue, "onClientOver"); break;
                    case "mouseout": raingObj.option(args.selectedValue, "onClientOut"); break;
                    case "change": raingObj.option(args.selectedValue, "onClientChage"); break;
                }
            }
            else raingObj.option(args.selectedValue, null);
        }

        function onCreate(args) {
            jQuery.addEventLog("Rating control has been <span class='eventTitle'>created</span>.");
        }
        function onClientClick(args) {
            jQuery.addEventLog("Rating control has been <span class='eventTitle'>clicked</span>.</br>");
        }
        function onClientOver(args) {
            jQuery.addEventLog("Rating control has been <span class='eventTitle'>hovered-in</span>.</br>");
        }
        function onClientOut(args) {
            jQuery.addEventLog("Rating control has been <span class='eventTitle'>hovered-out</span>.</br>");
        }
        function onClientChage(args) {
            jQuery.addEventLog("Rating value has been <span class='eventTitle'>changed</span> to " + args.value + " out of 5.</br>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>

