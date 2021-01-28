<%@ Page Language="C#" Title="Menu-XML Data-ASP.NET-SYNCFUSION" AutoEventWireup="true" CodeBehind="DataBinding-XML.aspx.cs" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates how to bind the XML type data to Syncfusion ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.DataBinding_XML" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 427px;">
    <ej:Menu ID="TreeXmlDSr" runat="server" DataSourceID="XmlDataSource1" DataTextField="Item" DataParentIdField="RootItem"></ej:Menu>
        </div>
    <div>
        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~\App_Data\XMLData.xml"></asp:XmlDataSource>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">

    <style type="text/css">
        .office-365 .controlframe{
            width: 460px !important;
        }
    </style>
</asp:Content>

