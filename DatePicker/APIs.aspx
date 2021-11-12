<%@ Page Title="DatePicker-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like show, hide, enable and disable in a ASP.NET Web Forms DatePicker" Inherits="WebSampleBrowser.DatePicker.methods" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DatePicker ID="datepick" runat="server" ClientSideOnOpen="dpOpen" ClientSideOnClose="dpClose" Width="100%"></ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Show / Hide
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:CheckBox runat="server" ID="chkShowHide" CssClass="e-checkbox" Value="ShowHide" ClientSideOnChange="onShowHide"></ej:CheckBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enable / disable
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:CheckBox runat="server" ID="ChkEnable" CssClass="e-checkbox" Checked="true" ClientSideOnChange="EnableDisable"></ej:CheckBox>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var dateobject, chckobject, temp = false, id = "";
        $(function () {
            dateobject = $("#<%=datepick.ClientID%>").data("ejDatePicker");
            chckobject = $("#<%=chkShowHide.ClientID%>").data("ejCheckBox");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function dpOpen(args) {
            chckobject.setModel({ checked: true });
        };
        function dpClose(args) {
            chckobject.setModel({ checked: false });
            temp = true;
        };
        function onShowHide(args) {
            if (args.isChecked) {
                if (id == "ej<%=chkShowHide.ClientID%>" && temp) {
                    chckobject.setModel({ checked: false });
                    temp = false;
                }
                else
                    dateobject.show();
            }
            else
                dateobject.hide();
        };
        function EnableDisable(args) {
            if (args.isChecked) {
                dateobject.enable();
                chckobject.enable();
            } else {
                dateobject.disable();
                chckobject.disable();
            }
        };
        $(document).on('click', function (event) {
            var ele = event.target;
            var ele1 = $(ele).parents("#ej<%=chkShowHide.ClientID%>");
            var ele2 = $(ele).parents("#<%=datepick.ClientID%>-img");
            id = (ele1.length == 1 || ele2.length == 1) ? "ej<%=chkShowHide.ClientID%>" : "";
        });

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
     <style>
           .frame {
            padding: 50px;
            width: 30%;
        }
        </style>
</asp:Content>

