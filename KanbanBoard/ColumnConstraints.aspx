<%@ Page Title="KanbanBoard-Column Constraints-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to set limits for Syncfusion ASP.NET Web Forms Kanban columns and how to hold a maximum or minimum number of cards in a column."  Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ColumnConstraints.aspx.cs" Inherits="WebSampleBrowser.Kanban.ColumnConstraints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / ColumnConstraints</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="false" EnableTotalCount="true" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress">
                <Constraints Max="2" />
            </ej:KanbanColumn>
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" SwimlaneKey="Assignee" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-kanban">
            <div class="row">
                <div class="col-md-3">
                    Constraint Type
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="editMode" runat="server" ClientSideOnChange="onConstraintTypeChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Column" Value="column" />
                            <ej:DropDownListItem Text="Swimlane" Value="swimlane" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onConstraintTypeChange(args) {
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            var type = args.selectedValue;
            var cols = kanbanObj.model.columns;
            for (var i = 0; i < cols.length; i++) {
                if (!ej.isNullOrUndefined(cols[i].constraints))
                    cols[i].constraints.type = type;
            }
            kanbanObj.refreshColumnConstraints();
        }
    </script>    
</asp:Content>


