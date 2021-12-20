<%@ Page Title="daterangepicker-DateTimeRange-ASP.NET-SYNCFUSION" Language="C#"  MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true"
    CodeBehind="DateTimeRange.aspx.cs"  MetaDescription="This example demonstrates how to enable the time options in a ASP.NET Web Forms DatePicker" Inherits="WebSampleBrowser.DateRangePicker.DateTimeRange" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
         <ej:DateRangePicker ID="dateRange" Width="100%" EnableTimePicker="true" runat="server"></ej:DateRangePicker>
        </div>
    </div>
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

