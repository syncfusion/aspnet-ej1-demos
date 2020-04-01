<%@ Page Title="TreeGrid-Custom Context Menu-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to display custom menu items in the context menu in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridCustomContextMenu.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridCustomContextMenu" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Context Menu</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="CustomContextMenu" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true"
            ContextMenuOpen="contextMenuOpen">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="60" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" />
            </Columns>
            <EditSettings AllowEditing="true" EditMode="RowEditing" />
            <ContextMenuSettings ShowContextMenu="true"
                ContextMenuItems="add,edit,delete" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
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
    <script type="text/javascript">
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
            if (currentMenuId == "Top") {
                rowPosition = ej.TreeGrid.RowPosition.Top;
            }
            else if (currentMenuId == "Bottom") {
                rowPosition = ej.TreeGrid.RowPosition.Bottom;
            }
            else if (currentMenuId == "Child") {
                rowPosition = ej.TreeGrid.RowPosition.Child;
            }
            this.addRow(tempData, rowPosition);
        }
        function customMenuExpandCollapseHandler(args) {
            var currentMenuId = args.menuId, expandCollapseArgs = {};
            expandCollapseArgs.data = args.data;
            if (currentMenuId === "Expand")
                expandCollapseArgs.expanded = true;
            else
                expandCollapseArgs.expanded = false;
            ej.TreeGrid.sendExpandCollapseRequest(this, expandCollapseArgs);
        }
    </script>
 </asp:Content>

