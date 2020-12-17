<%@ Page Title="TreeView-Remote Data-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"
    CodeBehind="Databinding-remote.aspx.cs" MetaDescription="This demo explains how to bind the remote data as datasource to the Syncfusion ASP.NET Web Forms Treeview control." Inherits="WebSampleBrowser.TreeView.Databinding_remote" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NET Web TreeView component provides all the functionalities that is available in EJ TreeView, since it is a server side wrapper of EJ TreeView widget. 
            It represents hierarchical data in a tree-like structure and allows to edit, drag n drop, selection with checkboxes and more. TreeView can be generated from the specified item list, list of objects or using OData services.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width: 300px">
        <ej:TreeView runat="server" ID="tree" DataIdField="CategoryID" DataTextField="CategoryName" Query="ej.Query().from('Categories').select('CategoryID,CategoryName').take(3)">
            <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true" />
            <Child TableName="Products" ParentId="CategoryID" Text="ProductName">
                <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true" />
            </Child>
        </ej:TreeView>
    </div>
</asp:Content>

