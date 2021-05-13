<%@ Page Title="DateTimePicker-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms DateTimePicker" Inherits="WebSampleBrowser.DateTimePicker.rtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadSection" runat="server">
    <style type="text/css">
           .frame {
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateTimePicker ID="dateTime" EnableRTL="true" Width="100%" runat="server"></ej:DateTimePicker>
        </div>
    </div>
</asp:Content>


