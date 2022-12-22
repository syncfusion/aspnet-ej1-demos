<%@ Page Title="DocIO-Image Insertion-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="ImageInsertion.aspx.cs" Inherits="WebSampleBrowser.DocIO.ImageInsertion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
    This sample illustrates inserting images of different formats(vector and scalar) into the Word document using Essential DocIO.
        </p>
    <p>
       Click the button to view the generated Word document or PDF. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document and PDF viewer is required to view the resultant PDF.
    </p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
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
            </tr>
        </table>
    </div>
</asp:Content>

