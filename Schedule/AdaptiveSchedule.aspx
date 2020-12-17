<%@ Page Title="Schedule-Adaptive-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This example shows how the ASP.NET Web Scheduler layout adapts to mobile devices." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AdaptiveSchedule.aspx.cs" Inherits="WebSampleBrowser.Schedule.AdaptiveSchedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Adaptive</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="emulatordesk">
        <div class="sample-container" style="padding-left: 31px; padding-top: 113px">
            <iframe src="Adaptive.aspx" id="sample" frameborder="0" tabindex="1" style="height: 493px; width: 319px"></iframe>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
		window.loadScheduleFrameTheme = function () {
			var iframe = document.getElementById('sample');
			iframe.contentWindow.postMessage("theme_" + window.theme, iframe.src);
		}
    </script>
</asp:Content>



