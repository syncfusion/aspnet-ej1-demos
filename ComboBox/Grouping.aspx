<%@ Page Title="ComboBox-Grouping-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Grouping.aspx.cs" MetaDescription="This example demonstrates how to group drop down items based on categories in ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.Grouping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="groupingCountry" runat="server" DataTextField="text" DataGroupByField="category" Placeholder="Select a country" Width="100%"></ej:ComboBox>
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


