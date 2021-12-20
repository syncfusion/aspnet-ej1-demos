<%@ Page Title="Presentation-SmartArt Creation-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SmartArtCreation.aspx.cs" Inherits="WebSampleBrowser.PPTX.SmartArtCreation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for creating, editing and converting SmartArt diagrams in a PowerPoint presentation.</p>
    <p>This sample demonstrates how to create SmartArt diagram in a PowerPoint presentation and convert it to PDF document.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Create and edit 134 default SmartArt diagram equivalent to Microsoft PowerPoint.</li>
		<li>Add, modify and remove nodes of the SmartArt diagram.</li>
		<li>Convert presentation with SmartArt diagram to PDF/Image.</li>
		</ul>
	</p>
    <table width="100%">
        <tr>
            <td align="left">
                <div>
                    <asp:Label Width="100%"  Style="text-align: justify;"
                        ID="label6" runat="server" Text="Click the button below to view the generated PowerPoint presentation or PDF document."></asp:Label>
                </div>
                <br />
                <div >
                    <table width="100%">
                        <tr>
                            <asp:Label Width="65px" runat="server" ID="label2" Text="Save As :"></asp:Label>
                                <asp:RadioButton Id="RadioButton1" Style="margin-left: 9px;font-size:13px;text-align:match-parent" Text="PPTX" GroupName="FileType"  Height="27px" Checked="true" runat="server" />
                                <asp:RadioButton Id="RadioButton2" Style="margin-left: 9px;font-size:13px;text-align:match-parent" Text="PDF" AutoPostBack="true" GroupName="FileType" Height="27px" runat="server"/>
                            <br /> <br />
                               <asp:Button Width="140px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                     OnClick="CreatePresentation_Click" Text="Create" />
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

