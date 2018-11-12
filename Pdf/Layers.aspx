<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Layers.aspx.cs" Inherits="WebSampleBrowser.Pdf.Layers" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates adding layers (Optional Content Group) with different shapes in the PDF document. 
The Essential PDF also supports to create, merge, and toggle the layers.



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
		
This feature can be used in CAD drawings, maps, layered artworks, and multi-language documents.
More information about the layers can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-layers">section.</a>
 


           </div>
</asp:Content>