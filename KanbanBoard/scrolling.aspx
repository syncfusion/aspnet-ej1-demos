<%@ Page Title="KanbanBoard-Scrolling-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to customize the width and height in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Scrolling.aspx.cs" Inherits="WebSampleBrowser.Kanban.Scrolling" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / Scrolling</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" AllowScrolling="true" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" Width="250" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" Width="220" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" Width="220" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" Width="250" />
        </Columns>
        <ScrollSettings Width="700" Height="500" />
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" SwimlaneKey="Assignee" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onFreezeSwimlane(args) {
            $('#<%= KanbanBoard.ClientID %>').ejKanban("option", { "scrollSettings": { "allowFreezeSwimlane": args.isChecked } });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-kanban">
            <div class="row">
                <div class="col-md-3">
                    Allow Freeze Swimlane
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="freezeSwimlaneCheck" runat="server" ClientSideOnChange="onFreezeSwimlane"></ej:CheckBox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

