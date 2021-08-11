<%@ Page Title="PDF-PDF To PDFA1b-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to convert PDF to PDF/A-1b in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PDFA1bConverter.aspx.cs" Inherits="WebSampleBrowser.Pdf.PDFA1bConverter" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			      This sample demonstrates the conversion of PDF to PDF/A-1b standard document using Essential PDF.
	</div>
    <br />
        <label>Choose a PDF file to convert</label>
            <div style="border: solid 1px #EDEDED; padding: 5px 7px 5px 7px;">
                <table width="100%">
                    <tr>
                        <td>
                            <div>
                                <input type="file" name="file1" id="File1" runat="server" accept=".pdf" style="margin-left: 5px;width:70%" />
                    <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1"
                        ErrorMessage="Choose a valid PDF file" ></asp:RequiredFieldValidator>
                            </div>
                        </td>
                    </tr>
                </table>                         
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
                                         OnClick="Button1_Click" Text="Generate PDF" />
                                </td>
                            </tr>
                        </table>
                    </div>
					  <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
		
				
		This feature can be used for long term archiving and standardization.
More information about conformance can be found in this documentation </a> and <a href="https://help.syncfusion.com/file-formats/pdf/working-with-pdf-conformance">section.</a>

           </div>
		   
		   
               
</asp:Content>

