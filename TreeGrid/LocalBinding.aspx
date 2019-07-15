<%@ Page Title="TreeGrid-Local Binding-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates binding local JSON data to the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="LocalBinding.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.LocalBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Local Binding</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlLocal" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric"/>
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String"/>
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker"/>
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker"/>
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric"/>
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric"/>
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" EditMode="cellEditing" />
        </ej:TreeGrid>
    </div>
</asp:Content>

