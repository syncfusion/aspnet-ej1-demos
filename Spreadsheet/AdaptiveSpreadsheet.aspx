<%@ Page Language="C#" AutoEventWireup="true" MetaDescription="This example shows how the ASP.NET Web Spreadsheet layout adapts to mobile,tablet,desktop devices." CodeBehind="AdaptiveSpreadsheet.aspx.cs" Inherits="WebSampleBrowser.SpreadsheetASP.AdaptiveSpreadsheet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite.css" rel="stylesheet" />
    <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite-responsive.css" rel="stylesheet" />
    <link href="../Content/SourceTabFormatter.css" rel="stylesheet" />
    <!--[if lt IE 9]>
    <script src="../scripts/jquery-1.11.3.min.js"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
    <script src="../scripts/jquery-3.4.1.min.js"></script>
    <!--<![endif]-->
    <script src="../Scripts/jquery.easing-1.3.min.js"></script>
    <script src="../Scripts/jquery.globalize.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.validate.unobtrusive.min.js" type="text/javascript"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>
    <style>
        html, body, .e-form1 {
            height:100%;
        }
    </style>
    <script type="text/javascript">
        function loadComplete(args) {
            var xlFormat = this.XLFormat;
            if (!this.model.isImport) {
                this.setWidthToColumns([142, 132, 110, 105, 102, 112, 122, 122, 102]);
                xlFormat.format({ "style": { "font-weight": "bold" } }, "A1:H1");
                xlFormat.format({ "type": "currency" }, "E2:H11");
                this.XLRibbon.updateRibbonIcons();
            }
        }
    </script>
</head>
<body style="overflow: hidden">
    <form id="form1" runat="server" class ="e-form1">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ej:Spreadsheet ID="FlatSpreadsheet" OnServerExcelExporting="Spreadsheet_ServerExcelExporting" OnServerCsvExporting="Spreadsheet_ServerCsvExporting" OnServerPdfExporting="Spreadsheet_ServerPdfExporting" runat="server">
                    <ClientSideEvents LoadComplete="loadComplete" />
                    <ScrollSettings Width="100%" Height="100%" IsResponsive="true" />
                    <ImportSettings ImportMapper="SpreadsheetHandler.ashx" />
                </ej:Spreadsheet>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
