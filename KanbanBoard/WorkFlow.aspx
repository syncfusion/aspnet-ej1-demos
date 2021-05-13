<%@ Page Title="KanbanBoard-WorkFlow-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates the flow of cards and moving cards between the kanban columns in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="WorkFlow.aspx.cs" Inherits="WebSampleBrowser.Kanban.WorkFlow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / WorkFlow</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowTitle="true" KeyField="Category" EnableTotalCount="true" AllowToggleColumn="true">
        <WorkFlow>
            <ej:KanbanWorkFlow Key="Order"  AllowedTransitions="Ready to Serve,Ready to Delivery" />
            <ej:KanbanWorkFlow Key="Ready to Serve" AllowedTransitions="Served" />
            <ej:KanbanWorkFlow Key="Ready to Delivery" AllowedTransitions="Delivered" />
        </WorkFlow>
        <Columns>
            <ej:KanbanColumn HeaderText="Order" Key="Order" AllowDrop="false" />
            <ej:KanbanColumn HeaderText="Ready to Serve" Key="Ready to Serve" />
            <ej:KanbanColumn HeaderText="Home Delivery" Key="Ready to Delivery" />
            <ej:KanbanColumn HeaderText="Served or Delivered" Key="Delivered,Served" AllowDrag="false" />
        </Columns>
         <CardSettings>
            <ColorMappings><ej:KeyValue Key="#cb2027" Value="Small" /></ColorMappings>
             <ColorMappings><ej:KeyValue Key="#fbae19" Value="Medium" /></ColorMappings>
             <ColorMappings><ej:KeyValue Key="#6a5da8" Value="Large" /></ColorMappings>
        </CardSettings>
        <Fields Content="Description" ImageUrl="ImageURL" PrimaryKey="Id" Title="Title" Color="Size" Tag="Tags" />
    </ej:Kanban>
</asp:Content>


