<%@ Page Title="ComboBox-Object Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-ObjectData.aspx.cs" MetaDescription="This demo explains how to bind the Object datasource as datasource to the Syncfusion ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.DataBinding_ObjectData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="Auto" runat="server" Width="100%" DataSourceID="ObjectDataSource1"
                DataTextField="Text" DataValueField="ID" Placeholder="Search a transport">
            </ej:ComboBox>
        </div>
    </div>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TabData"
        SelectMethod="GetTabItems"></asp:ObjectDataSource>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


