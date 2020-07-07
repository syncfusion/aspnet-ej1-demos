<%@ Page Title="XlsIO-Data Sorting-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="Sorting.aspx.cs" Inherits="WebSampleBrowser.XlsIO.Sorting" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <p>
        Essential XlsIO now provides support to sort a given range of cells in the worksheet.
    </p>
    <br />
    <p>The below sample demonstrates two ways of sorting,</p>
    <br />
    <p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Sort Values: Sorts the range based on the values. </p>
    <p>&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Sort Colors: Sorts the range based on the cell and font color. </p>
    <br />
    <div>
        <table style="align-content:space-between" id="PanelTable" width="450px" cellpadding="0" cellspacing="0" border="0" >
            <tr>
                <td align="left">
                    <b>Sort Based on Values</br/></b></td>
                <td align="left">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td align="left">
                    <strong>Choose the column index to sort</strong>
                </td>
                <td>&nbsp;
                </td>
                <td>&nbsp;
                </td>
            </tr>
            <tr style="margin-top:5px;">
                <td align="left">First Level
                </td>
                <td align="left">
                    <asp:dropdownlist id="cmbAlgorithm0" runat="server">
                    </asp:dropdownlist>
                </td>
            </tr>
            <tr style="margin-top:5px;">
                <td align="left">
                    <asp:label id="Label1" runat="server" text="Second Level"></asp:label>
                </td>
                <td align="left">
                    <asp:dropdownlist id="cmbAlgorithm1" runat="server">
                    </asp:dropdownlist>
                </td>
            </tr>
            <tr style="margin-top:5px;">
                <td align="left">
                    <asp:label id="Label2" runat="server" text="Third Level"></asp:label>
                </td>
                <td align="left">
                    <asp:dropdownlist id="cmbAlgorithm2" runat="server">
                    </asp:dropdownlist>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
            </tr>
            <tr align="center">
                <td>
                    <table border="0">
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="rdbAscending" runat="server" text="Ascending"
                                    groupname="ascending" checked="True" />
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:radiobutton id="rdbDescending" runat="server" text="Descending" groupname="ascending" />
                                &nbsp;
                               
                            </td>
                        </tr>
                    </table>
                </td>

                <td align="left">
                    <asp:button id="btnSort" runat="server" text="Sort Data" style="margin-left: 0px"
                        onclick="btnSort_Click" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:button id="Button1" runat="server" text="View Input Template" onclick="Button1_Click1" />
                </td>
            </tr>
            <tr style="visibility:hidden">
                <td align="left">
                    <strong>Sort Based on color</strong>
                </td>
            </tr>
            <tr align="center" style="visibility:hidden">
                <td>
                    <table name="tblSortColor" style="width: 47%;">
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="RadioButton1" runat="server" text="On Top" groupname="topName"
                                    checked="True" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:radiobutton id="RadioButton2" runat="server" text="OnBottom"
                                    groupname="topName" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
                <td>Sort On &nbsp;
                    <asp:dropdownlist id="ddlSortOn" runat="server">
                </asp:dropdownlist>
                </td>
            </tr>
            <tr style="visibility:hidden">
                <td>&nbsp;</td>
                <td>
                    <asp:button id="btnSortColor" runat="server" text="Sort Color"
                        style="margin-left: 0px" onclick="btnSortColor_Click" />
                </td>
            </tr>
            
        </table>
    </div>
</asp:Content>

