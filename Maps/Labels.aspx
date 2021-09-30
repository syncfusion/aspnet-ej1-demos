<%@ Page Title="Maps-Labels-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates data label and range color mapping features based on USA population in the Syncfusion ASP.NET Web Forms Maps control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Labels.aspx.cs" Inherits="WebSampleBrowser.Map.Labels" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">
    <script>
        $(window).on('load', function() {
           $("#labels").ejMap("refresh");
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    <div style="background-color: #FAFAF9;border-color: lightgray;border-width: 2px;margin-left:0px;opacity: 0.7;height: 60px;width:260px" >
		<label style="color:Black;font-size:22px;margin:15px;margin-top:18px;margin-left:20px;margin-right:20px;height:25px;font-weight:Normal;">USA Population 2013</label>   
    </div>
    <div style="min-height:435px">
    <ej:Map ID="labels" runat="server" EnablePan="false" Background="white" EnableAnimation="true">

        <Layers>
            <ej:ShapeLayer LayerType="Geometry" EnableMouseHover = "true" EnableSelection = "true" ShowTooltip = "true" TooltipTemplate = "template" ShapeDataPath = "name" ShapePropertyPath = "name" ShowMapItems = "false" >
                <LabelSettings ShowLabels = "true" LabelPath = "iso_3166_2" EnableSmartLabel = "true"></LabelSettings>
                <ShapeSettings AutoFill = "false" HighlightBorderWidth = "1" StrokeThickness = "0.5" Stroke = "white" HighlightColor = "#DAD1CF" HighlightStroke = "#1A5D65" ValuePath = "population" SelectionColor = "#FFC200" SelectionStroke = "white" SelectionStrokeWidth = "2.5">
                    <ColorMappings>
                        <MappingCollection>
                            <ej:RangeColorMapping From = "500000" To = "1000000" Color = "#9BC585"></ej:RangeColorMapping>
                            <ej:RangeColorMapping From = "1000001" To = "5000000" Color = "#D2DB9A"></ej:RangeColorMapping>
                            <ej:RangeColorMapping From = "5000001" To = "10000000" Color = "#A4D4BF"></ej:RangeColorMapping>
                            <ej:RangeColorMapping From = "10000001" To = "40000000" Color = "#E0C68F"></ej:RangeColorMapping>
                        </MappingCollection>
                    </ColorMappings>
                </ShapeSettings>
                    
            </ej:ShapeLayer>
        </Layers>
        
    </ej:Map>
    </div>

    <script>
        $.views.helpers({
            parseDouble: function (amount) {
                var delimiter = ",";
                var i = parseInt(amount);
                if (isNaN(i)) { return ''; }
                var origi = i;  // store original to check sign
                i = Math.abs(i);
                var minus = '';
                if (origi < 0) { minus = '-'; } // sign based on original
                var n = new String(i);
                var a = [];
                while (n.length > 3) {
                    var nn = n.substr(n.length - 3);
                    a.unshift(nn);
                    n = n.substr(0, n.length - 3);
                }
                if (n.length > 0) { a.unshift(n); }
                n = a.join(delimiter);
                amount = minus + n;
                return amount;
            }
        });
    </script>
    
    </asp:Content>
    
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    
    <script  id="template" type="application/jsrender">
		<div class="tip">				
			<p class="small" style="margin-top:8px">
                <label  style="color:white;font-size:11px;font-weight:normal;">State : {{:name}}</label>
            </p>
            <p class="big">
				<label style="color:white;font-size:11px;font-weight:normal;">Count : {{:~parseDouble(population)}}</label>
            </p>
		</div>               
    </script>

     <style type="text/css">	 
            p.small {line-height:70%;}
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

	</style>
</asp:Content>

