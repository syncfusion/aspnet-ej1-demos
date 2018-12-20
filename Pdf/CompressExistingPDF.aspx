<%@ Page Title="PDF-Compress Existing PDF-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to compress the PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CompressExistingPDF.aspx.cs" Inherits="WebSampleBrowser.Pdf.CompressExistingPDF" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server"> 
    <div style = "font-size: 17px;font-weight: 400;">
			    This sample demonstrates the optimization of an existing PDF document based on image quality, page content, metadata, and font to reduce the file size of the PDF document.
	</div>
               
                <br />
                <label>Choose a PDF file to compress</label>
                    <div style="border: solid 1px #EDEDED; padding: 5px 7px 5px 7px;">
                        <table width="100%">
                            <tr>
                                <td>
                                    <div>
                                        <input type="file" name="file1" id="File1" runat="server" style="margin-left: 5px;width:70%"
                        accept="application/pdf" />
                    <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                                    </div>
                                </td>
                            </tr>
                        </table>                         
                    </div>

                <br />
                    <label>
                        Compression Options
                    </label>
                    <br />
                    <div style="border: solid 1px #EDEDED; padding: 5px 7px 5px 7px;">

                        <table width="100%">
                            <tr>
                                <td align="left" width="50%" style="padding:5px 7px 5px 7px">
                                   <asp:CheckBox runat="server" ID="compressImage" Checked ="true" AutoPostBack="true" OnCheckedChanged="compressImage_CheckedChanged"/>&nbsp; Compress Image 
                                </td>
                                <td align="right" width="50%" style="padding:5px 7px 4px 7px">                                   
                                        Image Quality   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                  
                                   <asp:DropDownList Width="25%" runat="server" ID="imageQuality">
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem >30</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem Selected="True">50</asp:ListItem>
                                    <asp:ListItem>60</asp:ListItem>
                                       <asp:ListItem>70</asp:ListItem>
                                       <asp:ListItem>80</asp:ListItem>
                                       <asp:ListItem>90</asp:ListItem>
                                       <asp:ListItem>100</asp:ListItem>
                                </asp:DropDownList> 
                                </td>
                            </tr>
                            <tr>
                                <td align="left" width="50%" style="padding:5px 7px 5px 7px">
                                    <asp:CheckBox runat="server" ID="optPageContents" Checked ="true"/>&nbsp; Optimize Page Contents                                   
                                </td>
                                <td align="right" width="50%" style="padding:5px 7px 5px 7px">
                                    <asp:CheckBox runat="server" ID="removeMetadata" Checked ="true"/> &nbsp;Remove Metadata Information                                 
                                </td>
                            </tr>
                            <tr>
                                <td align="left" width="50%" style="padding:5px 7px 5px 7px">
                                   <asp:CheckBox runat="server" ID="optFont" Checked ="true"/>&nbsp; Optimize Font                             
                                    
                                </td>
                                <td align="right" width="50%" style="padding:5px 7px 5px 7px">
                                    <label for="Opentype">
                                    </label>
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
                                    OnClick="Button1_Click" Text="Compress PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
				  <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
		
				
		This feature can be used to reduce response times in web based applications, mails and more.
More information about compression can be found in this documentation </a> and <a href="https://help.syncfusion.com/file-formats/pdf/working-with-compression#compressing-existing-pdf-document">section.</a>


           </div>
          
</asp:Content>

