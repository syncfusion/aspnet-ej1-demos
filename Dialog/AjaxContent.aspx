<%@ Page Title="Dialog-Ajax Content-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates loading the Syncfusion ASP.NET Web Forms Dialog content from another page’s content using Ajax requests." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AjaxContent.aspx.cs" Inherits="WebSampleBrowser.Dialog.AjaxContent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <asp:UpdatePanel ID="Update" UpdateMode="Always" runat="server">
            <ContentTemplate>
                <ej:Button ID="btnOpen" Type="Button" Text="Click to open dialog" ClientSideOnClick="btnclick" CssClass="e-btn" runat="server"></ej:Button>
                <ej:Dialog IsResponsive="True" ID="dialog" ClientSideOnClose="onDialogClose" ContentUrl="../Dialog/DialogAjaxContent/twitter.html" Containment=".control" Width="550" Height="auto" Title="twitter" ContentType="ajax" runat="server">
                </ej:Dialog>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control {
            height: 700px;
            position: relative;
        }

        #LayoutSection_maincontrolarea {
            padding: 0;
        }
    </style>
    <script type="text/javascript">

        function btnclick() {
            var dialogObj = $("#<%=dialog.ClientID%>").data("ejDialog");
            dialogObj.open();
            $("#<%=btnOpen.ClientID%>").hide();
        }
        function onDialogClose(args) {
            $("#<%=btnOpen.ClientID%>").show();
        }

    </script>
</asp:Content>

