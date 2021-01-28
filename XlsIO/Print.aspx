<%@ Page Title="" Language="C#" MasterPageFile="~/samplebrowser.master" AutoEventWireup="true"
    CodeFile="Print.aspx.cs" Inherits="WebSampleBrowser.XlsIO.Print" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
        Essential XlsIO allows to print the Excel document in printer. Use the Print
        method of ExcelToPDFConverter class to convert the Excel document to PDF and then print the converted PDF document in printer.
        This enabling user easily print the Excel document.
    </p>
    <div>
        <table width="100%">
            <tr>
                <td>
                    <b>Select Document</b>
                    <div>
                        <br style="line-height: 10px" />
                    </div>
                    <div>
                        <asp:FileUpload ID="FileUpload1" Width="385px" runat="server" />
                    </div>
                </td>
            </tr>
        </table>
        <p>
            Clicking the button below will print the Excel document using Essential XlsIO and Essential PDF. Please note that you need to have a printer installed in order to print the converted PDF document.
        </p>
        <br />

        <table width="100%">
            <tr>
                <td>
                    <table width="100%" class="style1">
                        <tr>
                            <td align="left">
                                <b>Print Options</b>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:RadioButton ID="defaultPrintBtn" GroupName="PrintOptions" runat="server" Text="Default Print"
                                    Checked="true" OnCheckedChanged="option_SelectedIndexChanged" AutoPostBack="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:RadioButton ID="printWithConverterBtn" GroupName="PrintOptions" runat="server" Text="Print with Converter settings" OnCheckedChanged="option_SelectedIndexChanged" AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:RadioButton ID="printWithPrinterBtn" GroupName="PrintOptions" runat="server" Text="Print with Printer settings" OnCheckedChanged="option_SelectedIndexChanged" AutoPostBack="true"/>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:RadioButton ID="printWithConverterAndPrinterBtn" GroupName="PrintOptions" runat="server" Text="Print with Converter and Printer settings" OnCheckedChanged="option_SelectedIndexChanged" AutoPostBack="true"/>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <asp:Panel runat="server" ID="converterSettings" Visible="false">
                        <asp:Label ID="lb1" runat="server">Converter Settings:</asp:Label>
                        <br/>
                        <asp:RadioButton ID="noScaleRadioBtn" GroupName="ConverterSettings" runat="server" Text="No Scaling" Checked="true" />
                        <br/>
                        <asp:RadioButton ID="allRowsRadioBtn" GroupName="ConverterSettings" runat="server" Text="Fit All Rows On One Page" />
                        <br/>
                        <asp:RadioButton ID="allColumnRadioBtn" GroupName="ConverterSettings" runat="server" Text="Fit All Columns On One Page" />
                        <br/>
                        <asp:RadioButton ID="onePageRadioBtn" GroupName="ConverterSettings" runat="server" Text="Fit Sheet On One Page" />
                        <br/>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <br />
        <table width="100%">
            <tr>
                <td>
                    <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <asp:Button ID="btnInputTemplate" Width="100px" runat="server" Text="InputTemplate"
                                OnClick="btnInputTemplateClick" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnPrintExcel" Width="100px" runat="server" Text="Print"
                                OnClick="btnPrintExcelClick" />
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
    <div>
        <asp:Label Width="100%" ForeColor="red" Style="text-align: justify;" ID="label1"
            runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

