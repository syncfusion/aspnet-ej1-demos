<%@ Page Title="TreeGrid-Checkbox Selection-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates the option to select rows using checkbox selection in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridCheckboxSelection.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridCheckboxSelection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / CheckboxSelection</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControlCheckboxSelection" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="70" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" ShowCheckbox="true" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />                
            </Columns>
            <SelectionSettings SelectionType= "Checkbox" SelectionMode="Row" EnableSelectAll="true" EnableHierarchySelection="true" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="PropertySection">
    <style>
        .colwidth {
            margin-left: 10px;
        }
    </style>
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Select All
                </div>
                <div class="col-md-3">
                    <div class="colwidth"><ej:CheckBox ID="selectAll" runat="server" ClientSideOnChange="SelectAll" Checked="True"></ej:CheckBox></div>
                </div>
                </div>
            <div class="row">
                <div class="col-md-3">
                    Hierarchy Selection
                </div>
                <div class="col-md-3">
                    <div class="colwidth"><ej:CheckBox ID="hierarchySelection" runat="server" ClientSideOnChange="recursive" Checked="True"></ej:CheckBox></div>
                </div>
                </div>
            <div class="row">
                <div class="col-md-3 ">
                    Checkbox Column
                </div>
                <div class="col-md-3 ">
                    <div id="columnList">
                        <ul>
                            <li>Default</li>
                               <li>Task Id</li>
                               <li>Task Name</li>
                               <li>Start Date</li>
                               <li>End Date</li>
                               <li>Duration</li>                               
                        </ul>
                    </div>
                    <div class="colwidth"><ej:DropDownList ID="checkboxColumn" ClientIDMode="Static" runat="server" TargetID="columnList"
                        WatermarkText="Task Name" Width="100" ClientSideOnChange="checkboxSelection" /></div>
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">        
        function SelectAll(args) {
            var obj = $("#TreeGridControlCheckboxSelection").data("ejTreeGrid"),            
            selectionSettings = { enableSelectAll: args.isChecked, };
            obj.option("selectionSettings", selectionSettings);

        }
        function recursive(args) {
            var obj = $("#TreeGridControlCheckboxSelection").data("ejTreeGrid"),
              selectionSettings = { enableHierarchySelection: args.isChecked };
            obj.option("selectionSettings", selectionSettings);
        }
        function checkboxSelection(args) {
            var obj = $("#TreeGridControlCheckboxSelection").data("ejTreeGrid");

            if (args.value == "Default") {
                obj.updateCheckboxColumn();
            }
            else {
                var column = obj.getColumnByHeaderText(args.value);
                obj.updateCheckboxColumn(column.field);
            }
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });

    </script>
</asp:Content>

