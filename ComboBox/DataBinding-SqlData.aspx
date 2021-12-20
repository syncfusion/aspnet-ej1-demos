<%@ Page Title="ComboBox-SQL Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-SqlData.aspx.cs" MetaDescription="This demo explains how to bind the SQl data as datasource to the Syncfusion ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.DataBinding_SqlData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="Menusql" runat="server" Width="100%"
                DataTextField="MenuText" DataValueField="ID"
                DataSourceID="SqlDataSource1" Placeholder="Search a transport">
            </ej:ComboBox>
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





