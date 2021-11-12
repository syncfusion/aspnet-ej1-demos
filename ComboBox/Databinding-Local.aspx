<%@ Page Title="ComboBox-Local-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Databinding-Local.aspx.cs" MetaDescription="This demo explains how to bind the local data as a datasource to the Syncfusion ASP.NET Web Forms ComboBox contol." Inherits="WebSampleBrowser.ComboBox.Databinding_Local" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="selectState" runat="server" Width="100%" DataTextField="countryName" DataValueField="index" Placeholder="Select a state">
            </ej:ComboBox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


