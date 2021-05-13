<%@ Page Title="DatePicker-Date Format-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="Date-Format.aspx.cs"MetaDescription="This example demonstrates how to change the date format in the input field based on the format in a ASP.NET Web Forms DatePicker" Inherits="WebSampleBrowser.DatePicker.format" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DatePicker ID="dateformat" runat="server" Value="05/28/2018" DateFormat="MM/dd/yyyy" Width="100%"></ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <span>Select Format</span>
                </div>
                <div class="col-md-3">
                    <ej:DropDownList runat="server" ID="formatDD" TargetID="formatlist" ClientSideOnChange="onChange" Width="120px" SelectedItemIndex="0"></ej:DropDownList>
                    <div id="formatlist">
                        <ul>
                            <li>Default - MM/dd/yyyy</li>
                            <li>Short - d M, y</li>
                            <li>Medium - d MM, y</li>
                            <li>Full-dddd,d MMMM,yy</li>
                            <li>UTC - yyyy-MM-dd</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            var ddobject = $("#<%=formatDD.ClientID%>").data("ejDropDownList");
            $("#sampleProperties").ejPropertiesPanel();
        });
        function onChange(args) {
            var datebject = $("#<%=dateformat.ClientID%>").data("ejDatePicker");
            if (args.text == "Default - MM/dd/yyyy") datebject.setModel({ dateFormat: "MM/dd/yyyy" });
            else if (args.text == "Short - d M, y") datebject.setModel({ dateFormat: "d M, y" });
            else if (args.text == "Medium - d MM, y") datebject.setModel({ dateFormat: "d MM, y" });
            else if (args.text == "Full-dddd,d MMMM,yy") datebject.setModel({ dateFormat: "dddd,d MMMM,yy" });
            else if (args.text == "UTC - yyyy-MM-dd") datebject.setModel({ dateFormat: "yyyy-MM-dd" });
        }

    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame{
           padding:50px;
           width:30%;
        }
    </style>
</asp:Content>



