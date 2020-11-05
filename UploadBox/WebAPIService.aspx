<%@ Page Language="C#" Title="UploadBox-Web API Service-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="WebAPIService.aspx.cs" MetaDescription="This example demonstrates how to upload a file and save it using a web api service in Syncfusion ASP.NET Web Forms Upload control." Inherits="WebSampleBrowser.UploadBox.WebAPIService" %>

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
                <ej:UploadBox ID="UploadDefault" runat="server" SaveUrl= "//js.syncfusion.com/ejServices/api/uploadbox/Save" RemoveUrl="//js.syncfusion.com/ejServices/api/uploadbox/Remove" uploadName="Uploadbox" ></ej:UploadBox>
               
            </div>
        </div>
    </div>
</asp:Content>


