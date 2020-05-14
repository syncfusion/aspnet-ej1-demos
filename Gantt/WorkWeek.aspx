<%@ Page Title="Gantt-Work Week-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates how to define the working days in a week for the Syncfusion Gantt chart control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="WorkWeek.aspx.cs" Inherits="WebSampleBrowser.Gantt.WorkWeek" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControlDefault" ClientIDMode="Static" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/15/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone" DurationMapping="Duration"
            ChildMapping="Children" AllowGanttChartEditing="false" IncludeWeekend="false"
            TreeColumnIndex="1" IsResponsive="true">
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="PropertyContent" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid"> 
            <div class="row">
                <div class="col-md-3">Working Days</div>
                <div class="col-md-3">
                    <ej:DropDownList ClientIDMode="Static" runat="server" ID="workingdays" Width="105px" ShowCheckbox="true" ClientSideOnChange="onChangeWorkingDays" ClientSideOnCreate="create">
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function load(args) {
            this.getColumns()[0].width = 60;
            this.getColumns()[0].visible = false;
        }
        function onChangeWorkingDays(args) {
            var workweek = [], array = args.model.selectedItems.sort();
            for (i = 0; i < args.model.selectedItems.length; i++) {
                workweek.push(args.model.dataSource[array[i]]);
            }
            $("#GanttControlDefault").ejGantt("option",{ "workWeek": workweek });
        }
        function create(e) {
            var dropDown = $("#workingdays").data('ejDropDownList'),
                selectedItems = [1, 2, 3, 4, 5];
            dropDown.selectItemsByIndices(selectedItems);
        }

 </script>
    </asp:Content>

