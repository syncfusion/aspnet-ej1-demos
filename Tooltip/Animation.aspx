<%@ Page Language="C#" Title="Tooltip-Animation Effects-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Animation.aspx.cs" MetaDescription="This sample demonstrates the animation feature in the Syncfusion ASP.NET Web Forms Tooltip" Inherits="WebSampleBrowser.Tooltip.Animation" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
        <div class="row">
            <div class="cols-sample-area">
                <div class="frame" id="custom" runat="server">
                    
						<div class="image">
						<img src="../Content/images/tooltip/template-04.png" alt="Roslyn Succinctly" >
						</div>
						<div class="desc">Roslyn Succinctly</div>
					
                </div>
            </div>
        </div>
    </div>
    <ej:Tooltip For="custom" runat="server"  ClientSideOnCreate="onCreate" ClientSideOnBeforeOpen="onOpen" ClientSideOnBeforeClose="onHide" Width="25%" Content="Microsoft has only recently embraced the world of open source software, offering many pieces of the .NET Framework architecture as open source projects. More...">
        <Position>
            <Stem Horizontal="left" Vertical="center" />
            <Target Horizontal="right" Vertical="center" />
        </Position>
        <Animation Effect="Slide" Speed="1000" />
    </ej:Tooltip>
</asp:Content> 
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6"> Animation </div>
            </div>
            <div class="row">
                <div class="col-md-6"> Effects </div>
                <div class="col-md-6">
                    
                     <ej:DropDownList  ID="effect" TargetID="list" SelectedIndex="1" ClientSideOnChange="onChange" runat="server" Width="110px"></ej:DropDownList>
                    <div id="list">
                    <ul >
                        <li value="none">None</li>
                        <li value="slide">Slide</li>
                        <li value="fade">Fade</li>
                        <li value="easeInOutQuad">EaseInOutQuad</li>
                        <li value="easeInOutCubic">EaseInOutCubic</li>
                        <li value="easeInOutQuart">EaseInOutQuart</li>
                        <li value="easeInOutQuint">EaseInOutQuint</li>
                        <li value="easeInOutExpo">EaseInOutExpo</li>
                        <li value="easeInOutSine">EaseInOutSine</li>
                        <li value="easeInOutCirc">EaseInOutCirc</li>
                        <li value="easeInOutElastic">EaseInOutElastic</li>
                        <li value="easeInOutBack">EaseInOutBack</li>
                        <li value="easeInOutBounce">EaseInOutBounce</li>
                    </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6"> Speed </div>
                <div class="col-md-6">
                      <ej:NumericTextBox runat="server" ID="speed" Width="110px" DecimalPlaces="0" Value="1000" ClientSideOnChange="onChange"></ej:NumericTextBox>
                    
                </div>
            </div>
        </div>
    </div>
}
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../Scripts/jquery.easing-1.3.min.js"></script>
    <script type="text/javascript">
        var target;
        
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();

        });
        function onCreate() { target = $("#<%=custom.ClientID%>").data("ejTooltip"); }
        function onChange() {
            var numObj = $("#<%=speed.ClientID%>").data("ejNumericTextbox");
            var DropDownListObj = $("#<%=effect.ClientID%>").data("ejDropDownList");
            var value = DropDownListObj.getSelectedValue();
            var speed = $("#<%=speed.ClientID%>").ejNumericTextbox("getValue");
            if (value != "none") {
                if (speed == 0)
                    numObj.setModel({ value: 1000 });
                numObj.enable();
            }
            if (value == "none") {
                numObj.setModel({ value: 0 });
                numObj.disable();
            }
            speed = numObj.getValue();
            if (value == "slide" || value == "fade" || value == "none")
                target.setModel({ animation: { effect: value, speed: speed } });
        }
        function onOpen(args) {

            var DropDownListObj = $("#<%=effect.ClientID%>").data("ejDropDownList");
            var value = DropDownListObj.getSelectedValue();
            var speed = $("#<%=speed.ClientID%>").ejNumericTextbox("getValue");
            if (value != "slide" && value != "fade" && value != "none") {
                $(target.tooltip).animate({ height: "show" }, speed, value);
                args.cancel = true;
            }

        }
        function onHide(args) {
            var DropDownListObj = $("#<%=effect.ClientID%>").data("ejDropDownList");
            var value = DropDownListObj.getSelectedValue();
            var speed = $("#<%=speed.ClientID%>").ejNumericTextbox("getValue");
            if (value != "slide" && value != "fade" && value != "none") {
                $(target.tooltip).animate({ height: "hide" }, speed, value);
                args.cancel = true;
            }
        }


        </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		.frame{
			box-sizing: border-box;
			border: 1px solid #ccc !important;
			border-radius: 0px;
			padding: 0px;
			text-align: center;
			width : 160px;
		}
		.frame img{
		    width : 100%;
		}
        @media (max-width: 440px){
			.frame{
				width : 160px !important;
			}
        }
       .image{
		    background-color: #ccc;
		}
      img{
	      padding-top: 8px;
	  }
	</style>
</asp:Content>

