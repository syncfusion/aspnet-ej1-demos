<%@ Page Title="Toolbar-SQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBind-SqlData.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DataBind_SqlData" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="edittoolsv" runat="server" Orientation="Horizontal" DataIdField="id" DataSpriteCssClassField="iconCss" DataTooltipTextField="ToolTip"
                DataSourceID="SqlDataSource1">
            </ej:Toolbar>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Toolbar]" ConnectionString="<%$ ConnectionStrings:Linq_To_SQLConnectionString %>" ProviderName="<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>"></asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/rtl.css" rel="stylesheet" />
</asp:Content>


