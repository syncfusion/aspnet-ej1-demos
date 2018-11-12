<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ImportAndStamp.aspx.cs" Inherits="WebSampleBrowser.Pdf.ImportAndStamp" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to stamp an existing PDF document using text. The Essential PDF supports both stamp or watermark with text and images in the PDF document.
	</div>
    <asp:Label ID="lb_error" runat="server" ForeColor="Orange" EnableViewState="false"
        Visible="false" Text="Label"></asp:Label><br />
    <br />
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td align="left">
                <div style="border: solid 1px #788DB3; line-height: 20px; padding: 10px; background-color: #EDF0F7;">
                    <asp:Label runat="server" ID="label1" Text="PDF document to import"></asp:Label>
                    <input type="file" name="file1" id="File1" runat="server" style="margin-left: 5px;"
                        accept="application/pdf" />
                    <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label runat="server" ID="label2" Width="148px" Text="Stamping Text"></asp:Label>
                    <asp:TextBox ID="txtStamp" runat="server" Width="70%" Text="Imported Content using Essential PDF"></asp:TextBox>
                </div>
                <br />
               
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                    OnClick="btnImport_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
	  <br />
	<div style = "font-size: 17px;font-weight: 400;">
This feature can be used to stamp the PDF document for draft, confidential, review purpose only, company logo, copyright notice and more.
More information about the stamp or watermark can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-watermarks">section.</a>


           </div>
</asp:Content>
