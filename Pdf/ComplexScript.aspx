<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ComplexScript.aspx.cs" Inherits="WebSampleBrowser.Pdf.ComplexScript" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			  This sample demonstrates drawing complex script language text in the PDF document. It is possible to draw complex languages such as Thai, Hindi, Tamil, Kannada and more. 

	</div>
    <br>
    <div style="font-size: 17px;font-weight: 400;">
    <b>Note:</b> In this sample, we have used the Tahoma font from the system to draw Thai characters. So please make sure to install the font for it to work properly.
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
