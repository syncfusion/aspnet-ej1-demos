<%@ Page Title="Chart-Drill Down-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure drilldown series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Drilldown.aspx.cs" Inherits="WebSampleBrowser.Chart.Drilldown" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Chart/ User Interaction / Drilldown</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
	<div id="link"> 
			<a id="category" href="Drilldown.aspx" style="visibility:hidden; display:inline-block">
				Sales by Category 
			</a>
			<p style="visibility:hidden; display:inline-block" id="symbol">&nbsp;&gt;&gt;&nbsp;</p>
			<p id="text" style="display:inline-block;"></p>  
	</div> 
    <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <ej:Chart ClientIDMode="Static" ID="Chart1" OnClientLoad="onChartLoad" IsResponsive="true" OnClientPointRegionClick="onclick" OnClientSeriesRendering="completeAnimation"
         Height="600" runat="server" Width="900">
        <Title Text="Automobile Sales by Category"></Title>
        <Legend Visible="true" Position="Right" Font-FontSize="20px" ItemStyle-Height="12" ItemStyle-Width="12" />
        <CommonSeriesOptions Type="Pie" EnableAnimation="True"></CommonSeriesOptions>
        <Series>
            <ej:Series Name="Market" Explode="True" XName="Xvalue" YName="YValue1" Type="Pie">
            <Marker Visible="True">
                <DataLabel Font-FontSize="24px" EnableContrastColor="true" Visible="True"></DataLabel>
            </Marker>
                <Points>
                    <ej:Points X="SUV" Y="25" Text="25%"/>
                    <ej:Points X="Car" Y="37" Text="37%"/>
                    <ej:Points X="Pickup" Y="15" Text="15%"/>
                    <ej:Points X="Minivan" Y="23" Text="23%"/>
                </Points>
            </ej:Series>
        </Series>
    </ej:Chart>   
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script>
        function category() {
            $("#Chart1").ejChart("option", { "drilldown": pieSeries() });
            document.getElementById("link").style.visibility = "hidden";
        }
        function onclick(sender) {
            var pointIndex = sender.data.region.Region.PointIndex;
            document.getElementById("text").innerHTML = sender.model._visibleSeries[0]._visiblePoints[pointIndex].x;
            if (sender.model.series[0].name == "Market")
                $("#Chart1").ejChart("option", { "drilldown": pieSeries(pointIndex) });
            document.getElementById("symbol").style.visibility = "visible";

        }
        function completeAnimation(sender) {
            if (sender.model.series[0].name != "Market")
                document.getElementById("category").style.visibility = "visible";
            else
                document.getElementById("category").style.visibility = "hidden";
        }
        $(document).ready(function(){
        if (document.getElementById('category').addEventListener)
            document.getElementById('category').addEventListener('click', category, false);
        else
            document.getElementById('category').attachEvent('onclick', category, false);
        })
        function pieSeries(index) {
            if (index == 0) {
                return {
                    title :{text: 'Automobile Sales in the SUV segment'},
                    series: [{
                        points: [{ x: "Toyota", y: 8, text: 'Toyota 8%' }, { x: "Ford", y: 12, text: 'Ford 12%' },
                                 { x: "GM", y: 17, text: 'GM 17%' }, { x: "Renault", y: 6, text: 'Renault 6%' },
                                 { x: "Fiat", y: 3, text: 'Fiat 3%' }, { x: "Hyundai", y: 16, text: 'Hyundai 16%' },
                                 { x: "Honda", y: 8, text: 'Honda 8%' }, { x: "Maruthi", y: 10, text: 'Maruthi 10%' },
                                 { x: "BMW", y: 20, text: 'BMW 20%' }
                        ],

                        name: 'SUV-Sale', labelPosition: 'outside', enableAnimation : true,
                        marker: { 
                            dataLabel:{ visible:true, connectorLine :{height :40}, font: {  size: '12px'  },enableContrastColor:true }						
                        }
                    }],

                    legend: { visible: false }
                };
            }
            else if (index == 1) {
                return {
                    title :{text: 'Automobile Sales in the Car segment'},
                    series: [{
                        points: [{ x: "Toyota", y: 7, text: 'Toyota 7%' }, { x: "Chrysler", y: 12, text: 'Chrysler 12%' },
                                 { x: "Nissan", y: 9, text: 'Nissan 9%' }, { x: "Ford", y: 15, text: 'Ford 15%' },
                                 { x: "Tata", y: 10, text: 'Tata 10%' }, { x: "Mahindra", y: 7, text: 'Mahindra 7%' },
                                 { x: "Renault", y: 8, text: 'Renault 8%' }, { x: "Skoda", y: 5, text: 'Skoda 5%' },
                                 { x: "Volkswagen", y: 15, text:'Volkswagen 15%' }, { x: "Fiat", y: 3, text:'Fiat 3%' }
                        ],

                        name: 'Car-Sale', labelPosition: 'outside', enableAnimation: true,
                        marker: { 
                            dataLabel:{ visible:true, connectorLine :{height :40}, font: {  size: '12px' },enableContrastColor:true }						
                        }
                    }],
                    legend: { visible: false }

                };

            }
            else if (index == 2) {
                return {
                    title :{text: 'Automobile Sales in the Pickup segment'},
                    series: [{
                        points: [{ x: "Nissan", y: 9, text: 'Nissan 9%' }, { x: "Chrysler", y: 4, text: 'Chrysler 4%' },
                                 { x: "Ford", y: 7, text: 'Ford 7%' }, { x: "Toyota", y: 20, text: 'Toyota 20%' },
                                 { x: "Suzuki", y: 13, text: 'Suzuki 13%' }, { x: "Lada", y: 12, text: 'Lada 12%' },
                                 { x: "Bentley", y: 6, text: 'Bentley 6%' }, { x: "Volvo", y: 10, text: 'Volvo 10%' },
                                 { x: "Audi", y: 19, text:'Audi 19%' }
                        ],

                        name: 'Pickup-Sale', labelPosition: 'outside', enableAnimation: true,
                        marker: { 
                            dataLabel:{ visible:true, connectorLine :{height :40}, font: {  size: '12px'},enableContrastColor:true }						
                        }

                    }],

                    legend: { visible: false }

                };
            }
            else if (index == 3) {
                return {
                    title :{text: 'Automobile Sales in the Minivan segment'},
                    series: [{
                        points: [{ x: "Hummer", y: 11, text: 'Hummer 11%' }, { x: "Ford", y: 5, text: 'Ford 5%' },
                                 { x: "GM", y: 12, text: 'GM 13%' }, { x: "Chrysler", y: 3, text: 'Chrysler 3%' },
                                 { x: "Jaguar", y: 9, text: 'Jaguar 10%' }, { x: "Fiat", y: 8, text: 'Fiat 8%' },
                                 { x: "Honda", y: 15, text: 'Honda 16%' }, { x: "Hyundai", y: 4, text: 'Hyundai 4%' },
                                 { x: "Scion", y:11, text:'Scion 12%' }, { x: "Toyota", y: 17, text:'Toyota 18%' }

                        ],

                        name: 'Minivan-Sale', labelPosition: 'outside', enableAnimation: true,
                        marker: { 
                            dataLabel:{ visible:true, connectorLine :{height :40},font: {  size: '12px' },enableContrastColor:true }						
                        }

                    }],


                    legend: { visible: false }

                };
            } else {
                return {
                    title :{text: 'Automobile Sales by Category'},
                    series: [{
                        points: [{ x: "SUV", y: 25, text: '25%' }, { x: "Car", y: 37, text: '37%' },
                                 { x: "Pickup", y: 15, text: '15%' }, { x: "Minivan", y: 23, text: '23%' }],
                        name: 'Market', explode: true, enableAnimation: true,
                        marker: { 
                            dataLabel:{ visible :true, font: { size: '24px' },enableContrastColor:true }						
                        }
                    }
                    ],

                    legend: { visible: true },
                    AnimationComplete: false

                };
            }
        }
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style  >
          .e-waitpopup-pane{
            background-color: transparent;
            margin-top: 300px;
         }
        .cols-sample-area {
            margin-top: 16px;
        }
         
    </style>
</asp:Content>

