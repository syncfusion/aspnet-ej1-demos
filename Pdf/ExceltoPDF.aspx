<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ExceltoPDF.aspx.cs" Inherits="WebSampleBrowser.Pdf.ExceltoPDF" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="Server">
<div style = "font-size: 17px;font-weight: 400;">
     <p>
        Essential PDF allows to export the Excel document into PDF document. Use the Convert
        method of ExcelToPDFConverter class to convert the Excel files to PDF files and
        save the PDF document. This enabling user easily converts the Excel document to
        PDF document.
        </p>
    
		</div>
    <div>
        <table align="center" width="100%">
            <tr>
                <td align="left">
				                    <div>
                    <b>Select Document</b>

                        <br style="line-height: 10px" />
                    </div>
                    <div>
                        <asp:FileUpload ID="FileUpload1" Width="100%" runat="server" />
                    </div>
                    <br/>
                    <table width="100%">
                        <tr>
                            <td>
                                <b>Pdf Page Setup Options</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="noScaleRadioBtn" GroupName="PageSetup" runat="server" Text="No Scaling"
                                    Checked="true" />
                            </td>
                            <td>
                                <asp:RadioButton ID="allRowsRadioBtn" GroupName="PageSetup" runat="server" Text="Fit All Rows On One Page" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButton ID="allColumnRadioBtn" GroupName="PageSetup" runat="server" Text="Fit All Columns On One Page" />
                            </td>
                            <td>
                                <asp:RadioButton ID="onePageRadioBtn" GroupName="PageSetup" runat="server" OnCheckedChanged="RadioButton4_CheckedChanged"
                                    Text="Fit Sheet On One Page" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:CheckBox runat="server" ID="CheckBox1" Text=" Open Document inside Browser" AutoPostBack="false" />
                                </td>
                                <td align="right">
                                    <asp:Button ID="btnExceltoPDf" Width="128px" Height="24px" runat="server" Text="Convert to PDF"
                                        OnClick="btnExceltoPDFClick" />
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
		<p>
        <b>Note:</b> You need to have Essential XlsIO installed in order to run this sample.</p>
    </div>
</asp:Content>