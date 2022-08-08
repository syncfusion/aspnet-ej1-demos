<%@ Page Language="C#" Title="TagCloud-Data Binding - Remote-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-Remote.aspx.cs" Inherits="WebSampleBrowser.TagCloud.DataBinding_Remote" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 350px;">
    <ej:TagCloud ID="TagCloud1" Title="Employee List" runat="server">
         <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true"  />
    </ej:TagCloud>
</div>
</asp:Content>



