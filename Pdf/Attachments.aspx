<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Attachments.aspx.cs" Inherits="WebSampleBrowser.Pdf.Attachments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to attach files in the PDF document. The attachment files can be of any file format type with information.It is also possible to extract and remove attachments from the PDF document.

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
				  <br/>
		 <div style = "font-size: 17px;font-weight: 400;">
	More information about the attachments can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-attachments">section.</a>




           </div>
          
</asp:Content>
