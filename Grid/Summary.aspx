<%@ Page Title="Grid-Basic-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to display the summary values such as average, minimum, etc., for the columns in Syncfusion ASP.NET Web Forms DataGrid." AutoEventWireup="true" CodeBehind="Summary.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.Summary" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Summary / Basic</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" ShowSummary="True">
            <PageSettings PageSize="10"></PageSettings>
            <SummaryRows>
                <ej:SummaryRow Title="Sum">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Sum" Format="{0:C}" DisplayColumn="Freight" DataMember="Freight" />
                    </SummaryColumn>
                </ej:SummaryRow>
                <ej:SummaryRow Title="Average">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Average" Format="{0:C}" DisplayColumn="Freight" DataMember="Freight" />
                    </SummaryColumn>
                </ej:SummaryRow>
                <ej:SummaryRow Title="Smallest">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Minimum" Format="{0:C}" DisplayColumn="Freight" DataMember="Freight" />
                    </SummaryColumn>
                </ej:SummaryRow>
                <ej:SummaryRow Title="Largest">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Maximum" Format="{0:C}" DisplayColumn="Freight" DataMember="Freight" />
                    </SummaryColumn>
                </ej:SummaryRow>
            </SummaryRows>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="110" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="100" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

