<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="CloneAndMerge.aspx.cs" Inherits="WebSampleBrowser.DocIO.CloneAndMerge" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>This sample illustrates how to clone and merge Word documents using Essential DocIO. The cloning and merging feature allows to combine the sections or contents of many documents into a single document.</p>
    <p>
Click the button to view the generated Word document or PDF. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document and PDF viewer is required to view the resultant PDF.
    </p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
               <td>
                    <div>
                        <table width=100%>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:Label Width="240px" runat="server" ID="label2" Text="Clone And Merge Options:"></asp:Label>
                                    <br style="line-height: 15px" />
                                    <asp:RadioButton  Style="margin-left: 5px" ID="rdButtonClone" runat="server" 
                                        GroupName="Group2" Text="Use Clone functionality"
                                        Checked="True" oncheckedchanged="rdButtonClone_CheckedChanged" AutoPostBack="True" />
                                    <br/>
                                    <asp:RadioButton Style="margin-left: 5px" ID="rdButtonImport" runat="server" GroupName="Group2"
                                        Text="Use Import contents functionality" 
                                        oncheckedchanged="rdButtonImport_CheckedChanged" AutoPostBack="True"/>
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="left">
                                    <div>
                                    <br style="line-height: 5px" />
                                        <asp:Label Style="margin-left:53px" ID="label3" runat="server" Text="Import Options" Width="100px"></asp:Label>
                                        <asp:DropDownList ID="comboBoxImportOptions" runat="server" Width="165px" Enabled="False">
                                            <asp:ListItem>KeepSourceFormatting</asp:ListItem>
                                            <asp:ListItem>MergeFormatting</asp:ListItem>
                                            <asp:ListItem>KeepTextOnly</asp:ListItem>
                                            <asp:ListItem>UseDestinationStyles</asp:ListItem>
                                            <asp:ListItem>ListContinueNumbering</asp:ListItem>
                                            <asp:ListItem>ListRestartNumbering</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table width="100%">
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:Label Width="65px" runat="server" ID="label1" Text="Save As :"></asp:Label>
                                      <asp:RadioButton Style="font-size:13px;text-align:match-parent" ID="rdButtonDoc" runat="server" GroupName="Group1" Text="DOC" ToolTip="Saves the resultant document as Word Doc format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonDocx" runat="server" GroupName="Group1"
                                        Text="DOCX" Checked="True" ToolTip="Saves the resultant document as Word Docx format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonWordML" runat="server" GroupName="Group1"
                                        Text="WordML" ToolTip="Saves the resultant document as WordML format" />
                                    <asp:RadioButton Style="margin-left: 9px;font-size:13px;text-align:match-parent" ID="rdButtonPdf" runat="server" GroupName="Group1"
                                        Text="PDF" ToolTip="Saves the resultant document as PDF" />
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
                    <br />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>