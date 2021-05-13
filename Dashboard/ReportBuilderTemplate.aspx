<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportBuilderTemplate.aspx.cs" Inherits="WebSampleBrowser.Dashboard.ReportBuilderTemplate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <title>Essential Studio for ASP.NET  : Personal Expense Analysis</title>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta name="description" content="Report designer is a powerful component used to design SSRS RDL report using the parameter, drill through, subreport, nested data region with sort and filter, etc.| ASP.NET">
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.reportdesigner.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.reportdesigner.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.min.css")%>'/>
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/show-hint.min.css")%>'/>
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
	<script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/show-hint.js")%>' type="text/javascript" ></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/sql-hint.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/sql.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.reportdesigner.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/properties.js")%>' type="text/javascript"></script>

    <script type="text/javascript">
        var isSubmit = true;
        var controlId = 'ReportDesigner1';

        $(window).on("load", function () {
            if ((ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                alert("ReportDesigner will not be supported in IE Version < 9");
            }
        });

        $(document).ready(function () {
            if (!(ej.browserInfo().name === "msie" && Number(ej.browserInfo().version) < 9)) {
                $(window).bind("resize", windowResize);
                $('#preview_btn').bind("click", previewClick);
                $('#design_btn').bind("click", designClick);
                refreshWindow();
            } else {
                alert("ReportDesigner will not be supported in IE Version < 9");
            }
        });

        function windowResize(args) {
            refreshWindow();
        }

        function previewClick(agrs) {
            var designer = $('#' + controlId).data('ejReportDesigner');
            $('#design_btn').show();
            $('.rptdesigner-sample-designBtn').css('display', 'block');
            $('#preview_btn').hide();
            $('.rptdesigner-sample-previewBtn').css('display', "none");
            designer.showPreview();
        }

        function designClick(agrs) {
            var designer = $('#' + controlId).data('ejReportDesigner');
            $("#preview_btn").show();
            $(".rptdesigner-sample-previewBtn").css('display', 'block');
            $("#design_btn").hide();
            $(".rptdesigner-sample-designBtn").css('display', 'none');
            designer.showDesign();
        }

        function formSubmit(args) {
            isSubmit = false;
        }

        function windowUnload(args) {
            var designer = $('#' + controlId).data('ejReportDesigner');
            if (designer.hasReportChanges() && isSubmit) {
                return 'Changes you made may not be saved';
            }
            isSubmit = true;
        }

        function refreshWindow() {
            $('#' + controlId).width($(window).width());
            var windowHeight = $(window).innerHeight();
            var headerHeight = $("#sample_header_div").outerHeight();
            var containerHeight = windowHeight - headerHeight;
            $('#' + controlId).height(containerHeight);
        }

        function controlInitialized(args) {
            var designer = $('#' + controlId).data('ejReportDesigner');
            designer.openReport('/Catagory2/Personal Expense Analysis');
        }

        function reportModified(args) {
            if (args.isModified) {
                $('.rptdesigner-sample-reportstatus').html('(Edited)');
            }
        }

        function reportOpened(args) {
            $('#report_name_header').html(args.reportName);
            $('.rptdesigner-sample-reportstatus').html('(Edited)');
        }

        function reportSaved(args) {
            $('#report_name_header').html(args.reportName);
            $('.rptdesigner-sample-reportstatus').html('(Saved)');
        }

        function toolbarClick(args) {
            var designer = $('#' + controlId).data('ejReportDesigner');
            switch (args.click) {
                case 'New':
                    args.cancel = true;
                    if (designer.hasReportChanges()) {
                        if (confirm("Do you want to discard the modifed changes?") == true) {
                            designer.newReport('Untitled');
                            $('#report_name_header').html('Untitled');
                        }
                    }
                    else {
                        designer.newReport('Untitled');
                        $('#report_name_header').html('Untitled');
                    }
                    break;
            }
        }
    </script>

    <style type="text/css">
        .rptdesigner-sample-header {
            width: 100%;
            height: 40px;
            background-color: #333842;
            font-family: 'Segoe UI';
        }

            .rptdesigner-sample-header .rptdesigner-sample-previewBtn,
            .rptdesigner-sample-header .rptdesigner-sample-designBtn {
                width: 100px;
                height: 40px;
                float: right;
            }

                .rptdesigner-sample-header .rptdesigner-sample-previewBtn .preview-btn,
                .rptdesigner-sample-header .rptdesigner-sample-designBtn .design-btn {
                    background-color: #0079bc;
                    color: #fff;
                }

                .rptdesigner-sample-header .rptdesigner-sample-previewBtn .preview-btn,
                .rptdesigner-sample-header .rptdesigner-sample-designBtn .design-btn {
                    width: 80px;
                    margin-top: 7px;
                    height: 25px;
                    margin-left: 0px;
                    border: 0;
                    border-radius: 2px;
                    font-weight: 600;
                    font-size: 12px;
                    font-family: Segoe UI !important;
                }

            .rptdesigner-sample-header .report-name,
            .rptdesigner-sample-header .report-status {
                display: inline-block;
                padding-left: 6px;
            }

            .rptdesigner-sample-header .report-name {
                color: #fff;
                font-size: 16px !important;
            }

            .rptdesigner-sample-header .report-status {
                color: #a9a9a9;
                font-family: Segoe UI;
                padding-left: 15px;
                font-style: italic;
            }

            .rptdesigner-sample-header .main-screen-logo {
                width: 40px;
                height: 30px;
                display: inline-block;
                margin-top: 5px;
            }

            .rptdesigner-sample-header .rptdesigner-sample-designBtn .design-btn {
                display: none;
            }

            .rptdesigner-sample-header .preview-btn:hover,
            .rptdesigner-sample-header .design-btn:hover {
                background-color: #009aef;
            }

            .rptdesigner-sample-header .main-screen-logo img {
                height: 30px;
                padding-left: 5px;
                margin-top: -1px;
            }

        .rptdesigner-sample-reportname,
        .rptdesigner-sample-reportstatus {
            display: inline-block;
            margin: 0;
            vertical-align: middle;
            font-family: 'Segoe UI';
            font-size: 13px !important;
            font-weight: 400;
        }

        #ReportDesigner1 {
             width: 100%;
             height: 100%;
         }

         html, body {
             overflow: hidden; padding:0; margin: 0;height:100%;position:static;
         }
    </style>
</head>
<body>
    <form runat="server" id="form1">
         <div id="sample_header_div" class="rptdesigner-sample-header">
            <div class="rptdesigner-sample-previewBtn">
                <button id="preview_btn" type="button" class="preview-rep preview-btn">
                    <span>Preview</span>
                </button>
            </div>
            <div class="rptdesigner-sample-designBtn">
                <button id="design_btn" type="button" class="preview-rep design-btn">
                    <span>Design</span>
                </button>
            </div>
            <div class="main-screen-logo">
                <a class="home-link" data-toggle="tooltip" data-placement="bottom" title="Syncfusion Report Designer">
                    <img alt="Application Logo" id="application-logo" src="../../Content/images/favicon.ico" onerror="if (this.src !== '../../Content/images/favicon.ico') this.src = '../../Content/images/favicon.ico';" />
                </a>
            </div>
            <div class="report-name">
                <h5 class="rptdesigner-sample-reportname" id="report_name_header">Untitled</h5>
            </div>
            <div class="report-status">
                <h5 class="rptdesigner-sample-reportstatus" id="report_status_header">(Edited)</h5>
            </div>
        </div>
        <div style="height: 94%;width: 100%;position:absolute">
            <ej:ReportDesigner ClientIDMode="Static" ID="ReportDesigner1" runat="server" ServiceUrl="../api/ReportDesigner" OnClientCreate="controlInitialized" OnClientToolbarRendering="renderDesignerToolbar" OnClientToolbarClick="toolbarClick" OnClientReportOpened="reportOpened" OnClientReportSaved="reportSaved" OnClientReportModified="reportModified">
            </ej:ReportDesigner>
        </div>
        <div id="footer">
            <div class="bottom-links">
                <div class="left">
                    <div class="sync-text">
                        Copyright © 2001-2021 Syncfusion Inc.
                    </div>
                </div>
                <div class="right">
                    <a href="https://www.syncfusion.com">
                        <div class="syncfusion-image"></div>
                    </a>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
