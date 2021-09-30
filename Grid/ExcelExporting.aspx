<%@ Page Title="Grid-Exporting Grid-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to export the datagrid's content to Excel, PDF, and Word documents using the Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="ExcelExporting.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ExcelExporting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <span class="sampleName">Grid / Events</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server" IsResponsive="true"  AllowFiltering="True" AllowGrouping="true" AllowReordering="true" AllowSorting="true" ShowSummary="true" ShowStackedHeader="true" OnServerWordExporting="FlatGrid_ServerWordExporting" OnServerPdfExporting="FlatGrid_ServerPdfExporting" OnServerExcelExporting="FlatGrid_ServerExcelExporting" AllowPaging="True">
            <ToolbarSettings ShowToolbar="true" ToolbarItems="excelExport,wordExport,pdfExport"></ToolbarSettings>
			  
            <SummaryRows>
                <ej:SummaryRow ShowGroupSummary="false">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Sum" Format="{0:C}" Prefix="Sum = " DisplayColumn="Freight" DataMember="Freight" />
                    </SummaryColumn>
                </ej:SummaryRow>                
            </SummaryRows>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="70" Priority="4"  Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="85" Format="{0:C}" Priority="3" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="110"  />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Priority="2" Width="90" />
               <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="90" />
             </Columns>
			<StackedHeaderRows>
               <ej:StackedHeaderRow>
                   <StackedHeaderColumns>
                        <ej:StackedHeaderColumn Column="OrderID,OrderDate,Freight" HeaderText="Order Details" />
                        <ej:StackedHeaderColumn Column="ShipName,ShipCity,ShipCountry" HeaderText="Ship Details" />
                    </StackedHeaderColumns>
                </ej:StackedHeaderRow>
            </StackedHeaderRows>
        </ej:Grid>
    </div>
</asp:Content>


