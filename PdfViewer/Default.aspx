<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.PdfViewer.Default" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>
<%@ Register assembly="Syncfusion.EJ.Web" namespace="Syncfusion.JavaScript.Web" tagprefix="ej" %>
<%@ Register assembly="Syncfusion.EJ.Web" namespace="Syncfusion.JavaScript.Web" tagprefix="ej" %>

<%@ Register assembly="Syncfusion.EJ.Web" namespace="Syncfusion.JavaScript.Web" tagprefix="ej" %>

<%@ Register assembly="Syncfusion.EJ.Web" namespace="Syncfusion.JavaScript.Web" tagprefix="ej" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width: 100% !important;" >
	<div style="float:left; padding-bottom:5px; display:inline-flex;">
            <input type="file" id="fileUpload" style="display: block;visibility: hidden;width: 0;height: 0;"/>
            <ej:Button ID="fileUploadButton" runat="server" Type="Button" Text="Choose file from disk" Height="30px"></ej:Button>
        </div>
    <div style="float:right; padding-bottom:5px; display:inline-flex;">
           <span style="font-family: 'Segoe UI';width:350px; font-size: 18px;font-weight:400;float: left;vertical-align:middle">Select a PDF file to view:</span>
         
        <ej:DropDownList ID="selectCulture" ClientSideOnChange="onChange" runat="server" SelectedIndex="0" WatermarkText="Select a PDF" Width="100%"> 
              <Items>
                    <ej:DropDownListItem Text="HTTP Succinctly" Value="HTTP Succinctly"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="ASP.NET MVC 4 Succinctly" Value="ASP.NET MVC 4 Succinctly"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="F# Succinctly" Value="F# Succinctly"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="GIS Succinctly" Value="GIS Succinctly"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Windows Store Apps Succinctly" Value="Windows Store Apps Succinctly"></ej:DropDownListItem>
                </Items>
            </ej:DropDownList>
        </div>     
    <div style="width:100%;height:100%;padding-left: 10px;min-height: 680px;float:right">                  
        <ej:PdfViewer ID="PdfViewer2" runat="server" PdfService="Local" ServiceUrl="../api/PdfViewer">
        </ej:PdfViewer>
    </div>   
	</div>
</asp:Content>



<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
	$(document).ready(function () {
            document.getElementById('fileUpload').addEventListener('change', readFile, false);
            $('#LayoutSection_ControlsSection_fileUploadButton').click(function () {
                $('#fileUpload').click();
            });
        });
        function onChange(args) {
            var _filename = args.value;
            var _ejPdfViewer = $("#LayoutSection_ControlsSection_PdfViewer2").data("ejPdfViewer");
            _ejPdfViewer.load(_filename);
        }
		function readFile(evt) {
		    var uploadedFiles = evt.target.files;
		    if (uploadedFiles.length > 0) {
		        var uploadedFile = uploadedFiles[0];
		        var reader = new FileReader();
		        reader.readAsDataURL(uploadedFile);
		        reader.onload = function () {
		            var obj = $("#LayoutSection_ControlsSection_PdfViewer2").data("ejPdfViewer");
		            var uploadedFileUrl = this.result;
		            obj.load(uploadedFileUrl);
		        }
		        this.value = null;
		    }
        }
    </script>
</asp:Content>
