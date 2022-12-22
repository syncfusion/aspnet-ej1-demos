<%@ Page Title="ComboBox-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This demo explains how to initilalize a simple Syncfusion ASP.NET Web Forms ComboBox control." Inherits="WebSampleBrowser.ComboBox.DefultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:ComboBox ID="selectCar" runat="server" Placeholder="Select a car" DataTextField="text" Width="100%">
            </ej:ComboBox>
        </div>
    </div>

</asp:Content>


