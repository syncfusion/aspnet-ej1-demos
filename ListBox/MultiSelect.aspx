<%@ Page Title="ListBox-Multi-Select-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to select more than one item at a time in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="MultiSelect.aspx.cs" Inherits="WebSampleBrowser.ListBox.MultiSelect" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="control listbox"style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select your skills</div>
            <ej:ListBox ID="skillsets" runat="server" DataTextField="Skills" AllowMultiSelection="true" ClientSideOnCreate="OnCreated"></ej:ListBox>
        </div>
    </div>
<script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=skillsets.ClientID%>").ejListBox("instance");
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


