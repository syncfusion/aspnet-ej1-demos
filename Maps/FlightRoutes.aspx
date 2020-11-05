<%@ Page Title="Maps-FlightRoutes-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the navigation control feature based on flight routes in the Syncfusion ASP.NET Web Forms Maps control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FlightRoutes.aspx.cs" Inherits="WebSampleBrowser.Map.FlightRoutes" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">

    <script>
        $(window).on('load', function() {           
            $("#flightRoute").ejMap("refresh");
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    <div style="background-color: #FAFAF9;border-color: lightgray;border-width: 2px;margin-left:0px;opacity: 0.7;height: 60px;width:350px" >
		<label style="color:Black;font-size:22px;margin:15px;margin-top:13px;margin-left:20px;margin-right:20px;height:25px;font-weight:Normal;">Chennai - Raleigh Flight Routes</label>   
    </div>
    <div style="min-height:435px">
    <ej:Map ID="flightRoute" runat="server"  EnableAnimation="true" Background="white" BaseMapIndex="0">
         <NavigationControl EnableNavigation="true" Orientation="Vertical" DockPosition="None">
            <AbsolutePosition X="5" Y="15"/>
        </NavigationControl>

        <Layers>
            <ej:ShapeLayer  LayerType="Geometry" EnableMouseHover = "false" EnableSelection = "false" ShowMapItems = "false" >
                <ShapeSettings Fill = "#C6C35C" AutoFill = "false" HighlightStroke = "white" Stroke = "white" StrokeThickness = "0.5" HighlightBorderWidth = "1" HighlightColor = "#BFBFBF"/>
                <SubLayers>
                    <ej:ShapeLayer LayerType="Geometry" ShapePropertyPath = "name" EnableMouseHover = "true" EnableSelection = "false" ShowTooltip = "true" TooltipTemplate = "flightroute_template" ShapeDataPath = "Name" >
                        <ShapeSettings StrokeThickness = "1" Fill = "#BC0C0C" Stroke = "#BC0C0C" ValuePath = "Departure" SelectionColor="transparent" HighlightColor = "transparent" HighlightStroke = "#4E1493" HighlightBorderWidth="2"></ShapeSettings>
                    </ej:ShapeLayer> 

                    <ej:ShapeLayer LayerType="Geometry" ShapePropertyPath = "name" EnableMouseHover = "true" EnableSelection = "false" ShowTooltip = "true" TooltipTemplate = "airport_template" ShapeDataPath = "Name" >
                        <ShapeSettings StrokeThickness = "0.1" Fill = "#BC0C0C" Stroke = "white" ValuePath = "Departure" SelectionColor="transparent" HighlightColor = "transparent" HighlightStroke = "white"></ShapeSettings>
                    </ej:ShapeLayer>
                    
                     <ej:ShapeLayer LayerType="Geometry" ShapePropertyPath = "name" EnableMouseHover = "true" EnableSelection = "false" ShowTooltip = "true" TooltipTemplate = "intermediatestop1_template" ShapeDataPath = "Name" >
                        <ShapeSettings StrokeThickness = "0.1" Fill = "#4E1493" Stroke = "white" ValuePath = "Departure" SelectionColor="transparent" HighlightColor = "transparent" HighlightStroke = "white"></ShapeSettings>
                    </ej:ShapeLayer>
                    
                    <ej:ShapeLayer LayerType="Geometry" ShapePropertyPath = "name" EnableMouseHover = "true" EnableSelection = "false" ShowTooltip = "true" TooltipTemplate = "intermediatestop2_template" ShapeDataPath = "Name" >
                        <ShapeSettings StrokeThickness = "0.1" Fill = "#4E1493" Stroke = "white" ValuePath = "Departure" SelectionColor="transparent" HighlightColor = "transparent" HighlightStroke = "white"></ShapeSettings>
                    </ej:ShapeLayer> 
                </SubLayers>
            </ej:ShapeLayer>
        </Layers>
        
    </ej:Map>
    </div>   


</asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    
        <script  id="airport_template" type="application/jsrender">  
                        <div class="popup" id="closepopup"> 
                        <table align="Left">
                               <tr>
                                   <td align="left" >
                                       <label id="title" style="color:#333333;font-size:14px;font-weight:bold;">{{:Name}}</label>
                                   </td>
                               </tr>
                            <tr>
                                   <td align="left" >
                                       <label id="subtitle" style="color:green;font-size:14px;font-weight:bold;">Flight Routes  </label>
                                   </td>
                               </tr>
                         </table>
				        <table align="Left" style="margin-top:0px;width:auto">
                        <tr id="info1">
                            <td align="left" style="padding-right:5px;padding-top:7px" >       
                                <p class="small" id="Departure1" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                            </td>
                            <td align="left" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="route1_stop1" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route1_Stop1}} - </p>
                            </td>
                            <td align="left" id="route1" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="route1_stop2" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route1_Stop2}} - </p>
                            </td>
                            <td align="left" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="Arrival1" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                            </td>
                        </tr>
                        <tr id="info2" class="divider1">
                            <td align="left" style="padding-right:5px;padding-top:7px" >       
                                <p class="small" id="Departure2" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                            </td>
                            <td align="left" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="route2_stop1" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route2_Stop1}} - </p>
                            </td>
                            <td align="left" id="route2" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="route2_stop2" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route2_Stop2}} - </p>
                            </td>
                            <td align="left" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="Arrival2" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                            </td>
                        </tr>
                         <tr id="info3" class="divider1">
                            <td align="left" style="padding-right:5px;padding-top:7px" >       
                                <p class="small" id="Departure3" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                            </td>
                            <td align="left" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="route3_stop1" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route3_Stop1}} - </p>
                            </td>
                            <td align="left" id="route3" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="route3_stop2" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route3_Stop2}} - </p>
                            </td>
                            <td align="left" style="padding-left:8px;padding-top:7px" >        
                                <p class="small" id="Arrival3" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                            </td>
                        </tr>
                    </table>
                        </div>
     </script>

     <script  id="intermediatestop1_template" type="application/jsrender">  
                        <div class="popup" style="height:75px"> 
                            <table align="Left">
                                   <tr>
                                       <td align="left" >
                                           <label id="Label1" style="color:#333333;font-size:14px;font-weight:bold;">{{:Name}}</label>
                                       </td>
                                   </tr>
                                <tr>
                                       <td align="left" >
                                           <label id="Label2" style="color:green;font-size:14px;font-weight:bold;">Flight Route  </label>
                                       </td>
                                   </tr>
                             </table>
				             <table align="Left" style="margin-top:0px;width:auto">
                                <tr id="Tr1">
                                    <td align="left" style="padding-right:5px;padding-top:7px" >       
                                        <p class="small" id="P1" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P2" style="color:#4E1493;font-size:14px;font-weight:Bold;">{{:Route1_Stop1}} - </p>
                                    </td>
                                    <td align="left" id="Td1" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P3" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route1_Stop2}} - </p>
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P4" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                                    </td>
                                </tr>                        
                            </table>
                        </div>
      </script>

      <script  id="intermediatestop2_template" type="application/jsrender">  
                        <div class="popup" style="height:100px"> 
                            <table align="Left">
                                   <tr>
                                       <td align="left" >
                                           <label id="Label3" style="color:#333333;font-size:14px;font-weight:bold;">{{:Name}}</label>
                                       </td>
                                   </tr>
                                <tr>
                                       <td align="left" >
                                           <label id="Label5" style="color:green;font-size:14px;font-weight:bold;">Flight Route  </label>
                                       </td>
                                   </tr>
                             </table>
				             <table align="Left" style="margin-top:0px;width:auto">
                                <tr id="Tr3">
                                    <td align="left" style="padding-right:5px;padding-top:7px" >       
                                        <p class="small" id="P9" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P10" style="color:#4E1493;font-size:14px;font-weight:Bold;">{{:Route1_Stop1}} - </p>
                                    </td>
                                    <td align="left" id="Td3" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P11" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route1_Stop2}} - </p>
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P12" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                                    </td>
                                </tr>        
                                <tr id="Tr4">
                                    <td align="left" style="padding-right:5px;padding-top:7px" >       
                                        <p class="small" id="P13" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P14" style="color:#4E1493;font-size:14px;font-weight:Bold;">{{:Route2_Stop1}} - </p>
                                    </td>
                                    <td align="left" id="Td4" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P15" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route2_Stop2}} - </p>
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P16" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                                    </td>
                                </tr>                 
                            </table>
                        </div>
     </script>

    <script  id="flightroute_template" type="application/jsrender">  
                        <div class="popup" style="height:50px"> 
                            <table align="Left">
                                <tr>
                                       <td align="left" >
                                           <label id="Label4" style="color:green;font-size:14px;font-weight:bold;">Flight Route  </label>
                                       </td>
                                   </tr>
                             </table>
				             <table align="Left" style="margin-top:0px;width:auto">
                                <tr id="Tr2">
                                    <td align="left" style="padding-right:5px;padding-top:7px" >       
                                        <p class="small" id="P5" style="color:#333333;font-size:14px;font-weight:normal;">{{:Departure}} - </p>           
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P6" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route1_Stop1}} - </p>
                                    </td>
                                    <td align="left" id="Td2" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P7" style="color:#333333;font-size:14px;font-weight:normal;">{{:Route1_Stop2}} - </p>
                                    </td>
                                    <td align="left" style="padding-left:8px;padding-top:7px" >        
                                        <p class="small" id="P8" style="color:#333333;font-size:14px;font-weight:normal;">{{:Arrival}}</p>
                                    </td>
                                </tr>                        
                            </table>
                        </div>
     </script>

    <style type="text/css">
              .e-map
              {
	            background-color:white;
	          }
              p.small {line-height:50%;}
              p.big {line-height:110%;}

              .divider1 { border-top: 0.1px solid #DDDDDD; }
              
              .popup 
              {
                    border: 1px solid #5B5B5B;
                    box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
                    border-radius: 7px;
                    opacity:0.8;
                    width: 190px;
                    padding: 8px;
                    height: 125px;
                    background: white;
              }

	</style>
</asp:Content>

