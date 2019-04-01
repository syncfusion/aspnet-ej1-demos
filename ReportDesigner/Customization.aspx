<%@ page language="C#" masterpagefile="~/Samplebrowser.Master" autoeventwireup="true" codebehind="Customization.aspx.cs" inherits="WebSampleBrowser.ReportDesigner.Customization" %>

<asp:content id="Content1" contentplaceholderid="SampleHeading" runat="server">
    <span class="sampleName">ReportDesigner / Toolbar Customization</span>
</asp:content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeadSection">
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.min.css")%>'/>
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/show-hint.min.css")%>'/>
</asp:Content>

<asp:content id="ControlContent" runat="server" contentplaceholderid="ControlsSection">
    <div class="control">
        <div id="designerContainer" style="display: none">
            <ej:ReportDesigner ClientIDMode="Static" ID="ReportDesigner1" runat="server" ServiceUrl="../api/ReportDesigner" OnClientCreate="designerInitialization" OnClientToolbarRendering="renderDesignerToolbar">
            </ej:ReportDesigner>
        </div>
        <div id="viewerContainer" style="display: block">
            <ej:ReportViewer ClientIDMode="Static" ID="ReportViewer1" runat="server" ReportServiceUrl="../api/ReportDesigner" ReportServerUrl="/" ReportPath="~/App_Data/ReportServer/Report/Catagory1/Website Visitor Analysis.rdl" ProcessingMode="Remote" OnClientToolbarRendering="renderViewerToolbar">
            </ej:ReportViewer>
        </div>
    </div>
</asp:content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/sql.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/show-hint.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/sql-hint.js")%>' type="text/javascript"></script>

    <script type="text/javascript">
        var rptName = "/Catagory1/Website Visitor Analysis";

        $(window).on("load", function () {
            if ((ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                alert("ReportDesigner will not be supported in IE Version < 9");
            }
        });

        function designerInitialization(args) {
            var designer = $('#ReportDesigner1').data('ejReportDesigner');
            designer.openReport(rptName);
        }

        function showViewer() {
            $("#viewerContainer").css('display', 'block');
            $("#ReportViewer1").css('display', 'block');
            $("#designerContainer").css('display', 'none');
            $("#ReportDesigner1").css('display', 'none');
            var viewer = $('#ReportViewer1').data('ejReportViewer');
            viewer.reload();
        }

        function showDesigner() {
            $('#ReportViewer1_loadingIndicator').data('ejWaitingPopup').hide();
            $("#ReportViewer1").css('display', 'none');
            $("#viewerContainer").css('display', 'none');
            $("#designerContainer").css('display', 'block');
            $("#ReportDesigner1").css('display', 'block');
            var designer = $('#ReportDesigner1').data('ejReportDesigner');
            if (designer) {
                designer.openReport(rptName);
                var waitingPopup = $('#ReportDesigner1_designAreaContainer').data('ejWaitingPopup');
                waitingPopup.hide();
            } else {
                renderDesigner();

            }
        }

        function saveReport() {
            var designer = $('#ReportDesigner1').data('ejReportDesigner');
            designer.downloadReport();
        }

        function updateViewerHiddenList() {
            if ($('#ReportViewer1_toolbarContainer_target').length > 0 && $('#ReportViewer1_toolbarContainer_hiddenlist').is(':visible')) {
                $('#ReportViewer1_toolbarContainer_target').mousedown();
            }
        }

        function updateDesignerHiddenList() {
            if ($('#ReportDesigner1_toolBar_target').length > 0 && $('#ReportDesigner1_toolBar_hiddenlist').is(':visible')) {
                $('#ReportDesigner1_toolBar_target').mousedown();
            }
        }

        function cancelReport() {
            var designer = $('#ReportDesigner1').data('ejReportDesigner');
            updateDesignerHiddenList();
            if (designer.hasReportChanges()) {
                if (confirm("Changes you made may not be saved. Do you want back to Preview?")) {
                    showViewer();
                } else {
                    return;
                }
            } else {
                showViewer();
            }
        }

        function renderViewerToolbar(args) {
            var ulTag = $("<ul class='e-reportviewer-sample-toolbarul'/>");
            ulTag.attr('id', 'reportviewer-toolbarul');
            var divElement = $("<div/>");
            divElement.attr('id', 'reportviewer-edit-div');
            var editbutton = $("<button></button>");
            editbutton.attr('id', 'reportviewer-editbutton');
            divElement.append(editbutton);
            ulTag.append(divElement);
            args.target.append(ulTag);
            editbutton.bind('click', $.proxy(editClick, this));
            editbutton.ejButton({
                size: "medium",
                showRoundedCorner: true,
                cssClass: 'e-primary',
                contentType: "textandimage",
                prefixIcon: "e-icon e-edit",
                text: "Edit",
                type:"Button"
            });
            if (window.theme === 'office-365') {
                $('#reportviewer-edit-div').css('padding-top', '8px');
            }
        }

        function renderDesignerToolbar(args) {
            var ulTag = $("<ul class='e-rptdesigner-sample-toolbarul'/>");
            ulTag.attr('id', 'reportdesigner-toolbarul');
            var divElement = $("<div/>");
            divElement.attr('id', 'reportdesigner-btn-div');
            var saveButton = $("<button></button>");
            saveButton.attr('id', 'reportdesigner-savebutton');
            var backButton = $("<button></button>");
            backButton.attr('id', 'reportdesigner-backbutton');
            divElement.append(saveButton);
            divElement.append(backButton);
            ulTag.append(divElement);
            args.target.append(ulTag);
            saveButton.bind('click', $.proxy(saveClick, this));
            backButton.bind('click', $.proxy(cancelClick, this));
            saveButton.ejButton({
                size: "medium",
                showRoundedCorner: true,
                cssClass: 'e-primary',
                contentType: "textandimage",
                prefixIcon: "e-icon e-save",
                text: 'Save',
                type: "Button"
            });
            backButton.ejButton({
                size: "medium",
                showRoundedCorner: true,
                contentType: "textandimage",
                prefixIcon: "e-icon e-undo",
                text: 'Back',
                type: "Button"
            });
        }

        function editClick(args) {
            updateViewerHiddenList();
            showDesigner();
        }

        function saveClick(args) {
            updateDesignerHiddenList();
            saveReport();
        }

        function cancelClick(args) {
            cancelReport();
        }
    </script>

    <style type="text/css">
        .control {
            width: 100%;
            height: 100%;
            margin: 0 auto;
        }

        #designerContainer,#viewerContainer {
          width: 100%;
          height: 100%;
        }

        #ReportDesigner1 {
            display:none;
        }

        #ReportViewer1 {
            display:block;
        }

        #ReportDesigner1, #ReportViewer1 {
            width: 100%;
            height: 650px;
        }

        #reportdesigner-btn-div {
            width: 170px;
        }

        #reportviewer-editbutton,
        #reportviewer-toolbarul,
        #reportdesigner-toolbarul,
        #reportviewer-edit-div {
            float: right;
        }

        #reportviewer-editbutton,
        #reportdesigner-savebutton,
        #reportdesigner-backbutton {
            margin-right: 5px;
            margin-top: 4.5px;
            margin-bottom: 5.5px;
        }

        #reportdesigner-savebutton,
        #reportdesigner-backbutton,
        #reportviewer-editbutton {
            font-family: 'Segoe UI';
            height: 26px;
            width: 78px;
            font-size: 11px;
        }

        .e-rptdesigner .e-rptdesigner-toolbarul,
        .e-reportviewer-toolbarcontainer .e-reportviewer-toolbarul,
        .e-rptdesigner .e-rptdesigner-sample-toolbarul,
        .e-reportviewer-toolbarcontainer .e-reportviewer-sample-toolbarul {
            display: inline-block;
        }

        .e-rptdesigner .e-rptdesigner-toolbarul-begin.e-separator,
        .e-rptdesigner .e-rptdesigner-toolbarul-preview.e-separator,
        .e-rptdesigner .e-rptdesigner-sample-toolbarul {
            border-right: 0 none !important;
        }
    </style>
</asp:Content>

