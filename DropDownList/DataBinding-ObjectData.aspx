<%@ Page Title="DropDownList / DataBinding / Object Data" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-ObjectData.aspx.cs" Inherits="WebSampleBrowser.DropDownList.DataBinding_ObjectData" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="Transportlist" runat="server"
                DataSourceID="ObjectDataSource1"
                DataTextField="Text" DataValueField="ID" WatermarkText="Select a Transport" Width="100%">
            </ej:DropDownList>
        </div>
    </div>

    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="TabData"
        SelectMethod="GetTabItems"></asp:ObjectDataSource>
</asp:Content>

