<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master"  CodeBehind="InversedAxis.aspx.cs" Inherits="WebSampleBrowser.Chart.InversedAxis" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width=970 Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis ValueType="Datetime" LabelFormat="MMM-yyyy" IntervalType="Years" Title-Text="Years" 
                MajorGridLines-Visible="false" />
            <PrimaryYAxis RangePadding="Additional" Title-Text="Exchange rate (INR per USD)" IsInversed="true" />
             <Series>
                <ej:Series EnableAnimation="True" Type="Line" Name="Sales" Border-Width="2" Marker-Visible="true"
                    XName="Xvalue" YName="YValue1" 
                    Tooltip-Visible="true"></ej:Series>
              </Series>
            <Title Text="Exchange rate">
            </Title>
            <Legend Visible="false"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

