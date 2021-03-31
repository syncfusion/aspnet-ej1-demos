<%@ Page Title="TreeGrid-Column Filtering-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to perform predicate filtering on column fields in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridColumnFiltering.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridColumnFiltering" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Column Filtering</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid ClientIDMode="Static" runat="server" ID="TreeGridControlFiltering" ChildMapping="SubTasks" AllowFiltering="true" TreeColumnIndex="1" IsResponsive="true" BeginEdit="BeginEdit">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="55" EditType="Numeric" AllowFiltering="false" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" EditType="String" FilterEditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="FilterStartDate" EditType="Datepicker" FilterEditType="Datepicker" Format="{0:MM/dd/yyyy}"/>
                <ej:TreeGridColumn HeaderText="End Date" Field="FilterEndDate" EditType="Datepicker" FilterEditType="Datepicker" Format="{0:MM/dd/yyyy}"/>
                <ej:TreeGridColumn HeaderText="Approved" Field="Approved" IsTemplateColumn="true" TemplateID="customColumnTemplate" FilterEditType="Dropdown" AllowFilteringBlankContent="false" />
                <ej:TreeGridColumn HeaderText="Priority" Field="Priority" EditType="Dropdown" FilterEditType="Dropdown" />
                <ej:TreeGridColumn HeaderText="Progress" Field="Progress" EditType="Numeric" FilterEditType="Numeric" />
                
            </Columns>
            <FilterSettings FilterType="FilterBar" FilterHierarchyMode="Parent"></FilterSettings>
            <SizeSettings Width="100%" Height="450px" />
            <EditSettings AllowEditing="true" EditMode="CellEditing" />
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="customColumnTemplate">
        <div style="margin-left:20px;">{{if Approved}} <input class="customCheckbox" type="checkbox" checked="checked" onclick="checkUncheck(event); return true;" value="" />{{else}} <input class="customCheckbox" type="checkbox" value="" onclick="checkUncheck(event); return true;" />{{/if}}</div>
    </script>
     <script type="text/javascript">
         function BeginEdit(args) {
             if (args.columnIndex == 4)
                 args.cancel = true;
         }
         function checkUncheck(e) {
             e = e || window.event;
             var targetEle = e.target || e.srcElement,
                 $tr = $(targetEle).closest('tr'),
                 treeObj = $("#TreeGridControlFiltering").data("ejTreeGrid"),
                 checkStatus = $(targetEle).is(':checked'),
                 rowIndex = ($tr).index(),
                 record = treeObj.model.currentViewData && treeObj.model.currentViewData[rowIndex];
             record["Approved"] = checkStatus;
         }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
         function onModeChange(args) {
             var treeObject = $("#TreeGridControlFiltering").data("ejTreeGrid");
             var value = args.text == "Menu" ? "menu" : (args.text == "Excel" ? "excel" : "filterbar");
             var isResponsive = args.text == "Excel" ? false : true;
             var setting = {
                 filterType: value
             }
             treeObject.option("filterSettings", setting);
             treeObject.option("isResponsive", isResponsive);
         }
         function onHierarchyModeChange(args) {
             var treeObject = $("#TreeGridControlFiltering").data("ejTreeGrid");
             var value = args.text == "Child" ? "child" : (args.text == "Both" ? "both" : args.text == "None" ? "none" : "parent");
             var setting = {
                 filterHierarchyMode: value
             }
             treeObject.option("filterSettings", setting);
         }
     </script>
</asp:Content>
<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Filter Type
                </div>
                <div class="col-md-3">
                    <div>
                        <div id="editMode">
                            <ul>
                                <li>Menu</li>
                                <li>Filter Bar</li>
                                <li>Excel</li>
                            </ul>
                        </div>
                    </div>
                    <ej:DropDownList ID="editing" ClientIDMode="Static" runat="server" ClientSideOnChange="onModeChange" Value="Filter Bar" Text="Filter Bar" Width="120px" SelectedItemIndex="0" TargetID="editMode"></ej:DropDownList>
                </div>
            </div>
           
                <div class="row">
                    <div class="col-md-3">
                        Filter Hierarchy Mode
                    </div>
                    <div class="col-md-3">
                        <div>
                            <div id="hierarchyMode">
                                <ul>
                                    <li>Parent</li>
                                    <li>Child</li>
                                    <li>Both</li>
                                    <li>None</li>
                                </ul>
                            </div>
                        </div>
                        <ej:DropDownList id="filtering" clientidmode="Static" runat="server" clientsideonchange="onHierarchyModeChange" value="Parent" text="Parent" width="120px" selecteditemindex="0" targetid="hierarchyMode"></ej:DropDownList>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>

