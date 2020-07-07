<%@ Page Title="Gantt-Custom Menu Item-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the default functionality of the context menu in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="GanttContextMenu.aspx.cs" Inherits="WebSampleBrowser.Gantt.GanttContextMenu" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
   <style>
        .e-expandIcon:before {
             content: "\e703";
         }
         .e-collapseIcon:before {
             content: "\e707";
         }
         
        .e-aboveIcon:before {
            content: "\e7e5";
        }

        .e-belowIcon:before {
            content: "\e7e4";
        }

        .e-topIcon:before {
            content: "\e7e2";
        }

        .e-bottomIcon:before {
            content: "\e7e1";
        }

        .e-childIcon:before {
            content: "\e7e3";
        }
   </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Context Menu</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
            <ej:Gantt ID="GanttControlContextMenu" runat="server" AllowSelection="true" ContextMenuOpen="contextMenuOpen"
                TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/30/2017"
                StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone" IsResponsive="true" 
                ChildMapping="Children" TreeColumnIndex="1" AllowGanttChartEditing="true" EnableContextMenu="true" Load="load">
                <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" AllowIndent="true" EditMode="cellEditing" />
                <SizeSettings Width="100%" Height="450px" />
            </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">

    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        function contextMenuOpen(args) {

            var isExpandable = true, isCollapsable = true, data;
            data = args.item;
            if (data && data.hasChildRecords) {
                if (data.expanded)
                    isExpandable = false;
                else
                    isCollapsable = false;
            } else {
                isExpandable = false;
                isCollapsable = false;
            }
            if (data) {
                var aboveMenu = args.contextMenuItems.filter(function (val) { return val.menuId == "Above" }),
               belowMenu = args.contextMenuItems.filter(function (val) { return val.menuId == "Below" });
                aboveMenu[0].iconClass = "e-aboveIcon";
                belowMenu[0].iconClass = "e-belowIcon";
                var contextMenuItems = [{
                    headerText: "Top",
                    eventHandler: customMenuAddHandler,
                    menuId: "Top",
                    parentMenuId: "Add",
                    iconClass: "e-topIcon"
                }, {
                    headerText: "Bottom",
                    menuId: "Bottom",
                    parentMenuId: "Add",
                    eventHandler: customMenuAddHandler,
                    iconClass: "e-bottomIcon"
                },
                {
                    headerText: "Child",
                    menuId: "Child",
                    parentMenuId: "Add",
                    eventHandler: customMenuAddHandler,
                    iconClass: "e-childIcon"
                },
                 {
                     headerText: "Expand",
                     menuId: "Expand",
                     eventHandler: customMenuExpandCollapseHandler,
                     iconClass: "e-expandIcon",
                     disable: !isExpandable
                 },
                 {
                     headerText: "Collapse",
                     menuId: "Collapse",
                     eventHandler: customMenuExpandCollapseHandler,
                     iconClass: "e-collapseIcon",
                     disable: !isCollapsable
                 }
                ];
                args.contextMenuItems.push.apply(args.contextMenuItems, contextMenuItems);
            }
        }

        function customMenuAddHandler(args) {
            var currentMenuId = args.menuId,
                tempData = args.data && $.extend({}, args.data.item), rowPosition;
            if (tempData)
                delete tempData[this.model.childMapping];

            if (currentMenuId == "Top") {
                rowPosition = ej.TreeGrid.RowPosition.Top;
            }
            else if (currentMenuId == "Bottom") {
                rowPosition = ej.TreeGrid.RowPosition.Bottom;
            }
            else if (currentMenuId == "Child") {
                rowPosition = ej.TreeGrid.RowPosition.Child;
            }
            this.addRecord(tempData, rowPosition);
        }
        function customMenuExpandCollapseHandler(args) {
            this.expandCollapseRecord(args.data.taskId);
        }
    </script>
</asp:Content>

