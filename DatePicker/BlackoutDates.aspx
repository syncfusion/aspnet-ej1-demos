<%@ Page Title="" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="BlackoutDates.aspx.cs" Inherits="WebSampleBrowser.DatePicker.BlackoutDates" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:DatePicker runat="server" ID="datepick" Value="5/17/2018" Width="100%"></ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
      .frame{
          width:30%;
          padding:50px;
      }
        </style>
</asp:Content>