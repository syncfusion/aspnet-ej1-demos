<%@ Page Title="TreeGrid-Toolbar Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates displaying custom icons or buttons in the tree grid toolbar." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridToolbarTemplate.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridToolbarTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Toolbar Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="ToolbarTemplate" ClientIDMode="Static" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true" ToolbarClick="toolbarClick" Create="create">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <EditSettings AllowEditing="true" EditMode="CellEditing" />
            <SizeSettings Width="100%" Height="450px" />
            <ToolbarSettings ShowToolbar="true">
                <CustomToolbarItems>
                   <ej:TreeGridCustomToolbarItem TemplateID="#ColumnVisibility" TooltipText="Column Visibility"  />
                    <ej:TreeGridCustomToolbarItem Text="Reset"  TooltipText="Reset"  />       
                </CustomToolbarItems>              
            </ToolbarSettings>
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="ColumnVisibility" type="text/x-jsrender">
        <input id="dropdownContainer" />
    </script>
    <script type="text/javascript">
        var sampleData, treeGridColumns,
        dropData = [
          { text: "Task Id", value: "taskID", selected: true },
          { text: "Start Date", value: "startDate", selected: true },
          { text: "End Date", value: "endDate", selected: true },
          { text: "Duration", value: "duration", selected: true },
          { text: "Progress", value: "progress", selected: true }
        ];
        function toolbarClick(args) {
            if (args.itemName == "Reset") {
                var refreshData = $.extend(true, [], sampleData),
                refreshColumns = $.extend(true, [], treeGridColumns),
                  dropObj = $("#dropdownContainer").data("ejDropDownList");
                this.setModel({ "dataSource": refreshData, "columns": refreshColumns });
                dropObj.clearText();
                dropObj.checkAll();
            }
        }
        function create(args) {
            sampleData = $.extend(true, [], args.model.dataSource);
            treeGridColumns = $.extend(true, [], args.model.columns)
            $("#dropdownContainer").ejDropDownList({
                height: 30,
                dataSource: dropData,
                showCheckbox: true,
                fields: { text: "text", value: "value", selected: "selected" },
                checkChange: function (args) {
                    var treeObj = $("#ToolbarTemplate").data("ejTreeGrid");
                    if (args.isChecked == false) {
                        treeObj.hideColumn(args.selectedText);
                    }
                    else {
                        treeObj.showColumn(args.selectedText);
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        #ToolbarTemplate_ColumnVisibility:hover {
            background: none;
            border-color: transparent;
        }

        #ToolbarTemplate_ColumnVisibility {
            padding-top: 2px;
            padding-bottom: 0px;
        }

        .Reset:before {
            content: "\e677";
        }
    </style>
</asp:Content>


