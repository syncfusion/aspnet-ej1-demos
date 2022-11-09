<%@ Page Title="RangeNavigator-Highlight-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Highlight.aspx.cs" Inherits="WebSampleBrowser.RangeNavigator.Highlight" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">RangeNavigator / Highlight and Selection </span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <br />
     <div>
         <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="400" OnClientLoad="onchartload">
            <PrimaryXAxis LabelFormat="MMM dd" ValueType="Datetime" MajorGridLines-Visible="False"></PrimaryXAxis>
            <PrimaryYAxis LabelFormat="${value}"></PrimaryYAxis>
            <Series>
                <ej:Series Name="Product X" Fill="#4EC9DD" EnableAnimation="True" Type="Line" Tooltip-Visible="True"
                     Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)">
                </ej:Series>
            </Series>
            <Crosshair Visible="true" Type="Trackball">
                <Marker Visible="true" Shape="Circle">
                   <Size Height="9" Width="9" />
                </Marker>
                <Line Color="transparent" /> 
            </Crosshair>
        </ej:Chart>
         <br/>
    <ej:RangeNavigator ClientIDMode="Static" ID="RangeNavigator1" EnableDeferredUpdate="True"  runat="server" onClientSideLoad="loadingdata" 
        onClientSideRangeChanged="onchartloaded"  Padding="15" AllowSnapping="True"
        ValueType="datetime" IsResponsive="true">
      <SizeSettings Height="130"/>
        <SelectedRangeSettings End="2010/09/1" Start="2010/04/1"></SelectedRangeSettings>
      <ValueAxisSettings RangePadding="none"></ValueAxisSettings>
      <TooltipSettings Visible="True" LabelFormat="MMM/dd/yyyy" BackgroundColor="#434344" TooltipDisplayMode="ondemand">
           <Font Color="white" Family="Segoe UI" Style="Normal" Weight="Regular" Opacity="1"></Font>           
       </TooltipSettings>
	   <LabelSettings>
            <HigherLevel LabelPlacement="inside">
                <Style HorizontalAlignment="Left">
                    <Font Color="black" Family="Seoge UI" FontSize="13px" Weight="Regular" Style="Normal" Opacity="1"></Font>
                </Style>  
            </HigherLevel>
			<LowerLevel LabelPlacement="inside">
            </LowerLevel>
        </LabelSettings>
       <NavigatorStyleSettings ThumbStroke="black" ThumbColor="gray" Background="#f2f3f4" UnselectedRegionColor="#2d8ec4">
           <HighlightSettings Enable="True" Color="#006fa0">
				<Border Color="gray" Width="1"></Border>
		   </HighlightSettings>
		   <SelectionSettings Enable="True" Color="#0e4a7c">
				<Border Color="gray" Width="1"></Border>
		   </SelectionSettings>
       </NavigatorStyleSettings>
        <Border Color="#f2f3f4" Width="2" />
        <Series>
            <ej:Series Name="Product A" EnableAnimation="True" Type="Line" Opacity="0.5" Fill="#4EC9DD"></ej:Series>
        </Series>
    </ej:RangeNavigator>    
         </div>
   <script type="text/javascript" language="javascript">

       var data = GetData();

       function onchartload(sender) {
           loadTheme(sender);
           sender.model.series[0].dataSource = data.Open;
           sender.model.series[0].xName = "XValue";
           sender.model.series[0].yName = "YValue";
       }

       function GetData() {
           var series1 = [];
           var value = 100;
           for (var i = 1; i < 365; i++) {

               if (Math.random() > .5) {
                   value += Math.random();
               } else {
                   value -= Math.random();
               }
               var point1 = { XValue: new Date(2010, 0, i), YValue: value };
               series1.push(point1);
           }

           data = { Open: series1 };
           return data;
       }

       function loadingdata(sender) {
           loadTheme(sender);
           sender.model.series[0].dataSource = data.Open;
           sender.model.series[0].xName = "XValue";
           sender.model.series[0].yName = "YValue";
       }

       function onchartloaded(sender) {
           var chartobj = $("#Chart1").data("ejChart");
           if (chartobj != null) {
               chartobj.model.primaryXAxis.zoomPosition = sender.zoomPosition;
               chartobj.model.primaryXAxis.zoomFactor = sender.zoomFactor;
           }
           $("#Chart1").ejChart("redraw");
       }
    </script>
    
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
				<div class="prop-grid">
						<div class="row">
							<div class="col-md-3">
								 Enable Highlight
							</div>
							<div class="col-md-3 aligntop">
                                <input type="checkbox" checked="checked" id="enablehigh"/>
							</div>
						</div>
                        <div class="row">
							<div class="col-md-3">
								 Enable Selection
							</div>
							<div class="col-md-3 aligntop">
                                <input type="checkbox" checked="checked" id="enablesel"/>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								  Highlight Color
							</div>
							<div class="col-md-3 aligntop">
								 <ej:ColorPicker ID="colorPicker" Value="#006fa0" ClientSideOnSelect="onChange" runat="server"></ej:ColorPicker>
							</div>
						</div>
                        <div class="row">
							<div class="col-md-3">
								  Selection Color
							</div>
							<div class="col-md-3 aligntop">
								 <ej:ColorPicker ID="colorPicker1" Value="#0e4a7c" ClientSideOnSelect="onChange1" runat="server"></ej:ColorPicker>
							</div>
						</div>
			    </div>
        </div>
    </div>
    				
    <script type="text/javascript">
	
        $('#enablehigh').change(function () {
            $("#RangeNavigator1").ejRangeNavigator("option", { "navigatorStyleSettings": { highlightSettings: { enable: $('#enablehigh').is(":checked") } } });

        });
        $('#enablesel').change(function () {
            $(RangeNavigator1).ejRangeNavigator("option", { "navigatorStyleSettings": { selectionSettings: { enable: $('#enablesel').is(":checked") } } });

        });
        function onChange(args) {
            $(RangeNavigator1).ejRangeNavigator("option", { "navigatorStyleSettings": { highlightSettings: { color: args.value } } });
        }
        function onChange1(args) {
            $(RangeNavigator1).ejRangeNavigator("option", { "navigatorStyleSettings": { selectionSettings: { color: args.value } } });
        }
    	
        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>


