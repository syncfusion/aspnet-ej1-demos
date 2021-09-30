<%@ Page Title="TreeGrid-Column Menu-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates column menus in the Syncfusion tree grid control for sorting, filtering, and toggling column visibility options." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridColumnChooser.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridColumnChooser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / ColumnChooser</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlColumnChooser" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" AllowSorting="true" AllowMultiSorting="true" 
            ShowColumnChooser="true" ShowColumnOptions="true" ColumnDialogFields="field,headerText,editType,width,textAlign,showInColumnChooser">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" EditType="Numeric" ShowInColumnChooser="false" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" Visible="false" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

