<%@ Page Title="Right to left support in ASP.NET Autocomplete | Syncfusion" MetaDescription="This example demonstrates how the suggestion list content is displayed from right to left in the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.RTL" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectCar" runat="server" Width="100%" EnableRTL="true" WatermarkText="Select a car"></ej:Autocomplete>
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


