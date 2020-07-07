<%@ Page Title="ComboBox-Remote Data-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Databinding-Remote.aspx.cs" MetaDescription="This demo explains how to bind the remote data as datasource to the Syncfusion ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.Databinding_Remote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="searchCustomer" runat="server" Width="100%" DataTextField="ContactName" Placeholder="Search a customer">
                <DataManager URL="//js.syncfusion.com/ejServices/wcf/NorthWind.svc/" CrossDomain="true"></DataManager>
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

