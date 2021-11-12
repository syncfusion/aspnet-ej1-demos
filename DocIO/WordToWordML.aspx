<%@ Page Title="DocIO-Word to WordML-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="WordToWordML.aspx.cs" Inherits="WebSampleBrowser.DocIO.WordToWordML" %>

<asp:Content ID="Content8" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample illustrates how to convert Word document to WordML using Essential DocIO.
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
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
                            <asp:FileUpload ID="FileUpload1" accept=".doc,.docx" Width="385px" runat="server" />
                        </div>
                        <br />
                        <div>
                            <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button to view the resultant WordML document generated by Essential DocIO. "></asp:Label>
                        </div>
                        <br />
                        <div>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="btnDocToWordML" Width="150px" Height="27px" runat="server" Text="Convert to WordML"
                                            OnClick="btnDocToWordML_Click" />
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
    </div>
    <div>
        <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
            runat="server" Text=""></asp:Label></div>
</asp:Content>

