<%@ Page Title="Chart-Title-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render and configure title using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Title.aspx.cs" Inherits="WebSampleBrowser.Chart.Trim" %>

<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart  ClientIDMode="Static" ID="Chart1" runat="server" Width="700" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="List of countries which are using solar power in the year 2014" 
                 Title-EnableTrim="true" Title-MaximumTitleWidth="60"/>
            <PrimaryYAxis Title-Text="Measurements of Solar power used in different countries in the year 2014( in GW)"
                 Title-EnableTrim="true" Title-MaximumTitleWidth="110" LabelFormat="{value}GW"/>
            <CommonSeriesOptions Type="Column" EnableAnimation="false" Tooltip-Visible="true"/>
            <Series>
                <ej:Series  XName="Xvalue" YName="YValue1" Tooltip-Visible="true" Name="Countries Using Solar Power"></ej:Series>
            </Series>
            <Title Text="Top 10 Countries using Solar Power"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties" style="float:left;">
                <div class="prop-grid">
                    <div class="row">
					   		<div class="col-md-3">
                           Select Axis
                        </div>								 
                        <div class="col-md-3">
                            <select name="axis" onchange="titlePadding()"  id="axis" >
                               <option value="primaryXAxis">XAxis</option>
                               <option value="primaryYAxis">YAxis</option>
							</select>
                        </div>
					  
                    
					   <div class="col-md-3">
					     Maximum Title Width
                        </div>
                        <div class="col-md-3">
                            <input type="text" onchange="titlePadding()" id="xmaxTitleWidth" name="xmaxTitleWidth"  style="width:104px"  value="60"> <br>
                        </div>
						<br><br><br>
                        <div class="col-md-3">
                             Enable Trim
                        </div>								 
                        <div class="col-md-3">
                            <select name="enabletrim" onchange="titlePadding()" id="enabletrim" >
                               <option value="True">True</option>
                               <option value="False">False</option>                                                  
							</select>
                        </div>
						
						<div class="col-md-3">
						  Alignment
                        </div>                       
                        <div class="col-md-3">
                            <select name="ytruncateaction" onchange="titlePadding()"  id="alignment" >
                                <option value="Center">Center</option>
                                <option value="Near">Near</option>								
								<option value="Far">Far</option>								
							</select>
                        </div>	
						
						<div class="col-md-3">
						  Position
                        </div>                       
                        <div class="col-md-3">
                            <select name="ytruncateaction" onchange="titlePadding()"  id="position" >
                                <option value="Outside">Outside</option>
                                <option value="Inside">Inside</option>								
							</select>
                        </div>	
						
						<div class="col-md-3">
						  Offset
                        </div>                       
                        <div class="col-md-3">
						<input type="text" id="offset" name="offset" onchange="titlePadding()" value ="0"  style="width:104px" > <br>
                            
                        </div>	 
      				</div>
                </div>
            </div>    
     <script type="text/javascript" language="javascript">
         function titlePadding() {
             var chartobj = $("#Chart1").ejChart("instance");
             var xmaxTitleWidth = document.getElementById('xmaxTitleWidth');
             var offset = document.getElementById('offset');
             if ($("#axis")[0].value == "primaryXAxis") {
                 if ($("#enabletrim")[0].value == "True") {
                     chartobj.model.primaryXAxis.title.enableTrim = true;
                 }
                 else {
                     chartobj.model.primaryXAxis.title.enableTrim = false;
                 }
                 chartobj.model.primaryXAxis.title.maximumTitleWidth = parseInt(xmaxTitleWidth.value);
                 chartobj.model.primaryXAxis.title.alignment = ($("#alignment")[0].value);
                 chartobj.model.primaryXAxis.title.position = ($("#position")[0].value);
                 chartobj.model.primaryXAxis.title.offset = parseInt(offset.value);
             }
             else if ($("#axis")[0].value == "primaryYAxis") {
                 if ($("#enabletrim")[0].value == "True") {
                     chartobj.model.primaryYAxis.title.enableTrim = true;
                 }
                 else {
                     chartobj.model.primaryYAxis.title.enableTrim = false;
                 }
                 chartobj.model.primaryYAxis.title.maximumTitleWidth = parseInt(xmaxTitleWidth.value);
                 chartobj.model.primaryYAxis.title.alignment = ($("#alignment")[0].value);
                 chartobj.model.primaryYAxis.title.position = ($("#position")[0].value);
                 chartobj.model.primaryYAxis.title.offset = parseInt(offset.value);
             }

             $("#Chart1").ejChart("redraw");
         }

         $("#sampleProperties").ejPropertiesPanel();


    </script>

</asp:Content>


