<%@ Page Title="ListBox-Cascading-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display child list items based on their parent list items in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Cascading.aspx.cs" Inherits="WebSampleBrowser.ListBox.Cascading" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="listbox" style="display:none">
        <div class="frame">
            <div class="grouplist">
                <span class="txt">Select group</span>
                <ej:ListBox ID="groupsList" runat="server" DataValueField="parentId" CascadeTo="LayoutSection_ControlsSection_countryList" ClientSideOnCreate="OnCreated"></ej:ListBox>
            </div>
            <div class="grouplist">
                <span class="txt">Select country</span>
                <ej:ListBox ID="countryList" runat="server" LoadDataOnInit="false"></ej:ListBox>
            </div>
        </div>
    </div>
    <script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=groupsList.ClientID%>").ejListBox("instance");
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
        .grouplist {
            display: inline-block;
        }

        .txt {
            display: block;
            font-weight: 600;
            padding-bottom: 12px;
        }
    </style>
</asp:Content>


