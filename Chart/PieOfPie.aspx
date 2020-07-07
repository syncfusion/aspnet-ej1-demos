<%@ Page Title="Chart-Pie of Pie-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render pie of pie series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PieOfPie.aspx.cs" Inherits="WebSampleBrowser.Chart.PieOfPie" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>        
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="600" IsResponsive="true">
            <Title Text="Oil and other liquid imports in USA">
                <SubTitle Text="In the year 2014 - 2015"></SubTitle>
            </Title>
            <Series>
                <ej:Series EnableAnimation="True" PieCoefficient="1" PieOfPieCoefficient="0.8" SplitValue="10" GapWidth="100"
                    Marker-DataLabel-Visible="True"  Marker-DataLabel-EnableContrastColor="true" Name="Oil Import" XName="Xvalue" YName="YValue1" Type="PieOfPie"
                    LabelPosition="Inside" EnableSmartLabels="True" Tooltip-Visible="True" ConnectorLine-Width="2" ConnectorLine-DashArray="2,3">
                    <Points>
                        <ej:points Text="58%" X="Saudi Arabia" Y="58" />
                        <ej:points Text="15%" X="Persian Gulf" Y="15"/>
                        <ej:points Text="13%" X="Canada" Y="13"/>
                        <ej:points Text="8%" X="Venezuela" Y="8"/>
                        <ej:points Text="3%" X="Mexico" Y="3"/>
                        <ej:points Text="2%" X="Russia" Y="2"/>
                        <ej:points Text="1%" X="Russia" Y="1"/>
                    </Points>
                </ej:Series>
            </Series>
            <Legend Visible="True"></Legend>
        </ej:Chart>
    </div>    
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
<div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3">
                            Split Mode
                        </div>
                        <div class="col-md-3">
                            <select name="selectIndex"  id="splitMode">
								<option value="0">Value</option>
                                <option value="1">Position</option>
                                <option value="2">Percentage</option>
                                <option value="3">Indexes</option>
                            </select>
                        </div>
					</div>						 
					<div class="row">						
						<div class="col-md-3">
                           Split Value
                        </div>
                        <div class="col-md-3">
                           <input type="text" id="splitValue" value="10" style="width:90px;height:18px" />
                        </div>
					</div>
					<div class="row">
						<div class="col-md-3">
                           Gap Width
                        </div>
                        <div class="col-md-3">
                            <input type="text" id="gapWidth" style="width:100px" />
                        </div>
                    </div>                    
                </div>
			</div>
    <script type="text/javascript">
        $('#splitValue').change(changeSplitValue);
        $('#splitMode').change(changeSplitMode);
        $("#gapWidth").ejNumericTextbox({
            value: 100, width: "95px", height: "25px", minValue: 0, maxValue: 300, change: "changeGapWidth",
        });
        function changeSplitValue() {
            var chartObj = $("#Chart1").ejChart("instance");
            if (chartObj.model.series[0].splitMode != "indexes")
                chartObj.model.series[0].splitValue = parseFloat($("#splitValue").val());
            else
                chartObj.model.series[0].splitValue = JSON.parse("[" + $("#splitValue").val() + "]");
            chartObj.redraw();
        }
        function changeGapWidth(sender) {
            var chartObj = $("#Chart1").ejChart("instance");
            chartObj.model.series[0].gapWidth = parseInt(sender.value);
            chartObj.redraw();
        }

        function changeSplitMode() {
            var option = $("#splitMode option:selected").text();
            if (option == "Value") {
                $("#splitValue").val(10);
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { splitValue: $("#splitValue").val(), splitMode: option.toLowerCase() } });
            }
            else if (option == "Position") {
                $("#splitValue").val(3);
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { splitValue: $("#splitValue").val(), splitMode: option.toLowerCase() } });
            }
            else if (option == "Percentage") {
                $("#splitValue").val(15);
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { splitValue: $("#splitValue").val(), splitMode: option.toLowerCase() } });
            }
            else if (option == "Indexes") {
                $("#splitValue").val("1,4,5,2");
                $("#Chart1").ejChart("option", { "commonSeriesOptions": { splitValue: "1,4,5,2", splitMode: option.toLowerCase() } });
            }
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
    </asp:Content>

