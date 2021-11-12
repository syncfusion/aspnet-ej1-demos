<%@ Page Title="PDF-Form Filling-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to fill PDF form fields and flatten the PDF form fields in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FormFilling.aspx.cs" Inherits="WebSampleBrowser.Pdf.FormFilling" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates how to fill and flatten the form fields to personalize your PDF document.It is also possible to create, edit, and delete the form fields using the Essential PDF library.

	</div>
                     
                    <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                        <tr>                            
                            <td align="left">
                                <asp:CheckBox ID="CheckBox2" Height="23px" runat="server" Text="Form Flatten" />
                            </td>
                            <td align="right">
                                <asp:Button ID="btnViewTemplate" Width="100px" Height="27px" runat="server" OnClick="btnViewTemplate_Click"
                                    Text="View Template" />
                            </td>
                        </tr>
                    </table>
                </div>               
              <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; margin-top:5px; background-color: #EDF0F7;">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                        <tr>
                            <td align="left">
                <asp:CheckBox ID="CheckBox1" Height="23px" runat="server" Text=" Open Document inside Browser" />
                                </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button2" Height="27px" runat="server" OnClick="Button1_Click"
                                    Text="Create PDF" />
                            </td>
                            </tr>
                        </table>
                  </div>
				   <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
	This feature can be used in filling forms from the database or from user, and read form fields for transferring user data to database.
More information about the forms can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-forms">section.</a>



           </div>
           
</asp:Content>

