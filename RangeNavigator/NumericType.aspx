<%@ Page Title="RangeNavigator-NumericType-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="NumericType.aspx.cs" Inherits="WebSampleBrowser.RangeNavigator.NumericType" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">RangeNavigator / Custom</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     
        <ej:RangeNavigator ClientIDMode="Static" ID="RangeNavigator1" runat="server" onClientSideLoad="loadingdata"
             onClientSideRangeChanged="onchartloaded"  EnableDeferredUpdate="True" Padding="15" AllowSnapping="True" 
             IsResponsive="true" ValueType="numeric">
            <SizeSettings Height="130"/>
            <SelectedRangeSettings Start="100" End="250"></SelectedRangeSettings>
            <ValueAxisSettings RangePadding="none"></ValueAxisSettings>
            <TooltipSettings Visible="True" LabelFormat="MM/dd/yyyy" BackgroundColor="gray" TooltipDisplayMode="ondemand">
                <Font Color="white"  Style="Normal" Weight="Regular" Opacity="1" Family="Segoe UI"></Font>
            </TooltipSettings>
            <NavigatorStyleSettings SelectedRegionColor="lightgray" UnselectedRegionColor="lightblue" 
                 ThumbColor="black" Background="transparent" Border-Color="transparent" Border-DashArray="0">
                <MajorGridLineStyle Color="black" Visible="True"></MajorGridLineStyle>
                <MinorGridLineStyle Color="black" Visible="True"></MinorGridLineStyle>
            </NavigatorStyleSettings>
            <Series>
                <ej:Series Name="Product A" EnableAnimation="True" Fill="#69D2E7" Opacity="0.5" ></ej:Series>
            </Series>
        </ej:RangeNavigator>
      <br />
    <ej:Chart ID="Chart1" ClientIDMode="Static" runat="server" Height="400"  OnClientLoad="onchartload">
        <PrimaryXAxis Visible="True" MajorGridLines-Visible="False"></PrimaryXAxis>
        <PrimaryYAxis LabelFormat="${value}"></PrimaryYAxis>
        <Series>
            <ej:Series Name="Product X" Type="Line" Tooltip-Visible="True" 
                Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)" EnableAnimation="True"></ej:Series>
        <ej:Series Name="Product Y" Type="Line" Tooltip-Visible="True" 
                Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)" EnableAnimation="True"></ej:Series>
        </Series>
         <Crosshair Visible="true" Type="Trackball">
                <Marker Visible="true" Shape="Circle">
                   <Size Height="9" Width="9" />
                </Marker>
                <Line Color="transparent" /> 
            </Crosshair>
    </ej:Chart>
     <script type="text/javascript" language="javascript">

         var data;
         function onchartload(sender) {
             loadTheme(sender);
             data = GetData();
             sender.model.series[0].dataSource = data.Open;
             sender.model.series[0].xName = "XValue";
             sender.model.series[0].yName = "YValue";
             sender.model.series[1].dataSource = data.Close;
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
             for (var i = 0; i < 351; i++) {

                 if (Math.random() > .5) {
                     value += Math.random();
                     value1 += Math.random();
                 } else {
                     value -= Math.random();
                     value1 -= Math.random();
                 }
                 var point1 = { XValue: i, YValue: value };
                 var point2 = { XValue: i, YValue: value1 };
                 series1.push(point1);
                 series2.push(point2);
             }

             data = { Open: series1, Close: series2 };
             return data;
         }

         function loadingdata(sender) {
             loadTheme(sender);
             data = GetData();
             sender.model.series[0].dataSource = data.Open;
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


