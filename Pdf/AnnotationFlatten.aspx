<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AnnotationFlatten.aspx.cs" Inherits="WebSampleBrowser.Pdf.AnnotationFlatten" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style = "font-size: 17px;font-weight: 400;">
			This sample demonstrates the creation of different type of annotations such as ink, free text, pop up, text markup annotation and more. The Essential PDF supports  <a href="https://help.syncfusion.com/file-formats/pdf/working-with-annotations#supported-annotation-types">20+ annotations</a> with create, edit, and delete support. 


	</div>
	</br>
    <table width="100%" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
        <tr style="margin-top: 5px;">
            <td align="left">
               
                <br />
                <asp:CheckBox ID="CheckBox2" Height="23px" style="padding: 5px 7px 5px 7px;" Checked="true" runat="server" Text=" Annotation Flatten" />
                <div style="border: solid 1px #788DB3; padding: 5px 7px 5px 7px; background-color: #EDF0F7;">
 
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%">
<tr>
                 <td align="left">
                  <asp:CheckBox ID="CheckBox1" Height="23px" runat="server" Text=" Open Document inside Browser" />
                    
                 </td>
                
                            <td align="right">
                                <asp:Button Width="100px" ID="Button1" Height="27px" runat="server" OnClick="Button1_Click"
                                    Text="Create PDF" />
                            </td>
                        </tr>
                    </table>
                </div>
                <br />
                
            </td>
        </tr>
    </table>
	</br>
	 <div style = "font-size: 17px;font-weight: 400;">
This feature can be used for reviewing purpose.
More information about the annotations can be found in this documentation <a href="https://help.syncfusion.com/file-formats/pdf/working-with-annotations"> section. </a>



           </div>
</asp:Content>
