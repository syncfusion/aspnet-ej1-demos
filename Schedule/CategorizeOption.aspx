<%@ Page Title="Schedule-Appointment Categorize-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how to set categories for appointments in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CategorizeOption.aspx.cs" Inherits="WebSampleBrowser.Schedule.CategorizeOption" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule  ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017">
     <ContextMenuSettings Enable="true">
        <MenuItems>
            <AppointmentCollection>
                <ej:Appointment Id="open" Text="Open Appointment" />
                <ej:Appointment Id="delete" Text="Delete Appointment" />
                <ej:Appointment Id="custommenu3" Text="Custom menu3" />
                <ej:Appointment Id="custommenu4" Text="Custom menu4" />
                <ej:Appointment Id="categorize" Text="Categorize" />
            </AppointmentCollection>
            <CellsCollection>
                <ej:Cells Id="new" Text="New Appointment" />
                <ej:Cells Id="recurrence" Text="New recuring Appointment" />
                <ej:Cells Id="today" Text="Today" />
                <ej:Cells Id="gotodate" Text="Go to Date" />
                <ej:Cells Id="settings" Text="Settings"/>
                <ej:Cells Id="view" Text="view" ParentId="settings"/>
                <ej:Cells Id="timemode" Text="Time Mode" ParentId="settings"/>
                <ej:Cells Id="view_Day" Text="Day" ParentId="view"/>
                <ej:Cells Id="view_Week" Text="Week" ParentId="view"/>
                <ej:Cells Id="view_Workweek" Text="Workweek" ParentId="view"/>
                <ej:Cells Id="view_Month" Text="Month" ParentId="view"/>
                <ej:Cells Id="timemode_Hour12" Text="12 Hours" ParentId="timemode"/>
                <ej:Cells Id="timemode_Hour24" Text="24 Hours" ParentId="timemode"/>
                <ej:Cells Id="workhours" Text="Work Hours" ParentId="settings"/>
                <ej:Cells Id="custommenu1" Text="Custom Menu1"/>
                <ej:Cells Id="custommenu2" Text="Custom Menu2"/>
            </CellsCollection>
            </MenuItems>
    </ContextMenuSettings>
    <CategorizeSettings Enable="true" AllowMultiple="true" Id="id" Color="color" FontColor="fontColor" Text="text">
    </CategorizeSettings>
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" Categorize="Categorize"/>
</ej:Schedule>

    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [DefaultSchedule]"></asp:SqlDataSource>

</asp:Content>

