<%@ Page Title="Gantt-Sorting API-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example illustrates the sorting method available in the Syncfusion Gantt chart control for external sorting actions." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomSorting.aspx.cs" Inherits="WebSampleBrowser.Gantt.CustomSorting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Sorting API</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControlDefault" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/15/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone"
            ChildMapping="Children" AllowGanttChartEditing="false"
            TreeColumnIndex="1" IsResponsive="true" AllowSorting="true" Load="load">
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Column name
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="columnName" runat="server" SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="ID" Value="Id" />
                            <ej:DropDownListItem Text="Task Name" Value="Name"  />
                            <ej:DropDownListItem Text="Start Date" Value="StartDate"  />
                            <ej:DropDownListItem Text="End Date" Value="EndDate"  />
                            <ej:DropDownListItem Text="Progress" Value="PercentDone"  />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Sort Direction
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="directions" runat="server" SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Ascending" />
                            <ej:DropDownListItem Text="Descending" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:Button ID="doSorting" runat="server" Type="Button" Text="Sort" ClientSideOnClick="onClick" Width="100px"></ej:Button>
                </div>
                <div class="col-md-3">
                    <ej:Button ID="clearSorting" runat="server" Type="Button" Text="Clear" ClientSideOnClick="onClick" Width="100px"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function load(args) {
            this.getColumns()[0].width = 60;
        }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onClick(args) {
            var ganttObj = $('#<%= GanttControlDefault.ClientID %>').data("ejGantt");
            if (ganttObj != undefined) {
                if (this.element.attr('id').indexOf("doSorting")!=-1) {
                    var name = $('#<%= columnName.ClientID %>').data("ejDropDownList");
                    var direction = $('#<%= directions.ClientID %>').data("ejDropDownList");
                    var columnName = name.getSelectedValue();
                    var sortDirection = direction.getValue().toLowerCase();
                    ganttObj.sortColumn(columnName, sortDirection);
                }
                else
                {
                    ganttObj.clearSorting();
                }
            }
        }
    </script>
</asp:Content>

