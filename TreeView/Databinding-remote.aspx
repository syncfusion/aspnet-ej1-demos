<%@ Page Title="TreeView-Remote Data-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"
    CodeBehind="Databinding-remote.aspx.cs" Inherits="WebSampleBrowser.TreeView.Databinding_remote" %>

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

