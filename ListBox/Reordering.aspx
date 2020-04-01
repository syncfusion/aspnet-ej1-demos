<%@ Page Title="ListBox-Reordering-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to move the Syncfusion ASP.NET Web Forms ListBox component items up or down into another position." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Reordering.aspx.cs" Inherits="WebSampleBrowser.ListBox.Reordering" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Reorder skills</div>
            <ej:ListBox ID="ordering" runat="server" ClientSideOnCreate="OnCreated">
                <Items>
                    <ej:ListBoxItems Text="ASP.NET" Value="ASP.NET"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="ActionScript" Value="ActionScript"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Basic" Value="Basic"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="C++" Value="C++"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="C#" Value="C#"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="dBase" Value="dBase"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Delphi" Value="Delphi"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="ESPOL" Value="ESPOL"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="F#" Value="F#"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="FoxPro" Value="FoxPro"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Java" Value="Java"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="J#" Value="J#"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Lisp" Value="Lisp"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Logo" Value="Logo"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="PHP" Value="PHP"></ej:ListBoxItems>
                </Items>
            </ej:ListBox>
        </div>

    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="up" runat="server" Type="Button" Size="normal" Width="107px" ClientSideOnClick="Moveup" Text="Move Up" ShowRoundedCorner="true"></ej:Button>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="Button1" runat="server" Type="Button" Size="normal" Width="107px" ClientSideOnClick="Movedown" Text="Move Down" ShowRoundedCorner="true"></ej:Button>

                </div>
            </div>

        </div>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function Moveup(e) {
            var target = $('#<%=ordering.ClientID%>').data("ejListBox");
            target.moveUp();
        }
        function Movedown(e) {
            var target = $('#<%=ordering.ClientID%>').data("ejListBox");
            target.moveDown();
        }
function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=ordering.ClientID%>").ejListBox("instance");
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

