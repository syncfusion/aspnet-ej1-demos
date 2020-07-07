<%@ Page Title="PDF-Table Features-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create richly formatted table with defined styles in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TableFeatures.aspx.cs" Inherits="WebSampleBrowser.Pdf.TableFeatures" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates the creation of richly formatted table to keep your data organized for both basic and advanced operation on cells, rows, and columns along with headers and footers. 



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
More information about the document settings can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-tables"> section. </a>


           </div>
</asp:Content>

