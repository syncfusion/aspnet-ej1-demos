<%@ Page Title="Grid-Group Summary-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to display summary values for grouped columns under each grouped item in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="GroupSummary.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.GroupSummary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Summary / Group Summary</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowPaging="True" ShowSummary="True">
            <PageSettings PageSize="10"></PageSettings>
            <GroupSettings GroupedColumns="EmployeeID"></GroupSettings>
            <SummaryRows>
                <ej:SummaryRow ShowTotalSummary="False">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Average" DisplayColumn="Freight" DataMember="Freight"
                            Prefix="Average = " Format="{0:C}" />
                    </SummaryColumn>
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Sum" DisplayColumn="EmployeeID" DataMember="EmployeeID" Prefix="Sum = " />
                    </SummaryColumn>
                </ej:SummaryRow>
            </SummaryRows>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

