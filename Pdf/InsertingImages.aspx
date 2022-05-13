<%@ Page Title="PDF-Inserting Images-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to draw images in PDF in ASP.NET Web Forms using Syncfusion .NET PDF library. The supported images formats are JPG, PNG, TIFF, EMF and GIF." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="InsertingImages.aspx.cs" Inherits="WebSampleBrowser.Pdf.InsertingImages" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			 This sample demonstrates insertion of various raster and vector images (JPEG, PNG, TIFF, EMF, and GIF) in the PDF document.
			 This sample also demonstrates the image masking capability in the Essential PDF library.


	</div>
                     
                    <br />
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table>
                            <tr>
                                <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" 
                                         />
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
		
		It is also possible to rotate and paginate the images in the PDF document. 
More information about the images can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-images">section.</a>
 


           </div>

</asp:Content>

