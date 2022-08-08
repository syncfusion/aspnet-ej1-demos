<%@ Page Title="PDF-XFA Form Creation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create registration form using XFA form fields in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="XFAFormCreation.aspx.cs" Inherits="WebSampleBrowser.Pdf.XFAFormCreation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to create registration form using XFA form fields. The Essential PDF supports to create dynamic and static XFA form fields.


	</div>
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                        <tr>
                            <td align="left" valign="middle">  
                                 <asp:CheckBox ID="CheckBox1" Height="23px" runat="server" Text=" Open Document inside Browser" />                             
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server" OnClick="Button1_Click"
                                    Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />               
           <div style = "font-size: 17px;font-weight: 400;">
More information about the XFA can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-xfa">section.</a>


           </div>
</asp:Content>

