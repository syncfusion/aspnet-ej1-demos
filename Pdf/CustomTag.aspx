<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomTag.aspx.cs" Inherits="WebSampleBrowser.Pdf.CustomTag" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
      <div style = "font-size: 17px;font-weight: 400;">
	This sample demonstrates how to create tagged PDF or accessible PDF from the scratch with custom tags.



	</div>
                <br />
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
          </br>
	 <div style = "font-size: 17px;font-weight: 400;">
This feature can be used for the people who require assistive technologies when the electronic content is ready.The Essential PDF supports creating tagged PDF with Section 508 compliant.More information about the tagged PDF can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-tagged-pdf">section.</a>



           </div>
</asp:Content>
