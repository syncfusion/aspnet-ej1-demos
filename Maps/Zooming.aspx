<%@ Page Title="Maps-Zooming-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the zooming functionality in the Syncfusion ASP.NET Web Forms Maps control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Zooming.aspx.cs" Inherits="WebSampleBrowser.Map.Zooming" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">
    
        <script>

            var latLongPoints = [

                        { name: "Afghanistan", latitude: 33, longitude: 65 },
                        { name: "Argentina", latitude: -34, longitude: -64 },
                        { name: "Australia", latitude: -27, longitude: 133 },
                        { name: "Austria", latitude: 47.3333, longitude: 13.3333 },
                        { name: "Bahrain", latitude: 26, longitude: 50.55 },
                        { name: "Bangladesh", latitude: 24, longitude: 90 },
                        { name: "Barbados", latitude: 13.1667, longitude: -59.5333 },
                        { name: "Belgium", latitude: 50.8333, longitude: 4 },
                        { name: "Bermuda", latitude: 32.3333, longitude: -64.75 },
                        { name: "Bhutan", latitude: 27.5, longitude: 90.5 },
                        { name: "Brazil", latitude: -10, longitude: -55 },
                        { name: "Cambodia", latitude: 13, longitude: 105 },
                        { name: "Cameroon", latitude: 6, longitude: 12 },
                        { name: "Canada", latitude: 60, longitude: -95 },
                        { name: "Central African Republic", latitude: 7, longitude: 21 },
                        { name: "China", latitude: 35, longitude: 105 },
                        { name: "Czech Republic", latitude: 49.75, longitude: 15.5 },
                        { name: "Denmark", latitude: 56, longitude: 10 },
                        { name: "Ecuador", latitude: -2, longitude: -77.5 },
                        { name: "Egypt", latitude: 27, longitude: 30 },
                        { name: "France", latitude: 46, longitude: 2 },
                        { name: "Germany", latitude: 51, longitude: 9 },
                        { name: "Ghana", latitude: 8, longitude: -2 },
                        { name: "Greece", latitude: 39, longitude: 22 },
                        { name: "Greenland", latitude: 72, longitude: -40 },
                        { name: "Hong Kong", latitude: 22.25, longitude: 114.1667 },
                        { name: "Iceland", latitude: 65, longitude: -18 },
                        { name: "India", latitude: 20, longitude: 77 },
                        { name: "Indonesia", latitude: -5, longitude: 120 },
                        { name: "Iran", latitude: 32, longitude: 53 },
                        { name: "Iraq", latitude: 33, longitude: 44 },
                        { name: "Ireland", latitude: 53, longitude: -8 },
                        { name: "Israel", latitude: 31.5, longitude: 34.75 },
                        { name: "Italy", latitude: 42.8333, longitude: 12.8333 },
                        { name: "Japan", latitude: 36, longitude: 138 },
                        { name: "Kenya", latitude: 1, longitude: 38 },
                        { name: "Malaysia", latitude: 2.5, longitude: 112.5 },
                        { name: "Mexico", latitude: 23, longitude: -102 },
                        { name: "Nepal", latitude: 28, longitude: 84 },
                        { name: "Netherlands", latitude: 52.5, longitude: 5.75 },
                        { name: "New Zealand", latitude: -41, longitude: 174 },
                        { name: "Pakistan", latitude: 30, longitude: 70 },
                        { name: "Portugal", latitude: 39.5, longitude: -8 },
                        { name: "Russia", latitude: 60, longitude: 100 },
                        { name: "Saudi Arabia", latitude: 25, longitude: 45 },
                        { name: "South Africa", latitude: -29, longitude: 24 },
                        { name: "Spain", latitude: 40, longitude: -4 },
                        { name: "Sri Lanka", latitude: 7, longitude: 81 },
                        { name: "Sweden", latitude: 62, longitude: 15 },
                        { name: "Switzerland", latitude: 47, longitude: 8 },
                        { name: "Trinidad and Tobago", latitude: 11, longitude: -61 },
                        { name: "United Arab Emirates", latitude: 24, longitude: 54 },
                        { name: "United Kingdom", latitude: 54, longitude: -2 },
                        { name: "United States", latitude: 38, longitude: -97 },
                        { name: "Uruguay", latitude: -33, longitude: -56 }

            ]

        $(window).on('load', function() {
             $("#zooming").ejMap("refresh");
        });

		
        function onLoad() {
            var htmlSelect = document.getElementById("countriesCombo");
            for (var i = 0; i < latLongPoints.length; i++) {
                var item = latLongPoints[i];
                var selectBoxOption = document.createElement("option");
                selectBoxOption.value = item.name;
                selectBoxOption.text = item.name;
                 htmlSelect.add(selectBoxOption, null);
			     }  
            }
       
        function buttonClick() {
            var combo = $("#countriesCombo");
            var index = combo[0].selectedIndex;
            var lat = latLongPoints[index].latitude;
            var lon = latLongPoints[index].longitude;
            var level = 4;
            $("#<%=zooming.ClientID%>").ejMap("navigateTo", lat, lon, level);
            $("#<%=zooming.ClientID%>").ejMap("selectShape", latLongPoints[index].name, null, false);
        }

    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
	<div style="background-color: white;border-color: lightgray;border-width: 2px;opacity: 0.7;height: 60px;margin-left:80%;" >
		<select size="1" style="width: 180px;border-width: 1px;left:779px;top:-398px;border-color: lightgray;height: 30px" id="countriesCombo"
			onchange="buttonClick()">
		</select>
	</div>
    <div style="min-height:435px">
    <ej:Map ID="zooming" runat="server" Background="white" EnableAnimation = "true" OnClientRenderComplete = "onLoad">
       <ZoomSettings EnableZoom = "true" EnableZoomOnSelection="true"></ZoomSettings>
         <NavigationControl EnableNavigation="true" DockPosition="None" Orientation="Vertical">
            <AbsolutePosition X="5" Y="15"/>
        </NavigationControl>

         <Layers>
            <ej:ShapeLayer LayerType="Geometry" ShowTooltip="false" EnableSelection="true" EnableMouseHover = "true" ShapeDataPath = "Name" ShowMapItems = "false" ShapePropertyPath = "name" >
                <ShapeSettings Fill = "grey" StrokeThickness="0.5" Stroke = "white" HighlightColor = "#F7CD1C" HighlightStroke = "white" HighlightBorderWidth = "1" SelectionColor = "#F96C0D" ValuePath = "Name" SelectionStroke = "white" SelectionStrokeWidth = "2" AutoFill="true" />
            </ej:ShapeLayer>
        </Layers>
    </ej:Map>
    </div>
    
   
</asp:Content>

