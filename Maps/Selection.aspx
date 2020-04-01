<%@ Page Title="Maps-Selection-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample depicts the results of United States presidential election, 2012 using selection and highlight feature in the Syncfusion ASP.NET Web Forms Maps control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Selection.aspx.cs" Inherits="WebSampleBrowser.Map.Selection" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">
    <script>
        $(window).on('load', function() {
            $("#selection").ejMap("refresh");
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection" >
    <div style="background-color:white;border-color: lightgray;border-width: 2px;margin-left:0px;opacity: 10.7;height: 60px;width:230px" >
		<label style="color:Black;font-size:22px;margin:15px;margin-top:13px;margin-left:20px;margin-right:20px;height:25px;font-weight:Normal;">USA Election 2012</label>   
    </div>
    <div style="min-height:435px">
    <ej:Map ID="selection" runat="server" EnableAnimation="true" Background="White" OnClientShapeSelected = "onSelect">    

        <Layers>
            <ej:ShapeLayer LayerType="Geometry" EnableMouseHover = "true" EnableSelection = "true" ShowTooltip = "true" TooltipTemplate = "template" ShapeDataPath = "State" ShapePropertyPath = "name" ShowMapItems = "false" >
                <ShapeSettings HighlightBorderWidth = "1" AutoFill = "false" Stroke = "white" HighlightStroke = "white" HighlightColor = "#AFAFAF" ValuePath = "Electors" ColorValuePath = "Candidate" SelectionColor = "#EFB856" SelectionStroke = "white" SelectionStrokeWidth = "2.5">
                     <ColorMappings>
                             <MappingCollection>
                                 <ej:EqualColorMapping Value = "Romney" Color = "#D84444"></ej:EqualColorMapping>
                                 <ej:EqualColorMapping Value = "Obama" Color = "#316DB5"></ej:EqualColorMapping>
                             </MappingCollection>
                     </ColorMappings>
                </ShapeSettings>             
            </ej:ShapeLayer>
        </Layers>
    </ej:Map>
    </div>     

      <div class="popup" id="closepopup" style="margin-left:75%;margin-top:-150px"> 
				     <table style="margin-top:-10px;width:auto">
                        <tr>
                            <td align="left" style="padding:0.3px">
                                <label id="winner" style="color:green;font-size:18px;font-weight:bold;"></label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding:0.3px">
                                <label style="color:Black;font-size:12px;font-weight:normal;">State</label>           
                            </td>
                            <td align="left" style="padding:0.3px">
                                <label style="color:Black;font-size:12px;font-weight:normal;margin-left:8px">:</label>
                            </td>
                            <td align="left" style="padding:0.3px">
                                <label id="state" style="color:Black;font-size:12px;font-weight:normal;margin-left:8px"></label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding:0.3px">
                                <label style="color:Black;font-size:12px;font-weight:normal;">Electoral Votes </label>           
                            </td>
                            <td align="left" style="padding:0.3px">
                                <label style="color:Black;font-size:12px;font-weight:normal;margin-left:8px">:</label>
                            </td>
                            <td align="left" style="padding:0.3px">
                                <label id="votes" style="color:Black;font-size:12px;font-weight:normal;margin-left:8px"></label>
                            </td>
                        </tr>
                    </table>	
    <div class="close-btn" id="closebutton"  style="margin-left:191px;margin-top:-96px"><a href="#">X</a></div>   					
</div>
         

    <script>
        function onSelect(event) {
			if (event.originalEvent.length>0)
			{
			var matched = jQuery.uaMatch(navigator.userAgent);
            var browser = matched.browser.toLowerCase();
			var isIE11 = !!navigator.userAgent.match(/Trident\/7\./);
            if (isIE11)
                browser = "msie";
            var object = event.originalEvent[0].data;
            var popup = document.getElementById("closepopup");
            var closebutton = document.getElementById("closebutton");
            var winner = document.getElementById("winner");
            var state = document.getElementById("state");
            var vote = document.getElementById("votes");
            $(popup).css("display", "block");
			$(closebutton).css({"display":"block"});
           
            $(closebutton).click(function () {
                var popup = document.getElementById("closepopup");
                var closebutton = document.getElementById("closebutton");
                $(popup).css("display", "none");
                $(closebutton).css("display", "none");
            });
            
            if(browser!="mozilla")
            {
                state.innerText = object.State;
                vote.innerText = object.Electors;
                winner.innerText = object.Candidate;
            }
            else {
                state.textContent = object.State;
                vote.textContent = object.Electors;
                winner.textContent = object.Candidate;
                winner.textContent  = object.Candidate;
            }
			}
        }
    </script>
 </asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    
   <script  id="template" type="application/jsrender">
		<div class="tip">				
			<p class="small" style="margin-top:8px">
				<label  style="color:white;font-size:12px;font-weight:normal;">State : {{:State}}</label>
            </p>
            <p class="big">
					<label style="color:white;font-size:12px;font-weight:normal;">Winner : {{:Candidate}}</label>
            </p>
		</div>             
    </script> 

    <style type="text/css">	 
            p.small {line-height:50%;}
            p.big {line-height:110%;}

            .tip {
                    border: 1px solid #4D4D4D;
                    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                    border-radius: 7px;
                    margin-right: 25px;
                    min-width: 110px;
                    padding-top: 9px;
                    padding-right: 10px;
                    padding-left: 10px;
                    width: auto;
                    height: auto;
                    background: #4D4D4D;
                }

            .popup {					
                    border: 1px solid #5B5B5B;
                    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                    left:768px;
                    top:362px;                    
                    margin-bottom: 2em;
                    border-radius: 7px;
                    opacity:0.8;
                    display:none;
                    margin-right: 25px;
                    width: 190px;
                    padding: 1em;
                    height: 70px;
                    background: white;
                }

            .close-btn {				
                border: 2px solid #5B5B5B;               
                padding: 1px 4px;
                top: 351px;
                opacity:0.8;
                background-color: #605F61;
                left: 975px;
                border-radius: 50%/50%; 
                width: 12px;
                height: 19px;
                display:none;
                z-index:1000;
            }

            .close-btn a {				
                font-size: 12px;
                margin-left:2px;
                font-weight: bold;
                color: white;
                text-decoration: none;               
            }
        

	</style>
</asp:Content>

