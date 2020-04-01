<%@ Page Title="TreeGrid-Batch Editing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates bulk edit and save options in the tree grid control for remote data." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridBatchEditing.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridBatchEditing" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Batch Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlBatchEditing" ChildMapping="SubTasks"
             TreeColumnIndex="1" IsResponsive="true" AllowPaging="true" AllowSorting="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate"  EditType="Datepicker"/>
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration"  EditType="Numeric"/>
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <PageSettings PageSize="2" PageSizeMode="Root" />
            <SizeSettings Width="100%"/>
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="batchEditing" BeginEditAction="Click" RowPosition="Child" >
                <BatchEditSettings EditMode="Cell" />
            </EditSettings>
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,delete,update,cancel,search" />
        </ej:TreeGrid>
    </div>
</asp:Content>

