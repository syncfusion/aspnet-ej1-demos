<%@ Page Title="Schedule-Appointment Tooltip-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to display tooltips over appointments in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Tooltip.aspx.cs" Inherits="WebSampleBrowser.Schedule.Tooltip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Tooltip</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
       <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="425px" CurrentDate="6/5/2017">
    <TooltipSettings Enable="True"></TooltipSettings>
    <Resources>
        <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text">
            </ResourceSettings>
        </ej:Resources>
    </Resources>
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="OwnerId"/>
</ej:Schedule>

   </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
         SelectCommand="SELECT * FROM [MultipleResource]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="styleContent" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
       .imgheight{
			width:70px;
			height:72px;
		 }
		 .temp{
		  padding-top:2px;
		  font:12px Segoe UI SemiBold;
		 }
		 .temphead {
		  font:13px Segoe UI;
		  font-weight:bold;
		 }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var obj;
        $(document).ready(function () {
            $("#sampleProperties").ejPropertiesPanel();
            obj = $("#Schedule1").data("ejSchedule");
        });

        function _getResources(id) {
            var resid = id.split("_");
            switch (parseInt(resid[1])) {
                case 1:
                    if (parseInt(resid[0]) == 2)
                        return "<div>Nancy<div>"
                    else
                        return "<img class='imgheight' src='../Content/images/Employees/3.png'/>";
                    break;
                case 3:
                    if (parseInt(resid[0]) == 2)
                        return "<div>Steven<div>"
                    else
                        return "<img class='imgheight' src='../Content/images/Employees/5.png'>";
                case 5:
                    if (parseInt(resid[0]) == 2)
                        return "<div>Michael<div>"
                    else
                        return "<img class='imgheight' src='../Content/images/Employees/7.png'>";
                default:
                    return null;
            }
        }
        $.views.helpers({ format: _getResources });

        function onTooltip(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule("option", "tooltipSettings.enable", true);
            else
                $("#Schedule1").ejSchedule("option", "tooltipSettings.enable", false);
        }
        function onTooltipTemp(args) {
            if (args.isChecked)
                $("#Schedule1").ejSchedule("option", "tooltipSettings.templateId", "#tooltipTemp");
            else
                $("#Schedule1").ejSchedule("option", "tooltipSettings.templateId", null);
        }
    </script>
    <script id="tooltipTemp" type="text/x-jsrender">
        <div style="width:275px">
           <div style='float:left;width:80px;'>{{:~format("1_"+OwnerId.toString())}}</div>
		   <div>
		        <div>
					<div class="temphead" style="float:left;">Name:&nbsp;</div>
					<div class="temp">{{:~format("2_"+OwnerId.toString())}}</div>
				</div>
				<div style="padding-top:3px;">
					<div class="temphead" style="float:left;">Subject:&nbsp;</div>
					<div class="temp">{{:Subject.length>0 ? Subject:"NoTitle"}}</div>
				</div>
				<div style="padding-top:3px">
					<div class="temphead" style="float:left;">StartTime:&nbsp;</div>
					<div class="temp">{{:StartTime.toLocaleString()}}</div>
				</div>
				<div style="padding-top:3px;padding-bottom:2px">
					<div class="temphead" style="float:left;">EndTime:&nbsp;</div>
					<div class="temp">{{:EndTime.toLocaleString()}}</div>
				</div>
		   </div>
		</div>
	</script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
               <div class="row">
                <div class="col-md-3">
                 Enable Tooltip
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="true" ID="tooltip" ClientSideOnChange="onTooltip"></ej:Checkbox>
                </div>
            </div>
            <br />
               <div class="row">
                <div class="col-md-3">
                   Enable Tooltip Template
                </div>
                <div class="col-md-3">
                   <ej:Checkbox  runat="server" Checked="false" ID="tooltipTemplate" ClientSideOnChange="onTooltipTemp"></ej:Checkbox>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

