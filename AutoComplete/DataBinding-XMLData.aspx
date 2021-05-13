<%@ Page Title="Bind ASP.NET AutoComplete with XML data source | Syncfusion" MetaDescription="This example demonstrates how to bind an XML database key value mapping to the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-XMLData.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.DataBinding_XMLData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="Menuxml" runat="server" Width="100%" DataSourceID="XmlDataSource1" DataTextField="Text" DataMember="RootItem" WatermarkText="Select an apple product">
            </ej:Autocomplete>
        </div>
    </div>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/XMLData.xml"></asp:XmlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>

