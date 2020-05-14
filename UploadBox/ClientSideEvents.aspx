<%@ Page Language="C#" Title="UploadBox-Client-Side Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like create, destroy, fileselect, complete, error, success and remove etc in a ASP.NET Web Forms Upload control." Inherits="WebSampleBrowser.UploadBox.ClientSideEvents" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var uploadObj;
        $(function () {

            uploadObj = $("#<%=UploadEvents.ClientID%>").data("ejUploadbox");

            $('#selectControls').ejDropDownList({
                popupShown: "adjustpopupposition",
                showCheckbox: true,
                checkAll: true,
                change: "evtpropscheckedevent"
            });
        });
       function formatSize(bytes)
        {
            var i = -1;
            if (!bytes)
               return "0.0KB";
            do {
                bytes = bytes / 1024;
                i++;
            } while (bytes > 99);
            return Math.max(bytes, 0).toFixed(1) + ['KB', 'MB', 'GB', 'TB', 'PB', 'EB'][i];
        }

        function uploadload(e) {
            jQuery.addEventLog("Upload box control has been <span class='eventTitle'> created </span>.");
        }
       
        function fileselect(e) {
                for (var i = 0; i < e.files.length ;i++)
                {
                jQuery.addEventLog(e.files[i].name + "- file has been <span class='eventTitle'>selected </span>.");
            }
        }
        function fileuploadbegin(e) {
            jQuery.addEventLog("Upload has been<span class='eventTitle'> started </span> -" + e.files.name);
        }
        function fileuploadcancel(e) {
            jQuery.addEventLog("Upload has been <span class='eventTitle'>canceled </span>.");
        }
        function fileInprogress(e) {
            jQuery.addEventLog("Upload <span class='eventTitle'>is InProgress</span> - " + e.percentage + "% - " + e.file.name + " (" + formatSize(e.e.loaded) + ").");
        }
        function fileuploadcomplete(e) {
            jQuery.addEventLog("Upload action has been <span class='eventTitle'>completed </span>successfully .");
        }
        function fileuploadremove(e) {
            jQuery.addEventLog("Uploaded file has been <span class='eventTitle'> removed </span>successfully.");
        }
        function fileuploaderror(e) {
            jQuery.addEventLog("Upload action has <span class='eventTitle'>thrown an error </span>.");
        }
        function fileuploadDestroy(e) {
            jQuery.addEventLog("Upload control has been <span class='eventTitle'>destroyed </span>.");
        }
        function fileuploadSuccess(e) {
            jQuery.addEventLog("Upload of " + e.files.name + " is <span class='eventTitle'> success </span>.");
        }
        function onClear() {
            jQuery.clearEventLog();
        }

        function evtpropscheckedevent(args) {
            uploadObj = $("#<%=UploadEvents.ClientID%>").data("ejUploadbox");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create": uploadObj.option(args.selectedValue, "uploadload"); break;
                    case "fileSelect": uploadObj.option(args.selectedValue, "fileselect"); break;
                    case "begin": uploadObj.option(args.selectedValue, "fileuploadbegin"); break;
                    case "cancel": uploadObj.option(args.selectedValue, "fileuploadcancel"); break;
                    case "inProgress": uploadObj.option(args.selectedValue, "fileInprogress"); break;
                    case "complete": uploadObj.option(args.selectedValue, "fileuploadcomplete"); break;
                    case "remove": uploadObj.option(args.selectedValue, "fileuploadremove"); break;
                    case "uploadError": uploadObj.option(args.selectedValue, "fileuploaderror"); break;
                    case "success": uploadObj.option(args.selectedValue, "fileuploadSuccess"); break;
                    case "destroy": uploadObj.option(args.selectedValue, "fileuploadDestroy"); break;
                }
            }
            else uploadObj.option(args.selectedValue, null);
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .posupload {
            margin-left: 50px;
            margin-top: 20px;
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
                <ej:UploadBox ID="UploadEvents" runat="server" ClientSideOnDestroy="fileuploadDestroy" ClientSideOnError="fileuploaderror" ClientSideOnFileSelect="fileselect" ClientSideOnRemove="fileuploadremove" ClientSideOnComplete="fileuploadcomplete" 
              ClientSideOnInProgress="fileInprogress" ClientSideOnCancel="fileuploadcancel" ClientSideOnBegin="fileuploadbegin" ClientSideOnSuccess="fileuploadSuccess" ClientSideOnCreate="uploadload" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx"></ej:UploadBox>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition"  ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="create" Text="create"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="fileSelect" Text="uploadFileSelect"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="begin" Text="uploadBegin"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="cancel" Text="uploadCancel"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="inProgress" Text="Upload Progress"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="complete" Text="uploadComplete"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="remove" Text="uploadRemove"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="uploadError" Text="uploadError"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="success" Text="success"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="destroy" Text="destroy"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Type="Button" ClientSideOnClick="onClear" Text="Clear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

