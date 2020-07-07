<%@ Page Title="Bind LinqDataSource to ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates how to bind a LINQ to SQL database key value mapping in the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-LinqToSql.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.DataBinding_Linq_To_Sql" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="AutoLinqtoSql" runat="server" Width="100%" DataTextField="Text" DataSourceID="LinqDataSource1" DataUniqueKeyField="Id" WatermarkText="Select an item" />
        </div>
    </div>
    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="Databindings" Select="new(Id,ParentId,Text)">
    </asp:LinqDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>





