<%@ Page Title="TreeGrid-Frozen Columns-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates freezing and unfreezing columns from scrolling in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridFrozenColumns.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridFrozenColumns" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Frozen Columns</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridFrozenColumnsControl" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" ShowColumnChooser="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="ID" Field="TaskID" Width="100" IsFrozen="true" AllowFreezing="false"/>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" Width="200" IsFrozen="true"/>
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate"/>
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate"/>
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration"/>
                <ej:TreeGridColumn HeaderText="Approved" Field="Approved"/>
                <ej:TreeGridColumn HeaderText="Priority" Field="Priority"/>
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress"/>
            </Columns>
            <SizeSettings Width="100%" Height="350px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

