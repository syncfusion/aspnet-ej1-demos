<%@ Page Title="" Language="C#" MetaDescription="This example demonstrates the responsive behavior of the Syncfusion ASP.NET Web Forms Kanban component based on the client browser width and height." AutoEventWireup="true" CodeBehind="Adaptive.aspx.cs" Inherits="WebSampleBrowser.Kanban.Adaptive" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KanbanBoard-Adaptive-ASP.NET-SYNCFUSION</title>
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
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>
	<style>
      .e-kbnfilter-dlgmodal{
	   overflow: hidden;
	 }
     .e-dialog-modal{
        overflow-y: hidden;
     } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" IsResponsive="true" AllowTitle="true" KeyField="Status" AllowKeyboardNavigation="true" AllowSearching="true">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" ShowAddButton="true" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
		 <EditSettings AllowAdding="true" AllowEditing="true" EditMode="Dialog">
            <EditItems>
                <ej:KanbanEditItem EditType="String" Field="Id">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Status"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Assignee"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Numeric" Field="Estimate">
                    <NumericEditOptions DecimalPlaces="2" />
                    <ValidationRules>
                        <ej:KeyValue Key="range" Value="[0, 1000]" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="TextArea" Field="Summary">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
            </EditItems>
        </EditSettings>
		 <FilterSettings>
            <ej:KanbanFilterSetting Text="Janet Issues" Query="new ej.Query().where('Assignee', 'equal', 'Janet Leverling')" Description="Displays issues which matches the assignee as 'Janet Leverling" />
            <ej:KanbanFilterSetting Text="Testing" Query="new ej.Query().where('Status', 'equal', 'Testing')" Description="Display the issues of 'Testing'" />
        </FilterSettings>
    </ej:Kanban>
				  <script type="text/javascript">
				      $(function () {
				          if (window.addEventListener) {
				              window.addEventListener('message', function (e) {
				                  var kanbanObj = $("#KanbanBoard").ejKanban("instance");
                                 if (e.data == "mobile") 
					              kanbanObj._kanbanWindowResize()
                                 else if (e.data == "desktop") 
					              kanbanObj._kanbanWindowResize()
                                 else if (e.data == "tablet")
                                                      kanbanObj.kanbanWindowResize();
                                 if (typeof e.data == "boolean") 
					               kanbanObj._kanbanWindowResize()
				                 else 
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
