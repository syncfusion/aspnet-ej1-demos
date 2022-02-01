<%@ Page Title="XlsIO-Worksheet To HTML-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="HTMLtoWorksheet.aspx.cs" Inherits="WebSampleBrowser.XlsIO.HTMLtoWorksheet" %>

<asp:content id="Content2" contentplaceholderid="ControlsSection" runat="server">
    
      <p>
			Essential XlsIO supports importing HTML tables into Excel worksheets. The ImportHtmlTable method loads an HTML file and imports all the tables in the file to the worksheet.
			</p>
			 <br />
                <br />
                <b>Features:</b>
                <br />
                <ul>
                    <li>Imports HTML table</li>
                    <li>Imports with table formatting </li>
                </ul>
                <br />
    <p>
        Click the "Input Template" button to view the HTML input document and click the "Import" button to view the output Excel document. Please
        note that Microsoft Excel Viewer or Microsoft Excel is required to view the Excel document.
    </p>
    <div>
        <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>                    
                    
                    <asp:Button ID="InputBtn" runat="server" OnClick="Button2_Click" Text="Input Template" Width="147px" />
					&nbsp;&nbsp;&nbsp;					
					<asp:Button ID="ConvertBtn" runat="server" OnClick="Button1_Click" Text="Import" Width="145px" />
                </td>
            </tr>
        </table>
    </div>
</asp:content>

