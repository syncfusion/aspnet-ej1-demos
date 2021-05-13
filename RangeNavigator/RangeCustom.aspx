<%@ Page Title="RangeNavigator-Customization-ASP.NET-SYNCFUSION"   Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RangeCustom.aspx.cs" Inherits="WebSampleBrowser.RangeNavigator.RangeCustom" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">RangeNavigator / Custom</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <br /><br /><br />
  <script type="text/x-jsrender" id="leftlight">
          <div style="width:28px;height:20px;background-color: transparent;">
		     <img id="Img1" src="../Content/images/rangenavigator/Left.png"  />
		  </div>
	</script>
	<script type="text/x-jsrender" id="rightlight">
          <div style="width:20px;height:20px;background-color: transparent;">
		     <img id="Img2" src="../Content/images/rangenavigator/Right.png"  />
		  </div>
	</script>
	<script type="text/x-jsrender" id="leftdark">
          <div style="width:28px;height:20px;background-color: transparent;">
		     <img id="Img3" src="../Content/images/rangenavigator/LeftDark.png"  />
		  </div>
	</script>
	<script type="text/x-jsrender" id="rightdark">
          <div style="width:20px;height:20px;background-color: transparent;">
		     <img id="Img4" src="../Content/images/rangenavigator/RightDark.png"  />
		  </div>
	</script>
	<script type="text/x-jsrender" id="rectlight">
           <div style="width:8px;height:36px;background-color: #41d335;border: 2px ridge dimgray;"></div>
	</script>
	<script type="text/x-jsrender" id="rectdark">
           <div style="width:8px;height:36px;background-color: #41d335;border: 2px ridge white;"></div>
	</script>

    <div>
    <ej:RangeNavigator ClientIDMode="Static" ID="rangecustomtheme" runat="server" onClientSideLoad="loadingdata" 
        onClientSideLoaded="loadingtheme" onClientSideRangeChanged="onchartloaded" EnableDeferredUpdate="True" 
        Padding="15" AllowSnapping="True" IsResponsive="true">
        <SizeSettings Height="130" />
         <SelectedRangeSettings Start="2010/7/1" End="2011/4/1"></SelectedRangeSettings>
        <TooltipSettings Visible="True" LabelFormat="MM/dd/yyyy" BackgroundColor="gray" TooltipDisplayMode="ondemand">
            <Font Color="white"  Family="Segoe UI"  Style="Normal" FontSize="12px"  Opacity="1" Weight="Regular"></Font>
        </TooltipSettings>
        <SeriesSettings EnableAnimation="True" Type="Column"></SeriesSettings>
        <ValueAxisSettings Visible="False">
            <AxisLine Visible="False"></AxisLine>
            <Font FontSize="0px"></Font>
            <MajorTickLines Width="0" Size="0" Visible="True"></MajorTickLines>
            <MajorGridLines Visible="False"></MajorGridLines>
        </ValueAxisSettings>
        <LabelSettings>
            <HigherLevel IntervalType="Years" LabelPlacement="inside">
                <Style HorizontalAlignment="Left">
                    <Font Color="black" Family="Seoge UI" FontSize="13px" Weight="Regular" Style="Normal" Opacity="1"></Font>
                </Style>        
            <GridLineStyle Color="black" Width="1" DashArray="17 5 0"></GridLineStyle>     
            </HigherLevel>
            <LowerLevel IntervalType="Quarters" LabelPlacement="inside">
                <Style>
                    <Font Color="black" Family="Seoge UI" FontSize="13px" Style="Normal" Weight="Regular" Opacity="1"></Font>
                </Style>
            </LowerLevel>
        </LabelSettings>
        <NavigatorStyleSettings UnselectedRegionColor="white" LeftThumbTemplate="rectlight" RightThumbTemplate="rectlight" 
            ThumbColor="white" Background="transparent">
            <Border Color="black" Width="3"></Border>
            <MajorGridLineStyle Color="transparent"></MajorGridLineStyle>
            <MinorGridLineStyle Color="transparent"></MinorGridLineStyle>
        </NavigatorStyleSettings>
        <Series>
            <ej:Series Name="Product A" EnableAnimation="False" Type="Area" Fill="#45eded" Opacity="1" 
                Border-Color="transparent" Border-Width="2" ></ej:Series>
            <ej:Series Name="Product B" EnableAnimation="false" Type="Area" Fill="#41d335" Opacity="1" 
                Border-Color="transparent" Border-Width="2"></ej:Series>
        </Series>
    </ej:RangeNavigator>
    <br /><br />


      <ej:RangeNavigator ClientIDMode="Static" ID="rangecustomtheme2" runat="server" onClientSideLoad="loadingdata" onClientSideLoaded="loadingtheme" 
          onClientSideRangeChanged="onchartloaded" EnableDeferredUpdate="True" Padding="15"
          AllowSnapping="True" IsResponsive="true">
        <SizeSettings Height="130"  />
         <SelectedRangeSettings Start="2011/1/1" End="2011/10/1"></SelectedRangeSettings>
        <TooltipSettings Visible="True" LabelFormat="MM/dd/yyyy" BackgroundColor="gray" TooltipDisplayMode="ondemand">
            <Font Color="white"  Family="Segoe UI"  Style="Normal" FontSize="12px"  Opacity="1" Weight="Regular"></Font>
        </TooltipSettings>
        <SeriesSettings EnableAnimation="True" Type="Column"></SeriesSettings>
        <ValueAxisSettings Visible="False">
            <AxisLine Visible="False"></AxisLine>
            <Font FontSize="0px"></Font>
            <MajorTickLines Width="0" Size="0" Visible="True"></MajorTickLines>
            <MajorGridLines Visible="False"></MajorGridLines>
        </ValueAxisSettings>
        <LabelSettings>
            <HigherLevel IntervalType="Years" LabelPlacement="inside">
                <Style HorizontalAlignment="Left">
                    <Font Color="black" Family="Seoge UI" FontSize="13px" Weight="Regular" Style="Normal" Opacity="1"></Font>
                </Style>        
            <GridLineStyle Color="black" Width="1" DashArray="17 5 0"></GridLineStyle>     
            </HigherLevel>
            <LowerLevel IntervalType="Quarters" LabelPlacement="inside">
                <Style>
                    <Font Color="black" Family="Seoge UI" FontSize="13px" Style="Normal" Weight="Regular" Opacity="1"></Font>
                </Style>
            </LowerLevel>
        </LabelSettings>
        <NavigatorStyleSettings UnselectedRegionColor="white" LeftThumbTemplate="leftlight" 
            RightThumbTemplate="rightlight" ThumbColor="white" Background="transparent">
            <Border Color="black" Width="3"></Border>
            <MajorGridLineStyle Color="transparent"></MajorGridLineStyle>
            <MinorGridLineStyle Color="transparent"></MinorGridLineStyle>
        </NavigatorStyleSettings>
        <Series>
            <ej:Series Name="Product A" EnableAnimation="False" Type="SplineArea" Fill="#4EC9DD" 
                Opacity="1" Border-Color="transparent" Border-Width="2" ></ej:Series>
            <ej:Series Name="Product B" EnableAnimation="false" Type="SplineArea" Fill="#DD4A4A" 
                Opacity="1" Border-Color="transparent" Border-Width="2"></ej:Series>
        </Series>
    </ej:RangeNavigator>
</div>
    <script type="text/javascript" language="javascript">

          var data;

          function GetData() {

              var series1 = [];
              var series2 = [];
              var value = 100;
              var value1 = 120;


              series1.push({ XValue: new Date(2010, 0, 1), YValue: 5 });
              series1.push({ XValue: new Date(2010, 0, 20), YValue: 5 });
              series1.push({ XValue: new Date(2010, 0, 40), YValue: 20 });
              series1.push({ XValue: new Date(2010, 0, 80), YValue: 15 });
              series1.push({ XValue: new Date(2010, 0, 100), YValue: 20 });
              series1.push({ XValue: new Date(2010, 0, 120), YValue: 15 });
              series1.push({ XValue: new Date(2010, 0, 140), YValue: 15 });
              series1.push({ XValue: new Date(2010, 0, 160), YValue: 30 });
              series1.push({ XValue: new Date(2010, 0, 180), YValue: 20 });
              series1.push({ XValue: new Date(2010, 0, 200), YValue: 25 });
              series1.push({ XValue: new Date(2010, 0, 220), YValue: 15 });
              series1.push({ XValue: new Date(2010, 0, 240), YValue: 20 });
              series1.push({ XValue: new Date(2010, 0, 260), YValue: 15 });
              series1.push({ XValue: new Date(2010, 0, 280), YValue: 25 });
              series1.push({ XValue: new Date(2010, 0, 300), YValue: 5 });
              series1.push({ XValue: new Date(2010, 0, 320), YValue: 35 });
              series1.push({ XValue: new Date(2010, 0, 340), YValue: 25 });
              series1.push({ XValue: new Date(2010, 0, 363), YValue: 15 });
              series1.push({ XValue: new Date(2011, 0, 1), YValue: 5 });
              series1.push({ XValue: new Date(2011, 0, 20), YValue: 5 });
              series1.push({ XValue: new Date(2011, 0, 40), YValue: 20 });
              series1.push({ XValue: new Date(2011, 0, 80), YValue: 15 });
              series1.push({ XValue: new Date(2011, 0, 100), YValue: 20 });
              series1.push({ XValue: new Date(2011, 0, 120), YValue: 15 });
              series1.push({ XValue: new Date(2011, 0, 140), YValue: 15 });
              series1.push({ XValue: new Date(2011, 0, 160), YValue: 30 });
              series1.push({ XValue: new Date(2011, 0, 180), YValue: 20 });
              series1.push({ XValue: new Date(2011, 0, 200), YValue: 25 });
              series1.push({ XValue: new Date(2011, 0, 220), YValue: 15 });
              series1.push({ XValue: new Date(2011, 0, 240), YValue: 20 });
              series1.push({ XValue: new Date(2011, 0, 260), YValue: 15 });
              series1.push({ XValue: new Date(2011, 0, 280), YValue: 25 });
              series1.push({ XValue: new Date(2011, 0, 300), YValue: 5 });
              series1.push({ XValue: new Date(2011, 0, 320), YValue: 35 });
              series1.push({ XValue: new Date(2011, 0, 340), YValue: 25 });
              series1.push({ XValue: new Date(2012, 0, 60), YValue: 15 });
              series2.push({ XValue: new Date(2010, 0, 1), YValue: 5 });
              series2.push({ XValue: new Date(2010, 0, 20), YValue: 15 });
              series2.push({ XValue: new Date(2010, 0, 40), YValue: 20 });
              series2.push({ XValue: new Date(2010, 0, 80), YValue: 25 });
              series2.push({ XValue: new Date(2010, 0, 100), YValue: 20 });
              series2.push({ XValue: new Date(2010, 0, 120), YValue: 35 });
              series2.push({ XValue: new Date(2010, 0, 140), YValue: 15 });
              series2.push({ XValue: new Date(2010, 0, 160), YValue: 30 });
              series2.push({ XValue: new Date(2010, 0, 180), YValue: 10 });
              series2.push({ XValue: new Date(2010, 0, 200), YValue: 35 });
              series2.push({ XValue: new Date(2010, 0, 220), YValue: 25 });
              series2.push({ XValue: new Date(2010, 0, 240), YValue: 10 });
              series2.push({ XValue: new Date(2010, 0, 260), YValue: 25 });
              series2.push({ XValue: new Date(2010, 0, 280), YValue: 35 });
              series2.push({ XValue: new Date(2010, 0, 300), YValue: 15 });
              series2.push({ XValue: new Date(2010, 0, 320), YValue: 25 });
              series2.push({ XValue: new Date(2010, 0, 340), YValue: 35 });
              series2.push({ XValue: new Date(2010, 0, 363), YValue: 25 });
              series2.push({ XValue: new Date(2011, 0, 1), YValue: 35 });
              series2.push({ XValue: new Date(2011, 0, 20), YValue: 15 });
              series2.push({ XValue: new Date(2011, 0, 40), YValue: 20 });
              series2.push({ XValue: new Date(2011, 0, 80), YValue: 25 });
              series2.push({ XValue: new Date(2011, 0, 100), YValue: 20 });
              series2.push({ XValue: new Date(2011, 0, 120), YValue: 35 });
              series2.push({ XValue: new Date(2011, 0, 140), YValue: 15 });
              series2.push({ XValue: new Date(2011, 0, 160), YValue: 30 });
              series2.push({ XValue: new Date(2011, 0, 180), YValue: 10 });
              series2.push({ XValue: new Date(2011, 0, 200), YValue: 35 });
              series2.push({ XValue: new Date(2011, 0, 220), YValue: 25 });
              series2.push({ XValue: new Date(2011, 0, 240), YValue: 10 });
              series2.push({ XValue: new Date(2011, 0, 260), YValue: 25 });
              series2.push({ XValue: new Date(2011, 0, 280), YValue: 35 });
              series2.push({ XValue: new Date(2011, 0, 300), YValue: 15 });
              series2.push({ XValue: new Date(2011, 0, 320), YValue: 25 });
              series2.push({ XValue: new Date(2011, 0, 340), YValue: 35 });
              series2.push({ XValue: new Date(2012, 0, 60), YValue: 25 });
              data = { Open: series1, Close: series2 };
              return data;
          }
          function loadingdata(sender) {
              loadingtheme(sender);
              data = GetData();
              sender.model.series[0].dataSource = data.Close;
              sender.model.series[0].xName = "XValue";
              sender.model.series[0].yName = "YValue";
              sender.model.series[1].dataSource = data.Open;
              sender.model.series[1].xName = "XValue";
              sender.model.series[1].yName = "YValue";

          }
          function loadingtheme(sender) {
              sender.model.navigatorStyleSettings.border.dashArray = sender.model._size.width - 30 + " " + sender.model._size.height;
              var theme = window.theme;
              if (theme) {
                  switch (theme) {
                      case "flatdark":
                      case "azuredark":
                      case "limedark":
                      case "saffrondark":
                          theme = "flatdark";
                          break;
                      case "gradient":
                      case "gradientazure":
                      case "gradientlime":
                      case "gradientsaffron":
                          theme = "flatlight";
                          break;
                      case "gradientdark":
                      case "gradientazuredark":
                      case "gradientlimedark":
                      case "gradientsaffrondark":
                          theme = "gradientdark";
                          break;
                      default:
                          theme = "flatlight";
                          break;
                  }
              }
              var leftThumb = sender.model.navigatorStyleSettings.leftThumbTemplate;
              var rightThub = sender.model.navigatorStyleSettings.rightThumbTemplate;
              if (theme == "flatlight") {
                  if (leftThumb == "rectlight" || leftThumb == "rectdark") {
                      sender.model.navigatorStyleSettings.leftThumbTemplate = "rectlight";
                      sender.model.navigatorStyleSettings.rightThumbTemplate = "rectlight";
                  }
                  else {
                      sender.model.navigatorStyleSettings.leftThumbTemplate = "leftlight";
                      sender.model.navigatorStyleSettings.rightThumbTemplate = "rightlight";
                  }
                  sender.model.navigatorStyleSettings.border.color = "black";
                  sender.model.navigatorStyleSettings.thumbColor = "white";
                  sender.model.navigatorStyleSettings.unselectedRegionColor = "white";
                  sender.model.navigatorStyleSettings.thumbStroke = "black";
                  sender.model.labelSettings.higherLevel.style.font.color = "black";
                  sender.model.labelSettings.lowerLevel.style.font.color = "black";
                  sender.model.labelSettings.higherLevel.gridLineStyle.color = "black";
                  sender.model.labelSettings.lowerLevel.gridLineStyle.color = "black";
              }
              else {
                  if (leftThumb == "rectlight" || leftThumb == "rectdark") {
                      sender.model.navigatorStyleSettings.leftThumbTemplate = "rectdark";
                      sender.model.navigatorStyleSettings.rightThumbTemplate = "rectdark";
                  }
                  else {
                      sender.model.navigatorStyleSettings.leftThumbTemplate = "leftdark";
                      sender.model.navigatorStyleSettings.rightThumbTemplate = "rightdark";
                  }
                  sender.model.navigatorStyleSettings.border.color = "white";
                  sender.model.navigatorStyleSettings.thumbColor = "black";
                  sender.model.navigatorStyleSettings.unselectedRegionColor = "black";
                  sender.model.navigatorStyleSettings.thumbStroke = "white";
                  sender.model.labelSettings.higherLevel.style.font.color = "white";
                  sender.model.labelSettings.lowerLevel.style.font.color = "white";
                  sender.model.labelSettings.higherLevel.gridLineStyle.color = "white";
                  sender.model.labelSettings.lowerLevel.gridLineStyle.color = "white";
              }

          }
         
    </script>
</asp:Content>



