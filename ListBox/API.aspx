<%@ Page Title="ListBox-API's-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to enable or disable, add or remove, and select or unselect the Syncfusion ASP.NET Web Forms ListBox component items." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="API.aspx.cs" Inherits="WebSampleBrowser.ListBox.API" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select your skill</div>
            <ej:ListBox runat="server" ID="selectmethods" AllowMultiSelection="true" ClientSideOnCreate="OnCreated">
                <Items>
                    <ej:ListBoxItems Text="ASP.NET"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="ActionScript"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Basic"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="C++"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="C#"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="dBase"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="Delphi"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="ESPOL"></ej:ListBoxItems>
                    <ej:ListBoxItems Text="F#"></ej:ListBoxItems>
                </Items>
            </ej:ListBox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">Enable/Disable All</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton runat="server" ID="btnendis" Width="107px" CssClass="button" ClientSideOnChange="onEnableDiasableAll" Size="Normal" ActiveText="Enable All" DefaultText="Disable All"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Remove Item</div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="Remove" CssClass="button" Size="Normal" Width="107px" Text="Remove" ClientSideOnClick="remove"></ej:Button>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="additem" style="width: 95px;" class="ejinputtext" type="text" value="Java" />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="Add" Width="107px" ClientSideOnClick="add" CssClass="button" Size="Normal" Text="Add Item"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">CheckBox Visibility</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton runat="server" ID="btnshwhid" Width="107px" CssClass="button" ClientSideOnChange="onShowHide" Size="Normal" ActiveText="Hide" DefaultText="Show"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="checks" style="width: 95px" class="ejinputtext" type="text" value="3,4" disabled />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="Checks" Width="107px" Size="Normal" CssClass="button" Text="Check Items by Indices" ClientSideOnClick="checks"></ej:Button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="unchecks" style="width: 95px" class="ejinputtext" type="text" value="3,4" disabled />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="Unchecks" Width="107px" Size="Normal" CssClass="button" Text="Uncheck Items by Indices" ClientSideOnClick="unchecks"></ej:Button>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="selects" style="width: 95px;" class="ejinputtext" type="text" value="3,4" />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="selectsbutton" Width="107px" Size="Normal" CssClass="button" Text="Select Items by index" ClientSideOnClick="selects"></ej:Button>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="unselects" style="width: 95px;" class="ejinputtext" type="text" value="3,4" />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="unselectsbutton" Width="107px" Size="Normal" CssClass="button" Text="UnSelect Items by index" ClientSideOnClick="unselects"></ej:Button>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="disable" style="width: 95px;" class="ejinputtext" type="text" value="2,4,6" />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="Disable" Width="107px" Size="Normal" CssClass="button" Text="Disable Items by index" ClientSideOnClick="disable"></ej:Button>
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    <input id="enable" style="width: 95px;" class="ejinputtext" type="text" value="2,4" />
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="Enable" Width="107px" Size="Normal" CssClass="button" Text="Enable Items by index" ClientSideOnClick="enable"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function add(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            var value = $("#additem").val();
            target.addItem(value);
        }
        function remove(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            target.removeItem();
        }
        function onEnableDiasableAll(args) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            if (args.isChecked){
                target.disable();
		$(".ctrllabel").css("opacity",0.5);
		}
            else{
                target.enable();
		$(".ctrllabel").css("opacity",1);
		}
        }

        function selects(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            var value = $("#selects").val();
            if (value != "")
                target.selectItemsByIndex(value);
            else alert("Please enter the item index");
        }
        function unselects(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            var value = $("#unselects").val();
            target.unselectItemsByIndex(value);
        }
        function disable(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            var value = $("#disable").val();
            if (value != "")
                target.disableItemsByIndices(value);
            else alert("Please enter the item index");
        }
        function enable(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            var value = $("#enable").val();
            if (value != "")
                target.enableItemsByIndices(value);
            else alert("Please enter the item index");
        }
        function onShowHide(args) {
            ListboxObj = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            CheckedObj = $("#<%=Checks.ClientID%>").data("ejButton");
            UnCheckObj = $('#<%=Unchecks.ClientID%>').data("ejButton");
            SelectObj = $("#<%=selectsbutton.ClientID%>").data("ejButton");
            UnSelectObj = $('#<%=unselectsbutton.ClientID%>').data("ejButton");
            if (args.isChecked) {
                ListboxObj.option("showCheckbox", true);
                CheckedObj.enable();
                UnCheckObj.enable();
                SelectObj.disable();
                UnSelectObj.disable();
                $("#unselects").attr("disabled", "true");
                $("#selects").attr("disabled", "true");
                $("#checks").removeAttr("disabled");
                $("#unchecks").removeAttr("disabled");
            }
            else {
                ListboxObj.option("showCheckbox", false);
                CheckedObj.disable();
                UnCheckObj.disable();
                SelectObj.enable();
                UnSelectObj.enable();
                $("#unselects").removeAttr("disabled");
                $("#selects").removeAttr("disabled");
                $("#checks").attr("disabled", "true");
                $("#unchecks").attr("disabled", "true");
            }
        }
        function checks(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            value = $("#checks").val();
            if (value != "") {
                target.checkItemsByIndices(value);
            }
            else alert("Please enter the item index");
        }
        function unchecks(e) {
            var target = $('#<%=selectmethods.ClientID%>').data("ejListBox");
		    value = $("#unchecks").val();
		    if (value != "") {
		        target.uncheckItemsByIndices(value);
		    }
		    else alert("Please enter the item index");
		}
		$(function () {
		    ListboxObj = $('#<%=selectmethods.ClientID%>').data("ejListBox");
            CheckedObj = $("#<%=Checks.ClientID%>").data("ejButton");
            UnCheckObj = $('#<%=Unchecks.ClientID%>').data("ejButton");
            $("#sampleProperties").ejPropertiesPanel();
            if (!ListboxObj.option('showCheckbox')) {
                CheckedObj.disable();
                UnCheckObj.disable();
            }
        });
        function OnCreated() {
    if (document.body.firstElementChild.className = "htmljssamplebrowser material"){
        setTimeout(function () {
                    var obj = $("#<%=selectmethods.ClientID%>").ejListBox("instance");
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

