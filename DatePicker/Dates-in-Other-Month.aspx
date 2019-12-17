<%@ Page Title="DatePicker-Dates in Other Month-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Dates-in-Other-Month.aspx.cs"MetaDescription="This example demonstrates how to show the other months dates in a ASP.NET Web Forms DatePicker" Inherits="WebSampleBrowser.DatePicker.dates_in_othermonth" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DatePicker runat="server" ID="dateformat" Width="100%"></ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <span>Show Dates In Other Month
                    </span>
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="othermonth" CssClass="e-checkbox" Checked="true" runat="server" ClientSideOnChange="onStateChange"></ej:CheckBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });


        function onStateChange(args) {
            var datebject = $("#<%=dateformat.ClientID%>").data("ejDatePicker");
            if (args.isChecked)
                datebject.setModel({ showOtherMonths: true });
            else {
                datebject.setModel({ showOtherMonths: false });
            }
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .cols-prop-area .content {
            overflow-y: hidden;
        }
   .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


