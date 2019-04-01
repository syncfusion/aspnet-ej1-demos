<%@ Page Title="PDF-PDF-A Sample-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create PDF/A-1b document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PDFA.aspx.cs" Inherits="WebSampleBrowser.Pdf.PDFA" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			      This sample demonstrates various PDF conformance support in Essential PDF. Essential PDF provides support for PDF/A-1b, PDF/A-2b, PDF/A-3b, and PDF/X-1a 2001 conformance.
	</div>
	<br/>
					<div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:RadioButton GroupName="conformancelevel" Width="165px" ID="radioButton1" Style="margin-left: 10px" runat="server" Checked="true" Text="&nbsp;&nbsp;PDF/A-1b" />
                                <asp:RadioButton GroupName="conformancelevel" Width="165px" ID="radioButton2" runat="server" Text="&nbsp;&nbsp;PDF/A-2b" />
                                <asp:RadioButton GroupName="conformancelevel" Width="165px" ID="radioButton3" runat="server" Text="&nbsp;&nbsp;PDF/A-3b" />
								<asp:RadioButton GroupName="conformancelevel" Width="165px" ID="radioButton4" runat="server" Text="&nbsp;&nbsp;PDF/X-1a 2001" />
                            </td>
                        </tr>
                    </table>
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
		
				
		This feature can be used for long term archiving and standardization.
More information about conformance can be found in this documentation </a> and <a href="https://help.syncfusion.com/file-formats/pdf/working-with-pdf-conformance">section.</a>

           </div>
		   
		   
               
</asp:Content>

