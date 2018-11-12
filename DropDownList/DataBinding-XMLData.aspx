<%@ Page Title="DropDownList / DataBinding / XML Data" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-XMLData.aspx.cs" Inherits="WebSampleBrowser.DropDownList.DataBinding_XMLData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="DrpDwnxml" DataMember="RootItem" DataTextField="Text" DataValueField="Text" runat="server" DataSourceID="XmlDataSource1" WatermarkText="Select a Product" Width="100%">
            </ej:DropDownList>
        </div>
    </div>

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/XMLData.xml"></asp:XmlDataSource>
</asp:Content>
