<%@ Page Title="TreeGrid-Performance-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates binding large data along with smooth scrolling in the Syncfusion tree grid control." AutoEventWireup="true" CodeBehind="Virtualization.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.TreeGrid.Virtualization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Performance</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridVirtualization" AllowColumnResize="true" ChildMapping="Children" EnableVirtualization="true" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="Id" Width="60" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="Name" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Progress" Field="PercentDone" EditType="Numeric" />
            </Columns>           
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

