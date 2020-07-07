﻿<%@ Page Title="PDF-Zugferd Sample-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="Example [C#] to create Zugferd document in ASP.NET Web Forms using Syncfusion .NET PDF library." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ZugFerd.aspx.cs" Inherits="WebSampleBrowser.Pdf.Zugferd" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div style = "font-size: 17px;font-weight: 400;">
			      This sample demonstrates how to create ZUGFeRD PDF invoice using Essential PDF.
	</div>
	<br/>

                    <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
                        <table>
                            <tr>
                                <td align="left" width="100%" cellpadding="0" cellspacing="0" border="0">
                                    <asp:CheckBox ID="CheckBox1" runat="server" Text=" Open Document inside Browser" 
                                         />
                                </td>
                                <td align="right">
                                    <asp:Button Width="100px" Style="margin-right: 3px" ID="Button1" Height="27px" runat="server"
                                         OnClick="Button1_Click" Text="Create PDF" />
                                </td>
                            </tr>
                        </table>
                    </div>
					  <br/>
		   <div style = "font-size: 17px;font-weight: 400;">
		
				
		This feature can be used for long term archiving and standardization.
More information about conformance can be found in this documentation </a> and <a href="https://help.syncfusion.com/file-formats/pdf/working-with-pdf-conformance">section.</a>

           </div>
		   
		   
               
</asp:Content>

