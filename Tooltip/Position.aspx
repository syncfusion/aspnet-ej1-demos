<%@ Page Language="C#" Title="Tooltip-Position-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Position.aspx.cs" MetaDescription="This example demonstrates positioning of a ASP.NET Web Forms Tooltip." Inherits="WebSampleBrowser.Tooltip.Position" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
        <div class="row">
            <div class="cols-sample-area">
                <div id="treeView" style="width: 250px" runat="server">
                    <ej:TreeView ID="treeview1" runat="server" ClientSideOnCreated="onCreate" >
                        <Nodes>
                            <ej:TreeViewNode Expanded="true" Text="Fiction Book Lists">
                                <Nodes>
                                    <ej:TreeViewNode Text="To Kill a Mockingbird"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Pride and Prejudice"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Harry Potter"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="The Hobbit"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>

                            <ej:TreeViewNode Expanded="true" Text="Mystery Book Lists">
                                <Nodes>
                                    <ej:TreeViewNode Text="And Then There Where None"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="Angles & Demons"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="In Cold Blood"></ej:TreeViewNode>
                                    <ej:TreeViewNode Text="The Name of the Rose"></ej:TreeViewNode>
                                </Nodes>
                            </ej:TreeViewNode>
                        </Nodes>
                    </ej:TreeView>
                    
                </div>
            </div>

        </div>
    </div>
    <ej:Tooltip For="treeView" Target=".CanSelect" runat="server" Containment=".cols-sample-area" ClientSideOnCreate="onCreate" ClientSideOnBeforeOpen="onOpen" Width="230px" Height="65px" >
        <Position>
            <Stem Horizontal="left" Vertical="center" />
            <Target Horizontal="right" Vertical="center" />
        </Position>
    </ej:Tooltip>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
                <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-6"> Associate </div>
                        <div class="col-md-6">
                            
                            <ej:DropDownList runat="server"  ID="associate" TargetID="list1" Width="110px" SelectedIndex="0" ClientSideOnChange="associateChange"></ej:DropDownList>
                        <div id="list1">
                        <ul >
                            <li value="target">Target</li>
                            <li value="window">Window</li>
                            <li value="mousefollow">Mouse Follow</li>
                            <li value="mouseenter">Mouse Enter</li>
                            <li value="axis">Axis</li>
                        </ul>
                      </div>
                        </div>
                    </div>
					
                    <div class="row targetValue">
                        <div class="col-md-6"> Target Position</div>
                        <div class="col-md-6">
                            
                            <ej:DropDownList runat="server"  ID="targetHorizontal" TargetID="list2" Width="110px" SelectedIndex="0" ClientSideOnChange="targetHorizontalChange"></ej:DropDownList>
                        <div id="list2">
                        <ul >
                            <li value="right-center">Right Center</li>
                            <li value="right-top">Right Top</li>
                            <li value="right-bottom">Right Bottom</li>
                            <li value="left-center">Left Center</li>
                            <li value="left-top">Left Top</li>
                            <li value="left-bottom">Left Bottom</li>
                            <li value="center-center">Center Center</li>
                            <li value="center-top">Center Top</li>
                            <li value="center-bottom">Center Bottom</li>
                        </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row stemValue">
                        <div class="col-md-6"> Tooltip Position</div>
                        <div class="col-md-6">
                             
                            <ej:DropDownList runat="server"  ID="stemHorizontal" TargetID="list3" Width="110px" SelectedIndex="0" ClientSideOnChange="stemHorizontalChange"></ej:DropDownList>
                        <div id="list3">
                        <ul >
                            <li value="left-center">Left Center</li>
                            <li value="left-top">Left Top</li>
                            <li value="left-bottom">Left Bottom</li>
                            <li value="right-center">Right Center</li>
                            <li value="right-top">Right Top</li>
                            <li value="right-bottom">Right Bottom</li>
                            <li value="center-center">Center Center</li>
                            <li value="center-top">Center Top</li>
                            <li value="center-bottom">Center Bottom</li>
                        </ul>
                    </div>
                        </div>
                    </div>
                    <div class="row" id="axisValue">
                        <div class="col-md-6"> x-Axis </div>
                        <div class="col-md-6">
                            
                            <ej:NumericTextBox  runat="server" ID="xAxis" Width="100%" DecimalPlaces="0" Value="400" ClientSideOnChange="change"></ej:NumericTextBox>
                            
                        </div>
                        <div class="col-md-6"> y-Axis </div>
                        <div class="col-md-6">
                            <ej:NumericTextBox  runat="server" ID="yAxis" Width="100%" DecimalPlaces="0" Value="400" ClientSideOnChange="change"></ej:NumericTextBox>

                        </div>
                    </div>
                </div>
            </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target, associate, tHorizontal, tVertical, sHorizontal, sVertical;
        var tipProperty = {
            width: "230px",
            height: "65px",
            target: ".CanSelect",
            position: {
                stem: { horizontal: "left", vertical: "center" },
                target: { horizontal: "right", vertical: "center" },
            },
            beforeOpen: "onOpen"
        };
        
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            associate = $('#<%=associate.ClientID%>').ejDropDownList("getSelectedValue");

        });
        function onCreate() {
            target = $("#<%=treeView.ClientID%>").data("ejTooltip");
        }
        function onOpen(args) {
            contentFormation(args);
        }
        function contentFormation(args) {
            var currentElement = $(args.event.currentTarget), content = $.trim($(currentElement).text());

            var emp = [
                { book: "To Kill a Mockingbird", category: "Fiction" },
                { book: "Pride and Prejudice", category: "Fiction" },
                { book: "Harry Potter", category: "Fiction" },
                { book: "The Hobbit", category: "Fiction" },
                { book: "And Then There Where None", category: "Mystery" },
                { book: "Angles & Demons", category: "Mystery" },
                { book: "In Cold Blood", category: "Mystery" },
                { book: "The Name of the Rose", category: "Mystery" },
            ];
            for (i = 0; i < 8; i++) {
                if (content == emp[i].book)
                    var template = '<div class="main"> <img class="logo" src="../Content/images/tooltip/book.png" /> <div class="des"> <div class="artists"> Category:' + emp[i].category + '</div><div class="song">' + emp[i].book + '</div></div> </div>';
                else if (content == "Fiction Book Lists")
                    var template = '<div class="main"> <img class="logo" src="../Content/images/tooltip/book.png" /> <div class="des"> <div class="artists"> Category&nbsp;:&nbsp; Fiction </div><div class="song"> Please choose your books</div></div> </div>';
                else if (content == "Mystery Book Lists")
                    var template = '<div class="main"> <img class="logo" src="../Content/images/tooltip/book.png" /> <div class="des"> <div class="artists"> Category&nbsp;:&nbsp; Mystery </div><div class="song"> Please choose your books</div></div> </div>';
            }
            target.setModel({ content: template });
        }
        function associateChange(args) {
            associate = args.value;
            if (associate == "window") {
                target.destroy();
                tipProperty.containment = "body";
                target = $("#<%=treeView.ClientID%>").ejTooltip(tipProperty).data("ejTooltip");
                $('#<%=targetHorizontal.ClientID%>').ejDropDownList({ value: "right-bottom" });
            }
            else {
                tipProperty.containment = ".cols-sample-area";
                target = $("#<%=treeView.ClientID%>").ejTooltip(tipProperty).data("ejTooltip");
            }
            change();
        }
        function targetHorizontalChange(args) {
            change();
        }
        function targetVerticalChange(args) {
            change();
        }
        function stemHorizontalChange(args) {
            change();
        }
        function stemVerticalChange(args) {
            change();
        }
        function change() {
            tHorizontal = $('#<%=targetHorizontal.ClientID%>').ejDropDownList("getSelectedValue");
            tVertical = tHorizontal.substr(tHorizontal.indexOf("-") + 1);
            tHorizontal = tHorizontal.substr(0, tHorizontal.indexOf("-"));
            sHorizontal = $('#<%=stemHorizontal.ClientID%>').ejDropDownList("getSelectedValue");
            sVertical = sHorizontal.substr(sHorizontal.indexOf("-") + 1);
            sHorizontal = sHorizontal.substr(0, sHorizontal.indexOf("-"));
            xNum = $('#<%=xAxis.ClientID%>').data("ejNumericTextbox");
            yNum = $('#<%=yAxis.ClientID%>').data("ejNumericTextbox");
            var xAxis = parseInt($("#<%=xAxis.ClientID%>").ejNumericTextbox("getValue"));
            var yAxis = parseInt($("#<%=yAxis.ClientID%>").ejNumericTextbox("getValue"));
            if (associate == "axis") {
                $("#axisValue").show();
                $(".targetValue").hide();
                $(".stemValue").hide();
                xAxis = xAxis > 0 ? xAxis : 100;
                yAxis = yAxis > 0 ? yAxis : 100;
            }
            else if (associate == "window") {

                $(".stemValue").hide();
                $("#axisValue").hide();
                $(".targetValue").show();
            }
            else if (associate == "mouseenter" || associate == "mousefollow") {
                $(".targetValue").hide();
                $("#axisValue").hide();
                $(".stemValue").show();
            }
            else {
                $("#axisValue").hide();
                $(".targetValue").show();
                $(".stemValue").show();
            }
            tHorizontal = associate == "axis" ? xAxis : tHorizontal;
            tVertical = associate == "axis" ? yAxis : tVertical;
            var position = {
                stem: {
                    horizontal: sHorizontal,
                    vertical: sVertical
                },
                target: {
                    horizontal: tHorizontal,
                    vertical: tVertical
                },
            };


            target.option("position", position);
            target.option("associate", associate);
        }

        </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		.e-tooltip-wrap {
            background-color: #ffcccc;
        }
		.e-tooltip-wrap .e-arrowTipInner{
			border-color: #ffcccc transparent;
		}
        
        #axisValue{
            display : none;
        }
        .logo{
            float: left;
            width: 45px;
			height: 50px;
            border: 2px dotted green;
            border-radius: 12px;
            margin-right: 10px;
            margin-bottom: 5px;
        }
		.des{
			color : grey;
		}
		.artists{
			margin-bottom: 5px;
		}
	</style>
</asp:Content>

