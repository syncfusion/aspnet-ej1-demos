<%@ Page Title="PDF-Booklet-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create a booklet from the existing PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Booklet.aspx.cs" Inherits="WebSampleBrowser.Pdf.Booklet" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
		This sample demonstrates how to create a booklet from the existing PDF document.
	</div>
    <asp:Label ID="lb_error" runat="server" ForeColor="Orange" EnableViewState="false"
        Visible="false" Text="Label"></asp:Label><br />
    <br />
    <div>
        <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr style="margin-top: 5px;">
                <td align="left">
                    <b>Source Document</b><br />
                    <br />
                    <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                        <asp:Label runat="server" ID="label1" Text="Path" Width="50px"></asp:Label>
                        <asp:FileUpload ID="fileUpload1" runat="server" />
                        <asp:RequiredFieldValidator ID="requiredFieldValidator" runat="server" ControlToValidate="fileUpload1"
                            ErrorMessage=" *" Width="5px" Height="16px"></asp:RequiredFieldValidator>
                    </div>
                    <br />
                    <b>Page Settings</b>
                    <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                        <asp:Label runat="server" ID="label2" Text="Page Width"></asp:Label>
                        <asp:TextBox runat="server" ID="textBoxWidth" Width="90px" AutoPostBack="false" Text="595" MaxLength ="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="textBoxWidth" ValidationExpression="\d+" EnableClientScript="true"
                            ErrorMessage="*" Width="5px" Height="16px"></asp:RegularExpressionValidator>
                        <asp:Label runat="server" ID="label3" Style="margin-left: 35px" Text="Page Height"></asp:Label>
                        <asp:TextBox runat="server" ID="textBoxHeight" Width="90px" AutoPostBack="false"
                            Text="550" MaxLength ="4"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="textBoxHeight" ValidationExpression="\d+" EnableClientScript="true"
                            ErrorMessage="*" Width="5px" Height="16px"></asp:RegularExpressionValidator>
                        <asp:CheckBox ID="checkBoxDoubleSide" Style="margin-left: 35px" runat="server" Text=" Double Side"
                            ToolTip="The page will be double sided" AutoPostBack="false" />
                    </div>
                    <br />
                  
                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table width="100%" cellpadding="0" cellspacing="0" border="0">
                            <tr>
                                <td valign="middle" align="left">
                                    <asp:CheckBox ID="checkBoxOpen" runat="server" Text=" Open Document inside Browser" />
                                </td>
                                <td align="right">
                                    <asp:Button Width="100px" Style="margin-right: 3px" ID="btnCreatePDF" Height="27px"
                                        runat="server" OnClick="btnCreatePDF_Click" Text="Create PDF" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
    </div>
	  <br />
	<div style = "font-size: 17px;font-weight: 400;">
This feature can be used to print the PDF document in book format.

           </div>
</asp:Content>

