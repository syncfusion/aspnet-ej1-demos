<%@ Page Title="Schedule-Vertical View-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example shows how the calendars of multiple resources are grouped in default view layouts in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ResourceGrouping.aspx.cs" Inherits="WebSampleBrowser.Schedule.ResourceGrouping" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Resource Grouping</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
<ej:Schedule ClientIDMode="Static" runat="server" ID="Schedule1" DataSourceID="SqlData" Width="100%" Height="525px" CurrentDate="6/5/2017" CurrentView="Workweek">
    <Resources>
        <ej:Resources Field="RoomId" Name="Rooms" Title="Room" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text">
            </ResourceSettings>
        </ej:Resources>
        <ej:Resources Field="OwnerId" Name="Owners" Title="Owner" AllowMultiple="true">
            <ResourceSettings Color="color" Id="id" Text="text" GroupId="groupId">
            </ResourceSettings>
        </ej:Resources>
         
    </Resources>
    <Group Resources="Rooms,Owners"/>
    <AppointmentSettings Id="Id" Subject="Subject" AllDay="AllDay" StartTime="StartTime" EndTime="EndTime" Description="Description" Recurrence="Recurrence" RecurrenceRule="RecurrenceRule" ResourceFields="RoomId,OwnerId"/>
</ej:Schedule>
    </div>
    <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:ScheduleConnectionString %>"
            SelectCommand="SELECT * FROM [MultipleResource]"></asp:SqlDataSource>
</asp:Content>



