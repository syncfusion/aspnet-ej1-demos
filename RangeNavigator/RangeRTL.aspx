<%@ Page Title="RangeNavigator-RTL-ASP.NET-SYNCFUSION"   Language="C#"  MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RangeRTL.aspx.cs" Inherits="WebSampleBrowser.RangeNavigator.RangeRTL" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">RangeNavigator / Custom</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     
        <ej:RangeNavigator ClientIDMode="Static" ID="RangeNavigator1" onClientSideLoad="loadingdata" onClientSideRangeChanged="onchartloaded" 
            EnableRTL="true" runat="server" EnableDeferredUpdate="True" Padding="15" 
            AllowSnapping="True" IsResponsive="true">
            <SizeSettings Height="130" />
        <SelectedRangeSettings Start="2010/5/1" End="2011/10/1"></SelectedRangeSettings>
            <ValueAxisSettings RangePadding="none"></ValueAxisSettings>
            <TooltipSettings Visible="True" LabelFormat="MM/dd/yyyy" BackgroundColor="gray" TooltipDisplayMode="ondemand">
                <Font Color="white"  Family="Segoe UI"  Style="Normal"  Weight="Regular" Opacity="1"></Font>
            </TooltipSettings>
            <NavigatorStyleSettings SelectedRegionColor="lightgray" UnselectedRegionColor="lightblue" ThumbColor="black" 
                Background="transparent" Border-Color="transparent" Border-DashArray="0">
                <MajorGridLineStyle Color="black" Visible="True"></MajorGridLineStyle>
                <MinorGridLineStyle Color="black" Visible="True"></MinorGridLineStyle>
            </NavigatorStyleSettings>
            <Series>
                <ej:Series EnableAnimation="True" Name="Product A" Opacity="0.5" ></ej:Series>
            </Series>
        </ej:RangeNavigator>
        <br />
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="400" OnClientLoad="onchartload">
            <PrimaryXAxis LabelFormat="MMM dd" ValueType="Datetime" MajorGridLines-Visible="False"></PrimaryXAxis>
            <Series>
                <ej:Series Name="Product X" Type="Line" EnableAnimation="true" Tooltip-Visible="True" 
                    Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)"></ej:Series>
                 <ej:Series Name="Product Y" Type="Line" EnableAnimation="true" Tooltip-Visible="True" 
                    Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)"></ej:Series>
            </Series>
             <Crosshair Visible="true" Type="Trackball">
                <Marker Visible="true" Shape="Circle">
                   <Size Height="9" Width="9" />
                </Marker>
                <Line Color="transparent" /> 
            </Crosshair>
            <PrimaryYAxis LabelFormat="${value}" ></PrimaryYAxis>
        </ej:Chart>
       <script type="text/javascript" language="javascript">
           var data;
               function onchartload(sender) {
               loadTheme(sender);
               sender.model.series[0].dataSource = data.Open;
               sender.model.series[0].xName = "XValue";
               sender.model.series[0].yName = "YValue";
               sender.model.series[1].dataSource = data.Close,
               sender.model.series[1].xName = "XValue";
               sender.model.series[1].yName = "YValue";
               var chartobj = $("#RangeNavigator1").data("ejRangeNavigator");
               sender.model.primaryXAxis.zoomPosition = chartobj.model.zoomPosition;
               sender.model.primaryXAxis.zoomFactor = chartobj.model.zoomFactor;
           }

           function GetData() {
               var series1 = [];
               var series2 = [];
               var value = 100;
               var value1 = 120;
               for (var i = 1; i < 730; i++) {

                   if (Math.random() > .5) {
                       value += Math.random();
                       value1 += Math.random();
                   } else {
                       value -= Math.random();
                       value1 -= Math.random();
                   }
                   var point1 = { XValue: new Date(2010, 0, i), YValue: value };
                   var point2 = { XValue: new Date(2010, 0, i), YValue: value1 };
                   series1.push(point1);
                   series2.push(point2);
               }

               data = { Open: series1, Close: series2 };
               return data;
           }

           function loadingdata(sender) {
               loadTheme(sender);
               data = GetData();
               sender.model.series[0].dataSource = data.Open,
               sender.model.series[0].xName = "XValue";
               sender.model.series[0].yName = "YValue";
           }

           var flag = false;

           function onchartloaded(sender) {
               if (!flag) {
                   flag = true;
               } else {
                   var chartobj = $("#Chart1").data("ejChart");

                   if (chartobj != null) {
                       chartobj.model.primaryXAxis.zoomPosition = sender.zoomPosition;
                       chartobj.model.primaryXAxis.zoomFactor = sender.zoomFactor;
                   }
                   $("#Chart1").ejChart("redraw");
               }
           }
    </script>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
  <script>

      function onchartload(sender) {
      }

      function loadingtheme(sender) {
      }
      function onchartloaded(sender) {
         
          var chartobj = $("#Chart1").data("ejChart");
          if (chartobj != null) {
              chartobj.model.primaryXAxis.zoomPosition = sender.zoomSettings.zoomPosition;
              chartobj.model.primaryXAxis.zoomFactor = sender.zoomSettings.zoomFactor;
          }
          $("#Chart1").ejChart("redraw");
      }
   </script>
</asp:Content>


