<%@ Page Title="daterangepicker-API's-ASP.NET-SYNCFUSION" Language="C#"  MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs"  MetaDescription="This example demonstrates the various methods like show, hide, enable, getSelectedRange and disable in a ASP.NET Web Forms DateRangePicker" Inherits="WebSampleBrowser.DateRangePicker.Methods" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
         <ej:DateRangePicker ID="dateRange" Width="100%" runat="server"></ej:DateRangePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="check21" DefaultText="Disable" ActiveText="Enable" Width="107px" ClientSideOnClick="changeState" runat="server"></ej:ToggleButton>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="getrange" Type="Button" Text="Range" Width="107px" runat="server" ClientSideOnClick="getdaterangeclick" />
                </div>
                <div class="col-md-12">
                    <ej:ToggleButton ID="check22" DefaultText="Show" ActiveText="Hide" ClientSideOnClick="changeVisible" Width="107px" runat="server"></ej:ToggleButton>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="clear" Type="Button" Text="Clear" Width="107px" runat="server" ClientSideOnClick="clearrange" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var dateRangeObj, togObj;
        $(function () {
            dateRangeObj = $('#<%=dateRange.ClientID%>').data("ejDateRangePicker");
            togObj = $("#<%=check22.ClientID%>").data('ejToggleButton');

            $("#sampleProperties").ejPropertiesPanel();
        });
        function changeVisible(args) {
            if (args.isChecked)
                dateRangeObj.popupShow();
            else dateRangeObj.popupHide();
        }
        function changeState(args) {
            if (args.isChecked) {
                dateRangeObj.disable();
                togObj.disable();
            }
            else {
                dateRangeObj.enable();
                togObj.enable();
            }
        }
        function getdaterangeclick() {
            alert("StartDate - endDate :" + dateRangeObj.getSelectedRange().startDate+" - "+ dateRangeObj.getSelectedRange().endDate);
        }
        function clearrange() {
            dateRangeObj.clearRanges();
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

