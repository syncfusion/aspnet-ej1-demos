<%@ Page Title="Bind ObjectDataSource to ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates how to bind an object database key value mapping to the Syncfusion ASP.NET Web Forms Autocomplete component."  Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-ObjectData.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.DataBinding_ObjectData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="Auto" runat="server" Width="100%" DataSourceID="ObjectDataSource1"
                DataTextField="Text" DataUniqueKeyField="ID" WatermarkText="Search a transport">
            </ej:Autocomplete>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TabData"
        SelectMethod="GetTabItems"></asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


