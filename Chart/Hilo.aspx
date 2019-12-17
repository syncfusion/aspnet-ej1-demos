<%@ Page Title="Chart-Hilo-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render and configure hilo series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Hilo.aspx.cs" Inherits="WebSampleBrowser.Chart.Hilo" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div id="Tooltip" style="display: none; width:125px;padding-top: 10px;padding-bottom:10px">       
                <div align="center" style="font-weight:bold">
                    #point.x#
                </div>                
           <table>
            <tr>
                <td>
                    High:
                </td>
                <td>
                    #point.high#mm
                </td>
               
            </tr>
             <tr>
                <td>
                    Low:
                </td>
                <td >
                    #point.low#mm
                </td>
               
            </tr>
           </table>    
    </div>
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis RangePadding="Additional" Title-Text="Country" MajorGridLines-Visible="false" LabelRotation="90" />
            <PrimaryYAxis Title-Text="Rainfall(mm)" LabelFormat="{value}mm" MajorGridLines-Visible="true" />
            <CommonSeriesOptions Type="Hilo" Border-Width="2" Explode="true" />
            <Title Text="Highest and Lowest Rainfall across World"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Name="Rainfall" Tooltip-Visible="True" 
                    Tooltip-Template="Tooltip" XName="Xvalue" High="YValue1" Low="YValue2"></ej:Series>
            </Series>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style  >
         .tooltipDivChart1 table, table th, table tr {
                border:0px none;
                margin: 0 auto;
           
            }
             table td {
                border:0px none;
                margin: 0 auto;
                display:inline;
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

