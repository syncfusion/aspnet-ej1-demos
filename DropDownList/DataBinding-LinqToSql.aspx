<%@ Page Title="DropDownList-LinqToSQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-LinqToSql.aspx.cs" MetaDescription="This example demonstrates how to bind a LINQ to SQL database key value mapping in the Syncfusion ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.DataBinding_Linq_To_Sql" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="DrpDwnsql" runat="server" DataTextField="Text" Width="100%" DataValueField="Id" DataSourceID="LinqDataSource1" WatermarkText="Select an Album">
            </ej:DropDownList>
        </div>
    </div>

    <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="Databindings"></asp:LinqDataSource>
</asp:Content>


