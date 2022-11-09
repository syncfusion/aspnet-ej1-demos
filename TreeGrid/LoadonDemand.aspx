<%@ Page Title="TreeGrid-Load on Demand-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to load records on demand in the Syncfusion tree grid control with a parent node expand action." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="LoadonDemand.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.LoadonDemand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Data Binding / Load on Demand</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridLoadonDemand" TreeColumnIndex="1" IsResponsive="true" IdMapping="TaskID" ParentIdMapping="ParentID"
              HasChildMapping="isParent" EnableVirtualization="true" EnableLoadOnDemand="true">
             <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/TreeGridGantt/TreeGantt.svc/SelfReferenceDatas" CrossDomain="true"></DataManager>
           <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="datetimepicker"/>               
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="datetimepicker"/>
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress"/> 
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>      
</asp:Content>

