<%@ Page Title="UploadBox-Synchronous Upload-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SynchronousUpload.aspx.cs" MetaDescription="This example demonstrates how to upload multiple files synchronously using Syncfusion ASP.NET Web Forms Upload control." Inherits="WebSampleBrowser.UploadBox.SynchronousUpload" %>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .posupload {
            margin-left: 50px;
            margin-top: 20px;
        }

        .post {
            margin: 12px 0px 10px 20px;
        }

        .cols-sample-area {
            position: relative;
        }
        .uploadtext {
            text-align:center;
        }
        .material .post {
            margin: 12px 0px 0px 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="uploadtext">Select a file to upload </div>
            <div class="posupload">
                <ej:UploadBox ID="SyncUpload" runat="server" AsyncUpload="false"></ej:UploadBox><%-- Uploading files will be done only on clicking submit button after selecting the files.--%>
                <ej:Button ID="post" CssClass="post" Type="Submit" runat="server" OnClick="post_Click" Text="Submit" /><%--Once the  submit button is clicked it triggers the post_Click method of aspx.cs file and selcted file is uploaded.--%>
            </div>
            <asp:Label ID="status" runat="server" />
        </div>
    </div>
</asp:Content>

