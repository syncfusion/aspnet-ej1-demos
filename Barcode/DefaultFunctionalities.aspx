<%@ Page Title="Barcode-Getting Started-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Essential Studio JS 1 for ASP.NET Barcode" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Barcode.DefaultFunctionalities" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="ScriptSection">
    <script src="Scripts/ej.web.all.min.js"></script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    <div class="content-container-fluid">
        <div class="row">
            <div class="cols-sample-area">
                <ej:barcode id="Barcode1" runat="server" text="//www.syncfusion.com " symbologytype="qrbarcode"/>            
            </div>

            <div>
                <asp:Label runat="server" Font-Bold="true" Font-Size="12px" Text=" * Invalid characters found in entered text"
                    Font-Italic="true" ForeColor="Red" Visible="false" ID="errorNotify"></asp:Label>
            </div>

            <div id="sampleProperties">
                <div class="prop-grid">
                    <asp:Label runat="server" Font-Bold="true" Font-Size="12px" Text=" * Invalid characters found in entered text"
                        Font-Italic="true" ForeColor="Red" Visible="false" ID="Label3"></asp:Label>
                    <ul style="list-style: none">
                        <li>
                            <asp:Label ID="Label4" runat="server" Text="Symbology" Font-Bold="true" Width="150px"></asp:Label>
                        </li>
                        <li></li>
                        <li>
                            <asp:ListBox runat="server" ID="symbolListBx"
                                AutoPostBack="true" OnSelectedIndexChanged="symbolListBx_SelectionChanged">
                                <asp:ListItem>Code39</asp:ListItem>
                                <asp:ListItem>Code39Extended</asp:ListItem>
                                <asp:ListItem>Code11</asp:ListItem>
                                <asp:ListItem>Codabar</asp:ListItem>
                                <asp:ListItem>Code32</asp:ListItem>
                                <asp:ListItem>Code93</asp:ListItem>
                                <asp:ListItem>Code93Extended</asp:ListItem>
                                <asp:ListItem>Code128A</asp:ListItem>
                                <asp:ListItem>Code128B</asp:ListItem>
                                <asp:ListItem>Code128C</asp:ListItem>
                                <asp:ListItem>DataMatrix</asp:ListItem>
				<asp:ListItem>UpcBarcode</asp:ListItem>
                                <asp:ListItem Selected="True">QRBarcode</asp:ListItem>
                            </asp:ListBox>
                            <br />
                        </li>
                        <li>
                            <asp:Label ID="Label5" runat="server" Text="Text to Encode" Width="150px" Font-Bold="true"></asp:Label>
                        </li>
                        <li>
                            <asp:TextBox runat="server" Text="//www.syncfusion.com " ID="txtBox"></asp:TextBox>
                            <br />
                        </li>
                        <li>
                            <asp:Button runat="server" Text="Update Barcode" ID="Button1" OnClick="Update_Click" />
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>

