<%@ Page Title="KanbanBoard-Adaptive-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates the responsive behavior of the Syncfusion ASP.NET Web Forms Kanban component." Language="C#" AutoEventWireup="true" CodeBehind="AdapiveKanban.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Kanban.AdaptiveKanban" %>

<asp:content id="Content1" contentplaceholderid="SampleHeading" runat="server">
    <span class="sampleName">Kanban / Responsive</span>
</asp:content>

<asp:content id="Content2" runat="server" contentplaceholderid="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Responsive Mode
                </div>
                <div class="col-md-3">
                     <select id="columnName" class="e-ddl" data-bind="value: field">
                                <option value="320x493" selected="selected">Mobile Mode</option>
                                <option value="615x363">Tablet Mode</option>
                                <option value="1000x363">Desktop Mode</option>
                            </select>
                </div>
            </div>
        </div>
    </div>
</asp:content>

<asp:content id="ControlContent" runat="server" contentplaceholderid="ControlsSection">
    <div id="resMode" class="emulatordesk">
        <div class="sample-container" style="padding-left: 31px; padding-top: 113px">
            <iframe src="Adaptive.aspx" id="sample" frameborder="0"  tabindex="1" style="height: 364px; width: 616px"></iframe>
        </div>
    </div>
</asp:content>

<asp:content id="ScriptContent" runat="server" contentplaceholderid="ScriptSection">
    <script type="text/javascript">
        var browser;
        $(function () {
            browser = ej.browserInfo();
            $("#sampleProperties").ejPropertiesPanel();
            var dropDownSlectedValue = $("#columnName option:selected").text();
            $("#columnName").ejDropDownList({ width: "120", change: "dropdownChange", text: dropDownSlectedValue });
            var iframe = document.getElementById('sample'), browser = ej.browserInfo();
            $("#sample").parents().find("#resMode").removeClass("emulatortap").addClass("emulatordesk");
            $("#sample").css("width", "320").css("height", "493").css("margin-left", "");
            $('#mobilview').css('display', "block");
            $(".cols-sample-area").css("width", "72.956%").css("margin-left", "");
            $(".cols-prop-area").css("width", "95%");
            if (browser.name == "msie" && parseInt(browser.version, 10) <= 9) {
                alert("Details view not support in IE" + parseInt(browser.version, 10));
                var ddlObj = $("#columnName").data('ejDropDownList')
                ddlObj.setSelectedText("Desktop Mode");
            }
            else
                var iframe = document.getElementById('sample');
        });
            window.loadKanbanFrameTheme = function () {
                var iframe = document.getElementById('sample');
                iframe.contentWindow.postMessage("theme_" + window.theme, iframe.src);
            }

        function dropdownChange(args) {
            var str = args.selectedValue;
            var browser = ej.browserInfo();
            if (args.text == "Mobile Mode") {
                var iframe = document.getElementById('sample');
                $("#sample").parents().find("#resMode").removeClass("emulatortap").addClass("emulatordesk");
                $("#sample").css("width", str.split("x")[0]).css("height", str.split("x")[1]).css("margin-left", "");
                $('#mobilview').css('display', "block");
                $(".cols-sample-area").css("width", "72.956%").css("margin-left", "");
                 $(".cols-prop-area").css("min-height", "").css("margin-left", "");
                $(".sample-container").css({"padding-left":"31px","padding-top":"113px"});
                if (browser.name == "msie" && parseInt(browser.version, 10) <= 9) {
                    alert("Details view not support in IE" + parseInt(browser.version, 10));
                    var ddlObj = $("#columnName").data('ejDropDownList')
                    ddlObj.setSelectedText("Desktop Mode");
                }
                else
                    var iframe = document.getElementById('sample');
            }
           else if (args.text == "Tablet Mode") {
                var browser = ej.browserInfo();
                $("#sample").parents().find("#resMode").removeClass("emulatordesk").addClass("emulatortap");
                $("#sample").css("width", str.split("x")[0]).css("height", str.split("x")[1]);
                $(".cols-prop-area").css("min-height", "").css("margin-left", "");
                $(".sample-container").css({"padding-left":"31px","padding-top":"113px"});
                $(".cols-sample-area").css("width", "100%");
                $('#mobilview').css('display', "none");
            }
            else {
                var iframe = document.getElementById('sample');
                $("#sample").parents().find("#resMode").removeClass("emulatortap").removeClass("emulatordesk");
                $("#sample").css("width", "100%").css("height", str.split("x")[1]);
                $(".cols-prop-area").css("width", "99%").css("min-height", "180px").css("margin-left", "0px");
                $(".cols-sample-area").css("width", "99%");
                $('#mobilview').css('display', "none");
                $(".sample-container").css("padding", "");
            }
        }
    </script>
</asp:content>


