<%@ Page Title="KanbanBoard-Print-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example demonstrates how to print the whole kanban board layout in the Syncfusion ASP.NET Web Forms Kanban component." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="PrintKanban.aspx.cs" Inherits="WebSampleBrowser.Kanban.PrintKanban" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / PrintKanban</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" AllowPrinting="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
    </ej:Kanban>
</asp:Content>


