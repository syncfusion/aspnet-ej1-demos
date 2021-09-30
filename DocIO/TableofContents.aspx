<%@ Page Title="DocIO-Table of Contents-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="TableofContents.aspx.cs" Inherits="WebSampleBrowser.DocIO.TableofContents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample showcases how to insert and update the Table of Contents (TOC) in a Word document using Essential DocIO. TOC is a field which acts as an index to the Word document.
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
                                <td height="20px">
                                </td>
                            </tr>	
            <tr>
                <td valign="middle" align="left">
                    <b>Index/Table</b><br />
                    <asp:Label ID="Label2" runat="server" Text=" " Height="10px" Width="120px"></asp:Label>
                    <div>
                        <asp:Label ID="Label3" runat="server" Text="Title" Width="120px"></asp:Label>
                        <asp:TextBox ID="TextBox1" runat="server" Width="180px" Height="16px">Table of Contents</asp:TextBox>
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:Label ID="Label8" runat="server" Text="Heading Level" Width="120px"></asp:Label>
                        <asp:Label ID="Label4" runat="server" Text="Lower Level" Width="115px"></asp:Label>
                        <asp:DropDownList ID="DropDownList1" runat="server" Width="65px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:Label ID="Label5" runat="server" Style="margin-left: 124px" Text="Upper Level"
                            Width="115px"></asp:Label>
                        <asp:DropDownList ID="DropDownList2" runat="server" Width="65px">
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                            <asp:ListItem>6</asp:ListItem>
                            <asp:ListItem>7</asp:ListItem>
                            <asp:ListItem>8</asp:ListItem>
                            <asp:ListItem>9</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:Label ID="Label7" runat="server" Text="Styles" Width="115px"></asp:Label>
                        <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" GroupName="Group2"
                            Text=" Default" oncheckedchanged="rdButtonDefault_CheckedChanged" AutoPostBack="True" />
                        <asp:RadioButton ID="RadioButton2" Style="margin-left: 40px" runat="server" GroupName="Group2"
                            Text=" Custom" oncheckedchanged="rdButtonCustom_CheckedChanged" AutoPostBack="True" />
                    </div>
                    <br />
                    <b>Entries</b><br />
                    <asp:Label ID="Label9" runat="server" Text=" " Height="10px" Width="120px"></asp:Label>
                    <div>
                        <asp:CheckBox ID="CheckBox2" runat="server" AutoPostBack="True" Checked="True" Text=" Include Page Numbers" />
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:CheckBox ID="CheckBox3" runat="server" AutoPostBack="True" Checked="True" Text=" Right Align Page Numbers" />
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:CheckBox ID="CheckBox4" runat="server" AutoPostBack="True" Checked="True" Text=" Use HyperLink" />
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:CheckBox ID="CheckBox5" runat="server" AutoPostBack="True" Checked="True" Text=" Use OutLineLevels" />
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:CheckBox ID="CheckBox6" runat="server" AutoPostBack="True" Text=" Use TableEntryFields" />
                        <br />
                        <div>
                            <br style="line-height: 10px" />
                        </div>
                        <asp:CheckBox ID="CheckBox7" runat="server" AutoPostBack="True" Text=" Update Table of Contents" />
                    </div>
                    <br />
                    <div style="border: none 1px transparent; background-color: transparent;">
                        <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button to view the generated Word document or PDF. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document and PDF viewer is required to view the resultant PDF."></asp:Label>
                    </div>
                    <br />
                    <div>
                        <table style="width: 100%">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:Label Width="65px" Style="margin-left: 3px" runat="server" ID="label1" Text="Save As :"></asp:Label>
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
                                    <asp:Button Width="150px" ID="Button1" Height="27px" runat="server"
                                        OnClick="Button1_Click" Text="Generate Document" />
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

