<%@ Page Language="C#" Title="DropDownList-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like created, select, change and popup resize events etc in a ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="selectCompany" DataTextField="CompanyName" DataValueField="ContactName" runat="server" Width="230" ShowCheckbox="true" EnableFilterSearch="true" EnablePopupResize="true" ClientSideOnCreate="drpcreate" ClientSideOnBeforePopupShown="drpbeforepopupshow" ClientSideOnSelect="drpselectchange" ClientSideOnChange="drpvaluechange" ClientSideOnPopupShown="drppopupshow"
           ClientSideOnPopupHide="drppopuphide" ClientSideOnActionComplete="drpactionComplete" ActionFailure="drpactionFailure" ActionSuccess="drpactionSuccess"  ClientSideOnDataBound="drpdataBound" ClientSideOnPopupResizeStart="drppopupResizeStart" ClientSideOnPopupResize="drppopupResize" ClientSideOnPopupResizeStop="drppopupResizeStop" ClientSideOnCascade="drpcascade" ClientSideOnSearch="drpsearch" WatermarkText="Select a company"> 
            <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Customers" CrossDomain="true"  />
            </ej:DropDownList>
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
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="beforePopupShown" Text="beforePopupShown"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="popupHide" Text="popupHide"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="popupShown" Text="popupShown"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="select" Text="select"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="Change"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="search" Text="Search"></ej:DropDownListItem>                            
                            <ej:DropDownListItem Value="actionComplete" Text="ActionComplete"></ej:DropDownListItem> 
                            <ej:DropDownListItem Value="actionFailure" Text="ActionFailure"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="actionSuccess" Text="ActionSuccess"></ej:DropDownListItem>                            
                            <ej:DropDownListItem Value="dataBound" Text="DataBound"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="popupResizeStart" Text="PopupResizeStart"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="popupResize" Text="PopupResize"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="popupResizeStop" Text="PopupResizeStop"></ej:DropDownListItem>
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

        function drpcreate(sender) {
            jQuery.addEventLog("Dropdown control has been <span class='eventTitle'>created</span>.<br/>");
        }
        function drppopuphide(sender) {
            jQuery.addEventLog("Dropdown popup is <span class='eventTitle'>closed</span>.<br/>");
        }
        function drppopupshow(sender) {
            jQuery.addEventLog("Dropdown popup is <span class='eventTitle'>opened</span>.<br/>");
        }
        function drpbeforepopupshow(sender) {
            jQuery.addEventLog("<span class='eventTitle'>BeforePopupShow</span> event is triggered.<br/>");
        }
        function drpvaluechange(sender) {
            jQuery.addEventLog("<span class='eventTitle'>Value has changed</span> to " + sender.value + ".<br/>");
        }
        function drpselectchange(sender) {
            jQuery.addEventLog(sender.text + " is <span class='eventTitle'>selected</span>.<br/>");
        }
        function drpsearch(sender) {
            jQuery.addEventLog(sender.searchString + " is <span class='eventTitle'>searched</span>.<br/>");
        }
        function drpdataBound(sender) {
            jQuery.addEventLog("The data value is <span class='eventTitle'>Bounded</span>.<br/>");
        }
        function drppopupResizeStart(sender) {
            jQuery.addEventLog("Dropdown control popup<span class='eventTitle'>Resizing has started</span>.<br/>");
        }
        function drppopupResize(sender) {
            jQuery.addEventLog("Dropdown control Popup <span class='eventTitle'>is Resizing</span>.<br/>");
        }
        function drppopupResizeStop(sender) {
            jQuery.addEventLog("Dropdown control popup <span class='eventTitle'>Resizing has stopped</span>.<br/>");
        }
        function drpactionComplete(sender) {
            jQuery.addEventLog("The data fetching action is <span class='eventTitle'>Complete</span>.<br/>");
        }
        function drpactionFailure(sender) {
            jQuery.addEventLog("The data fetching action is <span class='eventTitle'>Failure</span>.<br/>");
        }
        function drpactionSuccess(sender) {
            jQuery.addEventLog("The data fetching action is <span class='eventTitle'>Success</span>.<br/>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }

        function evtpropscheckedevent(args) {
            var target = $("#<%=selectCompany.ClientID%>").data("ejDropDownList");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create":
                        target.option(args.selectedValue, "drpcreate");
                        break;
                    case "popupHide":
                        target.option(args.selectedValue, "drppopuphide");
                        break;
                    case "change": target.option(args.selectedValue, "drpvaluechange"); break;
                    case "select": target.option(args.selectedValue, "drpselectchange"); break;
                    case "popupShown": target.option(args.selectedValue, "drppopupshow"); break;
                    case "beforePopupShown": target.option(args.selectedValue, "drpbeforepopupshow"); break;
                    case "search": target.option(args.selectedValue, "drpsearch"); break;
                    case "dataBound": target.option(args.selectedValue, "drpdataBound"); break;
                    case "actionComplete": target.option(args.selectedValue, "drpactionComplete"); break;
                    case "actionFailure": target.option(args.selectedValue, "drpactionFailure"); break;
                    case "actionSuccess": target.option(args.selectedValue, "drpactionSuccess"); break;
                    case "popupResizeStart": target.option(args.selectedValue, "drppopupResizeStart"); break;
                    case "popupResize": target.option(args.selectedValue, "drppopupResize"); break;
                    case "popupResizeStop": target.option(args.selectedValue, "drppopupResizeStop"); break;
                }
            }
            else {
                target.option(args.selectedValue, null);
            }
        }
    </script>
<style>

.material #LayoutSection_EventSection_selectControls_wrapper.e-ddl {
    width: 35px !important;
}
.material .heading .pull-right{
	padding-right: 7px;
}
.material #LayoutSection_EventSection_selectControls_wrapper.e-popactive #LayoutSection_EventSection_selectControls_dropdown {
    display:none;
}
</style>
</asp:Content>


