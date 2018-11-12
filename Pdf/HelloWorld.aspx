<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HelloWorld.aspx.cs" Inherits="WebSampleBrowser.Pdf.HelloWorld" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
			       This sample demonstrates the creation of simple PDF document. It draws the string “Hello world!” in the desired location using the <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text#draw-text-using-standard-fonts">PDF standard font.</a> 

	</div>
	<br/>
   
               
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%">
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
		
				
		It is also possible to draw different language of text with different fonts using <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text#draw-text-using-truetype-fonts">TrueType fonts</a> and <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text#draw-text-using-cjk-fonts">CJK fonts.</a>
           </div>
		   
		   
</asp:Content>
