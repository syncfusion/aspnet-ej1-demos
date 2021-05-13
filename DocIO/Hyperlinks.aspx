<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="Hyperlinks.aspx.cs" Inherits="WebSampleBrowser.DocIO.Hyperlinks" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    This sample illustrates Essential DocIO's support for Hyperlinks.
    <script language="javascript" type="text/javascript">
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_initializeRequest(InitializeRequest);
        prm.add_endRequest(EndRequest);
        var postBackElement;
        function InitializeRequest(sender, args) {
            ShowPopup();
        }
        function ShowPopup() {
            var table = $get('PanelTable');
            var bound = Sys.UI.DomElement.getBounds(table);
            var popup = $get('ProgressIndicator');
            popup.style.height = bound.height + "px";
            popup.style.width = bound.width + "px";
            Sys.UI.DomElement.setLocation(popup, bound.x, bound.y);
            popup.style.display = 'block';
            table.className = "transparent_class";
        }
        function HidePopup() {
            $get('ProgressIndicator').style.display = 'none';
            $get('PanelTable').className = "";
        }
        function EndRequest(sender, args) {
            HidePopup();
        }
    </script>
    <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr>
            <td>
                <b>Select Hyperlink</b><div>
                    <br style="line-height: 10px" />
                </div>
                <div style="margin-top: 3px">
                    <asp:UpdatePanel ID="ListBoxPanel" runat="server">
                        <ContentTemplate>
                            <asp:RadioButtonList Width="100%" ID="RadioButtonList" runat="server" AutoPostBack="True"
                                RepeatDirection="Horizontal" OnSelectedIndexChanged="RadioButtonList_SelectedIndexChanged">
                                <asp:ListItem Selected="True">Web</asp:ListItem>
                                <asp:ListItem>Email</asp:ListItem>
                                <asp:ListItem>File</asp:ListItem>
                                <asp:ListItem>Bookmark</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:ListBox Style="margin-top: 5px" ID="detailsListBox" runat="server" Width="100%"
                                AutoPostBack="True" OnSelectedIndexChanged="detailsListBox_SelectedIndexChanged">
                            </asp:ListBox>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
                <b>Edit Hyperlink</b><div>
                    <br style="line-height: 10px" />
                </div>
                <div style="border: solid 1px #788DB3; padding: 0px 10px 0px 10px; background-color: #DEECFF;">
                    <asp:UpdatePanel ID="EditPanel" runat="server">
                        <ContentTemplate>
                            <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td height="13px">
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100">
                                        <asp:Label ID="Label1" runat="server" Text="Web Text"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox1" Width="250px" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="13px">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label2" runat="server" Text="Uri"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox2" Width="250px" runat="server"></asp:TextBox><br />
                                        <asp:FileUpload Width="255px" ID="File1" runat="server" Enabled="false"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td height="13px">
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <br />
                <b>Create Document</b><div>
                    <br style="line-height: 10px" />
                </div>
                <div>
                    <table width="100%" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td height="13px">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Width="100%" Style="text-align: justify;" ID="label6" runat="server" Text="Click the button below to view the Word document generated by Essential DocIO. 
                           Please note that MS Word Viewer or MS Word is required to view the resultant document."></asp:Label>
                            </td>
                        </tr>
                        <tr height="10px">
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label Width="65px" ID="Label3" runat="server" Text="Save As :"></asp:Label>
                                <asp:RadioButton ID="rdButtonWord97To2003" runat="server" GroupName="Group1" Text="Word 97-2003" />
                                <asp:RadioButton Style="margin-left: 5px" ID="rdButtonWord2007" runat="server" GroupName="Group1"
                                    Text="Word 2007" />
                                <asp:RadioButton Style="margin-left: 5px" ID="rdButtonWord2010" runat="server" GroupName="Group1"
                                    Text="Word 2010" />
                                <asp:RadioButton Style="margin-left: 5px" ID="rdButtonWord2013" runat="server" GroupName="Group1"
                                        Text="Word 2013" Checked="True" />
                                <asp:RadioButton Style="margin-left: 5px" ID="rdButtonWordML" runat="server" GroupName="Group1"
                                        Text="WordML" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Button Style="margin-top: 3px" Width="150px" ID="CreateDoc" runat="server" Text="Generate Document"
                                    OnClick="CreateDoc_Click" />
                                <asp:Button Style="margin-top: 3px" Width="150px" ID="ShowTemplate" runat="server"
                                    Text="Show Template" OnClick="ShowTemplate_Click" />
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
    <div id="ProgressIndicator" style="display: none; position: absolute;">
        <table width="100%" height="100%">
            <tr>
                <td align="center" valign="middle">
                    <img src="../images/waiting_triangle.gif" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
