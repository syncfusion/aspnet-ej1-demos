<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MergeDocuments.aspx.cs" Inherits="WebSampleBrowser.Pdf.MergeDocuments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
  <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to merge two different PDF documents into single PDF document. It is also possible to import pages to the PDF document. 
	</div>
    
                <br />
    <asp:Label ID="lb_error" runat="server" ForeColor="Orange" EnableViewState="false"
        Visible="false" Text="Label"></asp:Label><br />
    <br />
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr style="margin-top: 5px;">
            <td align="left">
                <b>Specify two PDF documents to merge</b>
                <div style="border: solid 1px #788DB3; line-height: 20px; padding: 10px; background-color: #EDF0F7;">
                    <table width="100%">
                        <tr>
                            <td align="left">
                                <asp:Label runat="server" Text="Document 1: "></asp:Label>
                            </td>
                            <td align="left">
                                <input type="file" name="file1" id="File1" runat="server" style="width: 320px" accept="application/pdf" />
                                <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text="Document 2: "></asp:Label>
                            </td>
                            <td align="left">
                                <input type="file" name="file2" id="File2" runat="server" style="width: 320px" accept="application/pdf"
                                    onclick="return File2_onclick()" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="File2"
                                    ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
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
                                    OnClick="btnMerge_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
	  <br />
	<div style = "font-size: 17px;font-weight: 400;">
   This feature can be used to assemble PDF documents for printing, electronic distribution, and bundle PDF for archiving.
More information about the merge and import pages can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/merge-documents">section.</a>






           </div>
           
</asp:Content>
