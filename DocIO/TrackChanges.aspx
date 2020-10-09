<%@ Page Title="DocIO-Track Changes-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true" CodeBehind="TrackChanges.aspx.cs" Inherits="WebSampleBrowser.DocIO.TrackChanges" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>This sample demonstrates how to accept or reject the tracked changes in the Word document using Essential DocIO.</p>
    <p>
Click the button to view the generated Word document. Please note that Microsoft Word Viewer or Microsoft Word is required to view the resultant Word document na.
    </p>
    <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr>
               <td>
                    <div>
                        <table width=100%>
							
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:Label Width="240px" runat="server" ID="label2" Text="Track Changes Options:"></asp:Label>							                                                
									<br style="line-height: 5px" />
									<div>
                                        <asp:Label Style="margin-left:5px" ID="label3" runat="server" Text="Author Name :" Width="100px"></asp:Label>                                        
										<asp:DropDownList ID="comboBoxAuthorName" runat="server" Width="165px" OnSelectedIndexChanged="OnAuthorNameChanged" AutoPostBack="True">
                                            <asp:ListItem>All</asp:ListItem>
                                            <asp:ListItem>Nancy Davolio</asp:ListItem>
                                            <asp:ListItem>Steven Buchanan</asp:ListItem>
                                            <asp:ListItem>Stanley Hudson</asp:ListItem>
                                            <asp:ListItem>Andrew Fuller</asp:ListItem>
                                        </asp:DropDownList>
									</div>
                                    <br style="line-height: 15px" />
                                    <asp:RadioButton  Style="margin-left: 5px" ID="rdButtonAccept" runat="server" 
                                        GroupName="Group2" Text="Accepts all changes made by the author"
                                          Enabled="false"/>
                                    <br/>
                                    <asp:RadioButton Style="margin-left: 5px" ID="rdButtonReject" runat="server" GroupName="Group2"
                                        Text="Rejects all changes made by the author" 
                                         Enabled="false"/>
									<br/>
                                    <asp:RadioButton Style="margin-left: 5px" ID="rdButtonAcceptAll" runat="server" GroupName="Group2"
                                        Text="Accepts all the tracked changes in the Word document" 
                                        Checked="True" />
									<br/>
                                    <asp:RadioButton Style="margin-left: 5px" ID="rdButtonRejectAll" runat="server" GroupName="Group2"
                                        Text="Rejects all the tracked changes in the Word document" />
                                </td>
                            </tr>
                            
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div>
                        <table width="100%">
                            <tr>
                                <td height="10px">
                                </td>
                            </tr>
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
                    <br />
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

