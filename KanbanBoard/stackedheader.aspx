<%@ Page Title="KanbanBoard-Stacked Header-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to group columns logically in the Syncfusion ASP.NET Web Forms Kanban component board." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="stackedheader.aspx.cs" Inherits="WebSampleBrowser.Kanban.stackedheader" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / StackedHeader</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" Width="80" />
            <ej:KanbanColumn HeaderText="Validated" Key="Validate" Width="80" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" Width="80" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" Width="80" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" Width="70" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
        <StackedHeaderRows>
            <ej:KanbanStackedHeaderRow>
                <StackedHeaderColumns>
                    <ej:KanbanStackedHeaderColumn HeaderText="Unresolved" Column="Backlog,Validated,In Progress" />
                    <ej:KanbanStackedHeaderColumn HeaderText="Resolved" Column="Testing,Done" />
                </StackedHeaderColumns>
            </ej:KanbanStackedHeaderRow>
        </StackedHeaderRows>
    </ej:Kanban>
</asp:Content>


