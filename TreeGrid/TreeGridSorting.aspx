<%@ Page Title="TreeGrid-Sorting-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates sorting columns in either ascending or descending order in the Syncfusion tree grid control." AutoEventWireup="true" CodeBehind="TreeGridSorting.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.TreeGrid.TreeGridSorting" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlSorting" ChildMapping="SubTasks" TreeColumnIndex="1" AllowSorting="true" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

