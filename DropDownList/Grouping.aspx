<%@ Page Title="DropDownList-Grouping-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Grouping.aspx.cs" MetaDescription="This example demonstrates how to group drop down items based on categories in ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.Grouping" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="vegetablelist" runat="server" PopupHeight="200px" WatermarkText="Select a vegetable" Width="100%" DataTextField="Veg" DataGroupByField="Group"  ></ej:DropDownList>
        </div>
    </div>
    
</asp:Content>


