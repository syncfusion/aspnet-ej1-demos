<%@ Page Title="Chart-Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to trigger events in Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Chart.Events" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ User Interaction / Events</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
    <ej:Chart  ClientIDMode="Static" ID="Chart1" Height="600" OnClientTitleRendering="ontitlerender" 
        OnClientPointRegionClick="onpointclick" OnClientPointRegionMouseMove="onpointmousemove" 
        OnClientLegendItemMouseMove="onlegendmousemove" OnClientLegendItemClick="onlegendclicked" OnClientChartClick="onchartclick" OnClientChartDoubleClick="onchartdoubleclick" OnClientAxisLabelClick="onaxislabelclick" OnClientChartMouseMove="onchartmousemove" OnClientChartMouseLeave="onchartmouseleave" OnClientAxisLabelMouseMove="onaxislabelmousemove" IsResponsive="true" OnClientLoad="onChartLoad" runat="server" Width="700">
       <Series>
             <ej:Series Name="Population" XName="Xvalue" YName="YValue1" Fill="#69D2E7" Type="Column" EnableAnimation="True"
                  Tooltip-Format="#point.x# : #point.y# millions <br/>" Tooltip-Visible="true"></ej:Series>
       </Series>
    </ej:Chart>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="EventSection">
    
   <div class="cols-prop-area event-tracer">
                <div>
                    <div class="heading">
                        <span>Event Trace</span>
                        <div class="pull-right">
                            <ej:DropDownList ID="selectControls" TargetId="evntname" CssClass="metroblue" ShowCheckbox="true" 
                                CheckAll="true" ClientSideOnChange="evtpropscheckedevent" runat="server"></ej:DropDownList>
                             <div id="evntname">
                                     <ul>
                                         <li>pointRegionClick</li>
                                         <li>pointRegionMouseMove</li>
                                         <li>legendItemMouseMove</li>
                                         <li>legendItemClick</li>
                                         <li>chartClick</li>
                                         <li>chartDoubleClick</li>
                                         <li>chartMouseMove</li>
                                         <li>chartMouseLeave</li>
                                         <li>axisLabelClick</li>
                                         <li>axisLabelMouseMove</li>
                                     </ul>
                             </div>
                        </div>
                    </div>
					<div class="prop-grid content">
						<div class="eventarea">
							<div class="EventLog" id="EventLog">
							</div>
						</div>
						<div class="evtbtn">
							<input type="button" class="eventclear e-btn" value="Clear" onclick="onClear()" />
						</div>
					</div>
                </div>
     </div>
     <script type="text/javascript">
         $("#sampleProperties").ejPropertiesPanel();
         
         function evtpropscheckedevent(args) {
             chartObj = $("#Chart1").data("ejChart");
             if (args.isChecked) {
                
                 switch (args.selectedText) {
                     case "pointRegionClick": chartObj.option(args.selectedText, "onpointclick"); break;
                     case "pointRegionMouseMove": chartObj.option(args.selectedText, "onpointmousemove"); break;
                     case "legendItemMouseMove": chartObj.option(args.selectedText, "onlegendmousemove"); break;
                     case "legendItemClick": chartObj.option(args.selectedText, "onlegendclicked"); break;
                     case "chartClick": chartObj.option(args.value, "onchartclick"); break;
                     case "chartDoubleClick": chartObj.option(args.value, "onchartdoubleclick"); break;
                     case "chartMouseMove": chartObj.option(args.value, "onchartmousemove"); break;
                     case "chartMouseLeave": chartObj.option(args.value, "onchartmouseleave"); break;
                     case "axisLabelClick": chartObj.option(args.value, "onaxislabelclick"); break;
                     case "axisLabelMouseMove": chartObj.option(args.value, "onaxislabelmousemove"); break;
                 }
             }
             else chartObj.option(args.selectedText, "");
         }
         function onchartmouseleave(sender) {
             var str = stringName(sender);
             jQuery.addEventLog("Leaving on <span class='eventTitle'>" + str + "</span>");
         }
         function onaxislabelclick(sender) {
             jQuery.addEventLog("Clicked on <span class='eventTitle'>" + sender.data.text + "</span>");
         }
         function onaxislabelmousemove(sender) {
             jQuery.addEventLog("Moved on <span class='eventTitle'>" + sender.data.text + "</span>");
         }
         function onchartclick(sender) {
             var str = stringName(sender);
             jQuery.addEventLog("Clicked on <span class='eventTitle'>" + str + "</span>");
         }
         function onchartdoubleclick(sender) {
             var str = stringName(sender);
             jQuery.addEventLog("Double Clicked on <span class='eventTitle'>" + str + "</span>");
         }
         function onchartmousemove(sender) {
             var str = stringName(sender);
             jQuery.addEventLog("Moved on <span class='eventTitle'>" + str + "</span>");
         }
         function onlegendclicked(sender) {
             jQuery.addEventLog("Clicked on <span class='eventTitle'>Legend</span>");
         }
         function onpointclick(sender) {
             jQuery.addEventLog("Clicked on <span class='eventTitle'> " +
             sender.model.primaryXAxis.labels[sender.data.region.Region.PointIndex] + "</span>");

         }
         function onpointmousemove(sender) {
             jQuery.addEventLog("Moved on <span class='eventTitle'> " +
             sender.model.primaryXAxis.labels[sender.data.region.Region.PointIndex] + "</span>");

         }
         function onlegendmousemove(sender) {
             jQuery.addEventLog("Moved on <span class='eventTitle'>Legend</span>");
         }
         function stringName(sender) {
             var id = sender.data.id, str;
             if (id.indexOf("ChartTitle") > 0) str = "ChartTitle";
             else if (id.indexOf("Series") > 0) str = "Series";
             else if (id.indexOf("Legend") > 0) str = "Legend";
             else if (id.indexOf("SvgRect") > 0) str = "Chart";
             else if (id.indexOf("ChartArea") > 0) str = "ChartArea";
             else if (id.indexOf("SecondaryAxis") > 0) str = "YAxisLabel";
             else if (id.indexOf("PrimaryAxis") > 0) str = "XAxisLabel";
             else if (id.indexOf("XAxisTitle") > 0) str = "XAxisTitle";
             else if (id.indexOf("YAxisTitle") > 0) str = "YAxisTitle";
             else str = "Chart";
             return str;
         }
         function onClear() {
             jQuery.clearEventLog();
         }
    </script>
    
</asp:Content>

