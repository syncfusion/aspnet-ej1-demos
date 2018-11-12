<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TextExtraction.aspx.cs" Inherits="WebSampleBrowser.Pdf.TextExtraction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to extract the text from the PDF document. 

	</div>
                
                <br />
                   
                    <b>Source Document</b>
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table width="100%">
                            <tr>
                                <td>
                                    <asp:Label runat="server" Style="margin-left: 3px" ID="label2" Font-Bold="true" Text="Source:"></asp:Label>
                                </td>
                                <td>
                                    <asp:FileUpload ID="fileUpload1" Width="299px" runat="server" />
                                    <asp:RequiredFieldValidator ID="requiredFieldValidator" runat="server" ControlToValidate="fileUpload1"
                                        ErrorMessage=" *" Width="5px" Height="16px"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr align="right">
                                <td>
                                </td>
                                <td align="right">
                                    <asp:Button Width="100px" Style="margin-right: 10px" ID="Button1" Height="27px" runat="server"
                                         OnClick="Button1_Click" Text="Extract Text" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                    <b>Extracted Text</b>
                    <table width="100%">
                        <tr>
                            <td>
                                <asp:TextBox TextMode="MultiLine" Width="100%" Height="220px" Wrap="true" ID="TextBox1"
                                    runat="server" Text=""></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
				</br>
				   <div style = "font-size: 17px;font-weight: 400;">
This feature can be used to extract information such as user data, billing information from invoice, address, and so on from the PDF document for indexing and archiving.
More information about the text extraction can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-text-extraction">section.</a>



           </div>
           
</asp:Content>
