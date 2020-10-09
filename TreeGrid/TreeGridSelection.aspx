<%@ Page Title="TreeGrid-Selection API-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates cell and row selection, available in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridSelection.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.Selection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Selection</span>
</asp:Content>



<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridControl" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="TaskID" Width="45" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="TaskName" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" />
                <ej:TreeGridColumn HeaderText="Duration" Field="Duration" />                
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
                    Selection Mode
                </div>
                <div class="col-md-3">
                    <div>
                        <div id="modes">
                            <ul>
                                <li>Row</li>
                                <li>Cell</li>                                
                            </ul>
                        </div>
                    </div>
                    <ej:DropDownList ID="mode" ClientIDMode="Static" runat="server" ClientSideOnChange="onModeChange" Value="Row" Text="Row" Width="120px" SelectedItemIndex="0" TargetID="modes"></ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                   Selection Type
                </div>
                <div class="col-md-3">
                    <div id="types">
                        <ul>
                            <li>Single</li>
                            <li>Multiple</li>
                            <li>Checkbox</li>                          
                        </ul>
                    </div>
                    <ej:DropDownList ID="selectiontype" runat="server" ClientIDMode="Static" ClientSideOnChange="onTypeChange" Value="Single" Width="120px" TargetID="types"></ej:DropDownList>
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
           var treeGridObject = $("#TreeGridControl").data("ejTreeGrid");
           if (args.text === "Row")
               treeGridObject.option("selectionMode", "row");
           if (args.text === "Cell")
               treeGridObject.option("selectionMode", "cell");
       }

       function onTypeChange(args) {
           var treeGridObject = $("#TreeGridControl").data("ejTreeGrid");
           $("#mode").ejDropDownList("enable");
           if (args.text === "Single")
               treeGridObject.option("selectionType", "single");
           if (args.text === "Multiple")
               treeGridObject.option("selectionType", "multiple");
           if (args.text === "Checkbox") {
               if (treeGridObject.model.selectionMode === "cell") {
                   $("#mode").ejDropDownList({ text: "Row" });
               }
               var selectionSettings = { selectionType: "checkbox", selectionMode: "row" };
               treeGridObject.option("selectionType", "checkbox");
               $("#mode").ejDropDownList("disable");
           }
       }
    </script>
</asp:Content>

