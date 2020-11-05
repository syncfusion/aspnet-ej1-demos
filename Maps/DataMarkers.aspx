<%@ Page Title="Maps-DataMarkers-ASP.NET-SYNCFUSION" MetaDescription="This sample indicates the top five population countries in the Syncfusion ASP.NET Web Forms Maps control" Language="C#"  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DataMarkers.aspx.cs" Inherits="WebSampleBrowser.Map.DataMarkers" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">

    <script>
        $(window).on('load', function() {
           $("#dataMarker").ejMap("refresh");
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    
    <div style="background-color: #FAFAF9;border-color: lightgray;border-width: 2px;margin-left:0px;opacity: 0.7;height: 50px;width: 290px;" >
		<label style="color:Black;font-size:22px;margin:15px;margin-top:10px;margin-left:15px;margin-right:20px;height:25px;font-weight:Normal;">Top Population Countries</label>   
    </div>	
    <div style="min-height:435px">
    <ej:Map ID="dataMarker" runat="server" Background="white" EnableAnimation="true">
        <NavigationControl EnableNavigation="true" DockPosition="None" Orientation="Vertical">
            <AbsolutePosition X="5" Y="10"/>
        </NavigationControl>

        <Layers>
            <ej:ShapeLayer LayerType="Geometry" EnableSelection="false" EnableAnimation = "true" EnableMouseHover = "false" ShowMapItems = "false" MarkerTemplate = "template">
                <ShapeSettings Fill = "#626171" StrokeThickness = "1" Stroke = "#6F6F79" HighlightColor = "gray" ValuePath = "name" HighlightStroke = "#6F6F79" AutoFill = "false"/>
            </ej:ShapeLayer>
        </Layers>
    </ej:Map>
    </div>
</asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    
    <script  id="template" type="application/jsrender">
    
         <div  >
             <div style="background-image:url(../Content/images/map/pin.png);margin-top:-38px;margin-left:-11px;height:40px;width:26px;background-repeat:no-repeat;">
             
              </div>
				 <div  style="background-image:url(../Content/images/map/mappath.png);margin-left:5px;height:25px;width:90px;margin-top:-15px;">
				 	</div>
                 <div style="margin-left:10px;height:45px;width:120px;margin-top:-24px;">					
				 <label class="label1" style="color:white;margin-left:15px;font-weight:normal">{{:Name}}</label>
				 <p/>				 
				 </div>
				 
           </div>    
           
    </script>  

    <style type="text/css">	 
	.panButton{		
		border-radius: 5px;		
	}	
	.panButton,.incrementButton{
	     -moz-user-select     : none;
		-khtml-user-select   : none;
		-webkit-user-select  : none;
		-o-user-select       : none;
		user-select          : none;
		width:18px;
		height:18px;
		border:1px solid white;
		background-color:gray;
	}
	.panButton:hover,.incrementButton:hover {
        cursor:pointer;
		background-color:#676868;
	}
	</style>

</asp:Content>

