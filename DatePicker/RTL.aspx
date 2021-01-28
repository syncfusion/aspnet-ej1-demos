<%@ Page Title="DatePicker-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs"MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms DatePicker" Inherits="WebSampleBrowser.DatePicker.rtl" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DatePicker ID="datepickerRTL" EnableRTL="true" runat="server" Width="100%"></ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
       .frame {
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>


