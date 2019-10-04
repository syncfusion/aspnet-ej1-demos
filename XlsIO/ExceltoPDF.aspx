<%@ Page Title="XlsIO-Excel To PDF-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/samplebrowser.master" AutoEventWireup="true"
    CodeFile="ExceltoPDF.aspx.cs" Inherits="WebSampleBrowser.XlsIO.ExceltoPDF" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <p>
        This sample illustrates the conversion of Microsoft Excel document to PDF.
    </p>
    <br />Essential XlsIO allows to export Excel document to PDF by using the <b>Convert</b> method of <b>ExcelToPDFConverter</b> class.
    <br />
    <br /><b>Features:</b>
    <br />
    <br />
    <ul>
        <li>Supports conversion of Excel document to PDF document with cell values, cell styles, tables, charts, autoshapes, pictures, etc.</li>
    </ul>
    <br />
    <b>Note:</b> Installation of Essential PDF and ExcelChartToImageConverter is necessary to run this sample
    <br />
    <br />
    <div>
        <table width="665px">
            <tr>
                <td>
                    <b>Select Document</b>
                    <div>
                        <br style="line-height: 10px" />
                    </div>
                    <div>
                        <asp:fileupload id="FileUpload1" width="385px" runat="server" />
                    </div>
                </td>
            </tr>
        </table>
        <br />
        <p>
            Clicking the 'Convert to PDF' button will convert the Excel document to PDF. PDF viewer is needed to view the converted PDF document.
        </p>        
        <table width="665px">
            <tr>
                <td>                    
                    <table width="100%" class="style1">
                        <br />
                        <tr>
                            <td align="left">
                                <b>Pdf Page Setup Options</b>
                            </td>
                        </tr>
                        <tr style="height:20px"></tr>
                        <tr style="margin-left: 40px"></tr>
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="noScaleRadioBtn" groupname="PageSetup" runat="server" text="No Scaling"/>
                            </td>
                            <td align="left">
                                <asp:radiobutton id="allRowsRadioBtn" groupname="PageSetup" runat="server" text="Fit All Rows On One Page" />
                            </td>
                        </tr>
                        <tr style="height:20px"></tr>
                        <tr style="margin-left:10px"></tr>
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="allColumnRadioBtn" groupname="PageSetup" runat="server" text="Fit All Columns On One Page" checked="true" />
                            </td>
                            <td align="left">
                                <asp:radiobutton id="onePageRadioBtn" groupname="PageSetup" runat="server" text="Fit Sheet On One Page" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="middle" align="left">
                                <asp:checkbox runat="server" id="checkfontStream" text="Font Stream" autopostback="false" TextAlign="Right"/>
                                  <br />
                                 <asp:Label runat="server" Font-Bold="false" Font-Size="Smaller">Missing fonts in the device will be substituted from embedded resource.</asp:Label>
                            </td>
                        </tr>
                        <tr>

                        </tr>
                    </table>
                    <br />
                    <div>
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:checkbox runat="server" id="CheckBox1" text=" Open File inside Browser" autopostback="false" />
                                </td>
                                <td align="right">
                                    <asp:button id="btnExceltoPDf" width="200px" runat="server" text="Convert to PDF"
                                        onclick="btnExceltoPDFClick" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <div>
            <asp:label width="100%" forecolor="red" style="text-align: justify;" id="label1"
                runat="server" text=""></asp:label>
        </div>
    </div>
</asp:Content>

