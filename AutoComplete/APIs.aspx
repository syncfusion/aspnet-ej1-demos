<%@ Page Title="ASP.NET AutoComplete API configuration example | Syncfusion" MetaDescription="This example demonstrates how to disable and get the selected value in the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.APIs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectCountry" runat="server" Width="100%" WatermarkText="Select a country"></ej:Autocomplete>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="check21" runat="server" DefaultText="Disable" ActiveText="Enable" ClientSideOnClick="changeState" Width="107px"></ej:ToggleButton>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="GetValue" runat="server" Type="Button" Text="Get value" Width="107px" ClientSideOnClick="btnClick"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">
        var autocomplete;
        $(function () {
            autocomplete = $('#<%=selectCountry.ClientID%>').data("ejAutocomplete");
            $("#sampleProperties").ejPropertiesPanel();
        });

        function changeState(args) {
            if (args.isChecked) autocomplete.disable();
            else autocomplete.enable();
        }
        function btnClick() {
            alert("Current value is : " + autocomplete.getValue());
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>


