<%@ Page Title="Using Templates to customize ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates the template support in the Syncfusion ASP.NET Web Forms Autocomplete component for customizing the suggestion list." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Template.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.Template" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectCountry" runat="server" Width="100%" Template="<div class='flag ${key}'> </div> <div class='txt'>${text}</div>" WatermarkText="Select a country"></ej:Autocomplete>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/AutoComplete/Template.css")%>" rel="stylesheet" />
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>

