<%@ Page Title="Chart-Error Bar-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure error bar series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ErrorBar.aspx.cs" Inherits="WebSampleBrowser.Chart.ErrorBar" %>
<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" EnableCanvasRendering="false">
            <PrimaryXAxis  Title-Text="Months" LabelIntersectAction="MultipleRows" />
            <PrimaryYAxis Title-Text="Temperature" LabelFormat="{value}C" />
            <CommonSeriesOptions Type="Line" EnableAnimation="false" Tooltip-Visible="true" />
            <Series>
                <ej:Series  XName="Xvalue" YName="YValue1" Tooltip-Visible="true"  >
                    <ErrorBar Visibility="visible"></ErrorBar>
                    <Marker Visible="true"></Marker>
                </ej:Series>
            </Series>
            <Title Text="Temperature Over Months"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">

   <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Error Bar Visible
                </div>
                <div class="col-md-3 aligntop">
                   <input type="checkbox" checked="checked"  id="visible"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                     Cap Visible
                </div>
                <div class="col-md-3 aligntop">
                    <input type="checkbox" checked="checked" id="cap" />
                </div>
            </div>
            <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                   Error Bar Type
					 </div>
                <div class="col-md-3 aligntop">
                       <select name="selectIndex" autocomplete="off" id="ErrorBarType" style="width:115px;">
                        <option value="0">Fixed Value</option>
                        <option value="1">Percentage</option>
                        <option value="2">Standard Deviation</option>
                        <option value="3">Standard Error</option>
                        <option value="4">Custom</option>
                    </select>
                </div>
            </div>
			<div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                    Drawing Mode
                </div>  
                <div class="col-md-3 aligntop">
                    <select name="selectIndex" autocomplete="off" id="mode" style="width:100px;">
                        <option value="0">Vertical</option>
                        <option value="1">Horizontal</option>
                        <option value="2">Both</option>

                    </select>
                </div>
            </div>
            <div class="row" style="margin: 10px 0;">
                <div class="col-md-3">
                    Direction Mode
                </div>
                <div class="col-md-3 aligntop">
                    <select name="selectIndex" autocomplete="off" id="direction" style="width:100px;">
                        <option value="0">Both</option>
                        <option value="1">Minus</option>
                        <option value="2">Plus</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Vertical Value
					 </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="numeric" Value="3" MinValue="1" MaxValue="5" Width="75%" Name="numeric" runat="server" ClientSideOnChange="vertical"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Horizontal Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox1"  Value="1" MinValue="1" MaxValue="5" Width="75%" Name="numeric" runat="server" ClientSideOnChange="horizontal" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Vertical Positive Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox2" Enabled="false" Value="5" Width="75%" MinValue="1" MaxValue="5" Name="numeric" runat="server" ClientSideOnChange="verticalPositive" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Vertical Negative Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox3" Enabled="false" Value="5" Width="75%" MinValue="1" MaxValue="5" Name="numeric" runat="server" ClientSideOnChange="verticalNegative"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Horizontal Positive Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox4" Enabled="false" Value="1" Width="75%" MinValue="1" MaxValue="5" Name="numeric" runat="server" ClientSideOnChange="horizontalPositive" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Horizontal Negative Value
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox5" Enabled="false" Value="1" Width="75%" MinValue="1" MaxValue="5" Name="numeric" runat="server" ClientSideOnChange="horizontalNegative"/>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3">
                    Error Bar Fill
                </div>
                <div class="col-md-3 aligntop">
                    <ej:ColorPicker ID="color1" Value="#000000" runat="server" ClientSideOnChange="errorBarColor"></ej:ColorPicker>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3">
                    Cap Fill
                </div>
                <div class="col-md-3 aligntop">
                    <ej:ColorPicker ID="ColorPicker1" Value="#000000" runat="server" ClientSideOnChange="errorBarCap"></ej:ColorPicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Cap Length
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox6" Value="20" Width="75%" MinValue="10" MaxValue="50" Name="numeric" runat="server" ClientSideOnChange="capLength"/>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Cap width
                </div>
                <div class="col-md-3 aligntop">
                    <ej:NumericTextBox ID="NumericTextBox7" Value="1" Width="75%" MinValue="1" MaxValue="5" Name="numeric" runat="server" ClientSideOnChange="capWidth"/>
                </div>
            </div>
           
        </div>
    </div>
 
	              
    <script type="text/javascript">


        $("#visible").click(function () {
            if ($(this).is(':checked')) {
                $("#cap").removeAttr("disabled");
                $("#ErrorBarType").removeAttr("disabled");
                $("#mode").removeAttr("disabled");
                $("#direction").removeAttr("disabled");
                $("#LayoutSection_PropertySection_numeric").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox1").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox2").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox3").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox4").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox5").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox6").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox7").ejNumericTextbox({ enabled: true });
                $('#LayoutSection_PropertySection_color1').ejColorPicker({ enabled: true });
                if ($("#cap").is(':checked')) {
                    $("#LayoutSection_PropertySection_ColorPicker1").ejColorPicker({ enabled: true });
                    $("#LayoutSection_PropertySection_NumericTextBox6").ejNumericTextbox({ enabled: true });
                    $("#LayoutSection_PropertySection_NumericTextBox7").ejNumericTextbox({ enabled: true });
                }
                else {
                    $("#LayoutSection_PropertySection_ColorPicker1").ejColorPicker({ enabled: false });
                    $("#LayoutSection_PropertySection_NumericTextBox6").ejNumericTextbox({ enabled: false });
                    $("#LayoutSection_PropertySection_NumericTextBox7").ejNumericTextbox({ enabled: false });
                }

            }
            else {
                $("#cap").attr("disabled", "disabled");
                $("#ErrorBarType").attr("disabled", "disabled");
                $("#mode").attr("disabled", "disabled");
                $("#direction").attr("disabled", "disabled");
                $("#LayoutSection_PropertySection_numeric").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox1").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox2").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox3").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox4").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox5").ejNumericTextbox({ enabled: false });
                $('#LayoutSection_PropertySection_color1').ejColorPicker({ enabled: false });
                $("#LayoutSection_PropertySection_ColorPicker1").ejColorPicker({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox6").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox7").ejNumericTextbox({ enabled: false });
            }
        });

        $("#cap").click(function () {
            if ($(this).is(':checked')) {
                $("#LayoutSection_PropertySection_ColorPicker1").ejColorPicker({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox6").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox7").ejNumericTextbox({ enabled: true });
            }
            else {
                $("#LayoutSection_PropertySection_ColorPicker1").ejColorPicker({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox6").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox7").ejNumericTextbox({ enabled: false });
            }
        });

        $('#ErrorBarType').change(function () {
            var dropdownValue = $("#ErrorBarType option:selected").text();
            if (dropdownValue == "Custom") {
                $("#LayoutSection_PropertySection_numeric").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox1").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox2").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox3").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox4").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox5").ejNumericTextbox({ enabled: true });
            }
            else {
                $("#LayoutSection_PropertySection_numeric").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox1").ejNumericTextbox({ enabled: true });
                $("#LayoutSection_PropertySection_NumericTextBox2").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox3").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox4").ejNumericTextbox({ enabled: false });
                $("#LayoutSection_PropertySection_NumericTextBox5").ejNumericTextbox({ enabled: false });
            }
        });

        $('#visible').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            if ($('#visible').is(":checked"))
                chart.model.series[0].errorBar.visibility = "visible";
            else
                chart.model.series[0].errorBar.visibility = "hidden";
            chart.redraw();
        });
     
        $('#cap').change(function () {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.cap.visible = $('#cap').is(":checked");
            chart.redraw();

        });

        $('#ErrorBarType').change(function () {
            var ErrorType = $("#ErrorBarType option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (ErrorType) {
                case 'Fixed Value':
                    chart.model.series[0].errorBar.type = 'fixedValue';
                    chart.redraw();
                    break;
                case 'Percentage':
                    chart.model.series[0].errorBar.type = 'percentage';
                    chart.redraw();
                    break;
                case 'Standard Deviation':
                    chart.model.series[0].errorBar.type = 'standardDeviation';
                    chart.redraw();
                    break;
                case 'Standard Error':
                    chart.model.series[0].errorBar.type = 'standardError';
                    chart.redraw();
                    break;
                case 'Custom':
                    chart.model.series[0].errorBar.type = 'custom';
                    chart.redraw();
                    break;
                default:
            }
        });


        function vertical(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.verticalErrorValue = sender.value;
            chart.redraw();
        }

        function horizontal(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.horizontalErrorValue = sender.value;
            chart.redraw();
        }
        function verticalPositive(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.verticalPositiveErrorValue = sender.value;
            chart.redraw();
        }

        function verticalNegative(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.verticalNegativeErrorValue = sender.value;
            chart.redraw();
        }
        function horizontalPositive(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.horizontalPositiveErrorValue = sender.value;
            chart.redraw();
        }

        function horizontalNegative(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.horizontalNegativeErrorValue = sender.value;
            chart.redraw();
        }

        function capLength(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.cap.length = sender.value;
            chart.redraw();
        }


        function capWidth(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.cap.width = sender.value;
            chart.redraw();
        }


        function errorBarColor(sender) {
   
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.fill = sender.value;
            chart.redraw();
        }


        function errorBarCap(sender) {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.series[0].errorBar.cap.fill = sender.value;
            chart.redraw();
        }

        $('#mode').change(function () {
            var mode1 = $("#mode option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (mode1) {
                case 'Vertical':
                    chart.model.series[0].errorBar.mode = 'vertical';
                    chart.redraw();
                    break;
                case 'Horizontal':
                    chart.model.series[0].errorBar.mode = 'horizontal';
                    chart.redraw();
                    break;
                case 'Both':
                    chart.model.series[0].errorBar.mode = 'both';
                    chart.redraw();
                    break;
                default:
            }
        });

        $('#direction').change(function () {
            var direction1 = $("#direction option:selected").text();
            var chart = $("#Chart1").ejChart("instance");
            switch (direction1) {
                case 'Both':
                    chart.model.series[0].errorBar.direction = 'both';
                    chart.redraw();
                    break;
                case 'Minus':
                    chart.model.series[0].errorBar.direction = 'minus';
                    chart.redraw();
                    break;
                case 'Plus':
                    chart.model.series[0].errorBar.direction = 'plus';
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:content>



