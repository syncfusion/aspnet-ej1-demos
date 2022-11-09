<%@ Page Title="Enable autofill text in ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates how to fill the Syncfusion ASP.NET Web Forms Autocomplete with the first matching item in the suggestion list." Language="C#" AutoEventWireup="true" CodeBehind="AutoFill.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.AutoComplete.AutoFill" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectFlower" runat="server" Width="100%" EnableAutoFill="true" WatermarkText="Select a flower"></ej:Autocomplete>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


