<%@ Page Title="RangeNavigator-Localization-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RangeLocalization.aspx.cs" Inherits="WebSampleBrowser.RangeNavigator.RangeLocalization" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">RangeNavigator / Custom</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <script src="../Scripts/cultures/ej.culture.fr-FR.min.js"></script>
    <div style="position: relative; left: 85px; height: 30px">		
Locale : 
		<select autocomplete="off"  id="locale">
            <option value="en-US">English</option>
            <option value="fr-FR">French</option>
        </select>
		IntervalType : 
		<select autocomplete="off"  id="interval">
            <option value="quarters">Quarter</option>
			<option value="weeks">Week</option>
        </select>	
</div>
           <ej:RangeNavigator ClientIDMode="Static" ID="RangeNavigator1" onClientSideLoad="loadingdata" 
               onClientSideRangeChanged="onchartloaded" runat="server"  EnableDeferredUpdate="True" 
               Padding="15" AllowSnapping="True" IsResponsive="true">
            <SizeSettings Height="130" />
            <SelectedRangeSettings Start="2010/4/1" End="2010/9/30"></SelectedRangeSettings>
            <ValueAxisSettings RangePadding="none"></ValueAxisSettings>
            <TooltipSettings Visible="True" LabelFormat="MMMM/dd/yyyy" BackgroundColor="gray" TooltipDisplayMode="ondemand">
                <Font Color="white" Family="Segoe UI"  Style="Normal"  Weight="Regular" Opacity="1"></Font>
            </TooltipSettings>
            <NavigatorStyleSettings SelectedRegionColor="lightgray" UnselectedRegionColor="lightblue" ThumbColor="black" 
                 Background="transparent">
                <Border Color="transparent" DashArray="0">
                </Border>
                <MajorGridLineStyle Color="black" Visible="true"></MajorGridLineStyle>
                <MinorGridLineStyle Color="black" Visible="True"></MinorGridLineStyle>
            </NavigatorStyleSettings>
            <Series>
                <ej:Series Fill="#69D2E7" Name="Product A" Opacity="0.5" EnableAnimation="False" ></ej:Series>
            </Series>
        </ej:RangeNavigator>
        <br />
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="400" OnClientLoad="onchartload">
            <Title Text="Stock Price Analysis"></Title>
            <PrimaryXAxis LabelFormat="MMM dd" ValueType="Datetime" MajorGridLines-Visible="False">
                <Title Text="Date"></Title>
            </PrimaryXAxis>
            <PrimaryYAxis LabelFormat="${value}">
                <Title Text="Price ($)"></Title>
            </PrimaryYAxis>
            <Series>
                <ej:Series Name="Product X" Type="Line" EnableAnimation="True" Tooltip-Visible="True" 
                    Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)"></ej:Series>
                <ej:Series Name="Product Y" Type="Line" EnableAnimation="True" Tooltip-Visible="True" 
                    Tooltip-Format="#point.x#  : ej.format(#point.y#,n2)"></ej:Series>
            </Series>
             <Crosshair Visible="true" Type="Trackball">
                <Marker Visible="true" Shape="Circle">
                   <Size Height="9" Width="9" />
                </Marker>
                <Line Color="transparent" /> 
            </Crosshair>
        </ej:Chart>
      <script>

        var data;
		var localizedText = {};
		localizedText["en-US"] = { title: "Stock Price Analysis", xAxisTitle: "Date", yAxisTitle: "Price ($)", series: [{ name: "Product X" }, { name: "Product Y" }] };
        localizedText["fr-FR"] = { title: "Stock Prix Analyse", xAxisTitle: "Date", yAxisTitle: "Prix ​​($)", series: [{ name: "Le produit X" }, {name:"Le produit Y"}] };
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

          function GetData1() {
              var series1 = [];
              var series2 = [];
              var value = 100;
              var value1 = 120;
              for (var i = 1; i < 90; i++) {

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

          function GetData() {
              var series1 = [];
              var series2 = [];
              var value = 100;
              var value1 = 120;
              for (var i = 1; i < 360; i++) {

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

          $('#locale').change(function () {
              var culture = $('#locale option:selected').val();
              var slideobj = $("#RangeNavigator1").data("ejRangeNavigator");
              var chartObj = $("#Chart1").ejChart("instance");
              chartObj.model.locale = culture;
              slideobj.model.locale = culture;
              $("#Chart1").ejChart("option", {
                locale: culture, title: { text: localizedText[culture].title },
                primaryXAxis: { title: { text: localizedText[culture].xAxisTitle } },
                primaryYAxis: { title: { text: localizedText[culture].yAxisTitle } },
                series: localizedText[culture].series
			});
              $("#RangeNavigator1").ejRangeNavigator("renderNavigator");
          });

          $('#interval').change(function () {
              var Interval = $('#interval option:selected').val();
              var slideobj = $("#RangeNavigator1").data("ejRangeNavigator");
              if (slideobj.model.series[0].dataSource.length == 359) {
                  var data = GetData1();
                  slideobj.model.series[0].dataSource = data.Open;
                  slideobj.model.selectedRangeSettings.start = "2010/2/1";
                  slideobj.model.selectedRangeSettings.end = "2010/3/1";
              }
              else {
                  var data = GetData();
                  slideobj.model.series[0].dataSource = data.Open;
                  slideobj.model.selectedRangeSettings.start = "2010/4/1";
                  slideobj.model.selectedRangeSettings.end = "2010/6/30";
              }

              slideobj.model.labelSettings.lowerLevel.intervalType = Interval;
              $("#RangeNavigator1").ejRangeNavigator("renderNavigator");
          });

          
    </script>
</asp:Content>


