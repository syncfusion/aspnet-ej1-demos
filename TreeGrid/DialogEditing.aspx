<%@ Page Title="TreeGrid-Dialog Editing-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates editing records in the  tree grid control using the customizable dialog modal." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DialogEditing.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.DialogEditing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Editing</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlDialogEditing" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="dialogEditing" RowPosition="BelowSelectedRow" />
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,expandAll,collapseAll" />
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Enable Dialog Template
                </div>
                <div class="col-md-3">
                    <div class="colwidth"><ej:CheckBox ID="dialogtemplate" runat="server" ClientSideOnChange="onModeChange" Checked="false"></ej:CheckBox></div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
       <script type="text/x-jsrender" id="template">
        <div>
            <b>Task Details</b>
            <table>
                <tr>
                    <td style="text-align: right;padding:10px;">
                        Task ID
                    </td>
                    <td style="text-align: left;padding:10px;">
                        <input id="TreeGridControlDialogEditingTaskID" name="TaskID" value="{{:TaskID}}" />
                    </td>
                    <td style="text-align: right;padding:10px;">
                        Task Name
                    </td>
                    <td style="text-align: left;padding:10px;">
                        <input id="TreeGridControlDialogEditingTaskName" name="TaskName" value="{{:TaskName}}" class="e-field e-ejinputtext" style="width: 100%; height: 100x;" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;padding:10px;">
                        Start Date
                    </td>
                    <td style="text-align: left;padding:10px;">
                        <input type="text" id="TreeGridControlDialogEditingStartDate" name="StartDate" value="{{:StartDate}}"/>
                    </td>
                    <td style="text-align: right;padding:10px;">
                        End Date
                    </td>
                    <td style="text-align: left;padding:10px;">
                        <input id="TreeGridControlDialogEditingEndDate" name="EndDate" value="{{:EndDate}}"/>
                    </td>
                </tr>
                <tr>
                    <td style="text-align: right;;padding:10px;">
                        Duration
                    </td>
                    <td style="text-align: left;padding:10px;">
                        <input id="TreeGridControlDialogEditingDuration" name="Duration" value="{{:Duration}}"/>
                    </td>
                    <td style="text-align: right;padding:10px;">
                        Progress
                    </td>
                    <td style="text-align: left;padding:10px;">
                        <input id="TreeGridControlDialogEditingProgress" name="Progress" value="{{:Progress}}" />
                    </td>
                </tr>
            </table>
        </div>
        </script>
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onModeChange(args) {
            var treeObject = $("#TreeGridControlDialogEditing").data("ejTreeGrid"), value;
            if (!args.isChecked)
                value = null;
            else
                value = "#template";
            var setting = {
                dialogEditorTemplateID: value
            }
            treeObject.option("editSettings", setting);
        }
    </script>
</asp:Content>

