<%@ Page Title="DocIO-Table Styles-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="TableStyles.aspx.cs" Inherits="WebSampleBrowser.DocIO.TableStyles" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
   <p>This sample demonstrates how to apply a predefined built-in and custom style to a table in the Word document using Essential DocIO.</p>
    <p>Click the button to view the generated Word document or PDF. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document and PDF viewer is required to view the resultant PDF.</p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td class="style3">
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>                                
                                <td valign="middle" align="left" class="style2">
                                    <asp:Label Width="65px" runat="server" ID="label1" Text="Save As :"></asp:Label>
                                    <asp:RadioButton Style="font-size:13px;text-align:match-parent" ID="rdButtonDocx" runat="server" GroupName="Group1"
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
                                        Text="Built-In Styles" />
                                </td>
                            </tr>
                             <tr>
                                <td height="10px">
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Button Width="150px" ID="Button2" Height="27px" runat="server" OnClick="Button2_Click"
                                        Text="Custom Styles" />
                                </td>
                            </tr>
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <br style="line-height: 10px" />
                    </div>
                    <br />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

