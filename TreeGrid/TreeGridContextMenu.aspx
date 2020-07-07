<%@ Page Title="TreeGrid-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the default functionality of the context menu in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridContextMenu.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridContextMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Context Menu</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlContextMenu" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" AllowSorting="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="60" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" IsFrozen="true" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <EditSettings AllowEditing="true" EditMode="RowEditing" />
            <ContextMenuSettings ShowContextMenu="true"
                ContextMenuItems="add,edit,delete" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

