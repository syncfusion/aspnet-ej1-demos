<%@ Page Title="Chart-Legend Position-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to customize the legend positions using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="LegendPosition1.aspx.cs" Inherits="WebSampleBrowser.Chart.LegendPosition1" %>


<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
   
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart  ClientIDMode="Static" ID="Chart1" runat="server" Width="690" Height="550" IsResponsive="true" OnClientLoad="onChartLoad" SeriesType="Pie">
            <CommonSeriesOptions Type="Pie">
            </CommonSeriesOptions>
            <Title Text="Internet users (per 100 people) in 2013"></Title>
            <Series>
                <ej:Series EnableAnimation="false" Marker-DataLabel-Visible="True" Marker-DataLabel-Shape="None" 
                    Name="Internet users (per 100 people) in 2013" XName="Xvalue" YName="YValue1" Type="Pie" LabelPosition="Inside" 
                    EnableSmartLabels="True" StartAngle="270">
                    <Border Width="1" Color="white" />

            <Marker>
            <DataLabel Visible="True" EnableContrastColor="true">
            <Font FontSize="14px" />
            </DataLabel>
            </Marker>
                    <Points>
                        <ej:points X="United States" Y="84" Fill="#E94649" />
                        <ej:points X="United Kingdom" Y="89" Fill="#6FAAB0" />
                        <ej:points X="United Arab Emirates" Y="88" Fill="#C4C24A" />
                        <ej:points X="New Caledonia" Y="66" Fill="#FB954F" />
                        <ej:points X="French Polynesia" Y="56" Fill="#005277" />
                        <ej:points X="Switzerland" Y="86" Fill="#8BC652" />
                        <ej:points X="Singapore" Y="73" Fill="#69D2E7" />
                        <ej:points X="New Zealand" Y="82" Fill="#E27F2D" />
                        <ej:points X="Saudi Arabia" Y="60" Fill="#6A4B82" />
                        <ej:points X="Sweden" Y="94" Fill="#F6B53F" />
                        <ej:points X="Indonesia" Y="60" Fill="#CC3399" />
                        <ej:points X="Philippines" Y="37" Fill="#FF0066" />
                        <ej:points X="South Africa" Y="48" Fill="#FF9900" />
                        <ej:points X="South Korea" Y="84" Fill="#009933" />
                        <ej:points X="Hong Kong" Y="74" Fill="#6699FF" />
                        <ej:points X="Netherlands" Y="93" Fill="#CC99FF" />
                    </Points>
                </ej:Series>
            </Series>
            <Legend Visible="true" Position="Bottom" Alignment="Center" >
                <Border Color="black" Width="1" />
                <Title Text="Countries" TextAlignment="center">
                    <Font FontSize="15px" Color="black" FontFamily="Segoe UI" />
                </Title>
            </Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    
    <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Position
                        </div>
                        <div class="col-md-3">
                            <select name="selectIndex"  id="optPositionChange">
                               <option value="0">Right</option>
                               <option value="1">Left</option>
                               <option value="2">Top</option>
                               <option value="3">Bottom</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                           Alignment
                        </div>
                        <div class="col-md-3">
                            <select name="disableItem"  id="optAlignmentChange">
                                <option value="0">Near</option>
                                <option value="1">Center</option>
                                <option value="2">Far</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            Height
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ClientIDMode="Static" ID="legendHeight" Width="104"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                            (eg. 10% or 100)
                        </div>
                        <div class="col-md-3">
                            Width
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ClientIDMode="Static" ID="legendWidth" Width="104"></asp:TextBox>
                        </div>
                        <div class="col-md-3">
                        </div>
                        <div class="col-md-3">
                            (eg. 10% or 100)
                        </div>
                      </div>
                    <div class="row">
                        <div class="col-md-3">
                           Row Count
                        </div>
                        <div class="col-md-3">
                            <select name="disableItem"  id="optRowcountChange">
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="5">5</option>
                                 <option value="6">6</option>
                                 <option value="7">7</option>
                                 <option value="8">8</option>
                                 <option value="9">9</option>
                                 <option value="10">10</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                           Column Count
                        </div>
                        <div class="col-md-3">
                            <select name="disableItem"  id="optColumncountChange">
                                 <option value="1">1</option>
                                 <option value="2">2</option>
                                 <option value="3">3</option>
                                 <option value="4">4</option>
                                 <option value="5">5</option>
                                 <option value="6">6</option>
                                 <option value="7">7</option>
                                 <option value="8">8</option>
                                 <option value="9">9</option>
                                 <option value="10">10</option>
                            </select>
                        </div>
                        <div class="col-md-3">
                            TextOverflow
                        </div>
                        <div class="col-md-3">
                            <select name="selectIndex"  id="optTextoverflowChange">
                               <option value="0">None</option>
                               <option value="1">Trim</option>
                               <option value="2">Wrap</option>
                               <option value="3">WrapAndTrim</option>
                            </select>
                        </div>
                       <div class="col-md-3">
                           TextWidth
                        </div>
                        <div class="col-md-3">
                            <asp:TextBox runat="server" ClientIDMode="Static" ID="textWidth" Width="104"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
        <script type="text/javascript">
            $("#legendHeight").val("");
            $("#legendWidth").val("");
            $("#textWidth").val("");
            var chartObj = $("#Chart1").data("ejChart");
            $("#optPositionChange").ejDropDownList({ "change": "positionChanged", width: "110px", selectedItemIndex: 3 });
            $("#optAlignmentChange").ejDropDownList({ "change": "alignmentChanged", width: "110px", selectedItemIndex: 1 });
            $("#optRowcountChange").ejDropDownList({ "change": "rowcountChanged", width: "110px", selectedItemIndex: 0 });
            $("#optColumncountChange").ejDropDownList({ "change": "columncountChanged", width: "110px", selectedItemIndex: 0 });
            $("#optTextoverflowChange").ejDropDownList({ "change": "textoverflowChanged", width: "110px", selectedItemIndex: 0 });
            function alignmentChanged(sender) {
                $("#Chart1").ejChart("option", { "legend": legend(sender, sender.selectedText) });
                changeHeightWidth();
            }
            function positionChanged(sender) {
                $("#Chart1").ejChart("option", { "legend": legend(sender, sender.selectedText) });
                changeHeightWidth();
            }
            function textoverflowChanged(sender) {               
                $("#Chart1").ejChart("option", { "legend": legend(sender, sender.selectedText) });                
                 changeHeightWidth();
            }
            function rowcountChanged(sender) {
                $("#Chart1").ejChart("option", { "legend": legend(sender, sender.selectedText) });
                changeHeightWidth();
            }
            function columncountChanged(sender) {
                $("#Chart1").ejChart("option", { "legend": legend(sender, sender.selectedText) });
                changeHeightWidth();
            }
            function legend(sender, data) {
                switch (sender.model.change) {
                    case "positionChanged":
                        var legendPosition = data.toLowerCase();
                        return {
                            position: legendPosition
                        }; break;
                    case "textoverflowChanged":
                        var textOverflow = data.toLowerCase();
                        return {
                            textOverflow: textOverflow
                        }; break;
                    case "alignmentChanged":
                        var legendAlignment = data.toLowerCase();
                        return {
                            alignment: legendAlignment
                        };
                        break;
                    case "rowcountChanged":
                        var count = data;
                        return { rowCount: count };
                        break;
                    case "columncountChanged":
                        var count = data;
                        return { columnCount: count };
                        break;
                }
            }
            $('#legendWidth').change(changeHeightWidth);
            $('#legendHeight').change(changeHeightWidth);
            $('#textWidth').change(changeTextWidth);
            function changeTextWidth()
            {
                var textwidth = parseInt($("#textWidth").val());
                var chart = $("#Chart1").ejChart("instance");
                chart.model.legend.textWidth = textwidth;
                chart.redraw();
            }
            function changeHeightWidth() {
                var newWidth = "", newHeight = "";
        var width = $("#legendWidth").val();
        var height = $("#legendHeight").val();
        var chart = $("#Chart1").ejChart("instance");
		
		for(var i=0; i<width.length; i++){
		   if (width.charCodeAt(i)== 37 || (width.charCodeAt(i)>=48 && width.charCodeAt(i)<=57))
		      newWidth+= width[i];
		}
		
		for(var i=0; i<height.length; i++){
		   if (height.charCodeAt(i)== 37 || (height.charCodeAt(i)>=48 && height.charCodeAt(i)<=57))
		      newHeight+= height[i];
		}
		
       chart.model.legend.size.width = newWidth;
       chart.model.legend.size.height = newHeight;
        chart.redraw();
            }
            $("#sampleProperties").ejPropertiesPanel();
            </script>
    </asp:Content>

