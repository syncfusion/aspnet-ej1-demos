<%@ Page Title="ASP.NET AutoComplete Default Functionalities | Syncfusion" MetaDescription="This example demonstrates how to create a Syncfusion ASP.NET Web Forms Autocomplete component and display a suggestion list when text is entered." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.DefaultFunctionalities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectCar" runat="server" Width="100%" WatermarkText="Select a car"></ej:Autocomplete>
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


