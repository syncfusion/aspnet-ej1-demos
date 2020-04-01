<%@ Page Title="SunburstChart-Animation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the animation feature based on population details in the Syncfusion ASP.NET Web Forms Sunburst control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Animation.aspx.cs" Inherits="WebSampleBrowser.Sunburst.Animation" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Sunburst/ Animation</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">  
    <div>
        
        <ej:SunburstChart ClientIDMode="Static" ID="container" runat="server" 
            OnClientLoad="chartLoad" ValueMemberPath="Population"  InnerRadius=0.2
            EnableAnimation="true">     
            <Size Height="600" />        
            <Levels>
                <ej:SunburstLevel GroupMemberPath="Continent"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="Country"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="State"></ej:SunburstLevel>               
            </Levels>  
            <DataLabelSettings Visible="true"></DataLabelSettings>
			<Tooltip Visible="true"></Tooltip>
            <Title Text="Population Details"></Title>            
            <Legend Visible="true" Position="Top">
            </Legend>                      
        </ej:SunburstChart> 
    </div>     
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
               <div class="prop-grid">
			     <div class="row">
                <div class="col-md-3">
                    Enable Animation
                </div>
                <div class="col-md-3 aligntop">
                   <input type="checkbox" checked="checked" id="enable" onchange="visible()" />
                </div>
            </div>
			   <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                  Animation Type
					 </div>
                <div class="col-md-3 aligntop">
                       <select name="selectIndex" autocomplete="off" id="animationtype" style="width:115px;">
                        <option value="0" selected>Rotation</option>
                        <option value="1">FadeIn</option>
                    </select>
                </div>
            </div>
			 </div>
       </div>			
    <script type="text/javascript">
       
        function visible() {
            var sunburst = $("#container").ejSunburstChart("instance");
            if ($("#enable").is(":checked"))
                sunburst.model.enableAnimation = true;
            else {
                sunburst.model.enableAnimation = false;
            }
            sunburst.redraw();
        }

        function animationTypeChanged(sender)
	{
		var option = sender.selectedText;
		var sunburst = $("#container").ejSunburstChart("instance");
		switch (option) {
			  case 'Rotation':
			    sunburst.model.animationType = 'rotation';
                break;
            case 'FadeIn':
                sunburst.model.animationType = 'fadeIn';
                break;
        }
		sunburst.redraw();	
	
	}
	
	$("#animationtype").ejDropDownList({ "change": "animationTypeChanged", width: "100px",selectedItemIndex:0 });

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>

