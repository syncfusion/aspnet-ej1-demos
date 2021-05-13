<%@ Page Title="PDF-XPS to PDF-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to convert XPS to PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="XPStoPDF.aspx.cs" Inherits="WebSampleBrowser.Pdf.XPStoPDF" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to convert XPS to PDF document.

	</div>
    
      <br />
                    <div>
                        <b>Select Document</b>
                        <asp:FileUpload ID="FileUpload1" Width="75%" runat="server" />
                    </div>
                    <br />
                   
                    <br />
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:CheckBox runat="server" ID="CheckBox1" Text=" Open File inside the Browser"
                                        AutoPostBack="false" />
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnXPStoPDF" Width="128px" Height="24px" runat="server" Text="Convert to PDF"
                                        OnClick="btnXPStoPDF_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
              
        <div>
            <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
                runat="server" Text=""></asp:Label>
        </div>
		<br />
		 <div style = "font-size: 17px;font-weight: 400;">
More information about XPS to PDF document can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-document-conversions#converting-xps-document-to-pdf">section.</a>



           </div>
		
    
</asp:Content>

