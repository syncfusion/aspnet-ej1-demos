<%@ Page Title="DateTimePicker-Drilldown Support-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Drilldown.aspx.cs" MetaDescription="This example demonstrates the drill down navigaiton in DateTimPicker and its properties like interval, meridian and enable in a ASP.NET Web Forms " Inherits="WebSampleBrowser.DateTimePicker.Drilldown" %>

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
               <DateTimePickerDrillDown Enabled="true" Interval="5" ShowMeridian="false"/>
            </ej:DateTimePicker>
        </div>
    </div>
</asp:Content>


