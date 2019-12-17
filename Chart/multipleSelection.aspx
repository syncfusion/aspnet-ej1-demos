<%@ Page Title="Chart-Range Selection-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to perform multiple selection for series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="multipleSelection.aspx.cs" Inherits="WebSampleBrowser.Chart.multipleSelection" %>

 <asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" clientIdMode="Static" runat="server" IsResponsive="true" Height="550" OnClientLoad="load" RangeSelected="selectedRegion"  >
            <PrimaryXAxis Title-Text="Years" />
            <PrimaryYAxis Title-Text="Sales in Units" />
            <CommonSeriesOptions EnableAnimation="True" Type="Scatter" Tooltip-Visible="true">
                 <SelectionSettings Enable="True" Mode="Range" RangeType="XY"></SelectionSettings>
                <Border Width="2" />
            </CommonSeriesOptions>
           <Series>
             <ej:Series Name="Product A" Fill="#5cd65c"> 
                 <Points>
                     <ej:Points X="1971" Y="50"></ej:Points> <ej:Points X="1972" Y="20"></ej:Points> 
                     <ej:Points X="1973" Y="63"></ej:Points> <ej:Points X="1974" Y="81"></ej:Points>
                     <ej:Points X="1975" Y="64"></ej:Points> <ej:Points X="1976" Y="36"></ej:Points>
                     <ej:Points X="1977" Y="22"></ej:Points> <ej:Points X="1978" Y="78"></ej:Points>
                     <ej:Points X="1979" Y="60"></ej:Points> <ej:Points X="1980" Y="41"></ej:Points> 
                     <ej:Points X="1981" Y="62"></ej:Points> <ej:Points X="1982" Y="56"></ej:Points>
                     <ej:Points X="1983" Y="96"></ej:Points> <ej:Points X="1984" Y="48"></ej:Points>
                     <ej:Points X="1985" Y="23"></ej:Points> <ej:Points X="1986" Y="54"></ej:Points>
                     <ej:Points X="1987" Y="73"></ej:Points> <ej:Points X="1988" Y="56"></ej:Points> 
                     <ej:Points X="1989" Y="67"></ej:Points> <ej:Points X="1990" Y="79"></ej:Points>
                     <ej:Points X="1991" Y="18"></ej:Points> <ej:Points X="1992" Y="78"></ej:Points> 
                     <ej:Points X="1993" Y="92"></ej:Points> <ej:Points X="1994" Y="43"></ej:Points>
                     <ej:Points X="1995" Y="29"></ej:Points> <ej:Points X="1996" Y="14"></ej:Points>
                     <ej:Points X="1997" Y="85"></ej:Points> <ej:Points X="1998" Y="24"></ej:Points>
                     <ej:Points X="1999" Y="61"></ej:Points> <ej:Points X="2000" Y="80"></ej:Points> 
                     <ej:Points X="2001" Y="14"></ej:Points> <ej:Points X="2002" Y="34"></ej:Points>
                     <ej:Points X="2003" Y="81"></ej:Points> <ej:Points X="2004" Y="70"></ej:Points>
                     <ej:Points X="2005" Y="21"></ej:Points> <ej:Points X="2006" Y="70"></ej:Points>
                     <ej:Points X="2007" Y="32"></ej:Points> <ej:Points X="2008" Y="43"></ej:Points> 
                     <ej:Points X="2009" Y="21"></ej:Points> <ej:Points X="2010" Y="63"></ej:Points>
                     <ej:Points X="2011" Y="9"></ej:Points>  <ej:Points X="2012" Y="51"></ej:Points> 
                     <ej:Points X="2013" Y="25"></ej:Points> <ej:Points X="2014" Y="96"></ej:Points>
                    <ej:Points X="2015" Y="32"></ej:Points>
                </Points> <Marker Visible="true" Shape="Star"><Size Height="15" Width="15" /></Marker>
                </ej:Series>
             <ej:Series Name="Product B" >
                 <Points>
                     <ej:Points X="1971" Y="23"></ej:Points> <ej:Points X="1972" Y="67"></ej:Points> 
                     <ej:Points X="1973" Y="83"></ej:Points> <ej:Points X="1974" Y="43"></ej:Points>
                     <ej:Points X="1975" Y="8"></ej:Points> <ej:Points X="1976" Y="41"></ej:Points>
                     <ej:Points X="1977" Y="56"></ej:Points> <ej:Points X="1978" Y="31"></ej:Points>
                     <ej:Points X="1979" Y="29"></ej:Points> <ej:Points X="1980" Y="87"></ej:Points> 
                     <ej:Points X="1981" Y="43"></ej:Points> <ej:Points X="1982" Y="12"></ej:Points>
                     <ej:Points X="1983" Y="38"></ej:Points> <ej:Points X="1984" Y="67"></ej:Points>
                     <ej:Points X="1985" Y="49"></ej:Points> <ej:Points X="1986" Y="67"></ej:Points>
                     <ej:Points X="1987" Y="83"></ej:Points> <ej:Points X="1988" Y="16"></ej:Points> 
                     <ej:Points X="1989" Y="89"></ej:Points> <ej:Points X="1990" Y="18"></ej:Points>
                     <ej:Points X="1991" Y="46"></ej:Points> <ej:Points X="1992" Y="39"></ej:Points> 
                     <ej:Points X="1993" Y="68"></ej:Points> <ej:Points X="1994" Y="87"></ej:Points>
                     <ej:Points X="1995" Y="45"></ej:Points> <ej:Points X="1996" Y="42"></ej:Points>
                     <ej:Points X="1997" Y="28"></ej:Points> <ej:Points X="1998" Y="82"></ej:Points>
                     <ej:Points X="1999" Y="13"></ej:Points> <ej:Points X="2000" Y="83"></ej:Points> 
                     <ej:Points X="2001" Y="26"></ej:Points> <ej:Points X="2002" Y="57"></ej:Points>
                     <ej:Points X="2003" Y="48"></ej:Points> <ej:Points X="2004" Y="84"></ej:Points>
                     <ej:Points X="2005" Y="64"></ej:Points> <ej:Points X="2006" Y="24"></ej:Points>
                     <ej:Points X="2007" Y="82"></ej:Points> <ej:Points X="2008" Y="37"></ej:Points> 
                     <ej:Points X="2009" Y="68"></ej:Points> <ej:Points X="2010" Y="37"></ej:Points>
                     <ej:Points X="2011" Y="35"></ej:Points> <ej:Points X="2012" Y="81"></ej:Points> 
                     <ej:Points X="2013" Y="38"></ej:Points> <ej:Points X="2014" Y="51"></ej:Points>
                    <ej:Points X="2015" Y="58"></ej:Points>
                </Points><Marker Visible="true" Shape="Triangle"><Size Height="15" Width="15" /></Marker>
             </ej:Series>
           </Series>
             <Title Text="Profit Comparison of A and B"></Title>
        </ej:Chart>
      </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="PropertySection">
      <div id="sampleProperties">
                 <div class="prop-grid">
                     <div class="row">
					 <table><tr>
					 <td>Selection Type</td>
					 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                     <td><select name="selection type" id="selection" onchange="selectiontypechanged(this)">
                                 <option value="xy">xy</option>
                                 <option value="x">x</option>
                                 <option value="y">y</option>
                             </select>
                      </td></tr></table><br/>
					  <table><br/><tr>
					  <td>Chart Data in Grid</td></tr></table><br/>
                      <table><tr>
					  <td>Product A</td></tr>
                      <tr><td><div id="ProductA" style="width:120px"></div></td></tr></table><br/>
                      <table><tr><td>Product B</td></tr>
					  <tr><td><div id="ProductB" style="width:120px"></div></td></tr></table>
                     </div>
                 </div>
             </div>
     <script>
         function load(sender) {
             onChartLoad(sender);
             loadTheme(sender);
             var gData = [], newData = [];
             gData.push({ Year: 'No Data', Sales: 'No Data' });
             newData.push({ Year: 'No Data', Sales: 'No Data' });
             $("#ProductA").ejGrid({ "dataSource": gData });
             $("#ProductA").ejGrid({ "allowScrolling": true, "scrollSettings": { width: "auto" } });
             $("#ProductB").ejGrid({ "dataSource": newData });
             $("#ProductB").ejGrid({ "allowScrolling": true, "scrollSettings": { width: "auto" } });
         }
         function selectiontypechanged(sender) {
             var val = $("#selection")[0].value;
             var chart = $("#Chart1").ejChart('instance');
             for (var i = 0; i < chart.model.series.length; i++) {
                 chart.model.series[i].selectionSettings.rangeType = val;
                 chart.redraw();
             }
         }
         function selectedRegion(sender) {
             var gData = [], newData = [], collectiondata = [];
             for (var i = 0; i < sender.data.selectedDataCollection.length; i++) {
                 for (var j = 0; j < sender.data.selectedDataCollection[i].length; j++) {
                     collectiondata[j] = sender.data.selectedDataCollection[i][j];
                     if (collectiondata[j].seriesIndex === 0) {
                         gData.push({ Year: collectiondata[j].x.toString(), Sales: collectiondata[j].y.toString() });
                     }
                     else if (collectiondata[j].seriesIndex === 1) {
                         newData.push({ Year: collectiondata[j].x.toString(), Sales: collectiondata[j].y.toString() });
                     }
                 }
             }
             if (gData) {
                 $("#ProductA").ejGrid({ "dataSource": gData });
                 $("#ProductA").ejGrid({ "allowScrolling": true, "scrollSettings": { width: 120 } });
             }
             if (newData) {
                 $("#ProductB").ejGrid({ "dataSource": newData });
                 $("#ProductB").ejGrid({ "allowScrolling": true, "scrollSettings": { width: 120 } });
             }
         }
         $("#sampleProperties").ejPropertiesPanel();
</script>
</asp:Content>

         


