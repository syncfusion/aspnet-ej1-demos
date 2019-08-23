<%@ Page Title="Grid-Adaptive Grid-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo shows the responsive behavior of Syncfusion ASP.NET Web Forms DataGrid control with respect to different client browsers’ width and height." AutoEventWireup="true" CodeBehind="Adapive.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ResponsiveGrid" %>

<asp:content id="Content1" contentplaceholderid="SampleHeading" runat="server">
    <span class="sampleName">Grid / Responsive</span>
</asp:content>

<asp:content id="Content2" runat="server" contentplaceholderid="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Responsive Grid
                </div>
                <div class="col-md-3">
                     <select id="columnName" class="e-ddl" data-bind="value: field">
                                <option value="320x493" >Mobile Mode</option>
                                <option value="613x364" selected="selected">Tablet Mode</option>
                                <option value="1000x363">Desktop Mode</option>
                            </select>
                </div>
             <div id="mobilview"style="display:none">
                            <div class="col-md-3">
                                DetailsView
                            </div>
                            <div class="col-md-3">
                                <input type="checkbox" id="enableDetailsView" />
                            </div>
                        </div>
            </div>
        </div>
    </div>
</asp:content>

<asp:content id="ControlContent" runat="server" contentplaceholderid="ControlsSection">
    <div id="resMode" class="emulatortap">
        <div class="sample-container" style="padding-left: 31px; padding-top: 113px">
            <iframe src="Adaptive.aspx" id="sample" frameborder="0"  tabindex="1" style="height: 364px; width: 616px"></iframe>
        </div>
    </div>
</asp:content>

<asp:content id="ScriptContent" runat="server" contentplaceholderid="ScriptSection">
    <script type="text/javascript">
        var browser;
        $(function () {
            browser = ej.Grid.prototype.getBrowserDetails();
            $("#sampleProperties").ejPropertiesPanel();
            var dropDownSlectedValue = $("#columnName option:selected").text();
            $("#columnName").ejDropDownList({ width: "120", change: "dropdownChange", text: dropDownSlectedValue });
            $("#enableDetailsView").ejCheckBox({
                "change": function (args) {
                    if (args.isInteraction) {
                        if (browser.browser == "msie" && parseInt(browser.version, 10) <= 9) {
                            alert("Details view not support in IE" + parseInt(browser.version, 10));
                            $("#enableDetailsView").ejCheckBox({ checked: false });
                        }
                        else {
                            var iframe = document.getElementById('sample');
                            iframe.contentWindow.postMessage(args.isChecked, iframe.src);
                        }
                    }
                }
            });
        });
            window.loadGridFrameTheme = function () {
                var iframe = document.getElementById('sample');
                iframe.contentWindow.postMessage("theme_" + window.theme, iframe.src);
            }

        function dropdownChange(args) {
            var str = args.selectedValue;
            if (args.text == "Mobile Mode") {
                $("#enableDetailsView").ejCheckBox({ checked: false });
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
                if (browser.browser == "msie")
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
</asp:content>


