<%@ Page Title="DocIO-Form Filling and Protection-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="FormFillingAndProtection.aspx.cs" Inherits="WebSampleBrowser.DocIO.FormFillingAndProtection" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
    This sample illustrates filling form and protecting the content controls in an existing Word document using Essential DocIO.
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
                            <tr>
                                <td height="10px">
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
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

