<%@ Page Title="DropDownList-Remote Data-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-remotedata.aspx.cs" MetaDescription="This demo explains how to bind the remote data as datasource to the Syncfusion ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.DataBinding_remotedata" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NETDropDownList control displays a single column list of items which enables you to select single or multiple items from the list. 
            By default, there will be no selection made in the control and the user have to navigate through the items using mouse or keyboard actions to select an item.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="customerList" runat="server" DataTextField="CustomerID" WatermarkText="Select a customer" Width="100%">
        <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true"  />
            </ej:DropDownList>
        </div>
    </div>

</asp:Content>


