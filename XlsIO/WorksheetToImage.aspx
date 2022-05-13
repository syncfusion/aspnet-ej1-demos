<%@ Page Title="XlsIO-Worksheet To Image-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="WorksheetToImage.aspx.cs" Inherits="WebSampleBrowser.XlsIO.WorksheetToImage" %>

<asp:content id="Content2" contentplaceholderid="ControlsSection" runat="server">
   
    <p>
        This sample demonstrates how a worksheet can be converted to an image that is subject
        to few limitations. The image can be of any format, and it can also be saved as
        a memory stream.
    </p>
    <br/>
    <p>
        Click the button below to convert the Excel worksheet to image using Essential XlsIO.
    </p>
    <div>
        <table id="PanelTable" width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td align="center">
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Convert to Image" Width="150px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Input Template" Width="150px" />                    
                </td>
            </tr>
        </table>
    </div>
</asp:content>

