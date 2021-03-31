<%@ Page Title="ListBox-Remote Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind the remote data source key value mapping in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-remotedata.aspx.cs" Inherits="WebSampleBrowser.ListBox.DataBinding_remotedata" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a customer</div>
            <ej:ListBox ID="customerList" runat="server" DataTextField="CustomerID" ClientSideOnCreate="OnCreate"></ej:ListBox>
        </div>
    </div>
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
<asp:Content runat="server" ID="scriptcontent" ContentPlaceHolderID="ScriptSection">
<script type="text/javascript">
function OnCreate(args){
 var dataManger = ej.DataManager({
        url: "//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/", crossDomain: true
     });
    $('#<%=customerList.ClientID%>').ejListBox({
        dataSource: dataManger
    });
     if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=customerList.ClientID%>").ejListBox("instance");
                    obj._refreshScroller();
                }, 800);
            }
    setTimeout(function () {
        $(".listbox").css("display", "block");
    }, 300);

}
</script>
</asp:Content>

