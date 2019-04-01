<%@ Page Title="PDF-Split PDF-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to split PDF document into multiple PDF pages in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SplitPDF.aspx.cs" Inherits="WebSampleBrowser.Pdf.SplitPDF" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to split the PDF pages into multiple PDF documents.
	</div>
    <asp:Label ID="lb_error" runat="server" ForeColor="Orange" EnableViewState="false"
        Visible="false" Text="Label"></asp:Label><br />
    <br />
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr style="margin-top: 5px;">
            <td align="left">
                <div style="border: solid 1px #788DB3; line-height: 20px; padding: 10px; background-color: #EDF0F7;">
                    <asp:Label runat="server" ID="label1" Text="PDF document to split"></asp:Label>
                    <input type="file" name="file1" id="File1" runat="server" style="margin-left: 5px;width:70%"
                        accept="application/pdf" />
                    <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                    <br />
                    <asp:Label runat="server" ID="label2" Width="163px" Text="Page to split-at"></asp:Label>
                    <asp:TextBox ID="txtSplitAtPage" Width="147px" runat="server">1</asp:TextBox>
                </div>
               
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                    OnClick="btnSplit_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
	  <br />
	<div style = "font-size: 17px;font-weight: 400;">
  This feature can be used to split the necessary pages from the PDF document, split a large sized PDF into a smaller one and more.

           </div>
	
</asp:Content>

