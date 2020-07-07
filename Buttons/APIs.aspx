<%@ Page Title="Buttons-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.Buttons.methods" MetaDescription="This example demonstrates the various methods like enable and disable in a ASP.NET Web Forms Button, ToggleButton, SplitButton"   %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="col-xs-6 col-sm-3">Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:Button ID="ButtonLarge" runat="server" Type="Button" Text="Button" Size="Large" ShowRoundedCorner="true"></ej:Button>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">Toggle Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:ToggleButton ID="ToggleButtonLarge" runat="server" Size="Large" ShowRoundedCorner="true" DefaultText="Play" ActiveText="Stop"></ej:ToggleButton>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">Split Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:SplitButton ID="SplitButtonLarge" runat="server" Text="Save" Size="Large" ShowRoundedCorner="true">
                    <Items>
                        <ej:SplitItem Text="Open..."></ej:SplitItem>
                        <ej:SplitItem Text="Save"></ej:SplitItem>
                        <ej:SplitItem Text="Delete"></ej:SplitItem>
                    </Items>
                </ej:SplitButton>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-6 col-sm-3">Dropdown Button</div>
            <div class="col-xs-6 col-sm-3">
                <ej:SplitButton ID="dropbtnlarge" runat="server" Text="Save" Size="Large" ShowRoundedCorner="true" ButtonMode="Dropdown">
                    <Items>
                        <ej:SplitItem Text="Open..."></ej:SplitItem>
                        <ej:SplitItem Text="Save"></ej:SplitItem>
                        <ej:SplitItem Text="Delete"></ej:SplitItem>
                    </Items>
                </ej:SplitButton>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Disable\Enable
                </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton ID="ToggleButtonChange" runat="server" ClientSideOnChange="onCheckUncheckAll" DefaultText="Disable" ActiveText="Enable"></ej:ToggleButton>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Arrowposition</div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList ID="arrowpos" runat="server" Width="120px" SelectedItemIndex="0" ClientSideOnChange="onArrowChange">
                        <Items>
                            <ej:DropDownListItem Text="Right" Value="right"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Left" Value="left"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Top" Value="top"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bottom" Value="bottom"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var buttonObject, toggleButtonObject, splitButtonObject, dropbtnobject;
        $(function () {
            //  declaration 

            buttonObject = $("#<%=ButtonLarge.ClientID%>").data("ejButton");
            toggleButtonObject = $("#<%=ToggleButtonLarge.ClientID%>").data("ejToggleButton");
            splitButtonObject = $("#<%=SplitButtonLarge.ClientID%>").data("ejSplitButton");
            dropbtnobject = $("#<%=dropbtnlarge.ClientID%>").data("ejSplitButton");

            $("#sampleProperties").ejPropertiesPanel();
        });
        function onCheckUncheckAll(args) {
            if (args.isChecked) {
                buttonObject.disable();
                toggleButtonObject.disable();
                splitButtonObject.disable();
                dropbtnobject.disable();
            }
            else if (buttonObject) {
                buttonObject.enable();
                toggleButtonObject.enable();
                splitButtonObject.enable();
                dropbtnobject.enable();
            }
        }
        function onArrowChange(args) {
            if (args.value == "top" || args.value == "bottom")
                $(".splttd").css("padding", "6px 0 6px 1px");
            else
                $(".splttd").css("padding", "0 0 0 1px");
            $(".e-splitbutton").ejSplitButton({ "arrowPosition": args.value });
        }
    </script>
</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 50%;
        }
    </style>
</asp:Content>

