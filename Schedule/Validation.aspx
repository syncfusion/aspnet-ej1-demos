<%@ Page Title="Schedule-Validation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to set up validations in appointment window fields in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="WebSampleBrowser.Schedule.Validation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Validation</span>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" ShowLocationField="true">
            <CategorizeSettings Enable="true" AllowMultiple="false" Id="id" Color="color" FontColor="fontColor" Text="text">
            </CategorizeSettings>
            <AppointmentSettings Id="Id" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" />
        </ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
        SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $.validator.addMethod("customRule", function (value, element, options) {
                var ptn = /^[a-zA-Z0-9- ]*$/;
                return ptn.test(value);
            }, "Special character(s) not allowed in Location field");
        });
    </script>
</asp:Content>

