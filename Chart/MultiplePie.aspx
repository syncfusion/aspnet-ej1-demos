<%@ Page Title="Chart-Multiple Pie-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render multiple pie series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MultiplePie.aspx.cs" Inherits="WebSampleBrowser.Chart.MultiplePie" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
  <div>
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
      <ej:Chart   ClientIDMode="Static" ID="Chart1" runat="server" Height="600" IsResponsive="true" OnClientLoad="onChartLoad"  OnClientSeriesRendering="seriesRender">
         <CommonSeriesOptions Type="Pie">
             <Border Color="white"/>  
            </CommonSeriesOptions>
           <Series>
             
             <ej:Series Name="Continents" 
                 Marker-DataLabel-Visible="True" Marker-DataLabel-Shape="None" Marker-DataLabel-ConnectorLine-Type="Bezier" Marker-DataLabel-EnableContrastColor="true"
                    Marker-DataLabel-ConnectorLine-Color="Black" LabelPosition="Inside"  PieCoefficient="0.6" DoughnutSize="0.6">                   
                    <Points >
                        <ej:Points X="Asia" Y="35.94" Text="Asia 35.94%"  Fill="#E94649" /> 
                       <ej:Points X="America" Y="8.91" Text="America 8.91%" Fill="#0FB954"/> 
                        <ej:Points X="Europe" Y="2.88" text="Europe 2.88%" Fill ="#005277" />  
						 <ej:Points X="Africa" Y="6.06" text="Africa 6.06%" Fill="#F6B53F"  /> 
                    </Points>
             </ej:Series>
             <ej:Series Name="Countries"  Marker-DataLabel-Visible="True" Marker-DataLabel-Shape="None"  Marker-DataLabel-ConnectorLine-Type="Bezier"
                    Marker-DataLabel-ConnectorLine-Color="Black" LabelPosition="Outside" >
                    <Points >
                        <ej:Points  X="China" Y="16.8" Text="China 16.8%"   Fill="#E94649"  /> 
                        <ej:Points  X="India" Y="15.6" Text="India 15.6%"   Fill="#E94649"/>  
                        <ej:Points  X="Indonesia" Y="3.54" Text="Indonesia 3.54%"   Fill="#E94649"/>  
                        <ej:Points  X="US" Y="4.42" Text="US 4.42%" Fill="#0FB954"/>  
                        <ej:Points  X="Brazil" Y="2.82" Text="Brazil 2.82%" Fill="#0FB954"/>
                        <ej:Points  X="Mexico" Y="1.67" Text="Mexico 1.67%" Fill="#0FB954"/>  
                        <ej:Points X="Germany" Y="1.11" Text="Germany 1.11%" Fill ="#005277"/>  
                          <ej:Points  X="France" Y="0.88" Text="France 0.88%" Fill ="#005277"/>
                        <ej:Points  X="UK" Y="0.89" Text="UK 0.89%" Fill ="#005277"/>  
                        <ej:Points X="Nigeria" Y="2.56" Text="Nigeria 2.56%" Fill="#F6B53F" />  
						  <ej:Points X="Ethopia" Y="1.26" Text="Ethopia 1.26%" Fill="#F6B53F" /> 
						    <ej:Points X="Egypt" Y="2.24" Text="Egypt 2.24%" Fill="#F6B53F" /> 
                    </Points>
             </ej:Series>
               </Series>
          <Title Text="List of Countries by Population"></Title>
          <Legend Visible="true"></Legend>
      </ej:Chart>
  </div>
</asp:Content>



<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
   <div id="sampleProperties">
                <div class="prop-grid">
                    <div class="row" style="margin: 10px 0;">
                        <div class="col-md-3">
                            Series Type
                        </div>
                        <div class="col-md-3 aligntop">
                            <select name="selectIndex" autocomplete="off" id="type">
                               <option value="pie">Pie</option>
                                <option value="doughnut">Doughnut</option>
                            </select>
                        </div>
                    </div>
                    
                </div>
                </div>	
    <script type="text/javascript">
        function seriesRender(sender) {
            if (sender.model.theme == "flatdark" || sender.model.theme == "gradientdark" || sender.model.theme == "high-contrast-01")
                sender.data.series.marker.dataLabel.connectorLine.color = "white";

        }
       
        $('#type').change(function () {
          
            $("#Chart1").ejChart("option", { "commonSeriesOptions": { type: $('#type')[0].value } });

        });
   
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>

