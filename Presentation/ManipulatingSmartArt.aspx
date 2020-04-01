<%@ Page Title="Presentation-Manipulating SmartArt-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ManipulatingSmartArt.aspx.cs" Inherits="WebSampleBrowser.PPTX.ManipulatingSmartArt" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for manipulating SmartArt in a PowerPoint presentation.</p>
    <p>This sample demonstrates how to add/remove nodes in a SmartArt diagram and edit text of the nodes in a PowerPoint presentation.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Add and remove nodes in an existing SmartArt diagram.</li>
		<li>Edit text contents of the SmartArt nodes.</li>
		<li>Make a SmartArt node as assistant node.</li>
		</ul>
	</p>
	<p>
        Note: The modifications in a SmartArt diagram (like add/remove nodes, modify position and size of nodes etc., which involve SmartArt layout changes) done by Essential Presentation are not supported in Image and PDF conversion. Whereas layout changes will be reflected properly in the generated PPTX file when opened using Microsoft PowerPoint.
    </p>
    <table width="100%">
        <tr>
            <td align="left">
                <div>
                    <asp:Label Width="100%"  Style="text-align: justify;"
                        ID="label6" runat="server" Text="Click the button to view the generated PowerPoint presentation"></asp:Label>
                </div>
                <br />
                <div style="border: solid 0px #788DB3; padding: 5px 7px 5px 7px;">
                    <table width="100%">
                        <tr>
                            <td align="left" width="100%">
                               <asp:Button Width="165px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                     OnClick="Button1_Click" Text="Create Presentation" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>

