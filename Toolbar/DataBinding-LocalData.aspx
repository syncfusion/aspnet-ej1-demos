<%@ Page Language="C#" Title="Toolbar / Data Binding /Local Data" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DataBinding-LocalData.aspx.cs" Inherits="WebSampleBrowser.Toolbar.DataBinding_LocalData" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div id="toolbarJson"></div>
            <%--<ej:Toolbar ID="tool"  runat="server" ></ej:Toolbar>--%>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            // declaration
            BrowserItems = [{
                empid: "1",
                spriteCss: "Browsers ieb",
                text: "IE",
            }, {
                empid: "2",
                spriteCss: "Browsers chromeb",
                text: "Chrome",
            }, {
                empid: "3",
                spriteCss: "Browsers firefoxb",
                text: "Firefox",
            }, {
                empid: "4",
                spriteCss: "Browsers bittyb",
                text: "Bitty",
            }, {
                empid: "5",
                spriteCss: "Browsers operab",
                text: "Opera",
            }
            ];
            $("#toolbarJson").ejToolbar({
                dataSource: BrowserItems,
                fields: { id: "empid", spriteCssClass: "spriteCss" },
                orientation: ej.orientation.Horizontal
            });
        });
    </script>
    <style>
    .material .frame{
			width: 360px;
		}
    </style>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/databinding-localdata.css" rel="stylesheet" />
</asp:Content>
