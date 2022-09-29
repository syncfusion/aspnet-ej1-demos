<%@ Page Title="Gantt-SQL Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates binding SQL data to a Syncfusion Gantt chart." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="SQLDataBinding.aspx.cs" Inherits="WebSampleBrowser.Gantt.SQLDataBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Data Binding / SQL Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Gantt ID="GanttSQLDataBinding" runat="server" AllowSelection="True"
            AllowSorting="True" AllowColumnResize="False"
            TaskIdMapping="TaskId" TaskNameMapping="TaskName" StartDateMapping="StartDate"
            EndDateMapping="EndDate" ProgressMapping="Progress" ParentTaskIdMapping="ParentId"
            ScheduleStartDate="01/30/2017" ScheduleEndDate="03/01/2017" ChildMapping="Children"
            TreeColumnIndex="1" AllowGanttChartEditing="False" DataSourceID="SqlDataSource1" IsResponsive="true" Load="load">
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>

        <asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:SelfReferenceConnectionString %>"
            selectcommand="SELECT * FROM [GanttData]"></asp:sqldatasource>
    </div>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
    function load(args) {
        this.getColumns()[0].width = 60;
    }
 </script>
    </asp:Content>

