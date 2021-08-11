<%@ Page Title="TreeGrid-Exporting TreeGrid-ASP.NET-SYNCFUSION" MetaDescription="This example illustrates exporting hierarchical data in Excel and PDF formats." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TreeGridExporting.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridExporting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlExporting" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" OnServerPdfExporting="TreeGridControlExporting_ServerPdfExporting" OnServerExcelExporting="TreeGridControlExporting_ServerExcelExporting" >
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="80" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />
            </Columns>
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="450px" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="pdfExport,excelExport" />
        </ej:TreeGrid>
    </div>
</asp:Content>

