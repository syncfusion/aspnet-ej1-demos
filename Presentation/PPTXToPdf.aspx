<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PPTXToPdf.aspx.cs" Inherits="WebSampleBrowser.PPTX.PPTXToPdf" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for converting the entire Presentation or a single slide to PDF.</p>
    <p>This sample demonstrates how to convert an existing Presentation to PDF using our library.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Convert all slide elements like text, shape, SmartArt diagram, table, etc., along with its formatting.</li>
		<li>Convert RTL(right to left) text.</li>
        <li>Convert with handouts option.</li>
        <li>Convert the notes pages to PDF.</li>
		<li>Option to include or exclude the charts while conversion.</li>
        <li>Converted PDF document size can be optimized.</li>		
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
                        <asp:Label Width="100%" Style="text-align: justify;" ID="pptLabel" runat="server" Text="Clicking the button will result in a PDF document being converted from presentation document using Essential Presentation and Essential PDF.  At the end of the document generation, an option will be provided to view the generated PDF file. Please note that you need to have a PDF viewer installed in order to view the generated PDF file."></asp:Label>
                    </div>
                    <br />
                    <div>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                    <asp:CheckBox runat="server" ID="CheckBox1" Text=" Open File inside the Browser"
                                        AutoPostBack="false" />
                                <br />
                                    <asp:Button ID="btnDocToPdf" Width="128px" Height="24px" runat="server" Text="Convert to PDF"
                                        OnClick="btnDocToPdf_Click" />
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
