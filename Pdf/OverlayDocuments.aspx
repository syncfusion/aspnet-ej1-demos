<%@ Page Title="PDF-Overlay Documents-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to overlay PDF documents in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="OverlayDocuments.aspx.cs" Inherits="WebSampleBrowser.Pdf.OverlayDocuments" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to overlay two different PDF documents into a single PDF document. 
	</div>
	  <br />
    <asp:Label ID="lb_error" runat="server" ForeColor="Orange" EnableViewState="false"
        Visible="false" Text="Label"></asp:Label><br />
    <br />
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr style="margin-top: 5px;">
            <td align="left">
                <b>Specify two template documents to import</b>
                <div style="border: solid 1px #788DB3; line-height: 20px; padding: 10px; background-color: #EDF0F7;">
                    <asp:Label runat="server" Width="110px" ID="label1" Text="Border Template"></asp:Label>
                    <asp:TextBox ID="txtBorder" runat="server" Width="75%" Text="BorderTemplate.pdf" Enabled="false"></asp:TextBox>
                    <br />
                    <asp:Label runat="server" ID="label2" Width="110px" Text="Source Template"></asp:Label>
                    <input id="File1" style="" accept="application/pdf" type="file" name="file1" runat="server" />
                    <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1"
                        ErrorMessage="*"></asp:RequiredFieldValidator>
                </div>
                <br />
               
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:CheckBox ID="CheckBox1" Style="margin-left: 3px" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 5px" ID="Button1" Height="27px" runat="server"
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
 This feature can be used to draw template pages from one document into another for easy designing. 

           </div>
</asp:Content>

