<%@ Page Title="Ribbon-Adaptive-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Adaptive.aspx.cs" MetaDescription="This example shows how the ASP.NET Web Ribbon adapts to mobile devices." Inherits="WebSampleBrowser.Ribbon.Adaptive" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Ribbon / Adaptive</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="emulatordesk">
        <div class="sample-container" style="padding-left: 31px; padding-top: 113px">
            <iframe src="AdaptiveRibbon.aspx" id="sample" frameborder="0" tabindex="1" style="height: 493px; width: 319px"></iframe>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
                window.loadRibbonFrameTheme = function () {
                    var browser = ej.browserInfo();
                    if (browser.name == "msie" && parseInt(browser.version, 10) <= 8)
                        alert("Details view not support in IE" + parseInt(browser.version, 10));
                    else {
                        var iframe = document.getElementById('sample');
                        iframe.contentWindow.postMessage("theme_" + window.theme, iframe.src);
                    }
            }
    </script>
</asp:Content>



