<%@ Page Title="Maps-HeatMap-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample indicates to render the legend label from right to left in the Syncfusion ASP.NET Web Forms Maps control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HeatMap.aspx.cs" Inherits="WebSampleBrowser.Map.HeatMap" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="ScriptSection">
    <script>
        $(window).on('load', function() {
           
            $("#heatMap").ejMap("refresh");
        });
        function enableRTL(args) {
            var map = $("#heatMap").ejMap("instance");
            if (args.checked)
                map.model.enableRTL = true;
            else
                map.model.enableRTL = false;
            map.refresh();
        }
    </script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    <div  id="title" style="background-color: #FAFAF9;border-color: lightgray;margin-left:0px;border-width: 2px;opacity: 0.7;height: 60px" >
		<label style="color:Black;font-size:22px;margin:15px;margin-top:13px;margin-left:20px;margin-right:20px;height:25px;font-weight:Normal;">USA Population 2013</label>   
    </div>
    <div style="min-height:435px">
    <ej:Map ClientIDMode="Static" ID="heatMap" runat="server" EnableAnimation ="true">
         <Layers>
            <ej:ShapeLayer ShowTooltip="true" TooltipTemplate="template" EnableSelection="false" LayerType="Geometry" ShapeDataPath="name" ShapePropertyPath="name" ShowMapItems="false" EnableMouseHover="true" >
                <LegendSettings ShowLegend="true" Position="BottomRight" Height="15" Width = "150" Type = "Layers" Mode="Interactive" Title = "Population" LeftLabel = "0.5 M" RightLabel = "40 M"></LegendSettings>
                <ShapeSettings Fill = "#9CBF4E" StrokeThickness = "0.1" Stroke = "white" HighlightStroke = "white" HighlightColor = "#BC5353"  HighlightBorderWidth = "0.5" ValuePath = "population">
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
     
             <div  style="margin-left:17px;margin-top:-45px;">             
				     <div class="tip">	
                             <p class="small" style="margin-top:8px">
                                    <label  style="color:white;font-size:14px;font-weight:normal;">{{:name}}</label>
                             </p>
                             <p class="big">
                                    <label style="color:white;font-size:11px;font-weight:normal;">Population : {{:~parseDouble(population)}}</label>
                             </p>
				    </div> 
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

<asp:Content runat="server" ID="propertycontent" ContentPlaceHolderID="PropertySection">

     
      <div id="sampleProperties">			
                <div class="prop-grid">
                    <div class="row">
                       <div class="col-md-3">Enable RTL</div>
                        <div class="col-md-3"><input type="checkbox" onchange="enableRTL(this)" /></div>
                    </div>
                </div>
      </div>
    <script>
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>

