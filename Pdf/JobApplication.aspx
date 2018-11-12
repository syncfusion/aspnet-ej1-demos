<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="JobApplication.aspx.cs" Inherits="WebSampleBrowser.Pdf.JobApplication" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			        This sample demonstrates the creation of job application form from the scratch using <a href="https://help.syncfusion.com/file-formats/pdf/working-with-forms">form fields.</a> The user can fill the online job application, then download as a PDF document.

	</div>
	<br/>
    
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="left">
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
		
				
		This is a good example that illustrates how to use the Essential PDF in any requirements like invoice, job applications, pay slips, bank statements and more.
           </div>
</asp:Content>
