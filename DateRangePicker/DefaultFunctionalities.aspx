<%@ Page Title="daterangepicker-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#"  MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs"  MetaDescription="This example demonstrates a simple, mobile-friendly and responsive ASP.NET Web Forms DateRangePicker to select a range of dates (startDate and endDate)." Inherits="WebSampleBrowser.DateRangePicker._default" %>

<asp:Content ID="Content6" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
  <ej:DateRangePicker ID="dateRange" runat="server" Width="100%" Value="1/1/2018-2/10/2018"></ej:DateRangePicker>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            width: 100%;
        }

        .frame{
            width: 50%;
            margin:0 auto;
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

