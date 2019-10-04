<%@ Page Title="Spreadsheet-Cell Data Binding-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" MetaDescription="This demo shows how to bind the values, formulas, comments, hyperlinks, cell formats, and number formats using Syncfusion ASP.NET Web Spreadsheet cells." CodeBehind="CellDataBinding.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.CellDataBinding" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
	<script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <link href="../Content/Spreadsheet/SpreadsheetStyles.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Data Binding / Cell Data Binding</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Spreadsheet ID="FlatSpreadsheet" AllowFormulaBar="false" ShowRibbon="false" runat="server">
            <ClientSideEvents LoadComplete="loadComplete" />
            <ScrollSettings Height="450"/>
            <Sheets>
                <ej:Sheet>
                    <Rows>
                        <ej:Row Height="30">
                            <Cells>
                                <ej:Cell Value="Item Name">
                                    <Style FontWeight="bold" Color="#FFFFFF" BackgroundColor="#428bca">
                                    </Style>
                                </ej:Cell>
                                <ej:Cell Value="Quantity">
                                    <Style FontWeight="bold" Color="#FFFFFF" BackgroundColor="#428bca">
                                    </Style>
                                </ej:Cell>
                                <ej:Cell Value="Price">
                                    <Style FontWeight="bold" Color="#FFFFFF" BackgroundColor="#428bca">
                                    </Style>
                                </ej:Cell>
                                <ej:Cell Value="Amount">
                                    <Style FontWeight="bold" Color="#FFFFFF" BackgroundColor="#428bca">
                                    </Style>
                                </ej:Cell>
                                <ej:Cell Value="Stock Detail">
                                    <Style FontWeight="bold" Color="#FFFFFF" BackgroundColor="#428bca">
                                    </Style>
                                </ej:Cell>
                                <ej:Cell Value="Website">
                                    <Style FontWeight="bold" Color="#FFFFFF" BackgroundColor="#428bca">
                                    </Style>
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Casual Shoes">
                                    <Comment Value="Casual Footwears with wide variety of colors." />
                                </ej:Cell>
                                <ej:Cell Value="10"/>
                                <ej:Cell Value="20">
                                    <Format Type="currency"/>
                                </ej:Cell>
                                <ej:Cell Value="=B2*C2"/>
                                <ej:Cell Value="OUT OF STOCK"/>
                                <ej:Cell Value="Amazon">
                                    <Hyperlink WebAddr="www.amazon.com" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Sports Shoes">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="20">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="30">
                                    <Style BackgroundColor="#E5F3FF" />
                                    <Format Type="currency" />
                                </ej:Cell>
                                <ej:Cell Value="=B3*C3">
                                    <Style BackgroundColor="#E5F3FF" />
                                    </ej:Cell>
                                <ej:Cell Value="IN STOCK">
                                    <Style BackgroundColor="#E5F3FF" />
                                    </ej:Cell>
                                <ej:Cell Value="AliExpress">
                                    <Hyperlink WebAddr="www.aliexpress.com" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Formal Shoes">
                                    <Comment Value="Formal Footwears with wide range of sizes." />
                                </ej:Cell>
                                <ej:Cell Value="20" />
                                <ej:Cell Value="15">
                                    <Format Type="currency"/>
                                </ej:Cell>
                                <ej:Cell Value="=B4*C4" />
                                <ej:Cell Value="IN STOCK" />
                                <ej:Cell Value="Amazon">
                                    <Hyperlink WebAddr="www.amazon.com" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Sandals & Floaters" >
                                    <Style BackgroundColor="#E5F3FF"/>
                                </ej:Cell>
                                <ej:Cell Value="15" >
                                    <Style BackgroundColor="#E5F3FF"/>
                                </ej:Cell>
                                <ej:Cell Value="20">
                                    <Format Type="currency" />
                                    <Style BackgroundColor="#E5F3FF"/>
                                </ej:Cell>
                                <ej:Cell Value="=B5*C5" >
                                    <Style BackgroundColor="#E5F3FF"/>
                                </ej:Cell>
                                <ej:Cell Value="OUT OF STOCK" >
                                    <Style BackgroundColor="#E5F3FF"/>
                                </ej:Cell>
                                <ej:Cell Value="Alibaba">
                                    <Hyperlink WebAddr="www.alibaba.com" />
                                    <Style BackgroundColor="#E5F3FF"/>
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Flip-Flops & Slippers" />
                                <ej:Cell Value="30" />
                                <ej:Cell Value="10">
                                    <Format Type="currency" />
                                </ej:Cell>
                                <ej:Cell Value="=B6*C6" />
                                <ej:Cell Value="IN STOCK" />
                                <ej:Cell Value="Ebay">
                                    <Hyperlink WebAddr="www.ebay.com" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Sneakers">
                                    <Style BackgroundColor="#E5F3FF" />
                                    <Comment Value="Sneakers with recent designs." />
                                </ej:Cell>
                                <ej:Cell Value="40" >
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="20">
                                    <Format Type="currency" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="=B7*C7">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="OUT OF STOCK">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="Amazon">
                                    <Hyperlink WebAddr="www.amazon.com" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Running Shoes" />
                                <ej:Cell Value="20" />
                                <ej:Cell Value="10">
                                    <Format Type="currency" />
                                </ej:Cell>
                                <ej:Cell Value="=B8*C8" />
                                <ej:Cell Value="OUT OF STOCK" />
                                <ej:Cell Value="AliExpress">
                                    <Hyperlink WebAddr="www.aliexpress.com" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Loafers">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="31">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="10">
                                    <Format Type="currency" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="=B9*C9">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="OUT OF STOCK">
                                    <Style BackgroundColor="#E5F3FF" /></ej:Cell>
                                <ej:Cell Value="Filpkart">
                                    <Hyperlink WebAddr="www.flipkart.com" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="Cricket Shoes" />
                                <ej:Cell Value="41" />
                                <ej:Cell Value="30">
                                    <Format Type="currency" />
                                </ej:Cell>
                                <ej:Cell Value="=B10*C10" />
                                <ej:Cell Value="IN STOCK"></ej:Cell>
                                <ej:Cell Value="Ebay">
                                    <Hyperlink WebAddr="www.ebay.com" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row>
                            <Cells>
                                <ej:Cell Value="T-Shirts">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="50">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="10">
                                    <Format Type="currency" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="=B11*C11">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="OUT OF STOCK">
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                                <ej:Cell Value="Amazon">
                                    <Hyperlink WebAddr="www.amazon.com" />
                                    <Style BackgroundColor="#E5F3FF" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                        <ej:Row Height="30">
                            <Cells>
                                <ej:Cell>
                                    <Style BackgroundColor="#428bca" />
                                </ej:Cell>
                                <ej:Cell>
                                    <Style BackgroundColor="#428bca" />
                                </ej:Cell>
                                <ej:Cell Value="Total Amount" Index="2">
                                    <Style FontWeight="bold" BackgroundColor="#428bca" Color="#FFFFFF" />
                                </ej:Cell>
                                <ej:Cell Value="=Sum(D2:D11)">
                                    <Style FontWeight="bold" BackgroundColor="#428bca" Color="#FFFFFF" />
                                </ej:Cell>
                                <ej:Cell>
                                    <Style BackgroundColor="#428bca" />
                                </ej:Cell>
                                <ej:Cell>
                                    <Style BackgroundColor="#428bca" />
                                </ej:Cell>
                            </Cells>
                        </ej:Row>
                    </Rows>
                    <RangeSettings>
                        <ej:RangeSetting StartCell="B1" ShowHeader="false" />
                    </RangeSettings>
                </ej:Sheet>
            </Sheets>
        </ej:Spreadsheet>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function loadComplete(args) {
            this.setWidthToColumns([140, 100, 100, 110, 140, 100, 110]);
        }
    </script>
</asp:Content>

