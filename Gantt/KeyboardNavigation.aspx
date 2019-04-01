<%@ Page Title="Gantt-Keyboard Interaction-ASP.NET-SYNCFUSION" MetaDescription="This example illustrates interacting with the Syncfusion Gantt chart control using keyboard shortcuts." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardNavigation.aspx.cs" Inherits="WebSampleBrowser.Gantt.KeyboardNavigation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" ClientIDMode="Static" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttKeyboardNavigation" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/15/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone"
            ChildMapping="Children" AllowGanttChartEditing="false"
            TreeColumnIndex="1" IsResponsive="true" Load="load">
            <EditSettings AllowEditing="true" AllowDeleting="true" EditMode="cellEditing" />
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Keys</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Description</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Alt + j </b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Focus
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Home</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            <p>First Row Selection</p>
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>End</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Last Row Selection
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>F2</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Cell Edit
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Enter</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Save request
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Delete</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Delete Row
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Ctrl + Down Arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Expand All
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Ctrl + Up Arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Collapse All
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Left Arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Collapse the Selected Row
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Right Arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Expand the Selected Row
                        </div>
                    </div>
                </div>
    </div>
    <style>        
        *.colwidth{
            width: 32.9%;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        $(document).on("keydown", function (e) {
            if (e.altKey && e.keyCode === 74) {
                $("#GanttKeyboardNavigation").find("#ejTreeGridGanttKeyboardNavigation").focus();
            }
        });
    </script>
</asp:Content>

