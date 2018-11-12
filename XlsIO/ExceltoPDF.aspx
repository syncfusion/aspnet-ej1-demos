<%@ Page Title="" Language="C#" MasterPageFile="~/samplebrowser.master" AutoEventWireup="true"
    CodeFile="ExceltoPDF.aspx.cs" Inherits="WebSampleBrowser.XlsIO.ExceltoPDF" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <p>
        Essential XlsIO allows to export the Excel document into PDF document. Use the Convert
        method of ExcelToPDFConverter class to convert the Excel files to PDF files and
        save the PDF document. This enabling user easily converts the Excel document to
        PDF document.
    </p>
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
            Clicking the button below will result in a PDF document being converted from Excel document using Essential XlsIO and Essential PDF.  At the end of the document generation, an option will be provided to view the generated PDF file. Please note that you need to have a PDF viewer installed in order to view the generated PDF file.
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
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="noScaleRadioBtn" groupname="PageSetup" runat="server" text="No Scaling"
                                    checked="true" />
                            </td>
                            <td align="left">
                                <asp:radiobutton id="allRowsRadioBtn" groupname="PageSetup" runat="server" text="Fit All Rows On One Page" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="allColumnRadioBtn" groupname="PageSetup" runat="server" text="Fit All Columns On One Page" />
                            </td>
                            <td align="left">
                                <asp:radiobutton id="onePageRadioBtn" groupname="PageSetup" runat="server" text="Fit Sheet On One Page" />
                            </td>
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
