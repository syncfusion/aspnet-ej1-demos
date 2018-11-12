<%@ Page Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FormFilling.aspx.cs" Inherits="WebSampleBrowser.PdfViewer.FormFilling" %>
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
    <div style="width:100%;height:100%;padding-left: 10px;min-height: 680px;float:right">                  
        <ej:PdfViewer ID="PdfViewer2" runat="server" PdfService="Local" ServiceUrl="../api/PdfViewer" DocumentPath="FormFillingDocument">
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
