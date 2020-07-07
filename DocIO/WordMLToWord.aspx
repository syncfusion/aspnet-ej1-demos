<%@ Page Title="DocIO-WordML to Word-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="WordMLToWord.aspx.cs" Inherits="WebSampleBrowser.DocIO.WordMLToWord" %>

<asp:Content ID="Content8" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample illustrates how to convert WordML to Word document using Essential DocIO.
    <div>
        <table width="850px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <div>
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <b>Select Document</b>
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <div>
                            <asp:FileUpload ID="FileUpload1" accept=".xml" Width="385px" runat="server" />
                        </div>
                        <br />
                        <div>
                            <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button to view the generated Word document. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document."></asp:Label>
                        </div>
                        <br />
                        <div>
                            <table width="100%">
                                <tr>
                                <td valign="middle" align="left">
                                    <asp:Label Width="65px" runat="server" ID="label2" Text="Save As :"></asp:Label>
                                    <asp:RadioButton Style="font-size:13px;text-align:match-parent" ID="rdButtonDoc" runat="server" GroupName="Group1" Text="DOC" ToolTip="Saves the resultant document as Word Doc format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonDocx" runat="server" GroupName="Group1"
                                        Text="DOCX" Checked="True" ToolTip="Saves the resultant document as Word Docx format" />
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>	
                                <tr>
                                    <td align="left">
                                        <asp:Button Width="150px" ID="btnWordMLToDoc" Height="27px" runat="server" Text="Convert to Word"
                                            OnClick="btnWordMLToDoc_Click" />
                                    </td>
                                </tr>
                            </table>
                            <div>
                                <br style="line-height: 10px" />
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
                runat="server" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

