<%@ Page Title="TreeGrid-Column Resize-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to resize columns dynamically in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridColumnResize.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridColumnResize" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Column Resize</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridColumnResizeSample" ClientIDMode="Static" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" AllowColumnResize="true">
            <ColumnResizeSettings ColumnResizeMode="FixedColumns" />
            <EditSettings BeginEditAction="Click" />
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Resize Mode
                </div>
                <div class="col-md-3">
                    <div>
                        <div id="resizeoptions">
                            <ul>
                                <li>Normal</li>
                                <li>Next Column</li>
                                <li>Fixed Columns</li>
                            </ul>
                        </div>
                    </div>
                    <ej:DropDownList ID="resizeMode" ClientIDMode="Static" runat="server" ClientSideOnChange="onModeChange" Width="120px" SelectedItemIndex="2" TargetID="resizeoptions"></ej:DropDownList>
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
        function onModeChange(args) {
            var treeObject = $("#TreeGridColumnResizeSample").data("ejTreeGrid"),
                 value = args.text,
            columnResizeSettings = {
                columnResizeMode: ej.TreeGrid.ColumnResizeMode.Normal
            };
            if (args.text == "Next Column")
                columnResizeSettings.columnResizeMode = ej.TreeGrid.ColumnResizeMode.NextColumn;
            else if (args.text == "Fixed Columns")
                columnResizeSettings.columnResizeMode = ej.TreeGrid.ColumnResizeMode.FixedColumns;
            treeObject.option("columnResizeSettings", columnResizeSettings);
        }
    </script>
</asp:Content>

