<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="WordToImage.aspx.cs" Inherits="WebSampleBrowser.DocIO.WordToImage" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample illustrates how to convert a Word document to Image using Essential DocIO. Essential DocIO has ability to convert entire Word document or single page to Image.
    <div>
        <table width="800px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
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
                            <asp:FileUpload ID="FileUpload1" Width="385px" runat="server" />
                        </div>
                        <br />
                        <div>
                            <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button to view the generated Image being converted from Word document using Essential DocIO."></asp:Label>
                        </div>
                        <br />
                        <div>
                            <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:Label Width="85px" runat="server" ID="label2" Text="Convert to :"></asp:Label>
                                    <asp:RadioButton ID="rdButtonPng" runat="server" GroupName="Group1" Text="PNG"
                                        Checked="True" ToolTip="Saves the resultant image as PNG" />
                                    <asp:RadioButton Style="margin-left: 5px" ID="rdButtonJpeg" runat="server" GroupName="Group1"
                                        Text="JPEG" ToolTip="Saves the resultant image as JPEG" />
                                    <asp:RadioButton Style="margin-left: 5px" ID="rdButtonBmp" runat="server" GroupName="Group1"
                                        Text="BMP" ToolTip="Saves the resultant image as BMP" />
                                        <asp:RadioButton Style="margin-left: 5px" ID="rdButtonEmf" runat="server" GroupName="Group1"
                                        Text="EMF" ToolTip="Saves the resultant image as EMF" />
                                </td>
                            </tr>
                                <tr>
                                <td height="10px">
                                </td>
                            </tr>	
                                <tr>
                                    <td align=left>
                                        <asp:Button ID="btnDocToImage" Width="150px" Height="27px" runat="server" Text="Convert to Image"
                                            OnClick="btnDocToImage_Click" />
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
