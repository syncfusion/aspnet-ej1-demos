<%@ Page Language="C#" MetaDescription="This demo shows the responsive behavior of Syncfusion ASP.NET Web Forms DataGrid control with respect to different client browsers’ width and height." AutoEventWireup="true" CodeBehind="Adaptive.aspx.cs" Inherits="WebSampleBrowser.Grid.Adaptive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite.css" rel="stylesheet" />
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
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
        .e-grid + span {
            display:block!important;
        }
        ::-ms-clear {
            display: none;
        }
        .e-gridAdaptive {
                border-width: 0px !important;
            }
		.e-grid.e-responsive {
			-webkit-box-sizing: border-box;
			-moz-box-sizing: border-box;
			box-sizing: border-box;
		}
    </style>
</head>
<body style="overflow:hidden">
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ej:Grid ID="FlatGrid" runat="server"  MinWidth="600" IsResponsive="true" AllowSorting="true" AllowMultiSorting="true" AllowPaging="True" EnableResponsiveRow="false" AllowFiltering="true">
                   <ClientSideEvents  ActionComplete="actionComplete"/>
                     <PageSettings PageCount="3" PageSize="7" />
                    <FilterSettings FilterType="Menu" />
                    <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
                    <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel,search"></ToolbarSettings>
                    <FilterSettings FilterType="Menu"></FilterSettings>
                    <Columns>
                        <ej:Column Field="OrderID" HeaderText="Order ID" Width="90" IsPrimaryKey="True" TextAlign="Right">
                        </ej:Column>
                        <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100">
						
                            </ej:Column>
						<ej:Column Field="EmployeeID" HeaderText="Employee ID" Width="90" EditType="DropdownEdit" TextAlign="Right" />
                        <ej:Column Field="Freight" HeaderText="Freight" Width="80" EditType="NumericEdit" TextAlign="Right" Format="{0:C}">
                             <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                        </ej:Column>
						<ej:Column Field="ShipCity" Width="120" HeaderText="Ship City" EditType="DropdownEdit" />
                    </Columns>
                </ej:Grid>
                  
				  <script type="text/javascript">
				      $(function () {
				          if (window.addEventListener) {
				              window.addEventListener('message', function (e) {
				                  if (e.data == "mobile") {
				                      $('body').css('margin', '0px');
				                      $('body').css('width', '100%');
				                      var gridObj = $("#FlatGrid").data('ejGrid');
				                      var obj = $("#FlatGrid").ejGrid("instance");
				                      obj.phoneMode = true;
				                      if (obj.model.isEdit)
				                          obj.cancelEdit();
				                      $("#FlatGrid").ejGrid("model.scrollSettings.height", "100%");
				                      $("#FlatGrid").ejGrid("model.pageSettings.pageSize", 10);
				                      $('.e-gridAdaptive').removeClass('e-gridAdaptive');
				                  }
				                  else if (e.data == "desktop") {
									  var obj = $("#FlatGrid").ejGrid("instance");
									  if(obj.model.enableResponsiveRow)
									 	$("#FlatGrid").ejGrid("model.enableResponsiveRow", false);
				                      $('body').css('margin-right', '1%');
				                      $('body').css('width', '99%');
				                      $("#FlatGrid").ejGrid("model.pageSettings.pageSize", 7)
				                      obj.windowonresize();
				                  }
				                  if (typeof e.data == "boolean") {
				                      var gridObj = $("#FlatGrid").data('ejGrid');
				                      var obj = $("#FlatGrid").ejGrid("instance");
				                      if (obj.model.isEdit)
				                          obj.cancelEdit();
				                      $("#FlatGrid").ejGrid("model.enableResponsiveRow", e.data);
				                      if (e.data) {
				                          $("#FlatGrid").css("width", "303px");
				                          $('body').css('overflow', 'visible');
				                          $('body').css('overflow-x', 'hidden');
										  obj.getContent().addClass("e-widget");
				                      }
				                      else {
				                          $("#FlatGrid").ejGrid("model.pageSettings.pageSize", 10)
				                          $('body').css('overflow', 'hidden');
				                      }
				                  }
				                  else 
				                      changeTheme();
				              });
				          }
				          window.onload = function () {
				              changeTheme();
				          }
				      });
				      function actionComplete(args) {
				          if (args.requestType == "filtering" || args.requestType == "searching") {
				              var proxy = this;
				              setTimeout(function () { proxy.windowonresize(); }, 30);
				          }
				      }
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
