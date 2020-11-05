<%@ Page Title="ListBox-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display a list of items using the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.ListBox.DefaultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">


    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select a car</div>
            <ej:ListBox ID="selectCar" runat="server" ClientSideOnCreate="OnCreated">
                <Items>
                    <ej:ListBoxItems Text="Audi A4" Value="Audi A4"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Audi A5" Value="Audi A5"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Audi A6" Value="Audi A6"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Audi A7" Value="Audi A7"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Audi A8" Value="Audi A8"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="BMW 501" Value="BMW 501"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="BMW 502" Value="BMW 502"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="BMW 503" Value="BMW 503"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="BMW 507" Value="BMW 507"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="BMW 3200" Value="BMW 3200"></ej:ListBoxItems>
                </Items>
            </ej:ListBox>
        </div>
    </div>
<script type="text/javascript">
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=selectCar.ClientID%>").ejListBox("instance");
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

