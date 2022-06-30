<%@ Page Title="PDF-XFA Form Filling-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to fill and flatten XFA form fields in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="XFAFormFilling.aspx.cs" Inherits="WebSampleBrowser.Pdf.XFAFormFilling" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to fill and flatten XFA form fields. It is possible to edit and remove the existing XFA form fields.


	</div>
                
                <br />
				<asp:CheckBox ID="CheckBox2" Height="23px" runat="server" Text="&nbsp;Flatten XFA Form" />
                <br />  
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                        <tr>
                            <td align="left">
                                <asp:Button ID="btnViewTemplate" Width="110px" Height="27px" runat="server" OnClick="btnViewTemplate_Click"
                                    Text="View Template" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server" OnClick="Button1_Click"
                                    Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <asp:CheckBox ID="CheckBox1" Height="23px" runat="server" Text="&nbsp;Open Document inside Browser" />
          <div style = "font-size: 17px;font-weight: 400;">
This feature can be used in filling forms from the database or from user and read out form fields for transferring user data to database.
More information about the XFA can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-xfa">section.</a>



           </div>
</asp:Content>

