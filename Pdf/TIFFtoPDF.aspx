<%@ Page Title="PDF-TIFF to PDF-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to convert single or multi frame TIFF to PDF in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TIFFtoPDF.aspx.cs" Inherits="WebSampleBrowser.Pdf.TIFFtoPDF" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to convert single or multi frame TIFF images to PDF. 

	</div>
    
   
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 5px 5px 5px; background-color: #EDF0F7;">
                    <table width="100%">
                        <tr>
                            <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" 
                                     />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server"
                                     OnClick="Button1_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
           </br>
				 <div style = "font-size: 17px;font-weight: 400;">
        More information about TIFF to PDF document can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-document-conversions#converting-tiff-to-pdf">section.</a>



           </div>
</asp:Content>

