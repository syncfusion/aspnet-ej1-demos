<%@ Page Title="ListBox-Checkbox-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to select multiple items at a time and display their check-boxes with the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="CheckBox.aspx.cs" Inherits="WebSampleBrowser.ListBox.CheckBox" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select your skills</div>
            <ej:ListBox ID="skillsets" runat="server" ShowCheckbox="true" ClientSideOnCreate="OnCreated">
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
                    <ej:ToggleButton runat="server" ID="btnchkunchk" Width="110px" DefaultText="Check All" ActiveText="Uncheck All" ClientSideOnChange="onCheckUncheckAll"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="get" runat="server" Width="110px" ClientSideOnClick="GetCheckeditems" Type="Button" Text="GetCheckeditems"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton runat="server" ID="btnshwhid" Width="110px" DefaultText="Hide Checkbox" ActiveText="Show Checkbox" ClientSideOnChange="onShowHide"></ej:ToggleButton>

                </div>
            </div>

        </div>
        <div id="resultarea" style="padding-left:25px">
            <label>CheckedItems</label>
            <table id="resultdata">
                <tr>
                    <th>Index</></th>
                    <th>Text</th>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target = $('#<%=skillsets.ClientID%>').data("ejListBox");;
        $(function () {

            target = $('#<%=skillsets.ClientID%>').data("ejListBox");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onCheckUncheckAll(args) {
            target = $('#<%=skillsets.ClientID%>').data("ejListBox");
            if (args.isChecked)
                target.checkAll();
            else
                target.uncheckAll();
        }

        function onShowHide(args) {
            target = $('#<%=skillsets.ClientID%>').data("ejListBox");
            ButtonObj = $("#<%=get.ClientID%>").data("ejButton");
            ToggleButtonObj = $("#<%=btnchkunchk.ClientID%>").data("ejToggleButton");
            if (args.isChecked) {
                target.option("showCheckbox", false);
                ButtonObj.disable();
                ToggleButtonObj.disable();
            }
            else {
                ButtonObj.enable();
                ToggleButtonObj.enable();
                target.option("showCheckbox", true);
            }
        }
        function GetCheckeditems(e) {
            var alertMsg = "";
            target.option("showCheckbox", true);
            var checkedItems = target.getCheckedItems();
            if (checkedItems.length) {
                $(checkedItems).each(function (index, ele) {
                    alertMsg += "<tr class='checkedItems'><td>" + ele.index + "</td><td>" + ele.value + "</td></tr>";
                    $(".checkedItems").remove();
                    $("#resultdata").append(alertMsg);
                });
            }
            else {
                $(".checkedItems").remove();
                $("#resultarea br").remove();
                $("#resultarea").append("<br /><span class='checkedItems'>No items are checked</span>");
            }

        }
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

        .cols-prop-area .content {
            overflow: visible;
        }

        #resultdata {
            width: 100%;
        }

        th {
            width: 50%;
        }

        label{
            margin-left: 35px;
        }
    </style>
</asp:Content>

