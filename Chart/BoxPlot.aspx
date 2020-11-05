<%@ Page Title="Chart-Box and Whisker-ASP.NET-SYNCFUSION"   Language="C#"  MetaDescription="This sample demonstrates how to render box and whisker series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master"  AutoEventWireup="true" CodeBehind="BoxPlot.aspx.cs" Inherits="WebSampleBrowser.Chart.BoxPlot" %>


   <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="690" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Department" LabelIntersectAction="Trim" />
            <PrimaryYAxis Title-Text="Age" />
            <Series>
                  <ej:Series Type="BoxAndWhisker" BoxPlotMode="Exclusive"  XName="Xvalue" YName="YValue1" Fill="#69D2E7" Tooltip-Visible="True"></ej:Series>
                  
            </Series>
            <Title Text="Employees age group in various departments"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
    
    
     <div id="sampleProperties">
				<div class="prop-grid">
                    <div class="row" >
                        <div class="col-md-3">
                            BoxPlot Mode
                        </div>
                        <div class="col-md-3" style="margin: 0 -25px 0 -25px ">
                            <div id="dropdown">
                                <select id="boxmode" >
                                    <option value="Exclusive">Exclusive</option>
                                    <option value="Inclusive">Inclusive</option>
									<option value="Normal">Normal</option>
                                </select>
                            </div>
                        </div>
                    </div>
		    <div class="row"> 
			<div class="col-md-3">
                            Show Median
                        </div>                       
                        <div class="col-md-3" style="margin: 0 -25px 0 -25px ">
                            <input type="checkbox" id="Median" name="median" checked>  <br/>       
                        </div>                        
		   </div>	
				</div>
			</div>	         
        <script type="text/javascript" >

           
        
            $('#Median').click(function () {
                var chart = $("#Chart1").ejChart("instance");
                if ($("#Median").is(":checked"))
                    chart.model.series[0].showMedian = true;
                else
                    chart.model.series[0].showMedian = false;
                chart.redraw();
            });
            $("#boxmode").ejDropDownList({ "change": "changeBoxmode",width: "100px", selectedItemIndex: 0 });
         

            function changeBoxmode(e) {
                $('#Chart1').ejChart('option', { commonSeriesOptions: { boxPlotMode: e.value } });
            }
            $("#sampleProperties").ejPropertiesPanel();

            </script>
    </asp:Content>

