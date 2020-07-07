<%@ Page Title="DropDownList / DataBinding / LocalData" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-locatdata.aspx.cs" MetaDescription="This demo explains how to bind the local data as a datasource to the Syncfusion ASP.NET Web Forms DropDownList contol." Inherits="WebSampleBrowser.DropDownList.DataBinding_locatdata" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="bikelist" runat="server" DataSourceID="ObjectDataSource1" DataTextField="Text" DataValueField="ID" ItemsCount="5" Width="100%" WatermarkText="Select a bike"></ej:DropDownList>
            <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TabData" SelectMethod="GetTabItems"></asp:ObjectDataSource>
        </div>
    </div>
</asp:Content>

