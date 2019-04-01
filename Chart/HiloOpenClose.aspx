<%@ Page Title="Chart-Hilo Open Close-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render hilo open close series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="HiloOpenClose.aspx.cs" Inherits="WebSampleBrowser.Chart.HiloOpenClose" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div id="Tooltip" style="display: none; height:125px; width:125px;padding-top: 10px;padding-bottom:10px">
       
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
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Date" IntervalType="Years" ValueType="Datetime" />
            <PrimaryYAxis Title-Text="Price in Dollars" LabelFormat="${value}" />
            <Legend Visible="false"></Legend>
            <Title Text="Financial Analysis"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Name="Candle" Type="HiloOpenClose" DrawMode="Both" Tooltip-Visible="True" 
                    Tooltip-Template="Tooltip" XName="Xvalue" High="YValue1" Low="YValue2" Open="YValue3" Close="YValue4"></ej:Series>
            </Series>
        </ej:Chart>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
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

