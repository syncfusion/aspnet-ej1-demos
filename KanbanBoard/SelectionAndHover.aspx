<%@ Page Title="KanbanBoard-Selection & Hover-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to select single or multiple cards and the hover behavior of cards in the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SelectionAndHover.aspx.cs" Inherits="WebSampleBrowser.Kanban.SelectionAndHover" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / SelectionAndHover</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" AllowSelection="true" SelectionType="Single" AllowTitle="true" KeyField="Status">
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" />
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                
                <div class="col-md-3">
                    Allow Hover
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="rowhoverCheck" Value="rowhoverCheck" runat="server" Checked="True" ClientSideOnChange="onHover"></ej:CheckBox>
                </div>
                <div class="col-md-3">
                    Allow Selection
                </div>
                <div class="col-md-3">
                    <ej:CheckBox ID="selectionCheck" Value="selectionCheck" runat="server" Checked="True" ClientSideOnChange="onSelection"></ej:CheckBox>
                </div>
				<div class="col-md-3">
                    Selection Type
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="selection" runat="server" ClientSideOnChange="onSelectionTypeChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Single" Value="single" />
                            <ej:DropDownListItem Text="Multiple" Value="multiple" />
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
        function onHover(args) {
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            if (args.isChecked)
                kanbanObj.model.allowHover = true;
            else
                kanbanObj.model.allowHover = false;
        }
        function onSelection(args) {
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            if (args.isChecked)
                kanbanObj.model.allowSelection = true;
            else {
                kanbanObj.KanbanSelection.clear();
                kanbanObj.model.allowSelection = false;
            }
        }
        function onSelectionTypeChange(args) {
            var kanbanObj = $('#<%= KanbanBoard.ClientID %>').data("ejKanban");
            var columnName = $('#<%= selection.ClientID %>').data("ejDropDownList")._selectedValue;
            kanbanObj.KanbanSelection.clear();
            $('#<%= KanbanBoard.ClientID %>').ejKanban({ selectionType: columnName });
        }
    </script>
</asp:Content>


