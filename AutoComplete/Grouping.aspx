<%@ Page Title="Grouping relevant items in ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates grouping items in the Syncfusion ASP.NET Web Forms Autocomplete and providing a header for each set of groups in the suggestion list." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Grouping.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.Grouping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="groupingCountry" runat="server" FilterType="Contains" HighlightSearch="true" DataGroupByField="category" WatermarkText="Select a country" Width="100%" ItemsCount="7"></ej:Autocomplete>
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


