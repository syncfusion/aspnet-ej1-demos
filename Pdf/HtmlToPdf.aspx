<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HtmlToPdf.aspx.cs" Inherits="WebSampleBrowser.Pdf.HtmlToPdf" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to convert URL to PDF. Many customization options and <a href="https://www.syncfusion.com/products/file-formats/pdf/html-to-pdf">features</a>
 are available in this conversion.

	</div>
	<br />
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr style="margin-top: 5px;">
            <td align="left">
                <div style="border: solid 1px #788DB3; line-height: 23px; padding: 10px; background-color: #EDF0F7;">
                    <asp:Label runat="server" ID="label1" Text="Source URL" Font-Bold="true"></asp:Label>
                    <asp:TextBox Style="margin-left: 12px" ID="TextBox1" Width="75%" runat="server">http://www.google.com</asp:TextBox>
                    <br />
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label runat="server" ID="label2" Text="Convert To" Font-Bold="true"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label runat="server" ID="label7" Text="Document Standard" Font-Bold="true"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="width:50%">
                                <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                                    <asp:RadioButtonList AutoPostBack="true" ID="RadioButtonList1"
                                        RepeatLayout="flow" RepeatDirection="Horizontal" runat="server" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                        <asp:ListItem style="margin-right: 10px" Text="Metafile" Selected="True" />
                                        <asp:ListItem Text="Bitmap" />
                                    </asp:RadioButtonList>
                                </div>
                            </td>
                            <td align="left">
                                <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                                    <asp:CheckBox Width="273px" ID="chkPDFA" runat="server" Text="PDF/A1-B" />
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label runat="server" ID="label8" Text="Converter Options" Font-Bold="true"></asp:Label><br />
                                <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                                    <table cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td valign="middle" align="left" style="padding-bottom: 10px">
                                                <asp:CheckBox Width="165px" ID="chkJavaScript" Style="margin-left: 10px" runat="server"
                                                    Text="Enable JavaScript" />
                                                <asp:CheckBox Width="165px" ID="chktextBreak" runat="server" Text="Split TextLines" />
                                                <asp:CheckBox Width="165px" ID="chkHyperlink" Checked="true" runat="server" Text="Enable Hyperlinks" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="middle" align="left">
                                                <asp:RadioButton GroupName="group1" Width="165px" ID="chkImageBreak" Style="margin-left: 10px"
                                                    runat="server" Checked="true" Text="Split Images" />
                                                <asp:RadioButton GroupName="group1" Width="165px" ID="chkPageBreak" runat="server"
                                                    Text="Activate PageBreak" />
                                                <asp:CheckBox Width="165px" ID="chkTag" AutoPostBack="true" OnCheckedChanged="chkTag_CheckedChanged" Checked="false" runat="server" Text="Tagged PDF" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label runat="server" ID="label9" Text="Page Settings" Font-Bold="true"></asp:Label><br />
                                <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                        <tr>
                                            <td valign="middle" align="left" style="padding-bottom: 10px; width: 50%;">
                                                <asp:Label runat="server" ID="label3" Width="45%" Text="Page Margins"></asp:Label>
                                                <asp:DropDownList ID="DropDownList1" Width="45%" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td valign="middle" style="padding-left: 20px; width: 50%;">
                                                <asp:Label runat="server" Style="margin-right: 5px;" ID="label4" Text="Orientation: "></asp:Label>
                                                <asp:RadioButtonList RepeatLayout="Flow" ID="RadioButtonList2" RepeatDirection="Horizontal"
                                                    runat="server">
                                                    <asp:ListItem style="margin-right: 10px" Selected="True">Portrait</asp:ListItem>
                                                    <asp:ListItem>Landscape</asp:ListItem>
                                                </asp:RadioButtonList>
                                            </td>
                                        </tr>
                                        <tr style="width:100%">
                                            <td valign="middle" align="left" style="width: 50%;">
                                                <asp:Label runat="server" ID="label5" Width="45%" Text="Rotate"></asp:Label>
                                                <asp:DropDownList ID="DropDownList2" Width="45%" runat="server">
                                                    <asp:ListItem>RotateAngle0</asp:ListItem>
                                                    <asp:ListItem>RotateAngle90</asp:ListItem>
                                                    <asp:ListItem>RotateAngle180</asp:ListItem>
                                                    <asp:ListItem>RotateAngle270</asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                            
                                            <td style="padding-left: 20px; width: 50%;">
                                                <asp:CheckBox ID="CheckBox2" Style="margin-right: 20px" runat="server" Text="Show Header" />
                                                <asp:CheckBox ID="CheckBox3" runat="server" Text="Show Footer" />
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
               
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 5px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:CheckBox Style="margin-left: 5px" ID="CheckBox1" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                    OnClick="Button1_Click" Text="HTML to PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
	<br />
	 <div style = "font-size: 17px;font-weight: 400;">
More information about the HTML to PDF document can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/converting-html-to-pdf">section.</a>



           </div>
</asp:Content>
