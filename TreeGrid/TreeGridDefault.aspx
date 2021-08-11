<%@ Page Title="TreeGrid-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example visualizes hierarchical data using a Syncfusion tree grid with basic features enabled." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridDefault.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridDefault" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlDefault" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
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

