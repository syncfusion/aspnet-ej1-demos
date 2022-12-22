<%@ Page Title="Presentation-Notes-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Notes.aspx.cs" Inherits="WebSampleBrowser.PPTX.Notes" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for adding notes in a PowerPoint presentation.</p>
    <p>This sample demonstrates how to add and convert the notes pages of a PowerPoint slide.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Add, remove, and modify 'Notes Pages' in a PowerPoint slide.</li>
		<li>Convert the 'Notes Pages' to PDF document.</li>
		</ul>
	</p>
    <div>
        <table width="100%">
            <tr>
                <td align="left">
                    <div>
                        <asp:Label Width="100%" Style="text-align: justify;" ID="pptLabel" runat="server" Text="Click the button to view a PowerPoint Presentation or PDF document generated using Essential Presentation and Essential PDF"></asp:Label>
                    </div>
                    <br />
                  <div>
                        <div>
                            <asp:Label Width="65px" runat="server" ID="label2" Text="Save As :"></asp:Label>
                            <asp:RadioButton ID="RadioPPTX" runat="server" Style="margin-left: 9px;font-size:13px;text-align:match-parent" Text="PPTX" GroupName="CloneType" AutoPostBack="true" Checked ="true" />
                            <asp:RadioButton ID="RadioPDF" Style="margin-left: 9px;font-size:13px;text-align:match-parent" runat="server" Text="PDF" GroupName="CloneType" AutoPostBack="true"/>
                        </div>
                        <table width="35%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left">
                                    <br />
                                    <asp:Button ID="btnCreateDocument" Width="135px" Height="24px" runat="server" Text="Generate Document"
                                        OnClick="btnCreateDocuments_Click" />
                                </td>
                            </tr>
                        </table>
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

