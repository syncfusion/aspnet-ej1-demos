<%@ Page Title="PDF-Bullets and Lists-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create ordered and unordered list in PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="BulletsAndLists.aspx.cs" Inherits="WebSampleBrowser.Pdf.BulletsAndLists" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			  This sample demonstrates how to list the content in ordered and unordered list. The ordered list can be number or alphabets and the unordered list can be bullets, circles, and images.
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
		
		More information about the list can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text#adding-an-ordered-list">section.</a>


           </div>
           
</asp:Content>

