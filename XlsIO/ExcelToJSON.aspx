<%@ Page Title="XlsIO-Excel To JSON-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="ExcelToJSON.aspx.cs" Inherits="WebSampleBrowser.XlsIO.ExcelToJSON" %>

<asp:content id="Content2" contentplaceholderid="ControlsSection" runat="server">
	<p>
        Essential XlsIO supports to convert Excel data to JSON files by simply saving the workbook using the <strong>SaveAsJson</strong> method.
    </p>
    <br />
    <p><b>Features:</b></p>
    <br />
    <ul>
        <li>Save as a simple JSON file or a JSON file with XML schema</li>
        <li>Save a workbook to JSON</li>
		<li>Save a worksheet to JSON</li>
        <li>Save a range to JSON</li>
		<li>Save as a stream with the above features</li>
    </ul>
    <br />
	<p>
        Click the “Input Template” button to view the input Excel document. Please note that the Microsoft Excel viewer  or Microsoft Excel is required to view the Excel document.
    </p>
	<p>
        Click the “Convert to JSON” button to view the converted JSON file
    </p>
    <br />
    <table id="PanelTable" width="650px" cellpadding="0" cellspacing="0" border="0">
        <tr>
            <td>                
                 <div>
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 320px">
                        <tr> 
                        <td align="left" >
                        <asp:Label runat="server" ID="label1" Text="Convert" Font-Bold="true" Width="45px"></asp:Label>
                        </td>
                        <td align="left">
                        <asp:Dropdownlist id="ConvertList" runat="server" Width="100px"></asp:Dropdownlist>
                        </td>
                        <td align="left">
                        <asp:checkbox id="Check1" runat="server" Checked="true" Text=" "/>
                        <asp:label id="label2" runat="server" Font-Bold="true">As Schema</asp:label>
                        </td>
                        </tr>
                    </table>
                </div>
                <br />
                <div>
                    <table width="50%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td>
                                <asp:Button ID="Button1" runat="server" Text="Input Template" OnClick="Button1_Click" Width="112px" />
                            </td>
                             <td>
                                <asp:button id="Button2" runat="server" Text="Convert to JSON" OnClick="Button2_Click" Width="112px" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table> 
</asp:content>
