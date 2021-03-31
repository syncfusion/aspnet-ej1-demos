<%@ Page Title="DateTimePicker-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like show, hide, enable, getValue and disable in a ASP.NET Web Forms DateTimePicker" Inherits="WebSampleBrowser.DateTimePicker.methods" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DateTimePicker ID="dateTime" runat="server" ClientSideOnChange="isChange" ClientSideOnClose="isClose" Width="100%" ClientSideOnOpen="isOpen" Value="05/28/2018 2:47 AM"></ej:DateTimePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="check21" DefaultText="Disable" ActiveText="Enable" Width="107px" ClientSideOnClick="changeState" runat="server"></ej:ToggleButton>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="getdatetime" Type="Button" Text="Get Value" Width="107px" runat="server" ClientSideOnClick="getdatetimeclick" />
                </div>
                <div class="col-md-12">
                    <ej:ToggleButton ID="check22" DefaultText="Show" ActiveText="Hide" ClientSideOnClick="changeVisible" Width="107px" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var dateTimeObj, togObj;
        $(function () {
            dateTimeObj = $('#<%=dateTime.ClientID%>').data("ejDateTimePicker");
            togObj = $("#<%=check22.ClientID%>").data('ejToggleButton');

            $("#updatetime").click(function () {
                dateTimeObj.setCurrentDateTime();
            });

            $("#sampleProperties").ejPropertiesPanel();
        });
        function changeVisible(args) {
            if (args.isChecked)
                dateTimeObj.show();
            else dateTimeObj.hide();
        }
        function changeState(args) {
            if (args.isChecked) {
                dateTimeObj.disable();
                togObj.disable();
            }
            else {
                dateTimeObj.enable();
                togObj.enable();
            }
        }
        function getdatetimeclick() {
            alert("Selected time is : " + dateTimeObj.getValue());
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
       .frame {
            padding: 50px;
            width: 30%;
        }
        putbtn {
            width: 95px;
        }

       </style>
</asp:Content>

