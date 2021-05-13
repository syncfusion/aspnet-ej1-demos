<%@ Page Title="ComboBox-LinqToSQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-LinqToSql.aspx.cs" MetaDescription="This example demonstrates how to bind a LINQ to SQL database key value mapping in the Syncfusion ASP.NET Web Forms ComboBox control."  Inherits="WebSampleBrowser.ComboBox.DataBinding_Linq_To_Sql" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="AutoLinqtoSql" runat="server" Width="100%" DataTextField="Text" DataSourceID="LinqDataSource1" DataValueField="Id" Placeholder="Select an item" />
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





