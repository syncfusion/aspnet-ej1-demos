<%@ Page Title="PDF-Multi Column Text-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create multi column PDF using HTML text in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultiColumnText.aspx.cs" Inherits="WebSampleBrowser.Pdf.MultiColumnText" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
			  This sample demonstrates drawing multi column HTML text in the PDF document. It supports basic HTML tags, refer to this  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text#adding-a-html-styled-text">section</a> for more details.This feature will be used to create newsletters and e-books.
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
				 <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
		
		Refer to this <a href="https://help.syncfusion.com/file-formats/pdf/converting-html-to-pdf">section</a> for more details about converting complex HTML with advanced CSS to PDF. 


           </div>
</asp:Content>

