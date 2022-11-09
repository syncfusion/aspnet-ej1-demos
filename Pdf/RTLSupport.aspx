<%@ Page Title="PDF-RTL Support-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to right-to-left language text in PDF in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RTLSupport.aspx.cs" Inherits="WebSampleBrowser.Pdf.RTLSupport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			  This sample demonstrates drawing right-to-left language text in the PDF document. It is possible to draw RTL languages such as Arabic, Hebrew, Persian, Urdu and more. 

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
		
				
		It is also possible to draw <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text#embedding-fonts-and-working-with-unicode-text">Unicode</a> text.
More information about drawing text can be found in this documentation</a> and <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text">section.</a>


           </div>
          
</asp:Content>

