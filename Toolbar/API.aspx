<%@ Page Language="C#" Title="Toolbar-API's-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="API.aspx.cs" Inherits="WebSampleBrowser.Toolbar.API" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="toolbarMethods" runat="server">
                <Items>
                    <ej:ToolbarItem Id="Left" SpriteCssClass="ToolbarItems LeftAlign_tool" TooltipText="Left"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Center" SpriteCssClass="ToolbarItems CenterAlign_tool" TooltipText="Center"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Right" SpriteCssClass="ToolbarItems RightAlign_tool" TooltipText="Right"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Justify" SpriteCssClass="ToolbarItems Justify_tool" TooltipText="Justify"></ej:ToolbarItem>
                </Items>
                <Items>
                    <ej:ToolbarItem Id="Bold" SpriteCssClass="ToolbarItems Bold_tool" TooltipText="Bold"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="Italic" SpriteCssClass="ToolbarItems Italic_tool" TooltipText="Italic"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="StrikeThrough" SpriteCssClass="ToolbarItems StrikeThrough_tool" TooltipText="StrikeThrough"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="UndeLine" SpriteCssClass="ToolbarItems Underline_tool" TooltipText="UndeLine"></ej:ToolbarItem>
                </Items>
            </ej:Toolbar>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">

    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">Select Item By ID</div>
                <div class="col-md-3 col-xs-4">
                    <select name="selectIndex" class="e-ddl" id="optSelectId">
                        <option value="none">None</option>
                        <option value="Left">Left</option>
                        <option value="Center">Center</option>
                        <option value="Right">Right</option>
                        <option value="Justify">Justify</option>
                        <option value="Bold">Bold</option>
                        <option value="Italic">Italic</option>
                        <option value="StrikeThrough">StrikeThrough</option>
                        <option value="UndeLine">UnderLine</option>
                    </select>
                </div>
                <div class="col-md-3 col-xs-4">Deselect Item By ID</div>
                <div class="col-md-3 col-xs-4">
                    <select name="selectIndex" class="e-ddl" id="optDeselectId">
                        <option value="none">None</option>
                        <option value="Left">Left</option>
                        <option value="Center">Center</option>
                        <option value="Right">Right</option>
                        <option value="Justify">Justify</option>
                        <option value="Bold">Bold</option>
                        <option value="Italic">Italic</option>
                        <option value="StrikeThrough">StrikeThrough</option>
                        <option value="UndeLine">UnderLine</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Disable Item By ID</div>
                <div class="col-md-3 col-xs-4">
                    <select name="selectIndex" class="e-ddl" id="optDisableId">
                        <option value="none">None</option>
                        <option value="Left">Left</option>
                        <option value="Center">Center</option>
                        <option value="Right">Right</option>
                        <option value="Justify">Justify</option>
                        <option value="Bold">Bold</option>
                        <option value="Italic">Italic</option>
                        <option value="StrikeThrough">StrikeThrough</option>
                        <option value="UndeLine">UnderLine</option>
                    </select>
                </div>
                <div class="col-md-3 col-xs-4">Enable Item By ID</div>
                <div class="col-md-3 col-xs-4">
                    <select name="selectIndex" class="e-ddl" id="optEnableId">
                        <option value="none">None</option>
                        <option value="Left">Left</option>
                        <option value="Center">Center</option>
                        <option value="Right">Right</option>
                        <option value="Justify">Justify</option>
                        <option value="Bold">Bold</option>
                        <option value="Italic">Italic</option>
                        <option value="StrikeThrough">StrikeThrough</option>
                        <option value="UndeLine">UnderLine</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Disable/Enable All </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" Width="100px" ID="Enabledisable" runat="server" ActiveText="Enable" DefaultText="Disable" ClientSideOnChange="onEnableDisableAll"></ej:ToggleButton>
                </div>
                <div class="col-md-3 col-xs-4">Show/Hide </div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton Type="Button" Width="100px" ID="Showhide" runat="server" ActiveText="Show" DefaultText="Hide" ClientSideOnChange="onShowHide"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var toolbar1;
        $(function () {

            toolbar1 = $("#<%=toolbarMethods.ClientID%>").data("ejToolbar");
            /**/
            $("#optSelectId").ejDropDownList({ "change": "onSelectChange", width: "100px", selectedItemByIndex: 0 });
            $("#optDeselectId").ejDropDownList({ "change": "onDeselectChange", width: "100px", selectedItemByIndex: 0 });
            $("#optDisableId").ejDropDownList({ "change": "onDisableChange", width: "100px", selectedItemByIndex: 0 });
            $("#optEnableId").ejDropDownList({ "change": "onEnableChange", width: "100px", selectedItemByIndex: 0 });
            $("#sampleProperties").ejPropertiesPanel();
        });

    </script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Toolbar/toolbarapi.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .inputBtn, .e-togglebutton {
            width: 97px;
        }
        .material .frame{
			width: 471px;
		}
    </style>
    <link href="../Content/Toolbar/API.css" rel="stylesheet" />
</asp:Content>

