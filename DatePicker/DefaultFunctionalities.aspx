<%@ Page Title="DatePicker-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="DefaultFunctionalities.aspx.cs"MetaDescription="This example demonstrates a simple, mobile-friendly and responsive ASP.NET Web Forms DatePicker to select a date." Inherits="WebSampleBrowser.DatePicker._default" %>

<asp:Content ID="Content7" ContentPlaceHolderID="ActionDescriptionSection" runat="server">
    <div>
        <p>
            This sample demonstrates about the Essential ASP.NET DatePicker control is created as a server side wrapper for Essential JavaScript DatePicker which allows user 
                to pick the date from Built-in calendar or directly enter the date value and supports client side and server side events.
        </p>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:DatePicker runat="server" ID="datepick" Width="100%"></ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
     .frame{
          width:30%;
          padding:50px;
      }
        </style>
</asp:Content>


