<%@ Page Title="KanbanBoard-Local Data-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to bind the local data source key value mapping in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="localdata.aspx.cs" Inherits="WebSampleBrowser.Kanban.localdata" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Localdata</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
    </ej:Kanban>
</asp:Content>


