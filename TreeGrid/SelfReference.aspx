<%@ Page Title="TreeGrid-Self Reference-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates binding self-referential flat data with parent ID to a Syncfusion tree grid." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SelfReference.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.SelfReference" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Self Reference</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridSelfReference" IdMapping="Id" ParentIdMapping="ParentId" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="Id" Width="60" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="Name" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="PercentDone" EditType="Numeric" />
            </Columns>            
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

