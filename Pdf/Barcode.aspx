<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Barcode.aspx.cs" Inherits="WebSampleBrowser.Pdf.Barcode" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			 This sample demonstrates the creation of barcode in the PDF document and does not requires barcode font for creating barcode.It supports both 1D and 2D barcode with many customizing properties. 

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
		
		This feature can be used in invoice, super markets, health care systems and more.
More information about the barcode can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-barcode">section.</a>
 


           </div>
</asp:Content>