<%@ Page Title="PDF-Named Destination-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create a named destination in the PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NamedDestination.aspx.cs" Inherits="WebSampleBrowser.Pdf.NamedDestination" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to create a named destination in the PDF document. 
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
                                    OnClick="Button" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
					</div>
					  <br/>
		 <div style = "font-size: 17px;font-weight: 400;">
	Named destination is the process of linking pages or destination within PDF document and can be used to open the PDF with the desired location and magnification in a webpage.
More information about the named destination can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-named-destination">section.</a>




           </div>
           
</asp:Content>

