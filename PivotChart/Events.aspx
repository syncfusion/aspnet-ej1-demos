<%@ Page Title="PivotChart-Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET Pivot Chart  control illustrates the events that are triggered during drill-down or drill-up operation" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="WebSampleBrowser.Events" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:PivotChart ID="PivotChart1" runat="server" Url="../api/OlapChart" IsResponsive="true" OnDrillSuccess="PivotChart1_DrillSuccess" ClientIDMode="Static">
        <Legend Visible="true" RowCount="2">
            <size height="68"></size>
        </Legend>
        <CommonSeriesOptions Type="Column"  EnableAnimation="True" Tooltip-Visible="true"/>
        <ClientSideEvents Load="loadTheme" />
        <Size Width="100%" Height="460px"></Size>
        <PrimaryXAxis>
            <Title Text="Date - Fiscal"></Title>
        </PrimaryXAxis>
        <PrimaryYAxis>
            <Title Text="Customer Count"></Title>
        </PrimaryYAxis>
		<Zooming EnableScrollbar="true" />
        <Legend RowCount="2"></Legend>
    </ej:PivotChart>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="EventSection">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog" runat="server"></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotChart1 {
            width: 100%;
            float:left;
            height:450px;
        }
        #legend_PivotChart1Container {
            width: 660px !important;
            left : 40px !important;
        }
    </style>
</asp:Content>

