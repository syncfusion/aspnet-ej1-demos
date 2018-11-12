<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Comments.aspx.cs" Inherits="WebSampleBrowser.PPTX.Comments" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for adding, replying and editing comments in a PowerPoint slide.</p>
    <p>This sample demonstrates how to add comments to a presentation slide.</p>	
    <div>
        <table width="100%">
            <tr>
                <td align="left">
                    <div>
                        <asp:Label Width="100%" Style="text-align: justify;" ID="pptLabel" runat="server" Text="Click the button to view a PowerPoint Presentation generated using Essential Presentation."></asp:Label>
                    </div>
                    <br />
                  <div>
                        <table width="35%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left">
                                    <br />
                                    <asp:Button ID="btnCreateDocument" Width="135px" Height="24px" runat="server" Text="Generate Document"
                                        OnClick="btnCreateDocuments_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
                runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>
