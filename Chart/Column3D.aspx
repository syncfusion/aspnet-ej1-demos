<%@ Page Title="Chart-Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render 3D column series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Column3D.aspx.cs" Inherits="WebSampleBrowser.Chart.Column3D" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <script type="text/javascript" src="../Scripts/ChartData.js"></script>
       <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Height="600" OnClientLoad="chartLoad" 
           Depth="100" WallSize="2" Tilt="0" Rotation="14" PerspectiveAngle="20" SideBySideSeriesPlacement="true" 
           EnableRotation="true" Enable3D="true"  IsResponsive="true">
            <Title Text="Chemicals in Soaps"></Title>
            <Legend Visible="true"/>
            <PrimaryXAxis ValueType="Category" LabelFormat="MMM" LabelIntersectAction="MultipleRows">
               <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
            </PrimaryXAxis>
            <PrimaryYAxis>                
                <MajorGridLines Visible="true" Color="#a9a9a9" Opacity="0.12" />
            </PrimaryYAxis>
              <Series>
                <ej:Series Name="Chemicals in Soap X">
                    <points>
                        <ej:points X="Calcium sulfate(Gypsum hydrated)" Y="11"/>
                        <ej:points X="Phosphorus pentachloride" Y="20"/>
                        <ej:points X="Sodium permanganate monohydrate" Y="8"/>
                        <ej:points X="Magnesium permanganate" Y="9"/>
                        <ej:points X="Pottasium permanganate" Y="8.5"/>
                        <ej:points X="Sodium bicarbonate" Y="6.3"/>
                    </points>
                </ej:Series>
                <ej:Series Name="Chemicals in Soap Y">
                    <points>
                        <ej:points X="Calcium sulfate(Gypsum hydrated)" Y="5"/>
                        <ej:points X="Phosphorus pentachloride" Y="26"/>
                        <ej:points X="Sodium permanganate monohydrate" Y="7"/>
                        <ej:points X="Magnesium permanganate" Y="32"/>
                        <ej:points X="Pottasium permanganate" Y="9.6"/>
                        <ej:points X="Sodium bicarbonate" Y="8.1"/>
                    </points>
                </ej:Series>
            </Series>
            <CommonSeriesOptions Type="Column">
                <Tooltip Visible="true" Format="#series.name#<br/>#point.x# : #point.y#mg" />
            </CommonSeriesOptions>
        </ej:Chart>
</asp:Content>
 
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
    <div class="prop-grid">
					<div class="row">
						<div class="col-md-3">
							Column Facet
						</div>
						<div class="col-md-3">
                            <div id="dropdown">
                                <select id="optColumnFacet">
                                    <option value="rectangle">Rectangle</option>
                                    <option value="cylinder">Cylinder</option>
                                </select>
                            </div>
                        </div>
					</div>
				</div>
        </div>
    <script  type="text/javascript" >
        function chartLoad(sender) {
            onChartLoad(sender);
            loadTheme(sender);
            sender.model.primaryXAxis.majorGridLines.color = "#a9a9a9";
            sender.model.primaryXAxis.majorGridLines.opacity = 0.12;
            sender.model.primaryYAxis.majorGridLines.color = "#a9a9a9";
            sender.model.primaryYAxis.majorGridLines.opacity = 0.12;
        }
        function columnFacetChanged(e) {
            $("#Chart1").ejChart('option', { commonSeriesOptions: { columnFacet: e.value } });
        }
        $("#optColumnFacet").ejDropDownList({ "change": "columnFacetChanged", width: "110px", selectedItemIndex: 0 });


        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>

 

