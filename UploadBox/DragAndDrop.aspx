<%@ Page Title="UploadBox-Drag And Drop-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DragAndDrop.aspx.cs" MetaDescription="This example demonstrates how to drag the files and upload it using Syncfusion ASP.NET Web Forms Upload control." Inherits="WebSampleBrowser.UploadBox.Dranganddrop" %>


<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 500px;
            height: 100px;
            margin-top: 10%;
        }

        .control {
            width: 100%;
            height: 100%;
        }

        .cols-sample-area {
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:UploadBox ID="Upload1" runat="server" AllowDragAndDrop="true" MultipleFilesSelection="true" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx"></ej:UploadBox>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
<script>
document.addEventListener('dragover',function(event){
    event.preventDefault();
    event.dataTransfer.dropEffect = 'none';
    return false;
	},false);
	document.addEventListener('drop',function(event){
    event.dataTransfer.dropEffect = 'none';
    event.preventDefault();
    return false;
  },false);
</script>
</asp:Content>

