<%@ Page Title="Toolbar-LinqToSQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-LinqToSql.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DataBinding_Linq_To_Sql" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="edittoolsv" runat="server" Orientation="Horizontal" DataTextField="Text" DataIdField="Id" DataSpriteCssClassField="iconCss" DataTooltipTextField="ToolTip"
                DataSourceID="LinqDataSource1">
            </ej:Toolbar>
            <asp:LinqDataSource ID="LinqDataSource1" runat="server" ContextTypeName="WebSampleBrowser.database.Linq_Common_DataDataContext" EntityTypeName="" TableName="ToolBarItems"></asp:LinqDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/rtl.css" rel="stylesheet" />
</asp:Content>


