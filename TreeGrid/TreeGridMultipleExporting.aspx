<%@ Page Title="TreeGrid-Multiple Exporting-ASP.NET-SYNCFUSION" MetaDescription="This example illustrates how to export records from multiple tree grids as a combined file." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TreeGridMultipleExporting.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridMultipleExporting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div style="font-size: 19px; margin: 20px 0 10px;">
        Planning Phase
    </div>
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlExporting" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" OnServerPdfExporting="TreeGridControlExporting_ServerPdfExporting"
            OnServerExcelExporting="TreeGridControlExporting_ServerExcelExporting">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="80"/>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration"/>
            </Columns>
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="250px" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="pdfExport,excelExport" />
        </ej:TreeGrid>
    </div>
    <div style="font-size: 19px; margin: 20px 0 10px;">
        Design Phase
    </div>
     <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlDesign" ChildMapping="SubTasks" TreeColumnIndex="1" EnableResize="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="80"/>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration"/>
            </Columns>
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="200px" />
        </ej:TreeGrid>
    </div>
     <div style="font-size: 19px; margin: 20px 0 10px;">
        Implementation Phase
    </div>
     <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlImplementation" ChildMapping="SubTasks" TreeColumnIndex="1" EnableResize="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="80"/>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration"/>
            </Columns>
            <EditSettings AllowDeleting="false" />
            <SizeSettings Width="100%" Height="250px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

