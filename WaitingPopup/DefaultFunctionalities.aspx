<%@ Page Language="C#" Title="WaitingPopup-Default Functionalities-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates displaying a popup over a target area using ASP.NET Web Forms WaitingPopup." Inherits="WebSampleBrowser.WaitingPopup.DefaultFunctionalities" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NET WaitingPopup control is a visual element that provides support for displaying a pop-up indicator over a 
            target area and to prevent the end user’s interaction with the target area while loading.
        </p>
    </div>
</asp:Content>
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

