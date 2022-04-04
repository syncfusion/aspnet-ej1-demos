<%@ Page Title="Presentation-WriteProtection-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="WriteProtection.aspx.cs" Inherits="WebSampleBrowser.PPTX.WriteProtection" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support to set write protection for PowerPoint presentation.</p>
	<p>This sample demonstrates how to set write protection for PowerPoint presentation.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
			<li>Set write protection for PowerPoint presentation with password.</li>
            <li>Remove write protection of PowerPoint presentation.</li>
		</ul>
	</p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td valign="middle" align="left">
                    <b>Select Document to Protect Writing</b>
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
                                        <asp:Button ID="ClickToProtect" Width="200px" Height="27px" runat="server" Text="Protect Document"
                                            OnClick="ClickToProtect_Click" />
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

