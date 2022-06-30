<%@ Page Title="DropDownList-Multi-Select-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultiSelect.aspx.cs" MetaDescription="This sample demonstrates multiple items selection with ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.MultiSelect" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="skillsets" runat="server" DataTextField="Skills" ShowCheckbox="true" WatermarkText="Select a skill" Width="100%" MultiSelectMode="VisualMode"></ej:DropDownList>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .ctrllabel {
            padding-top: 15px;
        }
    </style>
</asp:Content>

