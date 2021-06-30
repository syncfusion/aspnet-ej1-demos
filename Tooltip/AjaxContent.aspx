<%@ Page Language="C#" Title="Tooltip-Ajax Content-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="AjaxContent.aspx.cs" MetaDescription="This example demonstrates loading the Syncfusion ASP.NET Web Forms Tooltip content using Ajax requests." Inherits="WebSampleBrowser.Tooltip.AjaxContent" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
            <div class="row">
                <div class="cols-sample-area">
                    <div id="sample" runat="server" class="frame table-responsive">
                        <table id="details table">
                            <tr>
                                <th>EmployeeID</th>
                                <th>Name</th>
                                <th>Designation</th>
                            </tr>
                            <tr>
                                <td>SF6089</td>
                                <td><a href="#" class="e-info" title="Davolio">Davolio</a></td>
                                <td>Software Engineer</td>
                            </tr>
                            <tr>
                                <td>SF6073</td>
                                <td> <a href="#" class="e-info" title="Leverling">Leverling </a> </td>
                                <td>Tester</td>
                            </tr>
                            <tr>
                                <td>SF6073</td>
                                <td> <a href="#" class="e-info" title="Suyama"> Suyama </a> </td>
                                <td>Content Writer</td>
                            </tr>
                            <tr>
                                <td>SF7896</td>
                                <td> <a href="#" class="e-info" title="Buchanan"> Buchanan </a> </td>
                                <td>Graphics Designer</td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    <ej:Tooltip For="sample" Target=".e-info" runat="server"  ClientSideOnCreate="onCreate" ClientSideOnBeforeOpen="onOpen" Width="350px" Height="128px" >
        <Position>
            <Stem Horizontal="left" Vertical="top" />
            <Target Horizontal="right" Vertical="bottom" />
        </Position>
    </ej:Tooltip>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var content;
        var target;
        function onCreate() {
            target = $("#<%=sample.ClientID%>").data("ejTooltip");
        }
        function onOpen(args) {
            proxy = args;
            $.ajax({
                dataType: "json",
                url: '<%= Page.ResolveUrl("~/Scripts/Tooltip/tooltipData.js")%>',
                success: function (result) {
                    var emp = [
                        { photo: "../content/images/Employees/2.png" },
                        { photo: "../content/images/Employees/4.png" },
                        { photo: "../content/images/Employees/8.png" },
                        { photo: "../content/images/Employees/3.png" },
                        { photo: "../content/images/Employees/1.png" },
                        { photo: "../content/images/Employees/6.png" },
                    ];
                    for (i = 0; i < result.length ; i++) {
                        if (result[i].LastName == $(proxy.event.target).attr("data-content"))
                            content = '<div class="main"> <img src=' + emp[i].photo + ' class="logo"/><div class="des"><table> <tr> <th> ' + result[i].TitleOfCourtesy + ' ' + result[i].LastName + '</th> </tr> <tr> <td> Title </td> <td>&nbsp;&nbsp;: ' + result[i].Title + '</td> </tr> <tr><td> Address</td><td>&nbsp;&nbsp;: ' + result[i].Address + '</td> </tr><tr> <td> City </td> <td>&nbsp;&nbsp;: ' + result[i].City + '</td> </tr> <tr> <td> PostalCode </td> <td>&nbsp;&nbsp;: ' + result[i].PostalCode + '</td> </tr> </table></div></div>';
                    }
                    target.setModel({ content: content });

                }
            });
            target.show(args.event.target);
            args.cancel = true;
        }

        </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		.frame {
                width: 550px;
                box-sizing: border-box;
				border: none;
            }

            .frame table {
                border-collapse: collapse;
                width: 100%;
				border: 1px solid grey;
				box-sizing : border-box;
            }

           .frame th, .frame td {
                text-align: left;
                padding: 8px;
            }

            .logo {
                float: left;
               width: 100px;
                height: 114px;
            }

           .frame tr:nth-child(even) {
                background-color: #f2f2f2;
            }

            .frame th {
                background-color: #4CAF50;
                color: white;
            }
			
            .des {
                width: 230px;
                float: right;
                line-height: 24px;
            }
	</style>
</asp:Content>

