<%@ Page Title="TreeGrid-Text Wrap-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the cell text wrapping support available in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TextWrap.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TextWrap" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Text Wrap</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlTextWrap" ChildMapping="SubTasks" EnableVirtualization="false" AllowTextWrap="true" HeaderTextOverflow="Wrap" AllowColumnResize="true" TreeColumnIndex ="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" RowPosition="BelowSelectedRow" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll" />
        </ej:TreeGrid>
    </div>
</asp:Content>


