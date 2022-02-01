<%@ Page Language="C#" MetaDescription="This demo explains the Responsive behavior of Syncfusion ASP.NET Web Forms DataGrid control with respect to different client browser’s width and height" AutoEventWireup="true" CodeBehind="Responsive.aspx.cs" Inherits="WebSampleBrowser.Grid.Responsive" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title></title>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/ej.widgets.core.min.css" rel="stylesheet" />
    <link href="../Content/ejthemes/flat-lime/ej.theme.min.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite.css" rel="stylesheet" />
    <link href="../Content/ejthemes/responsive-css/ej.responsive.css" rel="stylesheet" />
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <link href="../Content/sampleBrowserSite-responsive.css" rel="stylesheet" />
    <link href="../Content/SourceTabFormatter.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.11.3.min.js"></script>
    <script src="../Scripts/jquery.easing-1.3.min.js"></script>
    <script src="../Scripts/jquery.globalize.min.js"></script>
    <script src="../Scripts/jquery.validate.min.js"></script>
    <script src="../Scripts/jsrender.min.js"></script>
    <script src="../Scripts/ej.web.all.min.js"></script>
	<style>
        .e-grid + span {
            display: block !important;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <ej:Grid ID="FlatGrid" runat="server"  MinWidth="700" IsResponsive="true" AllowPaging="True" EnableResponsiveRow="true">
                   <ClientSideEvents  ActionComplete="actionComplete"/>
                     <PageSettings PageCount="3" PageSize="7" />
                    <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
                    <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
                    <Columns>
                        <ej:Column Field="OrderID" HeaderText="Order ID" Width="90" IsPrimaryKey="True" TextAlign="Right">
                            <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                                <ej:KeyValue Key="number" Value="true" />
                            </ValidationRule>
                        </ej:Column>
                        <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100">
						<ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                            </ValidationRule>
                            </ej:Column>
						<ej:Column Field="EmployeeID" HeaderText="Employee ID" Width="90" EditType="DropdownEdit" TextAlign="Right" />
                        <ej:Column Field="OrderDate" Width="120" HeaderText="Order Date" EditType="Datepicker" Format="{0:MM/dd/yyyy}" />
                        <ej:Column Field="Freight" HeaderText="Freight" Width="80" EditType="NumericEdit" TextAlign="Right" Format="{0:C}">
                             <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                        </ej:Column>
                    </Columns>

                </ej:Grid>
                  
				  <script type="text/javascript">
                    $(function () {
                        if (window.addEventListener) {
                            window.addEventListener('message', function (e) {
                                if (typeof e.data == "boolean") {
                                    var gridObj = $("#FlatGrid").data('ejGrid');
									var obj = $("#FlatGrid").ejGrid("instance");
									if(obj.model.isEdit)
										obj.cancelEdit();
                                    $("#FlatGrid").ejGrid("model.enableResponsiveRow", e.data);
                                }
                                else {
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
                    function actionComplete(args) {
                        this.getContent().addClass("e-widget");
                    }
                </script>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
