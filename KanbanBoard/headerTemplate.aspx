<%@ Page Title="KanbanBoard-Header Template-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates the Syncfusion ASP.NET Web Forms Kanban control header template for customizing the kanban header layout." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="headerTemplate.aspx.cs" Inherits="WebSampleBrowser.Kanban.headerTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / headerTemplate</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" HeaderTemplate="#column1" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" HeaderTemplate="#column2" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" HeaderTemplate="#column3" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" HeaderTemplate="#column4" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="column1" type="text/x-jsrender">
       <span class="e-backlog e-icon"></span>
                     Backlog
    </script>
    <script id="column2" type="text/x-jsrender">
     <span class="e-inprogress e-icon"></span>
                      In Progress 
    </script>
    <script id="column3" type="text/x-jsrender">
     <span class="e-testing e-icon"></span>
                      Testing
    </script>
    <script id="column4" type="text/x-jsrender">
      <span class="e-done e-icon"></span>
                     Done
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-backlog, .e-inprogress, .e-testing, .e-done {
            font-size: 16px;
            padding-right: 5px;
            display: inline-block;
        }
        .e-backlog:before {
            content: "\e807";
        }
        .e-inprogress:before {
            content: "\e808";
        }
        .e-testing:before {
            content: "\e809";
        }
        .e-done:before {
            content: "\e80a";
        }
    </style>
</asp:Content>

