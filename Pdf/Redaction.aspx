<%@ Page Title="PDF-Redaction-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to redact text from PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library. Redacting images also possible." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Redaction.aspx.cs" Inherits="WebSampleBrowser.Pdf.Redaction" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates redacting a text from the PDF document. It is also possible to redact the images. The redaction is a process of removing sensitive or unwanted information from the PDF document.
	</div>
    <asp:Label ID="lb_error" runat="server" ForeColor="Orange" EnableViewState="false"
        Visible="false" Text="Label"></asp:Label><br />
    <br />
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr style="margin-top: 5px;">
            <td align="left">
                <div style="border: solid 1px #788DB3; line-height: 20px; padding: 10px; background-color: #EDF0F7;">
                    <div>
                        <table>
                            <tr style="width: 50%">
                                <td style ="width:16.5%">
                                    <asp:Label runat="server" ID="label1" Text="PDF document to redact"></asp:Label>
                                </td>
                                <td style ="width:10%">
                                    <input type="file" name="file1" id="File1" runat="server" accept="application/pdf" />
                                </td>
                                <td style ="width:5%; margin-left:0px">
                                    <asp:RequiredFieldValidator ID="validator" runat="server" ControlToValidate="File1" ErrorMessage="*"></asp:RequiredFieldValidator>
                                </td>
                                <td></td>
                            </tr>
                        </table>
                        <br />
                        <table>
                            <tr style="width: 100%">
                                <td style ="width:10%">
                                    <asp:Label runat="server" ID="label2" Width="163px" Text="X"></asp:Label>
                                </td>
                                <td style ="width:20%">
                                    <asp:TextBox ID="x" Width="147px" runat="server"></asp:TextBox>
                                </td>
                                <td style ="width:20%">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="x" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Invalid Entry"></asp:RegularExpressionValidator>
                                </td>
                                <td style ="width:10%">
                                    <asp:Label runat="server" ID="label3" Width="163px" Text="Y"></asp:Label>
                                </td>
                                <td style ="width:20%">
                                    <asp:TextBox ID="y" Width="147px" runat="server"></asp:TextBox>
                                </td>
                                <td style ="width:20%">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="y" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Invalid Entry"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr><td><br /></td></tr>
                            <tr style="width: 100%">
                                <td style ="width:10%">
                                    <asp:Label runat="server" ID="label4" Width="163px" Text="Width"></asp:Label>
                                </td>
                                <td style ="width:20%">
                                    <asp:TextBox ID="width" Width="147px" runat="server"></asp:TextBox>
                                </td>
                                <td style ="width:20%">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="width" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Invalid Entry"></asp:RegularExpressionValidator>
                                </td>
                                <td style ="width:10%">
                                    <asp:Label runat="server" ID="label5" Width="163px" Text="Height"></asp:Label>
                                </td>
                                <td style ="width:20%">
                                    <asp:TextBox ID="height" Width="147px" runat="server"></asp:TextBox>
                                </td>
                                <td style ="width:20%">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="height" ValidationExpression="([0-9])[0-9]*[.]?[0-9]*" ErrorMessage="Invalid Entry"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </div>                    
                </div>
               
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server" OnClick="btnSplit_Click" Text="Redact PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

