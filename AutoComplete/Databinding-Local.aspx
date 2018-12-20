<%@ Page Title="Binding ASP.NET AutoComplete to local data source" MetaDescription="This example demonstrates how to bind local data to the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Databinding-Local.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.Databinding_Local" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectState" runat="server" Width="100%" DataTextField="countryName" DataUniqueKeyField="index" WatermarkText="Select a state">
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


