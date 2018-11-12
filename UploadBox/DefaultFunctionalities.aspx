<%@ Page Title="UploadBox / Default Functionalities" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.UploadBox.DefaultFunctionalities" %>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .posupload {
            margin-left: 50px;
            margin-top: 20px;
        }

        .cols-sample-area {
            position: relative;
        }

        .uploadtext {
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
             <div class="uploadtext">Select a file to upload </div>
            <div class="posupload">
                <ej:UploadBox ID="Upload1" runat="server" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx"></ej:UploadBox>
            </div>
        </div>
    </div>
</asp:Content>
