<%@ Page Title="Presentation-Cloning Slide-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CloningSlides.aspx.cs" Inherits="WebSampleBrowser.PPTX.Cloning" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
	<p>Essential Presentation library has support for cloning individual slides in a PowerPoint presentation.</p>
    <p>This sample demonstrates cloning an individual slide from a PowerPoint presentation and merge it to another PowerPoint presentation with source and destination paste options.</p>
	<p><b>Features:</b></p>	
	<p>
		<ul>
		<li>Copy an individual PowerPoint slide and paste it to the same or different presentation.</li>
		<li>Slide elements like text, shapes, charts, tables, SmartArt diagrams and images etc., can be copied and moved between PowerPoint presentations.</li>
		<li>Copy the slides in a section and paste those to another section or PowerPoint presentation.</li>
		</ul>
	</p>
    <div>
        <table width="100%">
            <tr>
                <td align="left">
                     <div>
                        <div>
                            <asp:RadioButton ID="RadioDestination" runat="server" Text="Use Destination Theme" GroupName="CloneType" AutoPostBack="true" Checked="true" />
                            <asp:RadioButton ID="RadioSource" Style="margin-left: 9px;font-size:13px;text-align:match-parent" runat="server" Text="Keep Source Formatting" GroupName="CloneType" AutoPostBack="true"/>
                        </div>
                        <br />
                        <table width="50%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td align="left">
                                    <asp:Button ID="btnCloneSlides" Width="165px" Height="24px" runat="server" Text="Generate Document"
                                        OnClick="btnCloneSlides_Click" />
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


