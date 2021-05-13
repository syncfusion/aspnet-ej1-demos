<%@ Page Title="Presentation-PPTX To Image-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PPTXToImage.aspx.cs" Inherits="WebSampleBrowser.PPTX.PPTXToImage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for converting the entire Presentation or single slide to image.</p>
    <p>This sample demonstrates how to convert the slides to an image.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Convert all slide elements like text, shape, SmartArt diagram, table, etc., along with its formatting.</li>
		<li>Convert RTL(right to left) text.</li>
        <li>Charts in a slide can be converted to image.</li>
		<li>Slides can be converted to JPEG, PNG, BMP, TIFF, EMF, and GIF formats.</li>
		</ul>
	</p>
    <div>
        <table width="100%">
            <tr>
                <td align="left">
                    <div>
                    <b>Select Document</b>
                        <asp:FileUpload ID="FileUpload1" Width="75%" runat="server" />
                    </div>
                    <br />
                    <div>
                        <asp:Label Width="100%" Style="text-align: justify;" ID="pptLabel" runat="server" Text="Clicking the button will result in an image being converted from a PowerPoint document's first slide using Essential Presentation."></asp:Label>
                    </div>
                    <br />
                    <div>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:Button ID="btnDocToImage" Width="128px" Height="24px" runat="server" Text="Convert to Image"
                                        OnClick="btnDocToImage_Click" />
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

