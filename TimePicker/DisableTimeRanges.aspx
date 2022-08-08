<%@ Page Title="TimePicker-Disable Time Ranges-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master"
MetaDescription="This example demonstrates how the disable the specific range of time in a ASP.NET Web Forms TimePicker" CodeBehind="DisableTimeRanges.aspx.cs" Inherits="WebSampleBrowser.TimePicker.DisableTimeRanges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:TimePicker ID="time" runat="server" Width="100%" Value="12:00 AM">
                <DisableTimeRanges>
                    <ej:DisableTimeRange StartTime="3:00 AM" EndTime="6:00 AM" />
                    <ej:DisableTimeRange StartTime="12:00 PM" EndTime="3:00 PM" />
                    <ej:DisableTimeRange StartTime="8:00 PM" EndTime="10:00 PM" />
                </DisableTimeRanges>
            </ej:TimePicker>
        </div>
    </div>
</asp:Content>

