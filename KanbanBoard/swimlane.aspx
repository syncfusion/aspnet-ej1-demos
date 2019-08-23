<%@ Page Title="KanbanBoard-Swimlane-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates the horizontal categorization of issues in the Syncfusion ASP.NET Web Forms Kanban component, brings transparency to the workflow." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="swimlane.aspx.cs" Inherits="WebSampleBrowser.Kanban.swimlane" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Swimlane</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" SwimlaneKey="Assignee" />
		 <SwimlaneSettings AllowDragAndDrop="true" />
    </ej:Kanban>
</asp:Content>


