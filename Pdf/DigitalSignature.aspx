<%@ Page Title="PDF-Digital Signature-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to digitally sign the PDF document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DigitalSignature.aspx.cs" Inherits="WebSampleBrowser.Pdf.DigitalSignature" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
     <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates how to digitally sign the PDF document with the PFX certificate file. It is possible to digitally sign with X509 certificates such as .pfx files with private keys and support for Hardware Security Module (HSM), Online Certificate Status Protocol (OCSP), Certificate Revocation List (CRL), and Windows Certificate Store to offer authenticity and integrity. 
	</div>
    <asp:Label runat="server" ID="label"></asp:Label><br />
   
                <br />
                <b>Sign new PDF document</b><br />
                <br />
                <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
                        <tr>
                            <td align="left">
                                <asp:Label Width="100px" runat="server" ID="label1" Text="Signature Type"></asp:Label>
                            </td>
                            <td align="left">
                                <asp:RadioButton Style="margin-left: 5px" GroupName="list1" Height="20px" runat="server"
                                    Checked="true" ID="radioStandard" Text="Standard" />
                            </td>
                            <td align="left">
                                <asp:RadioButton Style="margin-left: 5px" GroupName="list1" Height="20px" runat="server"
                                    ID="radioAuthor" Text="Author" />
                            </td>
                            <td align="right">
                                <asp:Button runat="server" OnClick="btnNewPDF_Click" ID="btnNewPDF"
                                    Text="Create PDF" Height="27px" Width="100px" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                <b>Sign existing PDF document</b><br />
                <br />
                <div style="border: solid 1px #788DB3; padding: 10px; background-color: #EDF0F7;">
                    <table width="100%" id="PanelTable1" cellspacing="0" cellpadding="0" border="0">
                        <tr style="margin-top: 5px;">
                            <td align="left">
                                <br />
                                <asp:Label runat="server" ID="label2" Width="20%" Text="Source"></asp:Label>
                            </td>
                            <td>
                                <br />
                                <input style="width: 75%" id="File1" type="file" runat="server" visible="true" accept=".pdf" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label Width="20%" runat="Server" ID="label5" Text="Certificate"></asp:Label>
                            </td>
                            <td>
                                <br />
                                <input style="width: 75%" id="File2" type="file" runat="server" visible="true" accept=".pfx" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label Width="20%" runat="Server" ID="label4" Text="Password"></asp:Label>
                            </td>
                            <td>
                                <br />
                                <asp:TextBox Style="width: 50%;" TextMode="Password" AutoCompleteType="None" runat="Server" ID="textBoxPassword"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <br />
                                <asp:Label Width="20%" runat="Server" ID="label3" Text="Signature"></asp:Label>
                            </td>
                            <td>
                                <br />
                                <ej:Signature ID="signature" Height="200px" Width="60%" StrokeWidth="3" IsResponsive="true" runat="server"></ej:Signature>
                            </td>
                        </tr>
                        <tr style="margin-top: 5px;">
                            <td>
                                <br />
                            </td>
                            <td align="left">
                                <br />
                                <asp:Button Style="margin-top: 8px" Width="100px" ID="Button1" Height="27px" runat="server" Text="Create PDF" OnClientClick="createSignatureImage()" OnClick="btnOldPDF_Click" />
                                <asp:HiddenField id="myHiddenInput" runat="server" />
                            </td>
                        </tr>
                    </table>
                </div>
				 <div style = "font-size: 17px;font-weight: 400;">
	It is also possible to digitally sign with <a href="https://help.syncfusion.com/file-formats/pdf/working-with-digitalsignature#adding-a-timestamp-in-digital-signature">timestamp.</a>
More information about the digital signature and timestamp can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-digitalsignature">section.</a>



           </div>
           
    <br />
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 80%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function createSignatureImage() {
            var image = $("#<%=signature.ClientID%>").ejSignature("instance")._canvas[0].toDataURL("image/png");
            document.getElementById("<%=myHiddenInput.ClientID%>").value = image;
        }
    </script>
</asp:Content>

