<%@ Page Title="Gantt-Toolbar Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates displaying custom icons or buttons in the Gantt toolbar." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GanttToolbarTemplate.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttToolbarTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / ToolbarTemplate</span>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttControlToolbarTemplate" ClientIDMode="Static" runat="server" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" StartDateMapping="StartDate" DurationMapping="Duration"
            ProgressMapping="PercentDone" ChildMapping="Children" BaselineEndDateMapping="BaseLineEndDate" BaselineStartDateMapping="BaseLineStartDate"
            ScheduleStartDate="10/25/2017" ScheduleEndDate="12/02/2017"
            AllowGanttChartEditing="false" RenderBaseline="true" IsResponsive="true" Load="load" ToolbarClick="toolbarClick" Create="create">
            <SplitterSettings Index="2" />
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" EditMode="cellEditing" />
            <ToolbarSettings ShowToolbar="true">
                <CustomToolbarItems>
                     <ej:GanttCustomToolbarItem Text="ShowBaseline" TooltipText="Show Baseline" />
                    <ej:GanttCustomToolbarItem Text="Reset" TooltipText="Reset" />
                </CustomToolbarItems>                
            </ToolbarSettings>
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="RenderBaseline" type="text/x-jsrender">
        <input id="toggle" type="checkbox" />
    </script>
    <script type="text/javascript">
        var baselineData;
        function load(args) {
            var columns = this.getColumns(),
                baseColumnIndex = columns.indexOf(ej.TreeGrid.getColumnByField(columns, "baselineStartDate")),
                splicedColumns = columns.splice(baseColumnIndex, 2);
            columns.splice(1, 0, splicedColumns[0], splicedColumns[1]);
            columns[0].width = 100;
        }
        function toolbarClick(args) {
            if (args.itemName == "Hide Baseline") {
                $(args.currentTarget).find("a").removeClass("HideBaseline").addClass("ShowBaseline")
                $(args.currentTarget).attr("data-content", "Show Baseline");
                this.setModel({ "renderBaseline": true });
            }
            if (args.itemName == "Show Baseline") {
                $(args.currentTarget).find("a").removeClass("ShowBaseline").addClass("HideBaseline")
                $(args.currentTarget).attr("data-content", "Hide Baseline");
                this.setModel({ "renderBaseline": false });
            }
            if (args.itemName == "Reset") {
                var refreshData = $.extend(true, [], baselineData);
                if ($("#" + this._id + "_ShowBaseline").find("a").hasClass("HideBaseline")) {
                    $("#" + this._id + "_ShowBaseline").find("a").removeClass("HideBaseline").addClass("ShowBaseline");
                    $("#" + this._id + "_ShowBaseline").attr("data-content", "Show Baseline");
                }
                this.setModel({ "dataSource": refreshData, "renderBaseline": true });               
            }
        }
        function create(args) {
            baselineData = $.extend(true, [], args.model.dataSource);
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .HideBaseline:before {
            content: "\e900";
        }

        .ShowBaseline:before {
            content: "\e901";
        }

        .Reset:before {
            content: "\e677";
        }
        .office-365 .HideBaseline:before {
            content: "\e904";
        }

        .office-365 .ShowBaseline:before {
            content: "\e903";
        }
    </style>
</asp:Content>

