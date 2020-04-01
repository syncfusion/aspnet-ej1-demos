<%@ Page Title="UploadBox-File Input-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FileInput.aspx.cs" MetaDescription="This example demonstrates how to restrict uploading of files based on file type using Syncfusion ASP.NET Web Forms Upload control." Inherits="WebSampleBrowser.UploadBox.FileInput" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var uploadobject;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function allowfiletype() {
            uploadobject = $("#<%=Upload1.ClientID%>").data("ejUploadbox");
            uploadobject.option('extensionsAllow', $("#fileallow").val());
            uploadobject.option('extensionsDeny', "");
            $("#filedeny").val('');
        }
        function denyfiletype() {
            uploadobject = $("#<%=Upload1.ClientID%>").data("ejUploadbox");
            uploadobject.option('extensionsAllow', "");
            uploadobject.option('extensionsDeny', $("#filedeny").val());
            $("#fileallow").val('');
        }
        function onError(args) {
            alert(args.error);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .posupload {
            margin-left: 50px;
            margin-top: 20px;
        }


        .tb6 {
            width: 80px;
            border-radius: 4px 4px 4px 4px;
            line-height: normal;
            height: 24px;
            padding-left: 4px;
        }

        .leftalign #upbutton1.e-button.e-inpttxt, .leftalign #upbutton2.e-button.e-inpttxt {
            padding: 2px 8px;
        }

        .cols-sample-area {
            position: relative;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="posupload">
                <ej:UploadBox ID="Upload1" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" MultipleFilesSelection="true" ClientSideOnError="onError" runat="server"></ej:UploadBox>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="row">
            <div class="col-md-3">
                Extensions:
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <input type="text" id="fileallow" class="tb6 ejinputtext" />
            </div>
            <div class="col-md-3">
                <ej:Button ID="upbutton1" Type="Button" CssClass="e-btn" Text="Allow" ClientSideOnClick="allowfiletype" runat="server"></ej:Button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
                <input type="text" id="filedeny" class="tb6 ejinputtext" />
            </div>
            <div class="col-md-3">
                <ej:Button ID="upbutton2" Type="Button" CssClass="e-btn" Text="Deny" ClientSideOnClick="denyfiletype" runat="server"></ej:Button>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
</asp:Content>

