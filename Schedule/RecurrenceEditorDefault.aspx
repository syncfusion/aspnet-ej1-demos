<%@ Page Title="Schedule-Recurrence Editor-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example showcases recurrence rule generation based on the options selected from the recurrence editor in the ASP.NET Web Scheduler." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RecurrenceEditorDefault.aspx.cs" Inherits="WebSampleBrowser.Schedule.RecurrenceEditorDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Schedule / Recurrence Editor</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
	<div class="content-container-fluid">
		<div class="row">
			<div class="cols-sample-area" style="border:none;">
				<div style="margin: 0 15%;">
					<ej:RecurrenceEditor ClientIDMode="Static" ID="RecurrenceEditor1" SelectedRecurrenceType="2" runat="server" Create="onCreate"> </ej:RecurrenceEditor>
					<ej:Button ClientIDMode="Static" ID="donerecur1" runat="server"  Type="Button" Text="Generate Rule" ShowRoundedCorner="true" ClientSideOnClick="closerecurrence"></ej:Button>
				</div>
			</div>
		</div>
	</div>
	
	<div id="recurrenceAlert" style="display: none">
        <form id="token">
            <table width="100%" cellpadding="5">
                <tbody>
                    <tr>
                        <td colspan="2"><div id="ruleText"></div></td>
                    </tr>
                </tbody>
            </table>
        </form>
        <div style="padding-top:10px;">
            <button id="btncancel" style="margin: 0 40%;">Close</button>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#donerecur1").ejButton({ width: '155px', height: '35px', showRoundedCorner: true });
            $("#RecurrenceEditor1").after($("#donerecur1"));
            $("#btncancel").ejButton({ showRoundedCorner: true, size: "mini", click: "close" });
            $("#RecurrenceEditor1_recurrenceType").ejDropDownList({ popupHide: "drppopupshow" });
            $("#recurrenceAlert").ejDialog({ width: "auto", height: "auto", position: { X: 500, Y: 300 }, showOnInit: false, enableModal: true, title: "Recurrence Rule", enableResize: false, allowKeyboardNavigation: false, close: "close" });
            $("#RecurrenceEditor1").css({ border: "1px solid #c3c3c3", padding: "5px", marginBottom: "15px", width: "550px" });
            $("#donerecur1").css("margin-left", "40%");
        });
        function onCreate() {
            this.element.find("#recurrencetype_wrapper").css("width", "33%");
        }
        function closerecurrence() {
            $("#recurrenceAlert").ejDialog("open");
            var obj = $("#RecurrenceEditor1").data("ejRecurrenceEditor")
            obj.getRecurrenceRule();
            $("#recurrenceAlert").find("#ruleText").html(obj._recRule);
        }
        function drppopupshow(args) {
            var obj = $("#donerecur1").data("ejButton");
            if (args.model.selectedItemIndex == 0) obj.disable();
            else obj.enable();
        }
        function close() {
            $("#recurrenceAlert").ejDialog("close");
        }
    </script>
</asp:Content>

