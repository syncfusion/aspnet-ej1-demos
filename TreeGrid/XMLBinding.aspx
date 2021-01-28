<%@ Page Title="TreeGrid-XML Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates XML data binding to the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="XMLBinding.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.XMLBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Data Binding / XML Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlXMLBinding" ChildMapping="SubTasks" TreeColumnIndex="1"
            IdMapping="Id" ParentIdMapping="ParentId" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="Id" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="Name" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

