<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="ProcessSpreadsheet.aspx.cs" Inherits="WebSampleBrowser.XlsIO.ProcessSpreadsheet" %>

<asp:content id="content2" contentplaceholderid="ControlsSection" runat="server">
    
    <p>
        Essential XlsIO provides support for processing a spreadsheet in memory.
    </p>
    <br />
    <p>
        In this sample, a <em>templated</em> spreadsheet with data is available to the user
        for download. The user is allowed to modify data in this template based on given
        conditions. This edited spreadsheet is then sent back to the server and processed
        completely in-memory without saving to disk. The data in the spreadsheet is then
        imported and processed. Finally, a chart is drawn on the Web page after successful
        processing of the spreadsheet.</p> <br />
    <div>
        <table id="PanelTable" cellspacing="0" cellpadding="0" border="0" width="650px">
            <tr>
                <td style="border-style: groove; border-width: 2px">
                    <asp:Menu ID="StepMenu" runat="server" Font-Bold="True" ForeColor="Black" DynamicHorizontalOffset="2"
                        Font-Names="Verdana" Orientation="Horizontal" StaticSubMenuIndent="10px" Font-Size="12px"
                        OnMenuItemClick="StepMenu_MenuItemClick">
                        <StaticMenuItemStyle HorizontalPadding="15px" VerticalPadding="2px" BackColor="#515582"
                            ForeColor="White" />
                        <StaticHoverStyle BackColor="#F2C98A" ForeColor="Black" />
                        <StaticSelectedStyle BackColor="#E89B28" ForeColor="Black" />
                        <Items>
                            <asp:MenuItem Text="Step 1" Value="Step I" Selected="True"></asp:MenuItem>
                            <asp:MenuItem Text="Step 2" Value="Step II"></asp:MenuItem>
                            <asp:MenuItem Text="Step 3" Value="Step III"></asp:MenuItem>
                            <asp:MenuItem Text="Step 4" Value="Step IV"></asp:MenuItem>
                        </Items>
                    </asp:Menu>
                    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
                        <asp:View ID="view_step1" runat="server">
                            <div style="margin-top: 5px">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td align="left">
                                            Download this xls file which contain some “Sales information by region” data. Proceed
                                            to step 2.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">
                                            <asp:Button ID="btnDownload" runat="server" OnClick="btnDownload_Click" Text="Download *.xls Template" />
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="view_step2" runat="server">
                            <div style="margin-top: 5px">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td align="left">
                                            Make some changes to the data in the downloaded file. Add a few lines of compatible
                                            data. Proceed to step 3.
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="view_step3" runat="server">
                            <div style="margin-top: 5px">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td align="left">
                                            Upload the modified file using the link below (Upon clicking Upload, the file will
                                            be uploaded to our server and read by the XlsIO component. The data from the Excel
                                            sheet will be processed and Pie charts will be generated based on the statistical
                                            data available in the excel sheet).
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            <asp:FileUpload ID="FileUpload1" runat="server" Style="color: #284E98; background-color: White;
                                                border-color: #507CD1; border-width: 1px; border-style: Solid; font-family: Verdana;"
                                                BackColor="White" />
                                            <asp:Button Height="27px" ID="btnUpload" runat="server" OnClick="btnUpload_Click"
                                                Text="Upload" Width="15%" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 26px">
                                            <asp:Label ID="lbl_Error" runat="server" EnableViewState="False" ForeColor="Red"
                                                Text="Error: None of the files uploaded." Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </asp:View>
                        <asp:View ID="view_step4" runat="server">
                            <div>
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td colspan="2">
                                            <div style="font-size: 15px; text-align: center; font-weight: bold">
                                                <br />
                                                Statistical Analysis
                                                <hr />
                                            </div>
                                            <br />
                                            Choose Financial Year :
                                            <asp:DropDownList ID="ddlYear" Style="color: #284E98; background-color: White; border-color: #507CD1;
                                                border-width: 1px; border-style: Solid; font-family: Verdana;" runat="server"
                                                AutoPostBack="True" Width="75px">
                                            </asp:DropDownList>
                                            <br />
                                            <br />
                                            <br />
                                            <br />
                                            <asp:UpdatePanel ID="chart" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td align="center" style="text-decoration: 'underline'; font-weight: bold">
                                                                Region Vs Units Sold&nbsp;
                                                            </td>
                                                            <td align="center" style="text-decoration: 'underline'; font-weight: bold">
                                                                Products Vs Units Sold&nbsp;
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left">
                                                                <asp:Image ID="piechartImg" runat="server" />
                                                            </td>
                                                            <td align="right">
                                                                <asp:Image ID="Image1" runat="server" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ContentTemplate>
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="ddlYear" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <span><b>Note:</b> DataTable retreived from XlsIO is cached in session state.</span>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <br />
                            </div>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    </div>
</asp:content>
