<%@ Page Title="Buttons-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates the various clientside events like click, open, change and select in a ASP.NET Web Forms Button, ToggleButton, SplitButton, GroupButton controls"
 CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.Buttons.ClientSideEvents" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-3">Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:Button ID="ButtonNormal" runat="server" Size="Large" Type="Reset" ClientSideOnCreate="btnLoad" ClientSideOnClick="btnClick" ShowRoundedCorner="true" Text="Save"></ej:Button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">Toggle Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:ToggleButton ID="ToggleButton" runat="server" Size="Large" ClientSideOnClick="tglebtnClick" ClientSideOnChange="tglebtnChange" ClientSideOnCreate="tglebtnLoad" ShowRoundedCorner="true" DefaultText="Save" ActiveText="Delete"></ej:ToggleButton>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">Split Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:SplitButton ID="SplitButton" runat="server" Size="Large" ShowRoundedCorner="true" Text="Save" ClientSideOnCreate="spltbtnLoad" ClientSideOnBeforeOpen="onFocusIn" ClientSideOnItemSelected="spltbtnitmSelected" ClientSideOnItemMouseOut="spltbtnitmOut" ClientSideOnClick="spltbtnClick" ClientSideOnItemMouseOver="spltbtnitmHover" ClientSideOnOpen="spltbtnOpened" ClientSideOnClose="spltbtnClosed">
                    <Items>
                        <ej:SplitItem Text="Open..."></ej:SplitItem>
                        <ej:SplitItem Text="Save"></ej:SplitItem>
                        <ej:SplitItem Text="Delete"></ej:SplitItem>
                    </Items>
                </ej:SplitButton>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">Group Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:GroupButton ID="GroupButton" runat="server" Width="215px" Height="40px" GroupButtonMode="RadioButton" ShowRoundedCorner="true" ClientSideOnCreate="grpbtnLoad" ClientSideOnBeforeSelect="grpbtnBeforeSelect" ClientSideOnSelect="grpbtnSelect" ClientSideOnKeyPress="grpbtnKeyPress">
                    <Items>
                        <ej:GroupButtonItem Text="Save"></ej:GroupButtonItem>
                        <ej:GroupButtonItem Text="Open"></ej:GroupButtonItem>
                        <ej:GroupButtonItem Text="Delete"></ej:GroupButtonItem>
                    </Items>
                </ej:GroupButton>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <%--    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Always" runat="server">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" TargetID="eventList" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="Create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeOpen" Text="Open"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="beforeSelect" Text="Before Select"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="Change"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="click" Text="Click"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="close" Text="Close"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemMouseOver" Text="MouseOver"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemMouseOut" Text="MouseOut"></ej:DropDownListItem>                           
                            <ej:DropDownListItem Value="itemSelected" Text="Item Select"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="keyPress" Text="Key Press"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="open" Text="Open"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="select" Text="Select"></ej:DropDownListItem>                                                        
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
                    <ej:Button ID="ClearButton" Type="Button" CssClass="eventclear e-btn" ClientSideOnClick="onClear" runat="server" Text="Clear"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function btnLoad(e) {
            jQuery.addEventLog("Button has been <span class='eventTitle'>created</span>.");
        }
        function btnClick(e) {
            jQuery.addEventLog("Button has been <span class='eventTitle'>clicked</span>.");
        }
        function tglebtnLoad(e) {
            jQuery.addEventLog("ToggleButton has been <span class='eventTitle'>created</span>.");
        }
        function grpbtnLoad(e) {
            jQuery.addEventLog("Group Button has been <span class='eventTitle'>created</span>.");
        }
        function tglebtnClick(e) {
            jQuery.addEventLog("ToggleButton has been <span class='eventTitle'>clicked</span>.");
        }
        function tglebtnChange(e) {
            jQuery.addEventLog("ToggleButton value has been <span class='eventTitle'>changed</span> to " + e.isChecked + ".");
        }
        function spltbtnLoad(e) {
            jQuery.addEventLog("SplitButton has been <span class='eventTitle'>created</span>.");
        }
        function spltbtnClick(e) {
            jQuery.addEventLog("SplitButton has been <span class='eventTitle'>clicked</span>.");
        }
        function spltbtnOpened(e) {
            jQuery.addEventLog("SplitButton popup has been <span class='eventTitle'>opened</span>.");
        }
        function onFocusIn(e) {
            jQuery.addEventLog("SplitButton popup has been <span class='eventTitle'>BeforeOpened</span>. ");
        }
        function spltbtnClosed(e) {
            jQuery.addEventLog("SplitButton popup has been <span class='eventTitle'>Closed</span>.");
        }
        function spltbtnitmHover(e) {
            jQuery.addEventLog("SplitButton item <span class='eventTitle'>hovered-in</span>.");
        }
        function spltbtnitmOut(e) {
            jQuery.addEventLog("SplitButton item <span class='eventTitle'>hovered-out</span>.");
        }
        function spltbtnitmSelected(e) {
            jQuery.addEventLog(e.text + " item has been <span class='eventTitle'>selected</span>.");
        }
        function grpbtnBeforeSelect(args) {
            jQuery.addEventLog("Group Button <span class='eventTitle'>BeforeActive</span> event is fired for Index " + args.index + ".");
        }
        function grpbtnSelect(args) {
            jQuery.addEventLog("Group Button <span class='eventTitle'>Active</span> event is fired for Index " + args.index + ".");
        }
        function grpbtnKeyPress(args) {
            jQuery.addEventLog("Group Button <span class='eventTitle'>Focus</span> Changed to the index " + args.index + ".");
        }
        function onClear() {
            jQuery.clearEventLog();
        }

        function evtpropscheckedevent(args) {
            btnObj = $("#<%=ButtonNormal.ClientID%>").data("ejButton");
            tglbtnObj = $("#<%=ToggleButton.ClientID%>").data("ejToggleButton");
            spltbtnObj = $("#<%=SplitButton.ClientID%>").data("ejSplitButton");
            grpbtnObj = $("#<%=GroupButton.ClientID%>").data("ejGroupButton");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create":
                        btnObj.option(args.selectedValue, "btnLoad");
                        tglbtnObj.option(args.selectedValue, "tglebtnLoad");
                        spltbtnObj.option(args.selectedValue, "spltbtnLoad");
                        grpbtnObj.option(args.selectedValue, "grpbtnLoad");
                        break;
                    case "click":
                        btnObj.option(args.selectedValue, "btnClick");
                        tglbtnObj.option(args.selectedValue, "tglebtnClick");
                        spltbtnObj.option(args.selectedValue, "spltbtnClick");
                        break;
                    case "beforeOpen": spltbtnObj.option(args.selectedValue, "onFocusIn"); break;
                    case "open": spltbtnObj.option(args.selectedValue, "spltbtnOpened"); break;
                    case "change": tglbtnObj.option(args.selectedValue, "tglebtnChange"); break;
                    case "itemMouseOver": spltbtnObj.option(args.selectedValue, "spltbtnitmHover"); break;
                    case "itemMouseOut": spltbtnObj.option(args.selectedValue, "spltbtnitmOut"); break;
                    case "itemSelected": spltbtnObj.option(args.selectedValue, "spltbtnitmSelected"); break;
                    case "close": spltbtnObj.option(args.value, "spltbtnClosed"); break;
                    case "select": grpbtnObj.option(args.selectedValue, "grpbtnSelect"); break;
                    case "beforeSelect": grpbtnObj.option(args.selectedValue, "grpbtnBeforeSelect"); break;
                    case "keyPress": grpbtnObj.option(args.selectedValue, "grpbtnKeyPress"); break;
                }
            }
            else {
                btnObj.option(args.selectedValue, null);
                tglbtnObj.option(args.selectedValue, null);
                spltbtnObj.option(args.selectedValue, null);
                grpbtnObj.option(args.selectedValue, null);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 50%;
        }
    </style>
</asp:Content>

