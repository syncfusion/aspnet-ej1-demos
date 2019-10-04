<%@ Page Title="daterangepicker-Events-ASP.NET-SYNCFUSION" Language="C#"  MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true"
    CodeBehind="Events.aspx.cs"  MetaDescription="This example demonstrates the various events like create, change, open and close in a ASP.NET Web Forms DateRangePicker" Inherits="WebSampleBrowser.DateRangePicker.Events1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
 <asp:UpdatePanel ID="Update" UpdateMode="Always" runat="server">
   <ContentTemplate>
    <div class="frame">
        <div class="control">
           <ej:DateRangePicker ID="dateRange" Width="100%" ClientSideOnClick="onClick" ClientSideOnSelect="onSelected" ClientSideOnCreate="onCreate" ClientSideOnClose="onClose" ClientSideOnOpen="onOpen" runat="server" ></ej:DateRangePicker>
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
 </asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
  <script type="text/javascript">
        function evtpropscheckedevent(args) {
            var dateRangeObj = $("#dateRange").data("ejDateRangePicker");
            if (args.isChecked) {
                switch (args.selectedText) {
                    case "create": dateRangeObj.option(args.selectedText, "onCreate"); break;
                    case "change": dateRangeObj.option(args.selectedText, "onSelected"); break;
                    case "open": dateRangeObj.option(args.selectedText, "onOpen"); break;
                    case "close": dateRangeObj.option(args.selectedText, "onClose"); break;
                    case "click": dateRangeObj.option(args.selectedText, "onClick"); break;
                   
                }
            }
            else dateRangeObj.option(args.selectedText, null);
        }
        // Client side Events
        function onCreate(args) {
            jQuery.addEventLog("DateRangePicker has been <span class='eventTitle'> created</span>.");
        }
        function onSelected(args) {
            jQuery.addEventLog("DateRangePicker value has been <span class='eventTitle'> changed</span> to " + args.value + ".</br>");
        }
        function onOpen(args) {
            jQuery.addEventLog("DateRangePicker is in <span class='eventTitle'> Opened</span>");
        }
        function onClose(args) {
            jQuery.addEventLog("DateRangePicker is out of <span class='eventTitle'> Closed</span>");
        }
        function onClick(args) {
            jQuery.addEventLog("DateRangePicker Date has been <span class='eventTitle'> Clicked</span>");
        }
        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
         .control {
            width: 100%;
        }
         .frame{
            width: 50%;
        }
        .control .e-daterangewidget {
            width: 225px;
            margin: auto;
        }
          @media (max-width: 979px) and (min-width: 439px) {
            .e-daterangewidget .e-padding {
                padding: 0 24px 0 0;
                margin-right: 30px;
            }
        }
       </style>
</asp:Content>

