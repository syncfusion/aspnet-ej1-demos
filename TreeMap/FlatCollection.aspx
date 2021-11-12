<%@ Page Title="TreeMap-FlatCollection-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates layout types based on continents population in the Syncfusion ASP.NET Web Forms Treemap control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FlatCollection.aspx.cs" Inherits="WebSampleBrowser.TreeMap.flatcollection" %>
<%@ Register TagPrefix="a" Namespace="Syncfusion.JavaScript.DataVisualization.Models" Assembly="Syncfusion.EJ" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="ScriptSection">

        <script type="text/javascript" class="jsScript">

                $(window).on('load', function() {
                    
                    $("#flatCollection").ejTreeMap("refresh");
                });

                function onChange(args) {
		    var treemapObj = $("#<%=flatCollection.ClientID%>").data("ejTreeMap");				
            var index = $("#selectChange")[0].selectedIndex;
            if (treemapObj != null) {
                if (index == 0) {
                    treemapObj.option("itemsLayoutMode", ej.datavisualization.TreeMap.ItemsLayoutMode.Squarified);
                }
                else if (index == 1) {
                    treemapObj.option("itemsLayoutMode", ej.datavisualization.TreeMap.ItemsLayoutMode.SliceAndDiceHorizontal);
                }
                else if (index == 2) {
                    treemapObj.option("itemsLayoutMode", ej.datavisualization.TreeMap.ItemsLayoutMode.SliceAndDiceVertical);
                }
                else if (index == 3) {
                    treemapObj.option("itemsLayoutMode", ej.datavisualization.TreeMap.ItemsLayoutMode.SliceAndDiceAuto);
                }
            }
        }
    </script> 


</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="ControlsSection">
    <div style="min-height:405px">
    <ej:Treemap ID="flatCollection" runat="server" ColorValuePath = "Population" EnableGradient="true" ShowTooltip="true" ToolTipTemplate ="template" WeightValuePath = "Population" ShowLegend = "true" >
       <TreeMapLegend Mode="Interactive" LeftLabel ="20000000" RightLabel="300000000" Title = "Population" IconHeight = "17" IconWidth = "17" Height = "20" Width = "150" DockPosition = "Top" Alignment="Center"></TreeMapLegend>
        <LeafItemSettings ShowLabels = "true" LabelPath = "Country"></LeafItemSettings>
          

        <Levels>
            <ej:TreeMapLevel GroupPath = "Continent" GroupGap = "5" HeaderHeight = "25"></ej:TreeMapLevel>
        </Levels>
       
    </ej:Treemap>
    </div>
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="StyleSection">
   <style>
   .e-treemap-leaflabel{
    color:black;
    }
   </style>
    <script  id="headertemplate" type="application/jsrender">   
	  <div>
            <label style="color:gray;font-size:16px;font-weight:normal;" id="Label1">{{:header}}</label><br />            
      </div>                        
    </script> 

   <script  id="labeltemplate" type="application/jsrender">       
	    <div style="background-color: transparent;">
            <label style="color:white;font-size:large;font-weight:normal;" id="Label2">{{:label}}</label><br />            
        </div>                        
    </script> 
   <script  id="template" type="application/jsrender">
        <div  style="margin-left:17px;margin-top:-45px;">      
            <div style="height:auto;width:auto;background:black;border-radius:3px;opacity:1">
                <div style="margin-top:-20px;margin-left:9px;padding-top:3px;margin-right:9px;">
                    <label style="margin-top:-20px;font-weight:normal;font-size:12px;color:white;font-family:Segoe UI;">{{:Country}}</label>
                </div>
               <div style="height:10px;"></div>
                <div style="margin-top:-10px;margin-left:9px;margin-right:9px;padding-bottom:3px;">
                    <label style="margin-top:-10px;font-weight:normal;font-size:14px;color:white;font-family:segoe ui light;">{{:Population}}</label>
                </div>
            </div>
        </div>            
    </script> 	

</asp:Content>

<asp:Content runat="server" ID="propertycontent" ContentPlaceHolderID="PropertySection">

     
      <div id="sampleProperties">			
                <div class="prop-grid">
                    <div class="row">
                       <div class="col-md-3" style="left:55px;top:10px;position:relative;font-weight:bold">Layout Type</div>                                           
                            <select name="selectIndex" id="selectChange" style="left:58px;top:20px;position:relative" onchange="onChange()">
                                <option value="0">Squarified</option>
                                <option value="1">Horizontal</option>
                                <option value="2">Vertical</option>
                                <option value="3">Auto</option>
                            </select>                  
                    </div>
                </div>
      </div>

</asp:Content>

