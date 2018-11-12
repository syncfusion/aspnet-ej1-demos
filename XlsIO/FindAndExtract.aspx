<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="FindAndExtract.aspx.cs" Inherits="WebSampleBrowser.XlsIO.FindAndExtract" %>

<asp:content id="Content2" contentplaceholderid="ControlsSection" runat="server">
  
    <p>
        Find and Extract sample illustrates the ability of Essential XlsIO to search and
        retrieve specified text from the worksheet.
    </p>
    <br />
    <p>
        Select any item from the below listbox and click the Extract Data button 
       to extract the data from the spreasheet using Essential XlsIO.
    </p>
    <div>
        <table id="PanelTable" width="650px" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>                    
                    <div>
                        <asp:ListBox Font-Size="Smaller" Width="100%" ID="lstFormat" runat="server" Height="175px">
                            <asp:ListItem>Number with format 0.00</asp:ListItem>
                            <asp:ListItem Value="Number with format $#,##0.00" Selected="True"></asp:ListItem>
                            <asp:ListItem>-------------------------------------------</asp:ListItem>
                            <asp:ListItem Value="DateTime with format m/d/yy h:mm"></asp:ListItem>
                            <asp:ListItem>Time with format h:mm:ss AM/PM</asp:ListItem>
                            <asp:ListItem>Date with format d-mmm-yy</asp:ListItem>
                            <asp:ListItem>Date with format Saturday, December 01, 2007</asp:ListItem>
                            <asp:ListItem>-----------------------------------------------</asp:ListItem>
                            <asp:ListItem>Text</asp:ListItem>
                            <asp:ListItem>Text With Styles and Patterns</asp:ListItem>
                            <asp:ListItem>Number with Text Format</asp:ListItem>
                        </asp:ListBox>
                    </div>
                    <br />
                    <div style="line-height: 27px">
                        <asp:Label ID="Label1" runat="server" Text="Display Text" Width="112px"></asp:Label>
                        <asp:TextBox ID="txtDisplay" runat="server" Width="283px" Font-Size="16px"></asp:TextBox>
                    </div>
                    <div style="line-height: 27px">
                        <asp:Label ID="Label2" runat="server" Text="Value in the Cell" Width="112px"></asp:Label>
                        <asp:TextBox ID="txtValue" runat="server" Width="283px" Font-Size="16px"></asp:TextBox>
                    </div>
                    <br />
                    <table style="margin-top: 5px" width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td align="right">
                                <asp:Button ID="Button1" runat="server" Text="Extract Data" OnClick="Button1_Click"
                                    Width="150px"></asp:Button><br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:content>
