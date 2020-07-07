<%@ Page Title="Schedule-Custom View-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to display user-provided continuous date ranges in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomView.aspx.cs" Inherits="WebSampleBrowser.Schedule.CustomView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Time Mode</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule  ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" Views="CustomView" CurrentView="CustomView" CurrentDate="6/5/2017">
    <RenderDates Start="6/7/2017" End="7/10/2017" />
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule"/>
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });
        function onChange(args) {
            $("#Schedule1").ejSchedule("option","currentView")!=args.value.toLowerCase() && $("#Schedule1").ejSchedule({ views:[args.value], currentView:args.value.toLowerCase()});
        }
        function ChangeDate(args) {
            var startDate = $("#customstartdate").ejDatePicker("option", "value");
            startDate = new Date(startDate.getFullYear(), startDate.getMonth(), startDate.getDate());
            var endDate = $("#customenddate").ejDatePicker("option", "value");
            endDate = new Date(endDate.getFullYear(), endDate.getMonth(), endDate.getDate());
            if (startDate <= endDate) {  
				$('#ddlView').ejDropDownList({
				 selectedItemIndex: 5
				});
                $("#Schedule1").ejSchedule({
                    CurrentView: "CustomView",
                    views:["CustomView"],
					currentDate: new Date(startDate),
                    renderDates: {
                        start: new Date(startDate),
                        end: new Date(endDate)
                    }
                });
            }
            else
                alert("Start hour should be lesser than end hour");
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Select View
                </div>
                <div class="col-md-3">
                   <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlView" Width="115px" SelectedItemIndex="5" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="Agenda" Value="Agenda"/>
                            <ej:DropDownListItem  Text="Day" Value="Day"/>
                            <ej:DropDownListItem  Text="Week" Value="Week"/>
                            <ej:DropDownListItem  Text="WorkWeek" Value="WorkWeek"/>
                            <ej:DropDownListItem  Text="Month" Value="Month"/>
                            <ej:DropDownListItem  Text="CustomView" Value="CustomView"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
             <div class="row">
                <div class="col-md-3">
                    Start Date
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:DatePicker ClientIDMode="Static" runat="server" ID="customstartdate" Width="120px" Value="6/7/2017"></ej:DatePicker>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    End Date
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:DatePicker ClientIDMode="Static" runat="server" ID="customenddate" Width="120px" Value="7/10/2017"></ej:DatePicker>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-3">
                  <ej:Button ClientIDMode="Static" Type="Button" ID="BtnSubmit" runat="server" Text="Submit" ClientSideOnClick="ChangeDate"></ej:Button>
                 </div>
            </div>
        </div>
    </div>
</asp:Content>

