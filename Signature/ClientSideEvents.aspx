<%@ Page Title="Signature-Client-Side Events-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates client-side events when pparticular operations are performed in the Syncfusion ASP.NET Web Forms Signature component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="ClientSideEvents.aspx.cs" Inherits="WebSampleBrowser.Signature.ClientSideEvents" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <h3>Sign here</h3>
            <ej:Signature ID="signature" Height="300px" StrokeWidth="3" IsResponsive="true" ClientSideOnValueChanged="onchange" runat="server" ClientSideOnMouseDown="onmousedown" ClientSideOnMouseMove="onmousemove" ClientSideOnMouseUp="onmouseup"></ej:Signature>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="EventSection" runat="server">
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="mouseDown" Text="mouseDown"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseMove" Text="mouseMove"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="mouseUp" Text="mouseUp"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>                       
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" Text="Clear" Type="Button" ClientSideOnClick="onClear" CssClass="eventclear e-btn" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" class="jsScript">

        function evtpropscheckedevent(args) {
            var target = $("#<%=signature.ClientID%>").data("ejSignature");
            if (args.isChecked) {
                switch (args.selectedValue) {
                    case "mouseDown": target.option(args.selectedValue, "onmousedown"); break;
                    case "mouseMove": target.option(args.selectedValue, "onmousemove"); break;
                    case "change": target.option(args.selectedValue, "onchange"); break;
                    case "mouseUp": target.option(args.selectedValue, "onmouseup"); break;
                }
            }
            else {
                target.option(args.selectedValue, null);
            }
        }

        function onmousedown(args) {
            jQuery.addEventLog("Signature <span class='eventTitle'>mousedown</span> is triggered.");
        }
        function onmousemove(args) {
            jQuery.addEventLog("Signature <span class='eventTitle'>mousemove</span> is triggered.");
        }
        function onmouseup(args) {
            jQuery.addEventLog("Signature <span class='eventTitle'>mouseup</span> is triggered.");
        }
        function onchange(args) {
            jQuery.addEventLog("Signature <span class='eventTitle'>change</span> is triggered.");
        }
        function onClear() {
            $("#EventLog").html("");
        }

    </script>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
        .frame {
            width:80%;
        }

    </style>

</asp:Content>

