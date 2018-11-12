<%@ Page Title="" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RepeatButton.aspx.cs" Inherits="WebSampleBrowser.Buttons.repeatbutton" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <table>
                <tr>
                    <td style="padding-left:40px">Repeat Button <br/> </br>
                        <ej:Button ID="RepeatButton" runat="server" Text="Click" Size="Large" ShowRoundedCorner="true" RepeatButton="true" ClientSideOnClick="buttonClick" Type="Button"></ej:Button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="ClearButton" runat="server" Text="Clear" ClientSideOnClick="onClear" Type="Button"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">

        $(function () {
            var btnObj = $("#<%=RepeatButton.ClientID%>").data("ejButton");
        });

        function buttonClick(e, ui) {
            jQuery.addEventLog("Repeat Button click<span class='eventTitle'> triggered. </span>");
        }

        function onClear() {
            jQuery.clearEventLog();
        }
    </script>
</asp:Content>


