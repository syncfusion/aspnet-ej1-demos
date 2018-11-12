<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="InteractiveFeatures.aspx.cs" Inherits="WebSampleBrowser.Pdf.InteractiveFeatures" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates the creation of interactive invoice with  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-attachments">attachment</a>, product total price calculation based on the quantity using <a href="https://help.syncfusion.com/file-formats/pdf/working-with-action#javascript-action">PDF JavaScript</a>
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
                                         OnClick="Button1_Click" Text="Create PDF" />
                                </td>
                            </tr>
                        </table>
                    </div>
					 <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
	This example can be used in the real-time invoice generation with print, submit online, or mail the order functionalities.



           </div>
</asp:Content>
