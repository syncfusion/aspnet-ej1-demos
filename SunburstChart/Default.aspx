<%@ Page Title="SunburstChart-Default-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the default rendering of the Syncfusion ASP.NET Web Forms Sunburst control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.Sunburst.Default" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Sunburst/ Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">  
    <div>        
        <ej:SunburstChart ClientIDMode="Static" ID="container" runat="server" 
            OnClientLoad="chartLoad" ValueMemberPath="EmployeesCount" InnerRadius=0.2>     
            <Size Height="600" />        
            <Levels>
                <ej:SunburstLevel GroupMemberPath="Country"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="JobDescription"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="JobGroup"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="JobRole"></ej:SunburstLevel>
            </Levels>                   
            <DataLabelSettings Visible="true"></DataLabelSettings>
			<Tooltip Visible="true"></Tooltip>
            <Title Text="Employees Count"></Title>
            <Legend Visible="true" Position="Top"></Legend>                      
        </ej:SunburstChart> 
    </div>     
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
               <div class="prop-grid">
			     <div class="row">
                   <div class="col-md-3">
                    Start Angle
                   </div>					
                   <div class="col-md-3">
                     <div id="startAngle">
                    </div>
                   </div>
               </div>
			   <div class="row">
                   <div class="col-md-3">
                    End Angle
                   </div>					
                   <div class="col-md-3">
                     <div id="endAngle">
                    </div>
                   </div>
               </div>
			   <div class="row">
                   <div class="col-md-3">
                    Outer Radius
                   </div>					
                   <div class="col-md-3">
                     <div id="outerRadius">
                    </div>
                   </div>
               </div>
			   <div class="row">
                   <div class="col-md-3">
                    Inner Radius
                   </div>					
                   <div class="col-md-3">
                     <div id="innerRadius">
                    </div>
                   </div>
               </div>
			   <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                  Label Overflow Mode
					 </div>
                <div class="col-md-3 aligntop">
                       <select name="selectIndex" autocomplete="off" id="overflow" style="width:115px;">
                        <option value="0" selected>Trim</option>
                        <option value="1">Hide</option>
						<option value="2">None</option>
                    </select>
                </div>
            </div>
			<div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                    Label Rotation Mode
                </div>
                <div class="col-md-3 aligntop">
                    <select name="selectIndex" autocomplete="off" id="rotation" style="width:100px;">
                        <option value="0" selected>Angle</option>
                        <option value="1">Normal</option>

                    </select>
                </div>
            </div>
			 </div>
       </div>				
    <script type="text/javascript">
       
        

        $("#startAngle").ejSlider({
            sliderType: ej.SliderType.MinRange,
            height: 12,
            width: 100,
            value:0,
            minValue: 0,
            maxValue: 360,
            change: "onchange",
            slide: "onchange"
        });

        $("#endAngle").ejSlider({
            sliderType: ej.SliderType.MinRange,
            height: 12,
            width: 100,
            value:360,
            minValue: 0,
            maxValue: 360,
            change: "onchange",
            slide: "onchange"
        });

        $("#outerRadius").ejSlider({
            sliderType: ej.SliderType.MinRange,
            height: 12,
            width: 100,
            value:1,
            minValue: 0,
            maxValue: 1,
            incrementStep: 0.1,
            change: "onchange",
            slide: "onchange"
        });

        $("#innerRadius").ejSlider({
            sliderType: ej.SliderType.MinRange,
            height: 12,
            width: 100,
            value:0.2,
            minValue: 0,
            maxValue: 1,
            incrementStep: 0.1,
            change: "onchange",
            slide: "onchange"
        });
        function onchange(args) {
            var sunburst = $("#container").ejSunburstChart("instance");
            if (args.id == "startAngle")
                sunburst.model.startAngle = args.value;
            else if (args.id == "endAngle")
                sunburst.model.endAngle = args.value;
            else if (args.id == "outerRadius")
                sunburst.model.radius = args.value;
            else if (args.id == "innerRadius")
                sunburst.model.innerRadius = args.value;
            sunburst.redraw();
        }
       function labelOverFlowModeChanged(sender){		
	    var option = sender.selectedText;
	    var sunburst = $("#container").ejSunburstChart("instance");
	    switch (option) {
		case 'Trim':
		   sunburst.model.dataLabelSettings.labelOverflowMode = 'trim';
		   break;
		case 'Hide':
		    sunburst.model.dataLabelSettings.labelOverflowMode = 'hide';
		   break;
		case 'None':
		    sunburst.model.dataLabelSettings.labelOverflowMode = 'none';
		   break;
	    }				
	    sunburst.redraw();
	}
		
	$("#overflow").ejDropDownList({ "change": "labelOverFlowModeChanged", width: "100px",selectedItemIndex:0 });
		
	function labelRotationModeChanged(sender){
	     var option = sender.selectedText;
	     var sunburst = $("#container").ejSunburstChart("instance");
	     switch (option) {
		case 'Angle':
		    sunburst.model.dataLabelSettings.labelRotationMode = 'angle';
		   break;
		case 'Normal':
		    sunburst.model.dataLabelSettings.labelRotationMode = 'normal';
		   break;
	     }
	     sunburst.redraw();		
	}
	
	$("#rotation").ejDropDownList({ "change": "labelRotationModeChanged", width: "100px",selectedItemIndex:0 });	

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>

