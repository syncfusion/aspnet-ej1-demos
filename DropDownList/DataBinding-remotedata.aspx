<%@ Page Title="DropDownList / DataBinding / Remote Data" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataBinding-remotedata.aspx.cs" Inherits="WebSampleBrowser.DropDownList.DataBinding_remotedata" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="customerList" runat="server" DataTextField="CustomerID" WatermarkText="Select a customer" Width="100%">
        <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true"  />
            </ej:DropDownList>
        </div>
    </div>

</asp:Content>

