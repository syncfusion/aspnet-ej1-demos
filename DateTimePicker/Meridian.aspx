<%@ Page Title="DateTimePicker-Meridian Format-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Meridian.aspx.cs"  MetaDescription="This example demonstrates how to enable the time merdian support in dateTimePicker by using the properties like interval, meridian and enable in a ASP.NET Web Forms" Inherits="WebSampleBrowser.DateTimePicker.Meridian" %>

<asp:Content ID="Content1" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
           .frame {
            padding: 50px;
            width: 30%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateTimePicker ID="dateTime" runat="server" Width="100%" Value="05/28/2018 2:47 AM">    
               <DateTimePickerDrillDown Enabled="true" Interval="5" ShowMeridian="true"/>
            </ej:DateTimePicker>
        </div>
    </div>
</asp:Content>


