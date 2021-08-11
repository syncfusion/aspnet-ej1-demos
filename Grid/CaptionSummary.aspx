<%@ Page Title="Grid-Caption Summary-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to show the summary values in the datagrid’s group caption header of Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="CaptionSummary.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.CaptionSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Summary / Caption Summary</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowPaging="True" ShowSummary="True">
            <PageSettings PageSize="10"></PageSettings>
            <SummaryRows>
                <ej:SummaryRow ShowCaptionSummary="True" ShowTotalSummary="False">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Average" DisplayColumn="Freight" DataMember="Freight"
                            Format="{0:C}" Prefix="Average = " />
                    </SummaryColumn>
                </ej:SummaryRow>
            </SummaryRows>
            <GroupSettings GroupedColumns="CustomerID"></GroupSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="120" Format="{0:C}" />
                <ej:Column Field="Verified" HeaderText="Verified" Width="75" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>


