<%@ Page Title="ListBox-Client-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates client-side events when particular operations are performed in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.ListBox.ClientSideEvents" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="listbox" style="display:none">
        <div class="frame">
            <div class="grouplist">
                <div class="ctrllabel">Select a country</div>
                <ej:ListBox ID="selectCountry" runat="server" AllowDragAndDrop="true" ClientSideOnChange="OnselectIndexchange" ClientSideOnCreate="Oncreate" ClientSideOnSelect="Onselected" ClientSideOnItemDrag="OnitemDrag" ClientSideOnItemDragStart="OnitemDragStart" ClientSideOnItemDragStop="OnitemDragStop" ClientSideOnItemDrop="OnitemDropped">
                </ej:ListBox>
            </div>
            <div class="grouplist" style="padding-top: 29px">
                <div class="ctrllabel">Drop here</div>
                <ej:ListBox ID="dragable" runat="server" AllowDragAndDrop="true">
                    <Items>
                        <ej:ListBoxItems Text=""></ej:ListBoxItems>
                    </Items>
                </ej:ListBox>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EventSection" runat="server">
    <%--    <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="select" Text="selected"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="selectedindexchanged"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemDrag" Text="itemDrag"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemDragStart" Text="itemDragStart"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemDragStop" Text="OnItemDragStop"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="itemDrop" Text="OnItemDropped"></ej:DropDownListItem>
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
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        function onShowHide(args) {
            var target = $('#<%=selectCountry.ClientID%>').data("ejListBox");
            if (args.isChecked)
                target.checkboxHideShow(false);
            else
                target.checkboxHideShow(true);
        }
        function Oncreate(args) {
            jQuery.addEventLog(" <span class='eventTitle'>Create</span> has been fired");
            if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=selectCountry.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
            setTimeout(function () {
                $(".listbox").css("display", "block");
            }, 300);
        }
        function OnselectIndexchange(args) {
            jQuery.addEventLog(" <span class='eventTitle'>Change</span> has been fired");

        }
        function Onselected(args) {
            jQuery.addEventLog(" <span class='eventTitle'>Select</span> has been fired");

        }
        function OnitemDragStart(args) {
            jQuery.addEventLog(" <span class='eventTitle'>ItemDragStart</span> has been fired");

        }
        function OnitemDrag(args) {
            jQuery.addEventLog(" <span class='eventTitle'>ItemDrag</span> has been fired");

        }
        function OnitemDragStop(args) {
            jQuery.addEventLog(" <span class='eventTitle'>ItemDragStop</span> has been fired");

        }
        function OnitemDropped(args) {
            jQuery.addEventLog(" <span class='eventTitle'>ItemDrop</span> has been fired");

        }
        function onClear() {
            jQuery.clearEventLog();
        }
        function evtpropscheckedevent(args) {
            var target = $("#<%=selectCountry.ClientID%>").data("ejListBox");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create":
                        target.option(args.selectedValue, "Oncreate");
                        break;
                    case "select":
                        target.option(args.selectedValue, "Onselected");
                        break;
                    case "change": target.option(args.selectedValue, "selectIndexChange"); break;
                    case "itemDragStart": target.option(args.selectedValue, "OnitemDragStart"); break;
                    case "itemDragStop": target.option(args.selectedValue, "OnitemDragStop"); break;
                    case "itemDrag": target.option(args.selectedValue, "OnitemDrag"); break;
                    case "itemDrop": target.option(args.selectedValue, "OnItemDropped"); break;
                }
            }
            else {
                target.option(args.selectedValue, null);
            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .ctrllabel {
            padding-bottom: 12px;
            font-weight: 600;
        }
    </style>
</asp:Content>

