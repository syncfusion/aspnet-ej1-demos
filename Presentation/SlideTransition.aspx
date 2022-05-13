<%@ Page Title="Presentation-Slide Transition-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SlideTransition.aspx.cs" Inherits="WebSampleBrowser.PPTX.SlideTransition" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
<p>Essential Presentation library has support for creating slide transition effects in PowerPoint presentation.</p>
<p>
     <p>
		This sample demonstrates how to create slide transition effects in PowerPoint presentation.
     </p>
     <p><b>Features:</b></p>
     <p> The below transition effects are supported as equivalent to Microsoft PowerPoint:
          <ul>
          <li>Subtle</li>
          <li>Exciting</li>
          <li>Dynamic Content</li>
          </ul>
     </p>
     <p> The below transition options are supported as equivalent to Microsoft PowerPoint:
          <ul>
          <li>Effect options</li>
          <li>Advance On Time</li>
          <li>Advance Mouse On Click</li>
          <li>Transition Duration</li>
          </ul>
     </p>
</p>
    <table width="100%">
        <tr>
            <td align="left">
                <div>
                    <asp:Label Width="100%"  Style="text-align: justify;"
                        ID="label6" runat="server" Text="Click the below button to create a slide transition effects in PowerPoint presentation. Please note that MS PowerPoint viewer is required to view the resultant document."></asp:Label>
                </div>
                <br />
                <div style="border: solid 0px #788DB3; padding: 5px 7px 5px 7px;">
                    <table width="100%">
                        <tr>
                            <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
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

