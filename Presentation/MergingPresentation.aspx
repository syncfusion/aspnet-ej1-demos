<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MergingPresentation.aspx.cs" Inherits="WebSampleBrowser.PPTX.MergingPresentation" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for merging two presentation documents into one.</p>
    <p>This sample demonstrates merging two PowerPoint presentation documents with paste options - use destination theme and source formatting.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Copied slides can be merged with 'source' or 'destination' paste options equivalent to Microsoft PowerPoint.</li>
        <li>Merge an entire presentation with another Presentation by merging all the copied slides of the presentation to another.</li>
		</ul>
	</p>
    <div>
        <table width="100%">
            <tr>
                <td align="left">
                    <div>
                    <b>Select Document1</b>
                        <asp:FileUpload ID="FileUpload1" Width="75%" runat="server" />
                    </div>
                    <br />
                      <div>
                    <b>Select Document2</b>
                        <asp:FileUpload ID="FileUpload2" Width="75%" runat="server" />
                    </div>
                    <br />
                    <div>
                         <div>
                            <asp:RadioButton ID="RadioDestination" runat="server" Text="Use Destination Theme" GroupName="CloneType" AutoPostBack="true" Checked ="true" />
                            <asp:RadioButton ID="RadioSource" Style="margin-left: 9px;font-size:13px;text-align:match-parent" runat="server" Text="Keep Source Formatting" GroupName="CloneType" AutoPostBack="true"/>
                        </div>
                        <br />
                        <table width="35%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left">
                                    <asp:Button ID="btnMergeDocument" Width="135px" Height="24px" runat="server" Text="Merge Documents"
                                        OnClick="btnMergeDocuments_Click" />
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
<asp:Content ID="Content4" runat="server" contentplaceholderid="StyleSection">
    <style type="text/css">
        .auto-style1 {
            width: 50px;
            height: 24px;
        }
        .auto-style2 {
            width: 145px;
            height: 24px;
        }
        .auto-style3 {
            width: 150px;
            height: 24px;
        }
    </style>
</asp:Content>

