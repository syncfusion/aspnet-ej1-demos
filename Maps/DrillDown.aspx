<%@ Page Title="Maps-DrillDown-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the sales data by using the bubbles in the Syncfusion ASP.NET Web Forms Maps control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DrillDown.aspx.cs" Inherits="WebSampleBrowser.Map.DrillDown" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">
    <script>
        $(window).on('load', function() {             
            $("#drillDown").ejMap("refresh");
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">    
    <div  id="title" style="background-color: #FAFAF9;margin-left:0px;border-color: lightgray;border-width: 2px;opacity: 0.7;height: 60px;width:150px" >
		<label style="color:Black;font-size:22px;margin:15px;margin-top:13px;margin-left:20px;margin-right:20px;height:25px;font-weight:Normal;">Sales Data</label>   
    </div>	
	<div id="button" class="backLabel" onclick="ClickFunction()" style="left:350px;top:290px;width:85px;height:28px;border-radius: 16px;background-color:#0F77B7;">				
		 <img style="margin-left:15px;margin-top:6px;" src="../Content/images/map/backtext.png"/>				
	</div>	
    <div style="min-height:435px">
    <ej:Map ID="drillDown" runat="server" EnableAnimation="true" Background="White" BaseMapIndex = "0" OnClientRenderComplete = "onLoad" OnClientShapeSelected = "OnDrilled">
        

         <Layers>
            <ej:ShapeLayer LayerType="Geometry" EnableSelection="true" ShapeDataPath="name" ShapePropertyPath="name" EnableMouseHover="true" ShowMapItems="false" >
                <ShapeSettings Fill="#C3E6ED" StrokeThickness = "0.5" Stroke = "white" HighlightColor = "#63B7B7" HighlightStroke = "white" ValuePath = "name"/>
                
                <SubLayers>
                    <ej:ShapeLayer ShapeDataPath = "country" ShapePropertyPath = "name" MapItemsTemplate = "labeltemplate" ShowMapItems = "true" >
                        <ShapeSettings Fill = "#9FD0D3" StrokeThickness = "0.2" Stroke = "white" HighlightColor = "#63B7B7"></ShapeSettings>
                        <BubbleSettings ShowBubble = "true" ValuePath = "Sales" MinValue = "20" MaxValue = "30" Color = "#379F64"></BubbleSettings>
                    </ej:ShapeLayer>
                </SubLayers>
            </ej:ShapeLayer>

            <ej:ShapeLayer LayerType="Geometry" EnableMouseHover="true">
                <ShapeSettings Stroke="black" Fill="#C3E6ED" HighlightColor = "#63B7B7" SelectionColor = "#207BB2" StrokeThickness="0.5"/>
            </ej:ShapeLayer>

             <ej:ShapeLayer LayerType="Geometry" EnableMouseHover="true">
                <ShapeSettings Stroke="black" Fill="#C3E6ED" HighlightColor = "#63B7B7" SelectionColor = "#207BB2" StrokeThickness="0.5"/>
            </ej:ShapeLayer>

             <ej:ShapeLayer LayerType="Geometry" EnableMouseHover="true">
                <ShapeSettings Stroke="black" Fill="#C3E6ED" HighlightColor = "#63B7B7" SelectionColor = "#207BB2" StrokeThickness="0.5"/>
            </ej:ShapeLayer>

             <ej:ShapeLayer LayerType="Geometry" EnableMouseHover="true">
                <ShapeSettings Stroke="black" Fill="#C3E6ED" HighlightColor = "#63B7B7" SelectionColor = "#207BB2" StrokeThickness="0.5"/>
            </ej:ShapeLayer>

             <ej:ShapeLayer LayerType="Geometry" EnableMouseHover="true">
                <ShapeSettings Stroke="black" Fill="#C3E6ED" HighlightColor = "#63B7B7" SelectionColor = "#207BB2" StrokeThickness="0.5"/>
            </ej:ShapeLayer>

             <ej:ShapeLayer LayerType="Geometry" EnableMouseHover="true">
                <ShapeSettings Stroke="black" Fill="#C3E6ED" HighlightColor = "#63B7B7" SelectionColor = "#207BB2" StrokeThickness="0.5"/>
            </ej:ShapeLayer>
        </Layers>
    </ej:Map>
    </div>  	

    <script>

        function ClickFunction(event)
        {
            var button = document.getElementById("button");
            $(button).css('background-color', '#028DC4');
			
            var mapObj = $("#LayoutSection_ControlsSection_drillDown").data("ejMap");
            mapObj.model.enableAnimation = false;
            mapObj.option("baseMapIndex", 0);
            $(button).fadeOut(500);
            var title = document.getElementById("title");
            $(title).css("display", "block");

        }
        function onLoad()
        {
            var button = document.getElementById("button");
            $(button).css("display", "none");
            var title = document.getElementById("title");
            $(title).css("display", "block");
        }

        function OnDrilled(event) {
            if (event.model.baseMapIndex == 0) {
			
                var mapObj = $("#LayoutSection_ControlsSection_drillDown").data("ejMap");
                mapObj.model.enableAnimation = true;
				mapObj.model.layers[0].selectedItems=[];				   
                mapObj.model.layers[0].subLayers[0].selectedItems=[];	
                if (event.originalEvent[0].data.continent == "Africa") {
                    mapObj.option("baseMapIndex", 1);
                }
                else if (event.originalEvent[0].data.continent == "Asia") {
                    mapObj.option("baseMapIndex", 2);
                }
                else if (event.originalEvent[0].data.continent == "Europe") {
                    mapObj.option("baseMapIndex", 3);
                }
                else if (event.originalEvent[0].data.continent == "North America") {
                    mapObj.option("baseMapIndex", 4);
                }
                else if (event.originalEvent[0].data.continent == "Oceania") {
                    mapObj.option("baseMapIndex", 5);
                }
                else if (event.originalEvent[0].data.continent == "South America") {
                    mapObj.option("baseMapIndex", 6);
                }
                var button = document.getElementById("button");
                $(button).css('background-color', '#0F77B7');
                var title = document.getElementById("title");
                $(title).css("display", "none");
                // $(button).css("display", "block");
                $(button).fadeIn(500);
            }
        }
    </script>
 </asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    
     <script  id="labeltemplate" type="application/jsrender">             
	    <div style="margin-top:-10px;margin-left:-1px;">
	        <table style="width:40px;">
	          <tr>
	            <td>
                    <label style="color:Black;font-size:14px;width:40px;text-wrap:normal;font-weight:normal;text-align:center;" id="Label4">{{:country}}</label>
                </td>
              </tr>
            </table>
        </div>
   </script>

     <style type="text/css">
    .backLabel:hover
    {
        cursor:pointer;
		
    }
    </style>

    <br /><br />
</asp:Content>

