<%@ Page Title="KanbanBoard-Remote Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind the remote data source key value mapping in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="remotedata.aspx.cs" Inherits="WebSampleBrowser.Kanban.remotedata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Remotedata</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <DataManager URL="//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/Tasks" CrossDomain = "true" />
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" Tag="Tags" PrimaryKey="Id" />
    </ej:Kanban>
</asp:Content>


