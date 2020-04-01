<%@ Page Language="C#" Title="TagCloud-Default Functionalities-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.TagCloud.DefaultFunctionalities" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 350px;">
    <ej:TagCloud ID="techWebList" Title="Tech Sites" runat="server" 
        DataSourceID="ObjectDataSource1" DataTextField="text" DataUrlField="url" DataFrequencyField="frequency"></ej:TagCloud>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TagCloudData"
        SelectMethod="GetTagCloudItems"></asp:ObjectDataSource>
        </div>

  <style type="text/css">
        .material #LayoutSection_ControlsSection_techWebList { 
            width: 360px; 
        }
    </style>
</asp:Content>



