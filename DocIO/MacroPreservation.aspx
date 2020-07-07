<%@ Page Title="DocIO-Macro Preservation-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="MacroPreservation.aspx.cs" Inherits="WebSampleBrowser.DocIO.MacroPreservation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
    This sample illustrates preservation of macros in macro-enabled documents (DOCM and DOTM) using Essential DocIO.
        </p>
    <p>
    <b>Note:</b>
    Currently DocIO doesn’t provide support for creation of Macros

        </p>
    <p>
        Click the button to view the generated Word document. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document.
    </p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                <td>
                    <div>
                        <table width="100%">
                            <br />
                            <tr>
                                <td align="left">
                                        <asp:Button Width="150px" ID="Button2" Height="27px" runat="server" OnClick="Button2_Click"
                                        Text="View Template" />
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

