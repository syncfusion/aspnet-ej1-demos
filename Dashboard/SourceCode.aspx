<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SourceCode.aspx.cs" Inherits="WebSampleBrowser.Dashboard.SourceCode" %>

<%@ Register Src="~/Dashboard/ShowCaseTab.ascx" TagName="ShowTab" TagPrefix="Sync" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Essential Studio for ASP.NET  : Sourcecode of Dashboard</title>
	<meta charset="utf-8" />
      <meta content="width=device-width, initial-scale=1.0" name="viewport" />
      <meta name="description" content="Sourcecode for Showcase samples | ASP.NET">
    <link rel="shortcut icon" href="../Content/images/favicon.ico" />

    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/SourceTabFormatter.css" rel="stylesheet" />
    <%--<link href="../Content/sampleBrowserSite.css" rel="stylesheet" />--%>
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.webform.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ZeroClipboard.js")%>' type="text/javascript"></script>
    <style type="text/css">
        /*Copy to clipboard CSS*/
        .copycodeicon:before {
            content: "\e743";
        }

        .copycodeicon {
            font-size: 21px !important;
            margin: 7px 9px 0 0 !important;
        }

        .copycodedown {
            border: 1px solid #bbbcbb;
            border-radius: 2px;
            display: block;
            height: 30px;
            line-height: 2;
            margin: 40px 0 10px 9px;
            text-align: center;
            width: 160px;
            font-size:13px;
            font-weight:600;
        }

        .copycodedown.zeroclipboard-is-hover {
            background-color: #f5f5f5;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="cols-source sourcecodeTab">
            <Sync:ShowTab ID="codeviewtab1" runat="server" />
        </div>
    </form>
</body>
</html>
