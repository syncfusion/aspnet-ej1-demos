<%@ Page Title="Schedule-Time Mode-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to set different time modes in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TimeMode.aspx.cs" Inherits="WebSampleBrowser.Schedule.TimeMode" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Time Mode</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="800px" CurrentDate="6/5/2017" TimeMode="Hour12">
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(document).ready(function () { $("#sampleProperties").ejPropertiesPanel(); });
        function onChange(args) {
            if (args.text == "12 Hours")
                $("#Schedule1").ejSchedule({ timeMode: "12" });
            else if (args.text == "24 Hours")
                $("#Schedule1").ejSchedule({ timeMode: "24" });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                   Time Mode
                </div>
                <div class="col-md-3">
                   <ej:DropDownList ClientIDMode="Static" runat="server" ID="ddlTimeMode" Width="115px" SelectedItemIndex="0" ClientSideOnChange="onChange" ClientSideOnSelect="onChange">
                        <Items>
                            <ej:DropDownListItem  Text="12 Hours" Value="Hour12"/>
                            <ej:DropDownListItem  Text="24 Hours" Value="Hour24"/>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

