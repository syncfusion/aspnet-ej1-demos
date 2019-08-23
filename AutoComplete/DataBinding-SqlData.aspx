<%@ Page Title="Bind SQL Data to ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates how to bind a SQL database key value mapping to the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-SqlData.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.DataBinding_SqlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="Menusql" runat="server" Width="100%"
                DataTextField="MenuText" DataUniqueKeyField="ID"
                DataSourceID="SqlDataSource1" WatermarkText="Search a transport">
            </ej:Autocomplete>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Transport]"
        ConnectionString='<%$ ConnectionStrings:Linq_To_SQLConnectionString %>'
        ProviderName='<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>'></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>





