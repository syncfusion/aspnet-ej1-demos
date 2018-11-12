<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ImageExtraction.aspx.cs" Inherits="WebSampleBrowser.Pdf.ImageExtraction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to extract images from the PDF document. The extracted images can be saved into any raster image format.

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
                            <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser"/>
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server"
                                     OnClick="Button1_Click" Text="Extract Image" />
                            </td>
                        </tr>
                    </table>
                </div>
				</br>
				<div style = "font-size: 17px;font-weight: 400;">
      This feature will be used to extract the images from the PDF document for further processing such as OCR (Optical Character Recognition) scanned images and enhance the photos for replacing the images and so on  for indexing and archiving purpose.
	  More information about the image extraction can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-document-conversions#converting-tiff-to-pdf">section.</a>




           </div>
           
</asp:Content>
