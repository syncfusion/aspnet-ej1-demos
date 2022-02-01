<%@ Page Language="C#" AutoEventWireup="true" MetaDescription="This example illustrates fluid rendering functionality of the tree grid control in mobile, tablet, and desktop environments." CodeBehind="AdaptiveTreegrid.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.AdaptiveTreegrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite.css" rel="stylesheet" />
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
    <style>
        body, html {
            height: 100%;
            margin: 0px;
            padding: 0px;
        }

        #TreeGridControlAdaptive {
            position: absolute;
        }
    </style>
</head>
<body style="overflow:hidden">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="TreegridPanel" runat="server">
            <ContentTemplate>
        <ej:TreeGrid runat="server" ID="TreeGridControlAdaptive" AllowPaging="true" ChildMapping="SubTasks" ColumnDialogFields="field,headerText,width,filterEditType,allowSorting" AllowColumnReordering="true" allowsorting="true" ShowGridCellTooltip="true" ShowColumnChooser="true" ShowColumnOptions="true" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" Width="90" EditType="String" ClipMode="Ellipsis" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" Priority="5" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" Priority="6" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" Priority="6" />
            </Columns>
            <SelectionSettings SelectionMode="Row" SelectionType="Multiple" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll"></ToolbarSettings>
            <EditSettings AllowAdding="true" AllowDeleting="true" AllowEditing="true" EditMode="DialogEditing" DialogEditorTemplateID="" />
            <SizeSettings Width="100%" Height="100%" />
        </ej:TreeGrid>
     <script type="text/javascript">
				      $(function () {
				          if (window.addEventListener) {
				              window.addEventListener('message', function (e) {
				                      changeTheme();
				              });
				          }
				          window.onload = function () {
				              changeTheme();
				          }
				      });
				      function changeTheme() {
				          var links = $(document.head || document.getElementsByTagName('head')[0]).find("link");
				          for (var i = 0; i < links.length; i++) {
				              if (links[i].href.indexOf("ej.theme.min.css") != -1) {
				                  var cssref = links[i].href,
                                      serverconfig = cssref.substr(0, cssref.indexOf("Content") - 1), fileref, theme;
				                  theme = window.parent.themes[window.parent.theme]
				                  fileref = $('<link rel="stylesheet" type="text/css" href="' + serverconfig + theme + '" />');
				                  $(fileref).insertAfter(links[i]);
				                  $(links[i]).remove();
				                  break;
				              }
				          }
				      }
				    
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
