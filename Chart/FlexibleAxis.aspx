<%@ Page Title="Chart-Felxible Axis Layout-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render flexible axis using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="FlexibleAxis.aspx.cs" Inherits="WebSampleBrowser.Chart.FlexibleAxis" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div id="Tooltip" style="display: none; height:100px; width:125px;padding-top: 10px;padding-bottom:10px">
       
           <div align="center" style="font-weight:bold">
                    #point.x#
           </div>  
          <table>
            <tr>
                <td>
                   Open:
                </td>
                <td>
                    $#point.open#
                </td>
               
            </tr>
            <tr>
                <td>
                    High:
                </td>
                <td>
                    $#point.high#
                </td>
               
            </tr>
             <tr>
                <td>
                    Low:
                </td>
                <td >
                    $#point.low#
                </td>
               
            </tr>
             <tr>
                <td>
                    Close:
                </td>
                <td>
                    $#point.close#
                </td>
               
            </tr>
             
        </table>    
   
    </div>

    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" ClientIDMode="Static" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="chartload">
            <RowDefinitions>
                <ej:RowDefinitions RowHeight="25" Unit="percentage" />
                <ej:RowDefinitions RowHeight="75" Unit="percentage" />
            </RowDefinitions>
            <PrimaryXAxis MajorGridLines-Visible="false" LabelFormat="dd/MM/yyyy" Title-Text="Date" 
                ValueType="Datetime" ColumnIndex="0" />
            <PrimaryYAxis RowIndex="0" RowSpan="2" Title-Text="Million USD" />
            <Axes>
                <ej:Axis RowIndex="0" OpposedPosition="true" Orientation="Vertical" Font-FontSize="14px" 
                    Name="y1SecondQuater" Title-Text="Million USD" />
            </Axes>
            <CommonSeriesOptions EnableAnimation="True"></CommonSeriesOptions>
            <Series>
                <ej:Series Name="series1" YAxisName ="y1SecondQuater" Fill="#94D3F1" Opacity="1" Type="Column" 
                    Tooltip-Format="Date : #point.x#<br/>Stock: #point.y#" Tooltip-Visible="true"  ></ej:Series>
                <ej:Series Name="series2" Type="HiloOpenClose" Border-Width="2" Tooltip-Template="Tooltip"  Tooltip-Visible="true"/>
            </Series>
            <Title Text="Conn's,Inc Stock Details"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
         <script>
             function chartload(sender) {
                 onChartLoad(sender);
                 loadTheme(sender);
                 sender.model.series[0].dataSource = window.chartData;
                 sender.model.series[0].xName = "xDate";
                 sender.model.series[0].yName = "High";
                 sender.model.series[1].dataSource = window.chartData;
                 sender.model.series[1].xName = "xDate";
                 sender.model.series[1].high = "High";
                 sender.model.series[1].low = "Low";
                 sender.model.series[1].open = "Open";
                 sender.model.series[1].close = "Close";
             }
         </script>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style class="cssStyles">
           
            .tooltipDivChart1 table, table th, table tr , table td{
                border:0px none;
                margin: 0 auto;
           
            }
  			.tooltipDivChart1 
			{
                border:2px transparent;
                color:white;
            }
			#Tooltip td
			{
			color:white;
			}
     </style>          
</asp:Content>

