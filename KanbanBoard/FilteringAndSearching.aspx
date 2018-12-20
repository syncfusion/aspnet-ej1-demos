<%@ Page Title="KanbanBoard-Filtering & Searching-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to filter or search the collection of cards in the data source in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="FilteringAndSearching.aspx.cs" Inherits="WebSampleBrowser.Kanban.FilteringAndSearching" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / FilteringAndSearching</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowSearching="true" KeyField="Status" AllowTitle="true">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
        <FilterSettings>
            <ej:KanbanFilterSetting Text="Janet Issues" Query="new ej.Query().where('Assignee', 'equal', 'Janet Leverling')" Description="Displays issues which matches the assignee as 'Janet Leverling" />
            <ej:KanbanFilterSetting Text="Testing Issues" Query="new ej.Query().where('Status', 'equal', 'Testing')" Description="Display the issues of 'Testing'" />
        </FilterSettings>
    </ej:Kanban>
</asp:Content>


