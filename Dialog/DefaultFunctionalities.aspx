<%@ Page Title="Dialog-DefaultFunctionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to create a Syncfusion ASP.NET Web Forms Dialog component with a message to be displayed." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.DialogSample.DefaultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Button ID="btnOpen" Type="Button" CssClass="e-btn" Text="Click to open dialog" ClientSideOnClick="btnclick" runat="server"></ej:Button>
        <ej:Dialog ID="basicDialog" IsResponsive="True" Width="550" MinWidth="310px" MinHeight="215px" ClientSideOnClose="onDialogClose" Containment=".control" runat="server" Title="Audi Q3 Drive">
            <DialogContent>
                <h1>Audi Q3</h1>
                <div class="audi-q3">
                    <img src="../Content/images/dialog/audiq3-1.png" class="img" alt="audiq3-1"/>
                    <br />
                    <img src="../Content/images/dialog/audiq3-2.png" alt="audiq3-2"/>
                </div>
                <div class="cnt">
                    It is a concept vehicle with Liquid Silver body colour, 20-inch wheels, fabric folding roof, electrically-controlled hood, 4-cylinder 2.0 TDI engine rated 204 PS (150 kW; 201 hp) 
                                and 400 N·m (295.02 lbf·ft), diesel particulate filter and Bluetec emission control system, quattro permanent four-wheel drive system with Haldex clutch, 
                                Audi S tronic dual-clutch gearbox, McPherson-strut front axle and a four-link rear axle, Audi drive select system with 3 modes (dynamic, sport, efficiency), 
                                MMI control panel with touch pad and dual-view technology, sound system with the prominent extending tweeters.
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dialog/DefaultFunctionalities.js")%>' type="text/javascript"></script>
    <script>
        $(".e-lv").addClass("e-navigation");
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .audi-q3 {
            float: right;
            height: 356px;
            width: 267px;
            margin-left: 10px;
        }

        .control {
                height: 600px;
                position: relative;
            }
            .htmljssamplebrowser.material .control {
                height: 700px;
            }
            
            h1 {
                margin: 0 0 10px 0;
            }
            
            .img {
                margin-bottom: 10px;
            }
            
            #LayoutSection_maincontrolarea {
                padding: 0;
            }
            
            .htmljssamplebrowser:not(.material):not(.office-365) #LayoutSection_ControlsSection_basicDialog {
                padding: 15px;
            }

        .cnt {
            min-height: 356px;
            text-align: justify;
        }
    </style>

</asp:Content>

