<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="HTMLToDoc.aspx.cs" Inherits="WebSampleBrowser.DocIO.HTMLToDoc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample illustrates how to convert HTML to Word document using Essential DocIO.
    <div>
        <table width="850px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <br />
                    <b>HTML File</b><br />
                    <div>
                        <br style="line-height: 10px" />
                    </div>
                    <div>
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="385px" />
                    </div>
                    
                    <br />
                    <div style="border: none 1px transparent; background-color: transparent;">
                        <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button to view the generated Word document. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document."></asp:Label>
                    </div>
                    
                    <div>
                        <table width="100%">
                            <tr>
                                <td valign="middle" align="left">
                                    <br style="line-height: 5px" />
                                    <asp:Label Width="65px" runat="server" ID="label2" Text="Save As :"></asp:Label>
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
                                    <asp:Button ID="Button1" runat="server" Height="27px" OnClick="Button1_Click" Text="Convert to Word"
                                        Width="150px"/>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <br />
        <asp:Label Width="100%" ForeColor="Red" Style="text-align: justify;" ID="label1"
            runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
