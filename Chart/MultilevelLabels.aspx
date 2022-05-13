<%@ Page Title="Chart-Multi-level Labels-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render multi level axis labels using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultilevelLabels.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.API" %>


<asp:Content ID="ControlContent" runat="server" contentplaceholderid="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart  ClientIDMode="Static" ID="Chart1" runat="server" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis>
                <LabelBorder Width="1" />
                <MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="Quater 1" Start="-0.5" End="2.5">                       
                    </ej:MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="Quater 2" Start="2.5" End="5.5"></ej:MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="Quater 3" Start="5.5" End="8.5"></ej:MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="Quater 4" Start="8.5" End="11.5"></ej:MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="Half Yearly 1" Start="-0.5" End="5.5" Level="1"></ej:MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="Half Yearly 2" Start="5.5" End="11.5" Level="1"></ej:MultiLevelLabels>
                    <ej:MultiLevelLabels Visible="true" Text="2015" Start="-0.5" End="11.5" Level="2"></ej:MultiLevelLabels>
                </MultiLevelLabels>
                <Title Text="Months"></Title>
                <MajorTickLines Visible="true" />
            </PrimaryXAxis>
        <PrimaryYAxis>
            <Range Min="0" Max="40" Interval="5" />
            <Title Text="Temperature in Celsius"></Title>
            <MultiLevelLabels>
                <ej:MultiLevelLabels Visible="true" Text="Low" Start="0" End="10"></ej:MultiLevelLabels>
                <ej:MultiLevelLabels Visible="true" Text="Medium" Start="10" End="25"></ej:MultiLevelLabels>
                <ej:MultiLevelLabels Visible="true" Text="High" Start="25" End="40"></ej:MultiLevelLabels>
            </MultiLevelLabels>
        </PrimaryYAxis>
        <CommonSeriesOptions Type="Spline" EnableAnimation="true">
            <Tooltip Visible="true"></Tooltip>
            <Border Width="2" />
            <Marker Visible="true">
                <Size Width="8" Height="8" />
            </Marker>
        </CommonSeriesOptions>
        <Series>
            <ej:Series Name="London" Fill="#e8be33">
                <Points>
                    <ej:Points X="Jan" Y="1"></ej:Points>
                    <ej:Points X="Feb" Y="5"></ej:Points>
                    <ej:Points X="Mar" Y="2"></ej:Points>
                    <ej:Points X="Apr" Y="8"></ej:Points>
                    <ej:Points X="May" Y="30"></ej:Points>
                    <ej:Points X="Jun" Y="18"></ej:Points>
                    <ej:Points X="Jul" Y="32"></ej:Points>
                    <ej:Points X="Aug" Y="20"></ej:Points>
                    <ej:Points X="Sep" Y="16"></ej:Points>
                    <ej:Points X="Oct" Y="10"></ej:Points>
                    <ej:Points X="Nov" Y="4"></ej:Points>
                    <ej:Points X="Dec" Y="5"></ej:Points>
                </Points>                
            </ej:Series>
        </Series>
        <Title Text="Temperature of London in 2015"></Title>
        <Legend Visible="false"></Legend>
        </ej:Chart>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties" style="float:left;">
                <div class="prop-grid">
                    <div class="row">
			            <div class="col-md-3">
						Text Alignment
						</div>
						<div class="col-md-3">
						<select id="textalign" style="width:100px">
							<option value="center">Center</option>
							<option value="near">Near</option>
							<option value="far">Far</option>							
							</select>
							</div>
                        <div class="col-md-3">
						Border Style </div>
						<div class="col-md-3">
						<select id="borderstyle" style="width:100px">
							<option value="rectangle">Rectangle</option>
							<option value="none">Without border</option>
							<option value="withouttopandbottomborder">Without top/bottom border</option>
							<option value="brace">Brace</option>	
							<option value="curlybrace">Curly brace</option>								
							</select>
						</div>
                        <div class="col-md-3">
						Border Color</div>
						<div class="col-md-3">
						<input type="text" id="colorPick" /> </div> 
      				</div>
                </div>
            </div>    
     <script type="text/javascript" language="javascript">
         $("#colorPick").ejColorPicker({
             value: '#278787',
             select: "onChange"
         });
         $("#borderstyle, #textalign").change(function () {
             var chart = $("#Chart1").ejChart("instance"),
             borderstyle = $("#borderstyle")[0].value,
             textAlign = $("#textalign")[0].value;
             for (var i = 0; i < 7; i++) {
                 chart.model._axes[0].multiLevelLabels[i].border.type = borderstyle;
                 chart.model._axes[0].multiLevelLabels[i].textAlignment = textAlign;
                 
             }
             for (var i = 0; i < 3; i++) {
                 chart.model._axes[1].multiLevelLabels[i].border.type = borderstyle;
                 chart.model._axes[1].multiLevelLabels[i].textAlignment = textAlign;
                 
             }
             chart.redraw();
         });
         function onChange(args) {
             var color = args.value;
             var chart = $("#Chart1").ejChart("instance");
             for (var i = 0; i < 7; i++)
                 chart.model._axes[0].multiLevelLabels[i].border.color = color;
             for (var i = 0; i < 3; i++)
                 chart.model._axes[1].multiLevelLabels[i].border.color = color;
             chart.redraw();
         }
         $("#sampleProperties").ejPropertiesPanel();


    </script>

</asp:Content>









