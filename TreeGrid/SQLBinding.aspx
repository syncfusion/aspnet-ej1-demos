<%@ Page Title="TreeGrid-SQL Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates SQL data binding to the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SQLBinding.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.SQLBinding" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Data Binding /SQL Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlSQLBinding" ChildMapping="SubTasks" IdMapping="TaskId"
            TreeColumnIndex="1" ParentIdMapping="ParentId" DataSourceID="SqlDataSource2" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskId" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
        <asp:sqldatasource id="SqlDataSource2" runat="server" connectionstring="<%$ ConnectionStrings:SelfReferenceConnectionString %>"
            selectcommand="SELECT * FROM [GanttData]"></asp:sqldatasource>

    </div>
</asp:Content>

