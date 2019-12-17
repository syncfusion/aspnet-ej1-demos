<%@ Page Title="Dialog-Keyboard Interaction-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to access the Syncfusion ASP.NET Web Forms Dialog component functionalities using keyboard interactions." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardIntraction.aspx.cs" Inherits="WebSampleBrowser.Dialog.KeyboardIntraction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Button ID="btnOpen" Type="Button" runat="server" ClientSideOnClick="btnclick" CssClass="e-btn" Text="Click to open dialog"></ej:Button>
        <ej:Dialog ID="keyboardDialog" ClientSideOnClose="onDialogClose" Title="Amazon" IsResponsive="True" runat="server" Width="550" Containment=".control">
            <DialogContent>
                <div class="cnt">
                   Amazon.com, Inc., often referred to as simply Amazon, is an American electronic commerce and cloud computing company with headquarters in Seattle, Washington. It is the largest Internet-based retailer in the United States. Amazon.com started as an online bookstore, later diversifying to sell DVDs, Blu-rays, CDs, video downloads/streaming, MP3 downloads/streaming, audiobook downloads/streaming, software, video games, electronics, apparel, furniture, food, toys and jewelry. The company also produces consumer electronics—notably, Amazon Kindle e-book readers, Fire tablets, Fire TV and Fire Phone—and is the world's largest provider of cloud infrastructure services (IaaS). Amazon also sells certain low-end products like USB cables under its in-house brand AmazonBasics.
                    Amazon has separate retail websites for United States, United Kingdom and Ireland, France, Canada, Germany, Italy, Spain, Netherlands, Australia, Brazil, Japan, China, India and Mexico. Amazon also offers international shipping to certain other countries for some of its products.In 2011, it professed an intention to launch its websites in Poland and Sweden.
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid keyboard">
            <div class="row">
                <div class="col-md-2">
                    Alt + j
                </div>
                <div class="col-md-2">
                    Focuses the control.
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    Up
                </div>
                <div class="col-md-2">
                    Dialog move up.
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    Right
                </div>
                <div class="col-md-2">
                    Dialog move right.
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    Down
                </div>
                <div class="col-md-2">
                    Dialog move down.
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    Left
                </div>
                <div class="col-md-2">
                    Dialog move left.
                </div>
            </div>
            <div class="row">
                <div class="col-md-2">
                    Esc
                </div>
                <div class="col-md-2">
                    Dialog window close.
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dialog/KeyboardInteraction.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            height: 450px;
            position: relative;
        }
        .htmljssamplebrowser.material  .control {
            height: 600px;
        }

        #LayoutSection_maincontrolarea {
            padding: 0;
        }

        #sampleProperties {
            height: 450px;
        }

        .cnt {
            text-align: justify;
        }
    </style>

</asp:Content>

