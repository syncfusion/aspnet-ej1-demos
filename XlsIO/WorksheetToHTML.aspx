<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="WorksheetToHTML.aspx.cs" Inherits="WebSampleBrowser.XlsIO.WorksheetToHTML" %>

<asp:content id="Content2" contentplaceholderid="ControlsSection" runat="server">
    
    <p>
        This sample demonstrates how a worksheet / workbook can be converted to HTML. The
        output file can be saved to disc and also as a memory stream.
    </p>
    <br />
    <p>
        Click the button below to view the converted HTML document using Essential XlsIO.
    </p>
    <div>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <asp:RadioButton GroupName="html" ID="bookRBtn" runat="server" Text="Workbook" />
                    <asp:RadioButton style="margin-left: 20px" GroupName="html" Checked="true" ID="sheetRBtn" runat="server" Text="Worksheet" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Convert" Width="145px" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Input Template" Width="147px" />
                </td>
            </tr>
        </table>
    </div>
</asp:content>
