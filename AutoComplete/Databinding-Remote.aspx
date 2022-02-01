<%@ Page Title="Binding ASP.NET AutoComplete to remote  data source" MetaDescription="This example demonstrates how to bind remote data in the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Databinding-Remote.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.Databinding_Remote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="searchCustomer" runat="server" Width="100%" DataTextField="ContactName" WatermarkText="Search a customer">
                <DataManager URL="//js.syncfusion.com/ejServices/wcf/NorthWind.svc/" CrossDomain="true"></DataManager>
            </ej:Autocomplete>
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

