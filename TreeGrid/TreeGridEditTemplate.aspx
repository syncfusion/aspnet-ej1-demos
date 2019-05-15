<%@ Page Title="TreeGrid-Edit Template-ASP.NET-SYNCFUSION" MetaDescription="This example illustrates custom edit templates for editing records in the tree grid control." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TreeGridEditTemplate.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridEditTemplate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Edit Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlEditing" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String">
                <EditTemplate Create="create" Read="read" Write="write" />    
                </ej:TreeGridColumn>
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="RowEditing" RowPosition="BelowSelectedRow" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll" />
        </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function create() {
            return "<input>";
        }
        function write(args) {
            obj = $('#TreeGridControlEditing').ejTreeGrid('instance');
            var data = ej.DataManager(obj.model.flatRecords).executeLocal(new ej.Query().select("TaskName"));
            args.element.ejAutocomplete({ width: "100%", height:"28px", dataSource: data, enableDistinct: true, value: args.rowdata !== undefined ? args.rowdata["TaskName"] : "" });

        }
        function read(args) {
            args.ejAutocomplete('suggestionList').css('display', 'none');
            var e = $.Event("keyup", { keyCode: 13 });
            args.trigger(e);
            return args.ejAutocomplete("getValue");
        }
        $(function () {
            $("#TreeGridControlEditing").keyup(function (e) {
                if ((e.keyCode == 40 || e.keyCode == 38) && $(e.target).hasClass("e-autocomplete")) {
                    var autocomp = $("#TreeGridControlEditingTaskName").ejAutocomplete("instance")
                    if (autocomp.getValue() != "" && autocomp.getActiveText() != "No suggestions")
                        $(e.target).val(autocomp.getActiveText());
                }
            });
        });
    </script>
</asp:Content>

