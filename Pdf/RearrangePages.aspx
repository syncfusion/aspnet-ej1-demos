<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RearrangePages.aspx.cs" Inherits="WebSampleBrowser.Pdf.RearrangePages" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
	This sample demonstrates how to rearrange pages from an existing PDF document to make the document meaningful.

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
More information about rearrange pages can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-pages#rearranging-pages-in-an-existing-document">section.</a>



           </div>
</asp:Content>
