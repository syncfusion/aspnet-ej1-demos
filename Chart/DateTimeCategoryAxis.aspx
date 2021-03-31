<%@ Page Title="Chart-DateTime Category Axis-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render and configure date time category axis using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DateTimeCategoryAxis.aspx.cs" Inherits="WebSampleBrowser.Chart.DateTimeCategoryAxis" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
     <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis ValueType="DateTimeCategory" LabelFormat="ddd, dd" IntervalType="days" Title-Text="Business Days" /> 
            <PrimaryYAxis LabelFormat="{value}%" Title-text="Sales Count in %" />
             <Series>
               <ej:Series EnableAnimation="True" Type="Column" Name="Sales" XName="Xvalue" YName="YValue1"  Fill="#ff9900"
                   Tooltip-Visible="true" Tooltip-Format="Date : #point.x#  <br/> Sales : #point.y#">
               </ej:Series>
              </Series>
            <Title Text="Sales Comparison of a Product"></Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

