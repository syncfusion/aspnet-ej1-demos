<%@ Page Title="Chart-Candle-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render candle series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="Candle.aspx.cs" Inherits="WebSampleBrowser.Chart.Candle" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div id="Tooltip" style="display: none;  width:110px;padding-top: 10px;padding-bottom:10px">
       
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
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" Width="970" Height="600" OnClientLoad="onChartLoad" IsResponsive="true">
            <PrimaryXAxis Title-Text="Date" IntervalType="Years" ValueType="Datetime" />
            <PrimaryYAxis Title-Text="Price in Dollars" LabelFormat="${value}" />
            <Title Text="Foreign Exchange Rate Analysis"></Title>
            <Series>
                <ej:Series EnableAnimation="True" Tooltip-Visible="True" Tooltip-Template="Tooltip" Type="Candle"
                     Name="Candle" XName="Xvalue" High="YValue1" Low="YValue2" Open="YValue3" Close="YValue4"></ej:Series>
            </Series>
            <Legend Visible="False"></Legend>
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

