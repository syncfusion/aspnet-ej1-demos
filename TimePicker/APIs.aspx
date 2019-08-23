<%@ Page Title="TimePicker-API's-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="APIs.aspx.cs" MetaDescription="This example demonstrates the various methods like show, hide, enable,setCurrentTime, getValue and disable in a ASP.NET Web Forms TimePicker" Inherits="WebSampleBrowser.TimePicker.methods" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:TimePicker ID="time" runat="server" Value="10:10 AM" Width="100%" ClientSideOnClose="onClose" clientSideOnOpen="onOpen"></ej:TimePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="check21" Type="Button" ActiveText="Enable" DefaultText="Disable" ClientSideOnChange="changeState" runat="server"></ej:ToggleButton>
                </div>
                <div class="col-md-12">
                    <ej:Button ID="gettime" CssClass="e-btn inputBtn" Type="Button" ClientSideOnClick="gettime" Text="Get Time" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:Button ID="updatetime" CssClass="e-btn inputBtn" Type="Button" ClientSideOnClick="updatetime" Text="Time Now" runat="server"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <ej:ToggleButton ID="showHide" Type="Button" ActiveText="Hide" DefaultText="Show" ClientSideOnChange="showhide" runat="server"></ej:ToggleButton>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var timeObj, tgleBtn;
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            timeObj = $("#<%=time.ClientID%>").data("ejTimePicker");
            tgleBtn = $("#<%=showHide.ClientID%>").data("ejToggleButton");
            $(".e-togglebutton").mousedown(function (e) {
                e.stopPropagation();
            });
        });

        function onClose(e) {
            tgleBtn.option('toggleState', false);
        }
        function onOpen(e) {
            tgleBtn.option('toggleState', true);
        }
        function gettime(args) {
            alert("Selected time is : " + timeObj.getValue());
        }
        function updatetime(args) {
            timeObj.setCurrentTime();
        }
        function changeState(args) {
            timeObj = $("#<%=time.ClientID%>").data("ejTimePicker");
            if (args.isChecked) {
                timeObj.disable();
                tgleBtn.disable();
            }
            else{
                 timeObj.enable();
                 tgleBtn.enable();
            }
        }
        function showhide(args) {
            (args.isChecked) ? timeObj.show() : timeObj.hide();
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .inputBtn, .e-togglebutton {
            width: 97px;
        }

        .control {
            width: 210px;
        }
    </style>
</asp:Content>

