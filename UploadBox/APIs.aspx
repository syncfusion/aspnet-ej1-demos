<%@ Page Title="UploadBox-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods enable, disable in a ASP.NET Web Forms UploadBox control." Inherits="WebSampleBrowser.UploadBox.APIs" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        $(function () {
            $("#check1").ejCheckBox({ "change": "OnCheck" ,"checked":"true"});
            target = $("#<%=Upload1.ClientID%>").data("ejUploadbox");
            $("#enableButton").ejToggleButton({
                defaultText: "Disable",
                activeText: "Enable",
                size: "normal",
                change: "onCheckUncheckAll",
                width:"110px"
            });
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onCheckUncheckAll(args) {
            if (args.isChecked)

                target.disable();
            else
                target.enable();
        }
        function OnCheck(args) {
            if (args.isChecked) {
                target.setModel({ multipleFilesSelection: true });
            } else {
                target.setModel({ multipleFilesSelection: false });
            }

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
                <ej:UploadBox ID="Upload1" SaveUrl="saveFiles.ashx" RemoveUrl="removeFiles.ashx" runat="server" ></ej:UploadBox>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6">Enable / Disable</div>
                    <div class="col-md-6">
                        <input type="checkbox" id="enableButton" class="e-togglebtn" value="checkuncheck" />
                    </div>
                
            </div>
            <div class="row">
                <div class="col-md-6">Multiple Files Selection</div>
                    <div class="col-md-6">
                        <input type="checkbox" id="check1" />
                    </div>
               
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="EventSection" runat="server">
</asp:Content>

