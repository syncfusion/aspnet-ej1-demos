<%@ Page Title="Slider-Client-Side Events-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="ClientSideEvents.aspx.cs" MetaDescription="This sample demonstrates the various client side events like create, slideout, slidestart, slidestop and change in a ASP.NET Web Forms Slider control."  Inherits="WebSampleBrowser.Slider.ClientSideEvents" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
        <ContentTemplate>
            <div class="frame">
                <ej:Slider ID="sliderEvents" runat="server" ClientSideOnChange="onchange" ClientSideOnCreate="oncreate" 
                           ClientSideOnSlide="onslide" SliderType="MinRange" Value="30" 
                           ClientSideOnStart="onstart" ClientSideOnStop="onstop"></ej:Slider>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="EventSection" runat="server">
    <%--    <asp:UpdatePanel ID="UpdateProp" UpdateMode="Always" runat="server">
        <ContentTemplate>--%>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
                <div class="pull-right">
                    <ej:DropDownList ID="selectControls" ClientSideOnPopupShown="adjustpopupposition" 
                                     ClientSideOnCheckChange="evtpropscheckedevent" ShowCheckbox="true" CheckAll="true" runat="server">
                        <Items>
                            <ej:DropDownListItem Value="start" Text="start"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="stop" Text="stop"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="change" Text="change"></ej:DropDownListItem>
                            <ej:DropDownListItem Value="slide" Text="slide"></ej:DropDownListItem>
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
                    <ej:Button ID="Clear" Type="Button" Text="Clear" ClientSideOnClick="onClear" CssClass="eventclear e-btn" 
                               runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
    <%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        var sliderObj;
        $(document).ready(function () {
            sliderObj = $("#<%=sliderEvents.ClientID%>").data("ejSlider");
        });

        function evtpropscheckedevent(args) {
            if (args.isChecked) {
                switch (args.model.itemValue) {
                    case "start": sliderObj.option(args.model.itemValue, "onstart"); break;
                    case "stop": sliderObj.option(args.model.itemValue, "onstop"); break;
                    case "change": sliderObj.option(args.model.itemValue, "onchange"); break;
                    case "slide": sliderObj.option(args.model.itemValue, "onslide"); break;
                }
            }
            else
                sliderObj.option(args.model.itemValue, null);
        }

        function oncreate() {
            jQuery.addEventLog("Slider has been <span class='eventTitle'>created</span>.");
        }
        function onstart(args) {
            jQuery.addEventLog("Slider has been <span class='eventTitle'>started</span> at " + args.value + ". <br/>");
        }
        function onstop(args) {
            jQuery.addEventLog("Slider has been <span class='eventTitle'>stopped</span> at " + args.value + ". <br/>");
        }
        function onchange(args) {
            jQuery.addEventLog("Slider value has been <span class='eventTitle'>changed</span> to " + args.value + ". <br/>");
        }
        function onslide(args) {
            jQuery.addEventLog("Slider is being <span class='eventTitle'>changed</span> to " + args.value + ".");
        }
        function onClear() {
            $("#EventLog").html("");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .e-slider-wrap.e-horizontal .e-handle {
            top: -3px;
        }

        .e-slider-wrap.e-vertical .e-handle {
            left: -3px;
        }

        .frame {
            width: 50%;
            margin:0 auto;
        }
    </style>
</asp:Content>

