<%@ Page Title="DateTimePicker-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates a simple, mobile-friendly and responsive ASP.NET Web Forms DateTimePicker to select both date and time." Inherits="WebSampleBrowser.DateTimePicker._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
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
            <ej:DateTimePicker ID="dateTime" runat="server" Width="100%" Value="05/28/2018 2:47 AM"></ej:DateTimePicker>
        </div>
    </div>
</asp:Content>


