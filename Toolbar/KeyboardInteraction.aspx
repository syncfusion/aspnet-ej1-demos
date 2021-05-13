<%@ Page Language="C#" Title="Toolbar-Keyboard Interaction-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="KeyboardInteraction.aspx.cs" Inherits="WebSampleBrowser.Toolbar.KeyboardInteraction" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="toolbarKeySupport" TabIndex="1" runat="server">
                <Items>
                    <ej:ToolbarItem Id="Li5" TooltipText="Stop" SpriteCssClass="ToolbarItems Stop"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="mediaback" TooltipText="Previous" SpriteCssClass="ToolbarItems Back"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="previous" TooltipText="Preview" SpriteCssClass="ToolbarItems FastForward"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="play" TooltipText="play" SpriteCssClass="ToolbarItems Play"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="next" TooltipText="Review" SpriteCssClass="ToolbarItems FastForward1"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="end" TooltipText="Next" SpriteCssClass="ToolbarItems Back1"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="eject" TooltipText="Load/Eject" SpriteCssClass="ToolbarItems End"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="PlayOnce" TooltipText="PlayOnce" SpriteCssClass="ToolbarItems PlayOnce"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="RepeatAll" TooltipText="RepeatAll" SpriteCssClass="ToolbarItems RepeatAll"></ej:ToolbarItem>
                    <ej:ToolbarItem Id="playerSkew" TooltipText="Skew" SpriteCssClass="ToolbarItems playerSkew"></ej:ToolbarItem>
                </Items>
            </ej:Toolbar>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Alt + j
                </div>
                <div class="col-md-3 col-xs-4">
                    Focuses the control
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Up
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates up and right.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Down
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates down and left.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Left
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates down and left.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Right
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates up and right.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Home
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to the starting item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    End
                </div>
                <div class="col-md-3 col-xs-4">
                    Navigates to the ending item.
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">
                    Enter
                </div>
                <div class="col-md-3 col-xs-4">
                    Selects the focused item
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            //Control focus key
            $(document).on("keydown", function (e) {
                if (e.altKey && e.keyCode === 74) { // j- key code.
                    $("#<%=toolbarKeySupport.ClientID%>").focus();
                }
            });

            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
    <style>
.material .frame{
			width: 680px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/keyboardinteraction.css" rel="stylesheet" />
</asp:Content>

