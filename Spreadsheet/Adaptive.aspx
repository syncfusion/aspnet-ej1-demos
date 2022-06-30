<%@ Page Title="Spreadsheet-Adaptive-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This example shows how the ASP.NET Web Spreadsheet layout adapts to mobile,tablet,desktop devices." CodeBehind="Adaptive.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.SpreadsheetASP.Adaptive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Spreadsheet / Adaptive</span>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-spreadsheet">
            <div class="row">
                <div class="col-md-3">
                    Mode
                </div>
                <div class="col-md-3">
                    <select id="columnName" class="e-ddl" data-bind="value: field">
                        <option value="320x493">Mobile Mode</option>
                        <option value="613x364" selected="selected">Tablet Mode</option>
                        <option value="1000x444">Desktop Mode</option>
                    </select>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div id="resMode" class="emulatortap">
        <div class="sample-container" style="padding-left: 31px; padding-top: 113px">
            <iframe src="AdaptiveSpreadsheet.aspx" id="sample" frameborder="0" tabindex="1" style="height: 364px; width: 616px"></iframe>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            var dropDownSlectedValue = $("#columnName option:selected").text();
            $("#columnName").ejDropDownList({ width: "120", change: "dropdownChange", text: dropDownSlectedValue });
        });
        function dropdownChange(args) {
            var str = args.selectedValue, browser = ej.browserInfo();
            if (args.text == "Mobile Mode") {
                var iframe = document.getElementById('sample');
                iframe.contentWindow.postMessage("mobile", iframe.src);
                $("#sample").parents().find("#resMode").removeClass("emulatortap").addClass("emulatordesk");
                $("#sample").css("width", str.split("x")[0]).css("height", str.split("x")[1]);
                $(".sample-container").css("padding-left", "31px").css("padding-top", "113px");
                $(".cols-prop-area").css("width", "").css("min-height", "").css("margin-left", "");
                $(".cols-sample-area").css("width", "72.956%");
                $('#mobilview').css('display', "block");
            }

            else if (args.text == "Tablet Mode") {
                document.getElementById("sample").contentDocument.location.reload();
                $("#sample").parents().find("#resMode").removeClass("emulatordesk").addClass("emulatortap");
                $("#sample").css("width", str.split("x")[0]).css("height", str.split("x")[1]);
                $(".sample-container").css("padding-left", "31px").css("padding-top", "113px");
                $(".cols-prop-area").css("width", "").css("min-height", "").css("margin-left", "");
                if (browser.name == "msie")
                    $(".cols-sample-area").css("width", "100%");
                else
                    $(".cols-sample-area").css("width", "72.956%");
                $('#mobilview').css('display', "none");
            }
            else {
                var iframe = document.getElementById('sample');
                iframe.contentWindow.postMessage("desktop", iframe.src);
                $("#sample").parents().find("#resMode").removeClass("emulatortap").removeClass("emulatordesk");
                $("#sample").css("width", "100%").css("height", str.split("x")[1]);
                $(".sample-container").css("padding-left", "0px").css("padding-top", "0px");
                $(".cols-prop-area").css("width", "99%").css("min-height", "200px").css("margin-left", "0px");
                $(".cols-sample-area").css("width", "99%");
                $('#mobilview').css('display', "none");
            }
        }
    </script>
</asp:Content>


