<%@ Page Language="C#" Title="Tooltip / Knockout" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Knockout.aspx.cs" Inherits="WebSampleBrowser.Tooltip.Knockout" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="content-container-fluid">
    <div class="row">
        <div class="cols-sample-area">
            <div class="frame">
                <div class="knockbind table-responsive">
                    <table id="details" class="table" data-bind="ejTooltip: { target: target, isBalloon: isBalloon, width: width, height: height, beforeOpen: beforeOpen, position: position }">
                        <tr>
                            <th>EmployeeID</th>
                            <th>Name</th>
                            <th>Designation</th>
                        </tr>
                        <tr>
                            <td>SF6089</td>
                            <td><a href="#" class="e-info" title="Peter">Peter</a></td>
                            <td>Software Engineer</td>
                        </tr>
                        <tr>
                            <td>SF6073</td>
                            <td> <a href="#" class="e-info" title="Joe">Joe </a> </td>
                            <td>Tester</td>
                        </tr>
                        <tr>
                            <td>SF6073</td>
                            <td> <a href="#" class="e-info" title="Lois"> Lois </a> </td>
                            <td>Content Writer</td>
                        </tr>
                        <tr>
                            <td>SF7896</td>
                            <td> <a href="#" class="e-info" title="Cleveland"> Cleveland </a> </td>
                            <td>Graphics Designer</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../Scripts/knockout-min.js"></script>
    <script src="../Scripts/ej.widget.ko.min.js"></script>

    
        <script type="text/javascript">
            var target;
            var position = { target: { horizontal: "right", vertical: "bottom" }, stem: { horizontal: "left", vertical: "top" }, };
            $(function () {

                window.viewModel = {
                    target: ko.observable(".e-info"),
                    isBalloon: ko.observable(false),
                    width: ko.observable("235px"),
                    height: ko.observable("90px"),
                    position: ko.observable(position),
                    beforeOpen: ko.observable("onOpen"),
                }
                ko.applyBindings(viewModel);
                target = $('#details').data("ejTooltip");

            });
            function onOpen(args) {
                var emp = [
                    { name: "Peter", phone: "9712233456", birth: "12/08/1948", hired: "05/01/1992", photo: "../../Content/images/tooltip/Employee/7.png" },
                    { name: "Joe", phone: "9712567456", birth: "02/19/1952", hired: "08/14/1992", photo: "../../Content/images/tooltip/Employee/6.png" },
                    { name: "Lois", phone: "9259233456", birth: "08/30/1963", hired: "04/01/1992", photo: "../../Content/images/tooltip/Employee/3.png" },
                    { name: "Cleveland", phone: "9983233456", birth: "03/04/1955", hired: "10/17/1993", photo: "../../Content/images/tooltip/Employee/8.png" }, ];
                for (i = 0; i < 4; i++) {
                    if (emp[i].name == $(args.event.target).attr("data-content"))
                        var template = '<div class="main"> <img src=' + emp[i].photo + ' class="logo"/><div class="des"><b>' + emp[i].name + '</b><br> Birth Date&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;' + emp[i].birth + '<br> Hired Date&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;' + emp[i].hired + '<br></div></div>';
                }
                target.setModel({ content: template });
                target.show(args.event.target);
                args.cancel = true;
            }
</script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
     <style type="text/css" class="cssStyles">
        .knockbind > div {
			padding:5px;
		}
  
		
    	 .frame {
            width: 550px;
                box-sizing: border-box;
				border: none;
        }

        .frame table {
            border-collapse: collapse;
            width: 100%;
			border: 1px solid grey;
        }

        .frame th, td {
            text-align: left;
            padding: 8px;
        }
        .logo{
                float: left;
				width: 80px;
				height: 80px;
        }

        .frame tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .frame th {
            background-color: #4CAF50;
            color: white;
        }
		.des{
			width: 140px;
			float: right;
			line-height: 24px;
		}
    </style>
		
</asp:Content>