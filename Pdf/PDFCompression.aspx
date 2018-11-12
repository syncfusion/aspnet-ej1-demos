<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PDFCompression.aspx.cs" Inherits="WebSampleBrowser.Pdf.PDFCompression" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			    This sample demonstrates the creation of compressed PDF document. It compresses the content stream and images in the PDF document based on the quality factor.
	</div>
	
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server">Choose Compression Level</asp:Label>
                            </td>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server">Image Compression</asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:DropDownList Width="75%" runat="server" ID="comComBox">
                                    <asp:ListItem>AboveNormal</asp:ListItem>
                                    <asp:ListItem>BelowNormal</asp:ListItem>
                                    <asp:ListItem Selected="True">Best</asp:ListItem>
                                    <asp:ListItem>BestSpeed</asp:ListItem>
                                    <asp:ListItem>None</asp:ListItem>
                                    <asp:ListItem>Normal</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td align="left">
                                <asp:DropDownList Width="75%" runat="server" ID="imgComBox">
                                    <asp:ListItem>Minimum</asp:ListItem>
                                    <asp:ListItem>Low</asp:ListItem>
                                    <asp:ListItem Selected="True">Medium</asp:ListItem>
                                    <asp:ListItem>High</asp:ListItem>
                                    <asp:ListItem>Maximum</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%">
                        <tr>
                            <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                    OnClick="Button1_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
				  <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
		
				
		It is also possible to  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-compression#compressing-existing-pdf-document">compress the existing PDF document</a> by removing the metadata, optimizing the font, and page content.

           </div>
          
</asp:Content>
