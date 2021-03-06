<%@ Page Title="PDF-Bookmarks-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to add bookmark in PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Bookmarks.aspx.cs" Inherits="WebSampleBrowser.Pdf.Bookmarks" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
       This sample demonstrates the support for adding bookmarks in the PDF document  
        </p>
    <table width="100%">
        <tr>
            <td align="left">
                <div>
                    <asp:Label Width="100%"  Style="text-align: justify;"
                        ID="label6" runat="server" Text="Click the button to view a PDF document generated by Essential PDF.  Please note that Adobe Reader or its equivalent is required to view the resultant document."></asp:Label>
                </div>
                <br />
                <div style="border: solid 1px #788DB3; padding: 5px 5px 5px 5px; background-color: #EDF0F7;">
                    <table width="100%">
                        <tr>
                            <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
                                <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" 
                                     />
                            </td>
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server"
                                     OnClick="Button1_Click" Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

