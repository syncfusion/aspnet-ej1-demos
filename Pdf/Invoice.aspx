<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="WebSampleBrowser.Pdf.Invoice" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
			       This sample demonstrates the creation of invoice from the scratch using several elements such as <a href="https://help.syncfusion.com/file-formats/pdf/working-with-images">images</a>,  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text">text</a>,  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-shapes">shapes</a> and  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-tables">tables</a>

	</div>
	<br/>
        
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                            <tr>
                                <td align="left" valign="bottom">
                                    <asp:ListBox  SelectionMode="Single" Height="73px"
                                        Width="158px" ID="listBox" runat="server"></asp:ListBox>
                                </td>
                                <td align="right">
                                    <asp:Button Width="100px"  ID="Button1"
                                        Height="25px" runat="server" OnClick="Button1_Click" Text="Create PDF" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <asp:CheckBox ID="CheckBox1"  Height="23px"
                        runat="server" Text=" Open Document inside Browser" />
						</br>
						<div style = "font-size: 17px;font-weight: 400;">
		
				
		Likewise, we can create pay slips, bills, bank statements and more using our Essential PDF library.
           </div>
               
</asp:Content>
