<%@ Page Title="PDF-Portfolio-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create PDF portfolio in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Portfolio.aspx.cs" Inherits="WebSampleBrowser.Pdf.Portfolio" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to create portfolio in the PDF document. You can also extract and remove files from the PDF portfolio.

	</div>
      
          
                      <br />
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="right">
                                     <asp:Button ID="Button1"  Width="128px" Height="27px" runat="server" Text="Create Portfolio"
                                        OnClick="Button1_Click" />
                                </td>                                
                            </tr>
                        </table>
                    </div>
                  
               
            
        
        <div>
            <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
                runat="server" Text=""></asp:Label>
        </div>
		  <br/>
		 <div style = "font-size: 17px;font-weight: 400;">
	This feature allows the user to bring content together from variety of sources including documents, drawings, images, emails, spreadsheets, and web pages.
More information about the portfolio can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-portfolio">section.</a>



           </div>
    
</asp:Content>

