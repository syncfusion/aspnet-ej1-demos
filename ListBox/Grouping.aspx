<%@ Page Title="ListBox-Grouping-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to group items and providing a header for each group in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Grouping.aspx.cs" Inherits="WebSampleBrowser.ListBox.Grouping" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a country</div>
            <ej:ListBox ID="vegetable" runat="server" PopupHeight="200px" DataGroupBy="category" ClientSideOnCreate="OnCreated"></ej:ListBox>
        </div>
    </div>
<script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=vegetable.ClientID%>").ejListBox("instance");
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
    <style type="text/css" class="cssStyles">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>
</asp:Content>


