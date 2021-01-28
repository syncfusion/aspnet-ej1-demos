<%@ Page Title="Dialog-Action Buttons-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates the close, maximize, minimize, pin, unpin, collapse, and expand behaviors in the Syncfusion ASP.NET Web Forms Dialog component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomAction.aspx.cs" Inherits="WebSampleBrowser.Dialog.CustomAction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Button ID="btnOpen" Type="Button" ClientSideOnClick="btnclick" CssClass="e-btn" Text="Click to open dialog" runat="server"></ej:Button>
        <ej:Dialog ID="dialogIcon" ClientSideOnClose="onDialogClose" IsResponsive="True" EnableResize="false" Width="305" Containment=".control" Title="Audi-R8" runat="server">
            <DialogContent>
                <img src="../Content/images/dialog/r8-coupe.png" alt="Coupe"/>
                <div class="cnt">
                    The Audi R8 was initially equipped with a 4.2 litre V8 engine. Specifically, it is an all-aluminum alloy 32-valve (four valves per cylinder) petrol engine, utilising Fuel Stratified Injection (FSI), and has a displacement of 4,163 cubic centimetres (254.0 cu in).              
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dialog/CustomAction.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        .control {
            height: 500px;
            position: relative;
        }

        .htmljssamplebrowser.material .control {
            height: 600px;
        }

        .cnt {
            text-align: justify;
            padding-top: 5px;
        }
        .htmljssamplebrowser.material #LayoutSection_ControlsSection_dialogIcon img {
            width: 100%;
            overflow: hidden;
            position: relative;
        }
        .htmljssamplebrowser.office-365 img {
            width: 255px;
        }
    </style>
</asp:Content>

