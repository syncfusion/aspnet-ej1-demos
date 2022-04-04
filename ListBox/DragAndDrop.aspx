<%@ Page Title="ListBox-Drag And Drop-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to drag list items from one ListBox component and drop them into another Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DragAndDrop.aspx.cs" Inherits="WebSampleBrowser.ListBox.DragAndDrop" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Drag and drop skills</div>
              <div class="grouplist">
                <ej:ListBox ID="dragContainer" runat="server" DataTextField="Skills" AllowDragAndDrop="true" AllowMultiSelection="true" ClientSideOnCreate="OnCreated"></ej:ListBox>
            </div>
            <div class="grouplist" style="padding-top: 38px">
                <ej:ListBox ID="dropContainer" runat="server" AllowDragAndDrop="true" AllowMultiSelection="true">
                    <Items>
                        <ej:ListBoxItems Text=""></ej:ListBoxItems>
                    </Items>
                </ej:ListBox>
            </div>
        </div>
    </div>
    <script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=dragContainer.ClientID%>").ejListBox("instance");
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
        .ctrllabel {
            font-weight: 600;
            padding-bottom: 10px;
        }
    </style>
</asp:Content>

