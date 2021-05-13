<%@ Page Title="DocIO-Document Protection-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="DocumentProtection.aspx.cs" Inherits="WebSampleBrowser.DocIO.DocumentProtection" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
    This sample illustrates protecting the Word document using Essential DocIO.
        </p>
    <p>
        Click the button to view the generated Word document. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document.
    </p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <div>
                        <table width=100%&gt;
                            &lt;tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="left">
                                    <div>
                                        <asp:Label ID="Label3" runat="server" Text="Protection Type" Width="100px"></asp:Label>
                                        &nbsp;<asp:DropDownList ID="comboBox1" runat="server" Style="margin-top: 0px"
                                            Width="160px">
                                            <asp:ListItem>AllowOnlyFormFields</asp:ListItem>
                                            <asp:ListItem>AllowOnlyComments</asp:ListItem>
                                            <asp:ListItem>AllowOnlyRevisions</asp:ListItem>
                                            <asp:ListItem>AllowOnlyReading</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="left">
                                    <div>
                                        <br style="line-height: 5px" />
                                        <asp:Label ID="Label2" runat="server" Text="Password" Width="88px"></asp:Label>
                                        <asp:TextBox ID="textBox1" runat="server" TextMode="Password" Width="156px" Style="margin-left: 17px"></asp:TextBox>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="left">
                                    <br style="line-height: 5px" />
                                    <asp:Label Width="62px" runat="server" ID="label1" Text="Save As :"></asp:Label>
                                   <asp:RadioButton Style="font-size:13px;text-align:match-parent" ID="rdButtonDoc" runat="server" GroupName="Group1" Text="DOC" ToolTip="Saves the resultant document as Word Doc format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonDocx" runat="server" GroupName="Group1"
                                        Text="DOCX" Checked="True" ToolTip="Saves the resultant document as Word Docx format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonWordML" runat="server" GroupName="Group1"
                                        Text="WordML" ToolTip="Saves the resultant document as WordML format" />
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Button Width="150px" ID="Button1" Height="27px" runat="server" OnClick="Button1_Click"
                                        Text="Generate Document" />
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

