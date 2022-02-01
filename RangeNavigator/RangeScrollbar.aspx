<%@ Page Title="RangeNavigator-Scrollbar-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RangeScrollbar.aspx.cs" Inherits="WebSampleBrowser.RangeNavigator.RangeScrollbar" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">RangeNavigator / Scrollbar</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
     <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="300">
            <PrimaryXAxis LabelFormat="MMM/dd" ValueType="Datetime">
                <CrosshairLabel Visible="true"></CrosshairLabel>
            </PrimaryXAxis>
            <PrimaryYAxis RangePadding="None">
                <CrosshairLabel Visible="true"></CrosshairLabel>
            </PrimaryYAxis>
            <Series>
                <ej:Series Name="Product X" Type="Line">
                    <Border Width="2" />
                    <Tooltip Visible="true" Format="#point.x#  : #point.y#"></Tooltip>
                </ej:Series>
            </Series>
         <Crosshair Visible="true"></Crosshair>
         <Legend Visible="false"></Legend>
        </ej:Chart>
    <ej:RangeNavigator ClientIDMode="Static" ID="RangeNavigator1"  EnableDeferredUpdate="True"  runat="server" onClientSideLoad="onrangeload" 
        onClientSideRangeChanged="onRangeChanged" onClientSideScrollStart="onScrollStart" onClientSideScrollEnd="onScrollbarChanged"
        ValueType="datetime" IsResponsive="true" EnableScrollbar="true">
        <SelectedRangeSettings  Start="2009/5/11" End="2009/8/1"></SelectedRangeSettings>
        <ScrollRangeSettings Start="2009/1/1" End="2014/2/31" />
      <TooltipSettings Visible="True" LabelFormat="dd/MMM/yyyy" TooltipDisplayMode="always">
      </TooltipSettings>      
        <Series>
            <ej:Series Name="Product A" Type="Line" Opacity="0.5" Fill="#69D2E7">
                <Border Width="2" />
            </ej:Series>
        </Series>
    </ej:RangeNavigator>    
    <br/>
      
   <script type="text/javascript" language="javascript">
      
     
       function GetData(start, end) {
           var series1 = [], date, data1;
           var value = 100;

           for (var i = 0; start <= end; i++) {
               date = Date.parse(start);
               if (Math.random() > .5) {
                   value += Math.random();
               } else {
                   value -= Math.random();
               }
               var point1 = { XValue: new Date(date), YValue: value };
               new Date(start.setDate(start.getDate() + 1));
               series1.push(point1);
           }

           data1 = { Open: series1 };
           return data1;
       }

       //Event fires on loading the rangenavigator
       function onrangeload(sender) {
           loadTheme(sender);
           var data = GetData(new Date(2009,0,1), new Date(2010,2,1));
           sender.model.series[0].dataSource = data.Open;
           sender.model.series[0].xName = "XValue";
           sender.model.series[0].yName = "YValue";
       }

       //Event fires on Rangenavigator slider position changed
       function onRangeChanged(sender) {

           var chartobj = $("#Chart1").ejChart("instance");
           chartobj.model.series[0].dataSource = sender.selectedData;
           chartobj.model.series[0].xName = "XValue";
           chartobj.model.series[0].yName = "YValue";
           chartobj.model.primaryXAxis.labelFormat = "MMM/dd";
           chartobj.redraw();
       }

       //Event fires on scrollbar start
       function onScrollStart(sender) {
           $("#RangeNavigator1").ejWaitingPopup();
           $("#RangeNavigator1").ejWaitingPopup("show");
       }

       //Event fires on scrollbar position changed
       function onScrollbarChanged(sender) {
           $("#RangeNavigator1").ejWaitingPopup();
           $("#RangeNavigator1").ejWaitingPopup("hide");
           var range = sender, startRange, endRange;
           data = sender.data;
           startRange = Date.parse(data.newRange.start);
           endRange = Date.parse(data.newRange.end);
           data = GetData(new Date(startRange), new Date(endRange));
           range.model.series[0].dataSource = data.Open;
           range.model.series[0].xName = "XValue";
           range.model.series[0].yName = "YValue";
           $("#RangeNavigator1").ejRangeNavigator("redraw");
       }

	$(window).mouseup(function(){
		 $("#RangeNavigator1").ejWaitingPopup();
           $("#RangeNavigator1").ejWaitingPopup("hide");
	});
    </script>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
       .e-waitpopup-pane
			{
				background-color:transparent !important;
			}
    </style>
</asp:Content>

