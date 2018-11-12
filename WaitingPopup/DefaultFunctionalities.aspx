<%@ Page Language="C#" Title="WaitingPopup / Default Functionalities" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.WaitingPopup.DefaultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="controlframe" style="position:relative;">
    <ej:WaitingPopup ID="target" runat="server" AppendTo=".controlframe" ShowOnInit="True"></ej:WaitingPopup>
        </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #<%=target.ClientID%> {
            height: 320px;
        }
         
    </style>
</asp:Content>
