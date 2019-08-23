<%@ Page Title="TreeGrid-Inline Editing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates editing records in the tree grid control using inline cell and row editing options." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridEditing.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridEditing" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlEditing" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" AllowSearching="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" RowPosition="BelowSelectedRow" ShowDeleteConfirmDialog="true" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll,search" />
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Edit Mode
                </div>
                <div class="col-md-3">
                    <div>
                        <div id="editMode">
                            <ul>
                                <li>CellEditing</li>
                                <li>RowEditing</li>
                            </ul>
                        </div>
                    </div>
                    <ej:DropDownList ID="editing" ClientIDMode="Static" runat="server" ClientSideOnChange="onModeChange" Value="CellEditing" Text="CellEditing" Width="120px" SelectedItemIndex="0" TargetID="editMode"></ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Begin Edit Action
                </div>
                <div class="col-md-3">
                    <div id="editAction">
                        <ul>
                            <li>Double Click</li>
                            <li>Click</li>
                        </ul>
                    </div>
                    <ej:DropDownList ID="actionClick" runat="server" ClientIDMode="Static" ClientSideOnChange="onActionChange" Value="Double Click" Width="120px" TargetID="editAction"></ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onActionChange(args) {
            var treeObject = $("#TreeGridControlEditing").data("ejTreeGrid");
            var value = args.text == "Double Click" ? ej.TreeGrid.BeginEditAction.DblClick : ej.TreeGrid.BeginEditAction.Click;
            var setting = {
                beginEditAction: value
            }
            treeObject.option("editSettings", setting);
        }
        function onModeChange(args) {
            var treeObject = $("#TreeGridControlEditing").data("ejTreeGrid");
            var value = args.text == "CellEditing" ? ej.TreeGrid.EditMode.CellEditing : ej.TreeGrid.EditMode.RowEditing;
            var setting = {
                editMode: value
            }
            treeObject.option("editSettings", setting);
        }
    </script>
</asp:Content>

