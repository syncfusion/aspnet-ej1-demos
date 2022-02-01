<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Adaptive.aspx.cs" Inherits="WebSampleBrowser.Schedule.Adaptive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Schedule-Adaptive-ASP.NET-SYNCFUSION</title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
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
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="490px" CurrentDate="6/5/2017">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>
                    </div>
                <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
                <script type="text/javascript">
                    $(function () {
                        if (window.addEventListener) {
                            window.addEventListener('message', function (e) {
                                if (typeof e.data != "boolean"){
                                    var links = $(document.head || document.getElementsByTagName('head')[0]).find("link");
                                    for (var i = 0; i < links.length; i++) {
                                        if (links[i].href.indexOf("ej.theme.min.css") != -1) {
                                            var cssref = links[i].href,
                                                serverconfig = cssref.substr(0, cssref.indexOf("Content") - 1),
                                                fileref = $('<link rel="stylesheet" type="text/css" href="' + serverconfig + window.parent.themes[e.data.split('_')[1]] + '" />');
                                            $(fileref).insertAfter(links[i]);
                                            $(links[i]).remove();
                                            break;
                                        }
                                    }

                                }
                            });
                        }
                    });
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
