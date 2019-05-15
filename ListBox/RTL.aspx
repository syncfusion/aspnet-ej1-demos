<%@ Page Title="ListBox-RTL-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to list items in a right-to-left direction in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTL.aspx.cs" Inherits="WebSampleBrowser.ListBox.RTL" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a country</div>
            <ej:ListBox ID="rtlList" runat="server" DataTextField="Countries" EnableRTL="true" ClientSideOnCreate="OnCreated"></ej:ListBox>
        </div>
    </div>
<script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=rtlList.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
    setTimeout(function () {
        $(".listbox").css("display", "block");
    }, 300);
        }
</script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>
</asp:Content>

