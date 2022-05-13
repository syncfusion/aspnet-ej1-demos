<%@ Page Title="Dialog-API's-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to open or close, minimize or maximize, and collapse or expand the Syncfusion ASP.NET Web Forms Dialog component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs" Inherits="WebSampleBrowser.Dialog.API" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
            <ej:Dialog ID="dialogAPI" IsResponsive="True" ClientSideOnOpen="enableBtn" ClientSideOnClose="onDialogClose" Containment=".control" Title="Northwind" runat="server" Width="550">
            <DialogContent>
                <div class="cnt">

                   <p> Northwind is a privately held company that develops property management systems, as well as GDS/web based booking solutions for the hospitality industry.
                     Maestro Enterprise Suite,<span> the company's flagship product, includes a variety of modules</span> which can be coordinated to comply with a hotel or hotel chain's requirements.
                    </p>
                    <p> Maestro is a multi-platform system,<span> with over 10,000 users, allowing for optimized adaptibility </span> to single or multi-property businesses. </p>
                   <p> Northwind's headquarters are based in Markham, Ontario, with sales and support offices located worldwide.</p>
                    <p>
                      The Maestro Enterprise Suite is a sophisticated property management system used by single and multi-property hotel groups to share information between all branches of an operation, allowing for total network control.
                    </p>
                   
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="btnDialogOpen" Type="Button" CssClass="e-btn" Text="Open" Width="107px" ClientSideOnClick="onOpen" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="btnDialogClose" Type="Button" CssClass="e-btn" Text="Close" Width="107px" ClientSideOnClick="onClose" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="btnDialogMinimize" runat="server" ClientSideOnChange="onMinimize" DefaultText="Minimize" ActiveText="Restore" Width="107px"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="btnDialogMaximize" runat="server" ClientSideOnChange="onMaximize" DefaultText="Maximize" ActiveText="Restore" Width="107px"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="btnDialogCollapse" runat="server" ClientSideOnChange="onCollapse" DefaultText="Collapse" ActiveText="Expand" Width="107px"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dialog/API.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        .control {
            height: 450px;
        }
         .htmljssamplebrowser.material  .control {
            height: 600px;
        }

        .cols-sample-area {
            position: relative;
        }

        #sampleProperties {
            height: 450px;
        }

        .cnt {
            text-align: justify;
        }

            .cnt span {
                font-weight: 600;
            }
    </style>
</asp:Content>

