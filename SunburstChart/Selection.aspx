<%@ Page Title="SunburstChart-Selection-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample demonstrates the legend selection based on population details in the Syncfusion ASP.NET Web Forms Sunburst control" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Selection.aspx.cs" Inherits="WebSampleBrowser.Sunburst.Selection" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Sunburst/ Selection</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">  
    <div>
        
        <ej:SunburstChart ClientIDMode="Static" ID="container" runat="server" 
            OnClientLoad="chartLoad" ValueMemberPath="Population" 
            StartAngle=90 InnerRadius=0.2 >                 
            <Size Height="600"/>        
            <Levels>
                <ej:SunburstLevel GroupMemberPath="Continent"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="Country"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="State"></ej:SunburstLevel>               
            </Levels>       
            <HighlightSettings Enable="true" />
            <SelectionSettings Enable="true" />             
            <DataLabelSettings Visible="true"></DataLabelSettings>
            <Title Text="Population Details"></Title>
            <Legend Visible="true" Position="Top"></Legend>                      
        </ej:SunburstChart> 
    </div>     
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
     <div id="sampleProperties">
               <div class="prop-grid">
			     <div class="row">
                <div class="col-md-3">
                    Enable Highlight
                </div>
                <div class="col-md-3 aligntop">
                   <input type="checkbox" checked="checked" id="high" onchange="highLight()" />
                </div>
            </div>
			   <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                  Hightlight Type
					 </div>
                <div class="col-md-3 aligntop">
                       <select name="selectIndex" autocomplete="off" id="highlightType" style="width:115px;">
                        <option value="0" selected>Point</option>
                        <option value="1">All</option>
						<option value="2">Child</option>
						<option value="3">Parent</option>
                    </select>
                </div>
            </div>
			  <div class="row">
                <div class="col-md-3">
                    Enable Selection
                </div>
                <div class="col-md-3 aligntop">
                   <input type="checkbox" checked="checked" id="select" onchange="selection()" />
                </div>
            </div>
			   <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                  Selection Type
					 </div>
                <div class="col-md-3 aligntop">
                       <select name="selectIndex" autocomplete="off" id="selectionType" style="width:115px;">
                        <option value="0" selected>Point</option>
                        <option value="1">All</option>
						<option value="2">Child</option>
						<option value="3">Parent</option>
                    </select>
                </div>
            </div>
			 </div>
       </div>		
    <script type="text/javascript">
        function highLight() {
            var sunburst = $("#container").ejSunburstChart("instance");
            if ($("#high").is(":checked"))
                sunburst.model.highlightSettings.enable = true;
            else {
                sunburst.model.highlightSettings.enable = false;
            }
            sunburst.redraw();
        }

        function highlightModeChanged(sender)
	{
		var option = sender.selectedText;
		var sunburst = $("#container").ejSunburstChart("instance");
		switch (option) {
            case 'Point':
                 sunburst.model.highlightSettings.mode = 'point';
                break;
            case 'All':
			    sunburst.model.highlightSettings.mode = 'all';
                break;
			case 'Child':
			    sunburst.model.highlightSettings.mode = 'child';
				break;
			case 'Parent':
			    sunburst.model.highlightSettings.mode = 'parent';
				break;
        }	
		sunburst.redraw();			
	}
	$("#highlightType").ejDropDownList({ "change": "highlightModeChanged", width: "100px",selectedItemIndex:0 });

        function selection() {
            var sunburst = $("#container").ejSunburstChart("instance");
            if ($("#select").is(":checked"))
                sunburst.model.selectionSettings.enable = true;
            else {
                sunburst.model.selectionSettings.enable = false;
            }
            sunburst.redraw();
        }

        function selectionModeChanged(sender)
	{
		var option = sender.selectedText;
		var sunburst = $("#container").ejSunburstChart("instance");
		switch (option) {
            case 'Point':
                 sunburst.model.selectionSettings.mode = 'point';
                break;
            case 'All':
			    sunburst.model.selectionSettings.mode = 'all';
                break;
			case 'Child':
			    sunburst.model.selectionSettings.mode = 'child';
				break;
			case 'Parent':
			    sunburst.model.selectionSettings.mode = 'parent';
				break;
        }	
		sunburst.redraw();	
	
	}
	$("#selectionType").ejDropDownList({ "change": "selectionModeChanged", width: "100px",selectedItemIndex:0 });

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>


