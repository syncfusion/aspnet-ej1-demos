<%@ Page Title="Presentation-Customizing Appearance-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomizingAppearance.aspx.cs" Inherits="WebSampleBrowser.PPTX.CustomizingAppearance" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">   
	<p>Essential Presentation library has support for customizing the appearance of a SmartArt diagram in a PowerPoint slide.</p>
	<p>This sample demonstrates how to customize the appearance of a SmartArt diagram in a PowerPoint slide.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Add and remove nodes in an existing SmartArt diagram.</li>
		<li>Edit text contents of the SmartArt nodes.</li>
		<li>Make a SmartArt node as assistant node.</li>
		</ul>
	</p>
	<p><b>Note:</b> The modifications in a SmartArt diagram (like add/remove nodes, modify position and size of nodes etc., which involve SmartArt layout changes) done by Essential Presentation are not supported in Image and PDF conversion. Whereas layout changes will be reflected properly in the generated PPTX file when opened using Microsoft PowerPoint.</p>
    <table width="100%">
        <tr>
            <td align="left">
                <div>
                    <asp:Label Width="100%"  Style="text-align: justify;"
                        ID="label6" runat="server" Text="Click the button to view the modified SmartArt in PowerPoint presentation or PDF document."></asp:Label>
                </div>
                <br />
                <div style="border: solid 0px #788DB3; padding: 5px 7px 5px 7px;">
                    <table width="100%">
                        <tr>
                            <asp:Label Width="65px" runat="server" ID="label2" Text="Save As :"></asp:Label>
                                <asp:RadioButton Id="RadioButton1" Style="margin-left: 9px;font-size:13px;text-align:match-parent" Text="PPTX" GroupName="FileType" Height="27px" Checked="true" runat="server" />
                                <asp:RadioButton Id="RadioButton2" Style="margin-left: 9px;font-size:13px;text-align:match-parent" Text="PDF" AutoPostBack="true" GroupName="FileType" Height="27px" runat="server"/>
                            <br />
                            <br />
                               <asp:Button Width="130px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                     OnClick="Button1_Click" Text="Create" />
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

