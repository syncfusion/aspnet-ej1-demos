<%@ Page Title="TreeGrid-Object Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates object data binding to the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ObjectBinding.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.ObjectBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Data Binding / Object Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridObjectBinding" ChildMapping="SubTasks" TreeColumnIndex="1" DataSourceID="ObjectData" IsResponsive="true">
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

    <asp:objectdatasource id="ObjectData" runat="server" typename="TreeGridObjectData" selectmethod="GetDataSource">
    </asp:objectdatasource>
</asp:Content>

