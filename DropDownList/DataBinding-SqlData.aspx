<%@ Page Title="DropDownList-SQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-SqlData.aspx.cs" MetaDescription="This demo explains how to bind the SQl data as datasource to the Syncfusion ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.DataBinding_SqlData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="DrpDwnsql" runat="server" DataTextField="text" DataValueField="id" DataSourceID="SqlDataSource1" WatermarkText="Select a Transport" Width="100%">
            </ej:DropDownList>
        </div>
    </div>


    <asp:SqlDataSource ID="SqlDataSource1" runat="server" SelectCommand="SELECT * FROM [Vehicle]"
        ConnectionString='<%$ ConnectionStrings:Linq_To_SQLConnectionString %>'
        ProviderName='<%$ ConnectionStrings:Linq_To_SQLConnectionString.ProviderName %>'></asp:SqlDataSource>
</asp:Content>


