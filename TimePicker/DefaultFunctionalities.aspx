<%@ Page Title="TimePicker-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates a simple, mobile-friendly and responsive ASP.NET Web Forms TimepIcker to select a time." Inherits="WebSampleBrowser.TimePicker._default" %>

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
            <ej:TimePicker ID="time" Width="100%" runat="server"></ej:TimePicker>
        </div>
    </div>
</asp:Content>

