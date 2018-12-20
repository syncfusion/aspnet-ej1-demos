<%@ Page Title="DocIO-Word to PDF-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="DocToPDF.aspx.cs" Inherits="WebSampleBrowser.DocIO.DocToPDF" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample illustrates how to convert Word document to PDF using Essential DocIO.
    <div>
        <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
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
                            <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button to view the resultant PDF document being converted from Word document using Essential DocIO and Essential PDF. PDF viewer is required to view the resultant PDF."></asp:Label>
                        </div>
                        <br />
                        <div>
                            <table width="100%" cellpadding="50" cellspacing="50" border="0">
                                 <tr>
                                    <td align="left">
                                       <asp:CheckBox runat="server" ID="chkBox1" Checked="True" Text="Enables fast rendering, generates PDF faster." />
                                    </td>
                                </tr>
                                 <tr>
                                    <td><b>PDF Options :</b></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox runat="server" ID="CheckBox1" Text="Preserve structure tags, generates PDF document with accessiblity support."/>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox runat="server" ID="CheckBox2" Checked="True" Text="Preserve form fields, generates PDF Document with PDF form fields for equivalent Word document form fields." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox runat="server" ID="CheckBox3" Checked="True" Text="Convert Word headings to PDF bookmarks, generates PDF document with bookmarks for Word document paragraph with heading style and outline level." />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox runat="server" ID="CheckBox6" Checked="False" Text="Show the revision marks in the generated PDF for tracked changes or revisions in the Word document." />
                                    </td>
                                </tr>
                                <tr>
                                    <td><b>Embed Fonts :</b></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox runat="server" ID="CheckBox5" Text="Enables subset font, generates PDF document by embedding subset fonts information." />
								    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:CheckBox runat="server" ID="CheckBox4" Text="Enables complete font, generates PDF document by embedding complete fonts information." />
                                    </td>
                                </tr>
                                <tr>
                                    <td height="10px">
									</td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Button ID="btnDocToPDF" Width="150px" Height="27px" runat="server" Text="Convert to PDF"
                                            OnClick="btnDocToPDF_Click" />
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
    <p>DocIO provides support to render word document from flow to fixed page model and expert as PDF or image with this support to render word document.<br /></p>
    <ul>
        <li>You can generate invoice and other report in pdf staring from word document.</li>
        <li>You can view or print the content of word document by converting as PDF and loading generated pdf via PDF Viewer.</li>
        <li>You can generate pdf more faster by enabling fast render option and embed fonts by enabong font embed option.</li>
    </ul>
</asp:Content>

