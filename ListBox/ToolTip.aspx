<%@ Page Title="ListBox-Tooltip-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display tooltips for the list items in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ToolTip.aspx.cs" Inherits="WebSampleBrowser.ListBox.ToolTip" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a person</div>
            <ej:ListBox ID="selectExperts" runat="server" Height="220" ClientSideOnCreate="OnCreated">
            </ej:ListBox>
        </div>
    </div>
<script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=selectExperts.ClientID%>").ejListBox("instance");
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
            padding-bottom: 12px;
        }
    </style>
</asp:Content>

