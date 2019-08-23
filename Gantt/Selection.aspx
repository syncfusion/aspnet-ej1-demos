<%@ Page Title="Gantt-Selection-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates cell and row selection available in the Syncfusion Gantt chart control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Selection.aspx.cs" Inherits="WebSampleBrowser.Gantt.Selection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Gantt / Selection</span>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">   
  
   <script type="text/javascript">
       function load(args) {
           this.getColumns()[0].width = 60;
       }
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onModeChange(args) {
            $('#<%= GanttControlSelection.ClientID %>').ejGantt("model.selectionMode", args.text.toLowerCase());
        }
       function onTypeChange(args) {
           $('#<%= GanttControlSelection.ClientID %>').ejGantt("model.selectionType", args.text.toLowerCase());          
       }
    </script>
</asp:Content>
<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div style="width: 100%; height: 100%; overflow: visible;">
        <ej:Gantt ID="GanttControlSelection" runat="server" AllowSelection="true" AllowColumnResize="true"
            TaskIdMapping="Id" TaskNameMapping="Name" ScheduleStartDate="02/23/2017" ScheduleEndDate="03/15/2017"
            StartDateMapping="StartDate" EndDateMapping="EndDate" ProgressMapping="PercentDone"
            ChildMapping="Children" AllowGanttChartEditing="false" SplitterPosition="60%"
            TreeColumnIndex="1" IsResponsive="true" Load="load">
            <SizeSettings Width="100%" Height="450px" />
        </ej:Gantt>
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
                    <ej:DropDownList ID="mode" ClientIDMode="Static" runat="server" ClientSideOnChange="onModeChange" Value="row" Text="row" Width="120px" SelectedItemIndex="0" TargetID="modes"></ej:DropDownList>
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
                        </ul>
                    </div>
                    <ej:DropDownList ID="selectiontype" runat="server" ClientIDMode="Static" ClientSideOnChange="onTypeChange" Value="Single" Width="120px" TargetID="types"></ej:DropDownList>
                </div>
            </div>        
        </div>
    </div>
</asp:Content>

