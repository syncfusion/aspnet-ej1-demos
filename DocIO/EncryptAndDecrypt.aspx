<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="EncryptAndDecrypt.aspx.cs" Inherits="WebSampleBrowser.DocIO.EncryptAndDecrypt" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample focuses on encryption and decryption of a Word document using Essential DocIO.
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                                <td height="20px">
                                </td>
                            </tr>	
            <tr>
                <td valign="middle" align="left">
                    <b>Select Document to Encrypt</b>
                    <div>
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <div>
                            <asp:FileUpload ID="FileUpload1" Width="385px" runat="server" />
                        </div>
                        <br />
                        <div>
                            <asp:Label ID="Label2" runat="server" Text="Password To Protect : "></asp:Label>
                            <asp:TextBox ID="txtEnOpen" runat="server" TextMode="Password" Width="250px"> </asp:TextBox>
                        </div>
                        <br />
                        <div>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td valign="middle" align="left">
                                        <asp:Label Width="65px" runat="server" ID="label5" Text="Save As :"></asp:Label>
                                        <asp:RadioButton Style="font-size:13px;text-align:match-parent" ID="rdButtonDoc" runat="server" GroupName="Group2" Text="DOC" ToolTip="Saves the resultant document as Word Doc format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonDocx" runat="server" GroupName="Group2"
                                        Text="DOCX" Checked="True" ToolTip="Saves the resultant document as Word Docx format" />
                                    </td>
                                </tr>
                                 <tr>
                                <td height="10px">
                                </td>
                            </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="ClickToEncrypt" Width="150px" Height="27px" runat="server" Text="Generate Document"
                                            OnClick="ClickToEncrypt_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <table width="650px" id="PanelTable1" cellspacing="0" cellpadding="0" border="0">
            <tr>
                                <td height="10px">
                                </td>
                            </tr>
            <tr>
                <td valign="middle" align="left">
                    <b>Select Document to Decrypt</b>
                    <div>
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <div>
                            <asp:FileUpload ID="FileUpload2" Width="385px" runat="server" />
                        </div>
                        <br />
                        <div>
                            <asp:Label ID="Label3" runat="server" Text="Password To Open : "></asp:Label>
                            <asp:TextBox ID="txtDeOpen" runat="server" TextMode="Password" Width="260px"> </asp:TextBox>
                        </div>
                        <br />
                        <div>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td valign="middle" align="left">
                                        <asp:Label Width="65px" runat="server" ID="label4" Text="Save As :"></asp:Label>
                                       <asp:RadioButton Style="font-size:13px;text-align:match-parent" ID="rdButtonDecryptDoc" runat="server" GroupName="Group1" Text="DOC" ToolTip="Saves the resultant document as Word Doc format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonDecryptDocx" runat="server" GroupName="Group1"
                                        Text="DOCX" Checked="True" ToolTip="Saves the resultant document as Word Docx format" />
                                     </td>
                                </tr>
                                 <tr>
                                <td height="10px">
                                </td>
                            </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="ClickToDecrypt" Width="150px" Height="27px" runat="server" Text="Generate Document"
                                            OnClick="ClickToDecrypt_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
            runat="server" Text=""></asp:Label></div>
</asp:Content>
