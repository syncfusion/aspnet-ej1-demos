<%@ Page Title="DatePicker-Date Range-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Date-Range.aspx.cs" MetaDescription="This example demonstrates how to disables the specific range of dates (min and max) in a ASP.NET Web Forms DatePicker." Inherits="WebSampleBrowser.DatePicker.date_range" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <span class="acc">
            <input type="text" id="autocomplete1" />
        </span><span class="firstdp"><span class="innerdp">
            <ej:DatePicker ID="daterange1" runat="server" ClientSideOnClose="selectedDate1" Width="80%" DateFormat="MM/dd/yyyy"></ej:DatePicker>
        </span></span><span class="seconddp"><span class="innerdp">
            <ej:DatePicker ID="daterange2" runat="server" ClientSideOnClose="selectedDate2" Width="80%" DateFormat="MM/dd/yyyy"></ej:DatePicker>
        </span></span>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var maxDatepicker = $("<%=daterange1.ClientID%>").data("ejDatePicker");
        var minDatepicker = $("<%=daterange2.ClientID%>").data("ejDatePicker");
        function selectedDate1(sender) {
            $(function () {
                maxDatepicker = $("#<%=daterange2.ClientID%>").data("ejDatePicker");
                minDatepicker1 = $("#<%=daterange1.ClientID%>").data("ejDatePicker");
                maxDatepicker.setModel({ "minDate": new Date(sender.value) });
                var curDate = new Date(sender.value);
                maxDatepicker.setModel({ value: new Date(curDate.getFullYear(), curDate.getMonth(), curDate.getDate() + 7) });
            });

        }
        function selectedDate2(sender) {
            $(function () {
                minDatepicker = $("#<%=daterange1.ClientID%>").data("ejDatePicker");
                minDatepicker.setModel({ "maxDate": new Date(sender.value) });
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .darktheme .frame, .frame {
            background: url("../Content/images/datepicker/daterange-bg.png") no-repeat scroll 0 0 transparent;
            padding: 109px 0;
            padding: 0;
            width: 600px;
            min-height: 300px;
            border: 0;
            height: 470px;
        }

        .acc {
            display: block;
            margin-bottom: 70px;
            margin-left: 275px;
            padding-top: 80px;
        }

        .firstdp {
            margin-left: 67px;
        }

        .seconddp {
            margin-left: 55px;
        }

        .innerdp {
            display: inline-block;
        }
    </style>
</asp:Content>


