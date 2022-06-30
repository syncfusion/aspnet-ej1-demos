<%@ Page Language="C#" Title="TagCloud-RTL-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.TagCloud.RTL" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="width: 350px;">
    <ej:TagCloud ID="tagcloudRTL" Title="مواقع التكنولوجيا" EnableRTL="true"
        DataSourceID="ObjectDataSource1" DataTextField="text" DataUrlField="url" DataFrequencyField="frequency" runat="server"></ej:TagCloud>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TagCloudData"
        SelectMethod="GetRtlTagCloudItems"></asp:ObjectDataSource>
        </div>
</asp:Content>


