<%@ Page Title="DropDownList / Multi-Select" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultiSelect.aspx.cs" Inherits="WebSampleBrowser.DropDownList.MultiSelect" %>

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
