<%@ Page Title="TreeGrid-Adaptive-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates fluid rendering functionality of the tree grid control in mobile, tablet, and desktop environments." AutoEventWireup="true" CodeBehind="Adaptive.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.TreeGrid.Adaptive" %>

<asp:content id="Content1" contentplaceholderid="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Adaptive</span>
</asp:content>

<asp:content id="Content2" runat="server" contentplaceholderid="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Adaptive TreeGrid
                </div>
                <div class="col-md-3">
                     <select id="columnName" class="e-ddl" data-bind="value: field">
                                <option value="320x493" >Mobile Mode</option>
                                <option value="613x364" selected="selected">Tablet Mode</option>
                            </select>
                </div>
        </div>
    </div>
</asp:content>

<asp:content id="ControlContent" runat="server" contentplaceholderid="ControlsSection">
    <div id="resMode" class="emulatortap">
        <div class="sample-container" style="padding-left: 31px; padding-top: 113px">
            <iframe src="AdaptiveTreegrid.aspx" id="sample" frameborder="0"  tabindex="1" style="height: 364px; width: 616px"></iframe>
        </div>
    </div>
</asp:content>

<asp:content id="ScriptContent" runat="server" contentplaceholderid="ScriptSection">
    <script type="text/javascript">
        var browser;
        $(function () {
            browser = ej.TreeGrid.prototype.getBrowserDetails();
            $("#sampleProperties").ejPropertiesPanel();
            var dropDownSlectedValue = $("#columnName option:selected").text();
            $("#columnName").ejDropDownList({ width: "120", change: "dropdownChange", text: dropDownSlectedValue });
        });
        window.loadTreeGridFrameTheme = function () {
                var iframe = document.getElementById('sample');
                iframe.contentWindow.postMessage("theme_" + window.theme, iframe.src);
            }

        function dropdownChange(args) {
            var str = args.selectedValue;
            if (args.text == "Mobile Mode") {
                var iframe = document.getElementById('sample');
                iframe.contentDocument.location.reload();
                $("#sample").parents().find("#resMode").removeClass("emulatortap").addClass("emulatordesk");
                $("#sample").css("width", str.split("x")[0]).css("height", str.split("x")[1]);
                $(".sample-container").css("padding-left", "31px").css("padding-top", "113px");
                $(".cols-prop-area").css("width", "").css("min-height", "").css("margin-left", "");
                $(".cols-sample-area").css("width", "71.956%");
            }
            else if (args.text == "Tablet Mode") {
                document.getElementById("sample").contentDocument.location.reload();
                $("#sample").parents().find("#resMode").removeClass("emulatordesk").addClass("emulatortap");
                $("#sample").css("width", str.split("x")[0]).css("height", str.split("x")[1]);
                $(".sample-container").css("padding-left", "31px").css("padding-top", "113px");
                $(".cols-prop-area").css("width", "").css("min-height", "").css("margin-left", "");
                $(".cols-sample-area").css("width", "100%");
            }
        }
    </script>
</asp:content>

