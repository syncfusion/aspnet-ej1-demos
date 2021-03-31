<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.SynReportWriter.Default" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
    </p>
    <div>
        <table id="PanelTable" width="650px" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <div>
                        <asp:label width="100%" style="text-align: justify;" id="label1" runat="server" text="" font="normal 16px Calibri" >							
								This sample shows the exporting of Territory Sales report which is hosted in Microsoft SQL Server Reporting Service into various file formats using Report Writer.
							<br />
							<br />
                        </asp:label>
                        <table width="100%"  cellspacing="0" border="0">
                            <tr>
                                <td align="center" style="display:inline-block; padding:10px">
                                    <asp:Label ID="Label2" runat="server" Text="Save As:" style="padding:0px 5px 0px 2px ; font-weight:bold"></asp:Label>
                                    <asp:radiobutton style="margin-left: 10px" id="pdf" runat="server" checked="true" groupname="formatgrp"/>
                                    <asp:Label ID="Label3" runat="server" text="PDF" style="padding:0px 5px 0px 2px ; font-weight:bold" ></asp:Label>
                                    <asp:radiobutton style="margin-left: 10px" id="word" runat="server" groupname="formatgrp" />
                                    <asp:Label ID="Label4" runat="server" text="Word" style="padding:0px 5px 0px 2px ; font-weight:bold" ></asp:Label>
                                    <asp:radiobutton style="margin-left: 10px" id="xls"  runat="server" groupname="formatgrp"/>
                                    <asp:Label ID="Label5" runat="server" text="Excel" style="padding:0px 5px 0px 2px ; font-weight:bold" ></asp:Label>
                                    <asp:radiobutton style="margin-left: 10px" id="html"  runat="server" groupname="formatgrp" />
                                    <asp:Label ID="Label6" runat="server" text="Html" style="padding:0px 25px 0px 2px ; font-weight:bold" ></asp:Label>
                                    <asp:button id="Button1" runat="server" onclick="Button1_Click" text="Generate" width="100px" align="center" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
