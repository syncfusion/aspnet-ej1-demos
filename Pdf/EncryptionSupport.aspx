<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="EncryptionSupport.aspx.cs" Inherits="WebSampleBrowser.Pdf.EncryptionSupport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates how to encrypt the PDF document with encryption standards like 40-bit RC4, 128-bit RC4, 128-bit AES, 256-bit AES, and advanced encryption standard 256-bit AES Revision 6 (PDF 2.0) to protect documents against unauthorized access. 
	</div>
       <br />
               
                <div style="border: solid 1px #788DB3; padding: 3px 10px 3px 10px; background-color: #EDF0F7;">
                    <table align="center" width="100%">
                        <tr>
                            <td>
                                <asp:Label runat="server" ID="label3" Text="Key Size" Font-Bold="true"></asp:Label><br />
                                <div style="border: solid 1px #788DB3; background-color: #EDF0F7;">
								 							
                                    <asp:RadioButtonList AutoPostBack="true" Style="margin-left: 10px; margin-right:10px"   ID="rdButtonKeySizeList"
                                        OnSelectedIndexChanged="rdButtonKeySizeList_SelectedIndexChanged" RepeatLayout="flow"
                                        RepeatDirection="Horizontal" runat="server" Height="25px">
                                        <asp:ListItem Text="40 Bit" style="margin-right:10px" />
                                        <asp:ListItem Text="128 Bit" style="margin-right:10px" Selected="True" />
                                        <asp:ListItem Text="256 Bit" style="margin-right:10px" />
                                        <asp:ListItem Text="256 Bit Revision 6" style="margin-right:10px"/>
                                    </asp:RadioButtonList>
									 
                                </div>
                            </td><td>&nbsp;</td>
                            <td>
                                <asp:Label runat="server" ID="label4" Text="Encryption Algorithm" Font-Bold="true"></asp:Label><br />
                                <div style="border: solid 1px #788DB3; padding: 0px 0px 0px 10px; background-color: #EDF0F7;">
                                    <asp:RadioButtonList ID="rdButtonAlgorithmList" runat="server" RepeatDirection="Horizontal" Height="25px">
                                        <asp:ListItem style="margin-right:10px">RC4</asp:ListItem>
                                        <asp:ListItem style="margin-right:10px" Selected="True">AES</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div style="border: solid 1px #788DB3; padding: 3px 10px 3px 10px; background-color: #EDF0F7;">
                    <table align="center" width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label runat="server" ID="label1" Text="<b>User</b> Password &nbsp;&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;<b>password</b>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label runat="server" ID="label2" Text="<b>Owner</b> Password : &nbsp;&nbsp;&nbsp;<b>syncfusion</b>"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                    OnClick="Button1_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
				</br>
				 <div style = "font-size: 17px;font-weight: 400;">
	It is possible to protect with user password or owner password or both passwords and also possible to change or remove password and permission. 
More information about encryption or decryption can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-security">section.</a>


           </div>
           
</asp:Content>
