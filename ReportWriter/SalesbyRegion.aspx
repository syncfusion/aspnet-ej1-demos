<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SalesbyRegion.aspx.cs" Inherits="WebSampleBrowser.SynReportWriter.SalesbyRegion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
    </p>
    <div>
        <table id="PanelTable" width="650px" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <br />
                    <div>
                        <asp:label width="100%" style="text-align: justify;" id="label" runat="server" text="" font="normal 16px Calibri">
                            This sample showcases the following capabilities of the ReportWriter.
                        <br />
                        <br />
                        •	Maps
                        <br />
                        <br />
                        •	Drill Through
                        </asp:label>
                        <br />
                        <br />
                       <table width="100%"  cellspacing="0" border="0">
                            <tr>
                                <td align="center" style="padding:20px 5px 5px 5px">
                                    <asp:Label ID="Label2"  runat="server"  Text="SaveAs:"></asp:Label>
                                    <asp:radiobutton style="margin-left: 25px" id="pdf" runat="server" checked="true" groupname="formatgrp"/>
                                    <asp:Label ID="Label3" runat="server" text="PDF" style="padding:0px 5px 0px 15px ; font-weight:bold" ></asp:Label>
                                    <asp:radiobutton style="margin-left: 15px" id="word" runat="server" groupname="formatgrp" />
                                    <asp:Label ID="Label4" runat="server" text="Word" style="padding:0px 5px 0px 15px ; font-weight:bold" ></asp:Label>
                                    <asp:radiobutton style="margin-left: 15px" id="xls"  runat="server" groupname="formatgrp"/>
                                    <asp:Label ID="Label5" runat="server" text="Excel" style="padding:0px 5px 0px 15px ; font-weight:bold" ></asp:Label>
                                    <asp:radiobutton style="margin-left: 15px" id="html"  runat="server" groupname="formatgrp" />
                                    <asp:Label ID="Label6" runat="server" text="Html" style="padding:0px 25px 0px 15px ; font-weight:bold" ></asp:Label>
                                    <asp:button id="Button1" runat="server" onclick="Button1_Click" text="Generate" width="140px" align="center" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
