<%@ Page Title="PDF-Export as Image-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to convert PDF to image in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExportasImage.aspx.cs" Inherits="WebSampleBrowser.Pdf.ExportasImage" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to export as images from the PDF document or PDF to image. The exported images can be saved into any raster image format.

	</div>
    
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 5px 5px 5px; background-color: #EDF0F7;">
                    <table width="100%"> 
                          <tr>                            
                                 <td align="left">
                                <asp:Button ID="btnViewTemplate" Width="130px" Height="27px" runat="server" OnClick="btnViewTemplate_Click"
                                    Text="View Template" />
                                 </td>                                
                           </tr>
                                   
                        <tr>
                            <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0" colspan="3">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" 
                                     />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server"
                                     OnClick="Button1_Click" Text="Convert to Image" />
                            </td>
                        </tr>
                    </table>
                </div>
				  <br />
				<div style = "font-size: 17px;font-weight: 400;">
     This feature will be used to convert PDF to rasterized images to reduce the file size, prevent editing capability, prevent text extraction, and view document content without PDF viewing software.
More information about export as image can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-document-conversions#converting-pdf-to-image">section.</a>





           </div>
           
          
</asp:Content>

