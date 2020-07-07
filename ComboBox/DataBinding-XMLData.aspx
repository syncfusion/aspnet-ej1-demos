<%@ Page Title="ComboBox-XML Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-XMLData.aspx.cs" MetaDescription="This demo explains how to process and bind the XML type data to the Syncfusion ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.DataBinding_XMLData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="Menuxml" runat="server" Width="100%" DataSourceID="XmlDataSource1" DataTextField="Text" DataMember="RootItem" Placeholder="Select an apple product">
            </ej:ComboBox>
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

