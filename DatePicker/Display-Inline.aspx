<%@ Page Title="DatePicker-Display Inline-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Display-Inline.aspx.cs"MetaDescription="This example demonstrates how to show the DatePicker in the inline mode in ASP.NET Web Forms" Inherits="WebSampleBrowser.DatePicker.display_inline" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <ej:DatePicker ID="datepickerinline" TagName="div" DisplayInline="true" ShowFooter="false" ClientSideOnSelect="onSelected" runat="server"></ej:DatePicker>
        <div id="col-md-3">
            Select a date
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onSelected(args) {
            $("#col-md-3").html("Selected date : " + args.value);
        }
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
       .darktheme .frame, .frame {
            padding: 14px 0px 10px 0px;
            width: 350px;
        }
        .e-datepicker.e-popup {
            margin: 0 auto;
        }
        #col-md-3
        {
            margin-top:5px;
            margin-left: 25px;
        }   
    </style>
</asp:Content>

