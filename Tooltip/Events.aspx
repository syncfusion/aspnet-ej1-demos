<%@ Page Language="C#" Title="Tooltip-Events-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Events.aspx.cs" MetaDescription="This example shows the events that trigger on specific actions in the ASP.NET Web Tooltip." Inherits="WebSampleBrowser.Tooltip.Events" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
     <div class="content-container-fluid">
        <div class="row">
            <div class="cols-sample-area">
                
					<div class="frame" id="custom" runat="server">
					<div class="image">
						<img src="../Content/images/tooltip/template-06.png" alt="Python Succinctly" >
						</div>
						<div class="desc">Python Succinctly</div>
					</div>  
            </div>
  
        </div>
    </div>
    <ej:Tooltip For="custom" runat="server"  Containment=".cols-sample-area" ClientSideOnCreate="tipCreate" ClientSideOnBeforeOpen="tipShown"  Height="65px"  Content="Learn to use the Python language to create programs of all kinds to creating practical applications." Width="200px" Associate="MouseFollow"  ClientSideOnTracking="tipTrack" ClientSideOnOpen="onShow" ClientSideOnClose="onHide" ClientSideOnBeforeClose="tipHide" > 
        <Position>
            <Stem Horizontal="left" Vertical="center" />
            <Target Horizontal="right" Vertical="center" />
        </Position>
    </ej:Tooltip>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    <asp:UpdatePanel ID="UpdatePanelProp" UpdateMode="Conditional" runat="server">
        
        <ContentTemplate>
                      <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                        <div class="pull-right">
                            
                             <ej:DropDownList runat="server" ID="selectControls" TargetID="list" CheckAll="true" ShowCheckbox="true"  ClientSideOnBeforePopupShown="adjustpopupposition" ClientSideOnChange="evtpropscheckedevent"></ej:DropDownList>
                            <div id="list">
                            <ul  >
                                <li value="create">Create</li>
                                <li value="beforeOpen">beforeOpen</li>
                                <li value="beforeClose">beforeHide</li>
                                <li value="open">open</li>
                                <li value="close">close</li>
                                <li value="tracking">tracking</li>
                            </ul>
                            </div>
                        </div>
                    </div>
      
	  <div class="prop-grid content">
                        <div class="eventarea">
                            <div class="EventLog" id="EventLog">
                            </div>
                        </div>
                        <div class="evtbtn">
                            <input type="button" class="eventclear e-btn" value="Clear" onclick="onClear()" />
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var dialogObj;
        var trackCount = 1;
        var target, target1, target2;
       
        // Event wire and unwire
        function evtpropscheckedevent(args) {
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "create":
                        target.option(args.selectedValue, "tipCreate");
                        break;
                    case "beforeClose":
                        target.option(args.selectedValue, "tipHide");
                        break;
                    case "beforeOpen":
                        target.option(args.selectedValue, "tipShown");
                        break;
                    case "close":
                        target.option(args.selectedValue, "onHide");
                        break;
                    case "open":
                        target.option(args.selectedValue, "onShow");
                        break;
                    case "tracking":
                        target.option(args.selectedValue, "tipTrack");
                        break;
                }
            }
            else {
                target.option(args.selectedValue, null);

            }
        }


        function tipCreate(sender) {
            target = $("#<%=custom.ClientID%>").data("ejTooltip");
            jQuery.addEventLog("Tooltip control has been <span class='eventTitle'>created</span>.<br/>");

        }
        function tipTrack(sender) {
            if (trackCount == 1)
                jQuery.addEventLog("Tooltip has been <span class='eventTitle'>Tracking</span> <span class='circle' id='count'>" + trackCount + "</span><br/>");
            else {
                var target = $("div.event-tracer > div > div.content > div.eventarea > div#EventLog > div.divEventTrace > span > span#count");
                if (target != 0) {
                    target = $("div.event-tracer > div > div.content > div.eventarea > div#EventLog > div.divEventTrace > span > span#count")[0];
                    $(target).html('<span class="circle" id="count">' + trackCount + '</span>');
                }
            }
            trackCount++;
        }
        function tipHide(sender) {
            jQuery.addEventLog("<span class='eventTitle'>beforeClose</span> event is fired for Tooltip.<br/>");
            trackCount = 1;
        }
        function tipShown(sender) {
            jQuery.addEventLog("<span class='eventTitle'>beforeOpen</span> event is fired for Tooltip.<br/>");
            trackCount = 1;
        }
        function onHide(sender) {
            jQuery.addEventLog("Tooltip popup is <span class='eventTitle'>closed</span>.<br/>");
            trackCount = 1;
        }
        function onShow(sender) {
            jQuery.addEventLog("Tooltip popup is <span class='eventTitle'>opened</span>.<br/>");
            trackCount = 1;
        }
        function onClear() {
            jQuery.clearEventLog();
            trackCount = 1;
        }


    </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style class="cssStyles">
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
		.circle {
			  
				color: white;
				background: #1dabce;
				border-radius: 10px;
				padding: 2px;
			}
		.image{
		    background-color: #ccc;
		}
      img{
	      padding-top: 8px;
	  }
		
      
      
       

    </style>
		
</asp:Content>


