<%@ Page Language="C#" Title="Tooltip-Forms-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Target.aspx.cs" MetaDescription="This example demonstrates how to initialize the ASP.NET Web Forms Tooltip control for a specified target."  Inherits="WebSampleBrowser.Tooltip.Target" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
  
                <div id="form" class="frame" runat="server">
                    <form id="details" role="form">
                        <fieldset>
                            <div class="form-group">
                                <label for="name">User Name:</label>
                                <input class="form-control" type="text" id="name" name="firstname" title="Please enter your name">
                            </div>
                            <div class="form-group">
                                <label for="email">Email Address:</label>
                                <input class="form-control" id="email" type="text" name="email" title="Enter a valid email address">
                            </div>
                            <div class="form-group">
                                <label for="pwd">Password:</label>
                                <input class="form-control" id="pwd" type="password" name="pwd" title="Be at least 8 characters length">
                            </div>
                            <div class="form-group">
                                <label for="Cpwd">Confirm Password:</label>
                                <input class="form-control" type="password" id="Cpwd" name="Cpwd" title="Re-enter your password">
                            </div>
                             
                    <ej:Button ID="sample"  runat="server" Type="Submit" Text="Submit" ShowRoundedCorner="true" Size="Medium" ></ej:Button>
                            <ej:Button ID="clear" runat="server" Type="Reset" Text="Reset" ShowRoundedCorner="true" Size="Medium" ></ej:Button>
                        </fieldset>
                    </form>
                </div>
    
    <ej:Tooltip For="form" Target=".form-control" runat="server"  Trigger="Focus" ClientSideOnCreate="onCreate" ClientSideOnBeforeOpen="onOpen" Width="175px" Height="30px" >
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
                        <div class="col-md-6">
                            Trigger
                        </div>
                        <div class="col-md-6">
                          
                            <ej:DropDownList runat="server"  ID="trigger" TargetID="list" SelectedIndex="0" Width="120px" ClientSideOnChange="selectChange"></ej:DropDownList>
                        <div id="list">
                        <ul >
                            <li value="focus" > Focus </li>
                            <li value="click"> Click </li>
                            <li value="hover"> Hover </li>
                        </ul>
                    </div>
                        </div>
                    </div>

                </div>
            </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var target;
        target = $("#<%=form.ClientID%>").data("ejTooltip");
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
           
        });
        function onCreate() {
            target = $("#<%=form.ClientID%>").data("ejTooltip");
        }
        function selectChange(args) {

            target.option("trigger", args.value)
        }
        function onOpen(args) {
            var currentElement = args.event.currentTarget, content = $(currentElement).attr("data-content");
            if (content == "Enter a valid email address")
                target.setModel({ cssClass: "info" });
                //$(target.tooltip).removeClass("warning").addClass("info");

            else
                target.setModel({ cssClass: "warning" });
            //$(target.tooltip).removeClass("info").addClass("warning");

        }

        </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		.info {
            background-color : #f9ce9b;
			color : #b29b7f;
        }
		.warning{
            background-color: #e56161;
			color: #ffffff;
		}
        .cols-sample-area {
            height: 500px;
        }

		.frame{
			width : 500px;
			box-sizing: border-box;
			border : none;
		}
		.form-control{
			box-sizing: border-box;
			
		}
		.form-group {
			margin-bottom: 10px;
		}
       
        fieldset {
            border: 1px solid #D9DEDD;
            padding: 15px;
			width : 100%;
			box-sizing: border-box;
           
        }
		#sample{
			margin-right: 50px;
		}
		#details .e-button{
			
			margin: 10px;
		}
	</style>
</asp:Content>

