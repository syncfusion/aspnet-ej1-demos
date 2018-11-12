<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="EncryptAndDecrypt.aspx.cs" Inherits="WebSampleBrowser.PPTX.Security" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for encrypting and decrypting the PowerPoint presentation.</p>
	<p>This sample demonstrates how to add encryption and decryption in a PowerPoint presentation.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
			<li>Encrypt a PowerPoint presentation using agile encryption, like Office 2010 and 2013.</li>
            <li>Decrypt the encrypted PowerPoint presentation using both agile and standard (Office 2007) encryption.</li>                        
			<li>Mark a PowerPoint presentation as 'Final' or 'Read-only'.</li>
		</ul>
	</p>
	<p><b>Note:</b>The encrypted documents can only be read by Office 2007 SP2 compatibility pack or later Office versions.</p>	
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
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
                                   <td height="10px">
                                   </td>
                                </tr>
                                <tr>
                                    <td align="left" style="padding-left:120px">
                                        <asp:Button ID="ClickToEncrypt" Width="200px" Height="27px" runat="server" Text="Encrypt Document"
                                            OnClick="ClickToEncrypt_Click" />
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
        <br />
        <table width="650px" id="PanelTable1" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td valign="middle" align="left">
                    <b>Select Document to Decrypt</b>
                    <div>
                        <br style="line-height: 10px" />
                    </div>
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
                                <td height="10px">
                                </td>
                            </tr>
                                <tr>
                                    <td align="left" style="padding-left:120px">
                                        <asp:Button ID="ClickToDecrypt" Width="200px" Height="27px" runat="server" Text="Decrypt Document"
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
