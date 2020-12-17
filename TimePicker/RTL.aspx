<%@ Page Title="TimePicker-RTL-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms TimePicker"  Inherits="WebSampleBrowser.TimePicker.rtl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            width: 210px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:TimePicker ID="time" EnableRTL="true" Width="100%" runat="server"></ej:TimePicker>
        </div>
    </div>
</asp:Content>


