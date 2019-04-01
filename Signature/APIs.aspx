<%@ Page Title="Signature-API's-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to dynamically customize the Syncfusion ASP.NET Web Forms Essential JS 1 Signature component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" Inherits="WebSampleBrowser.Signature.APIs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <h3>Sign here</h3>
            <ej:Signature ID="apisignature" Height="400px" StrokeWidth="3" BackgroundImage="../Content/images/progressbar/water.png" SaveWithBackground="true" IsResponsive="true" runat="server"></ej:Signature>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3 col-xs-4">StrokeColor</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ColorPicker runat="server" ID="strokecolor" Value="#000000" ClientSideOnChange="onchangestroke"></ej:ColorPicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">StrokeWidth</div>
                <div class="col-md-3 col-xs-4">
                    <ej:DropDownList runat="server" ID="selectwidth" Width="100px" WatermarkText="width" ClientSideOnChange="signwidthchange">
                        <Items>
                            <ej:DropDownListItem Text="1" Value="1"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="2" Value="2"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="3" Value="3"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="4" Value="4"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="5" Value="5"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="6" Value="6"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="7" Value="7"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="8" Value="8"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Undo</div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="signundo" ClientSideOnClick="onundo" Size="Normal" ShowRoundedCorner="true" Text="Undo"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Redo</div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="signuredo" ClientSideOnClick="onredo" Size="Normal" ShowRoundedCorner="true" Text="Redo"></ej:Button>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 col-xs-4">Clear</div>
                <div class="col-md-3 col-xs-4">
                    <ej:Button runat="server" Type="Button" ID="signclear" ClientSideOnClick="onclear" Size="Normal" ShowRoundedCorner="true" Text="Clear"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Save</div>
                <div class="col-md-3 col-xs-4">
                     <ej:Button runat="server" Type="Button" ID="signsave" ClientSideOnClick="onsave" Size="Normal" ShowRoundedCorner="true" Text="Save"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-xs-4">Hide/Show</div>
                <div class="col-md-3 col-xs-4">
                    <ej:ToggleButton runat="server" ID="Checks" Size="Normal" ShowRoundedCorner="true" DefaultText="Hide" ActiveText="Show" ClientSideOnClick="signshowChange"></ej:ToggleButton>
                </div>
            </div>
            <br />
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onchangestroke(args) {
            var sign = $("#<%=apisignature.ClientID%>").ejSignature("instance");
            sign.model.strokeColor = args.value;
        }

        function signwidthchange(args) {
            var sign = $("#<%=apisignature.ClientID%>").ejSignature("instance");
            sign.model.strokeWidth = parseInt(args.value);
        }
        function onclear() {
            var sign = $("#<%=apisignature.ClientID%>").ejSignature("instance");
            sign.clear();
        }
        function onundo() {
            var sign = $("#<%=apisignature.ClientID%>").ejSignature("instance");
            sign.undo();
        }

        function onredo() {
            var sign = $("#<%=apisignature.ClientID%>").ejSignature("instance");
            sign.redo();
        }

        function onsave() {
            var sign = $("#<%=apisignature.ClientID%>").ejSignature("instance");
            sign.save("MySignature");
        }

        function signshowChange(args) {
            $("#<%=apisignature.ClientID%>").ejSignature(args.isChecked ? "hide" : "show");
        }
        $(function () {           

            $("#sampleProperties").ejPropertiesPanel();

        })
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 80%;
        }
    </style>
</asp:Content>

