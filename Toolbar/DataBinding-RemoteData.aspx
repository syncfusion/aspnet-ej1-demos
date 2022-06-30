<%@ Page Language="C#" Title="Toolbar-Remote Data-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-RemoteData.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DataBinding_RemoteData" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="toolbarOdata" runat="server" Orientation="Horizontal" DataTextField="CustomerID">
                 <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/" CrossDomain="true"  />
            </ej:Toolbar>

        </div>
    </div>
    <style>
	.material .frame{
		width: 495px;
	}
	</style>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/databinding-remotedata.css" rel="stylesheet" />
</asp:Content>

