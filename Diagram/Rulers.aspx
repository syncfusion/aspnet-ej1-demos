<%@ Page Title="Diagram-Rulers-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates ASP.NET WEB diagram’s ruler behavior and its customization in the diagram." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Rulers.aspx.cs" Inherits="WebSampleBrowser.Diagram.Rulers" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src="../Scripts/ej.web.all.min.js" type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        function ticksChange(args) {
            updateSettings("ticks", args.value);
        }
        function segmentsChange(args) {
            updateSettings("segmentWidth", args.value);
        }
        function thicknessChange(args) {
            updateSettings("thickness", args.value);
        }
        function alignChanged(args) {
            updateSettings("align", args.value);
        }
        function markerChanged(args) {
            updateSettings("markerColor", args.value);
        }
        function arrangeChanged(args) {
            updateSettings("arrange", args.value);
        }



        function arrangeTick(args) {
            if (args.tickInterval % 100 == 0) {
                args.tickLength = 25;
            }
            else if (args.tickInterval % 50 == 0) {
                args.tickLength = 20;
            }
            else if (args.tickInterval % 20 == 0) {
                args.tickLength = 15;
            }
            else if (args.tickInterval % 10 == 0) {
                args.tickLength = 10;
            }
        }

        function showRulers(args) {
            $("#DiagramRuler").ejDiagram({
                rulerSettings: { showRulers: args.model.checked }
            });
        }

        function updateSettings(option, value) {
            var orientation = $("#orientation").ejDropDownList("instance");
            var diagram = $("#DiagramRuler").ejDiagram("instance");
            var rulerSettings;
            switch (option) {
                case "thickness":
                    if (orientation.model.itemValue === "horizontal")
                        rulerSettings = { horizontalRuler: { thickness: value } };
                    else
                        rulerSettings = { verticalRuler: { thickness: value } };
                    break;
                case "ticks":
                    if (orientation.model.itemValue === "horizontal")
                        rulerSettings = { horizontalRuler: { interval: value } };
                    else
                        rulerSettings = { verticalRuler: { interval: value } };
                    break;
                case "segmentWidth":
                    if (orientation.model.itemValue === "horizontal")
                        rulerSettings = { horizontalRuler: { segmentWidth: value } };
                    else
                        rulerSettings = { verticalRuler: { segmentWidth: value } };
                    break;
                case "align":
                    if (orientation.model.itemValue === "horizontal")
                        rulerSettings = { horizontalRuler: { tickAlignment: value } };
                    else
                        rulerSettings = { verticalRuler: { tickAlignment: value } };
                    break;

                case "markerColor":
                    if (orientation.model.itemValue === "horizontal")
                        rulerSettings = { horizontalRuler: { markerColor: value } };
                    else
                        rulerSettings = { verticalRuler: { markerColor: value } };
                    break;
                case "arrange":
                    rulerSettings = { horizontalRuler: { arrangeTick: "arrangeTick" }, verticalRuler: { arrangeTick: "arrangeTick" } };
                    break;
            }

            if (rulerSettings) {
                $("#DiagramRuler").ejDiagram({
                    rulerSettings: rulerSettings
                });
            }
        }

        $(window).on("load", function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <div class="control_section">
        <div class="diagram_section">
            <ej:diagram clientidmode="Static" id="DiagramRuler" runat="server" height="600px" width="100%">
                <PageSettings ScrollLimit="Diagram" />
            </ej:diagram>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">

            <div class="row">
                <div class="col-md-6">
                    <b>Ruler Settings</b>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3 aligntop">
                    Orientation
                </div>
                <div class="col-md-3">
                    <ej:dropdownlist id="orientation" selecteditemindex="0" clientsideonchange="dropDownChanged" width="110px" clientidmode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Horizontal" Value="horizontal"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Vertical" Value="vertical"></ej:DropDownListItem>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    Show Rulers
                </div>
                <div class="col-md-3">
                    <ej:checkbox id="multiplepage" clientidmode="Static" runat="server" checked="true" cssclass="multiplePage" clientsideonchange="showRulers"></ej:checkbox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    Interval
                </div>
                <div class="col-md-3">
                    <ej:numerictextbox clientidmode="Static" id="ticks" value="10" name="numeric" minvalue="0" maxvalue="50" width="110px" clientsideonchange="ticksChange" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    Segment Width
                </div>
                <div class="col-md-3">
                    <ej:numerictextbox clientidmode="Static" id="segmentWidth" value="100" name="numeric" minvalue="0" maxvalue="1000" width="110px" clientsideonchange="segmentsChange" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    Thickness
                </div>
                <div class="col-md-3">
                    <ej:numerictextbox clientidmode="Static" id="thickness" value="25" name="numeric" minvalue="5" maxvalue="150" width="110px" clientsideonchange="thicknessChange" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    Alignment
                </div>
                <div class="col-md-3">
                    <ej:dropdownlist id="align" value="rightorbottom" text="rightorbottom" clientsideonchange="alignChanged" width="110px" clientidmode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Right or Bottom" Value="rightorbottom"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Left or Top" Value="leftortop"></ej:DropDownListItem>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 aligntop">
                    Marker Color
                </div>
                <div class="col-md-3">
                    <ej:dropdownlist id="marker" value="red" text="Red" clientsideonchange="markerChanged" width="110px" clientidmode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Blue" Value="blue"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Red" Value="red"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Green" Value="green"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Yellow" Value="yellow"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Pink" Value="pink"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Black" Value="black"></ej:DropDownListItem>
                        </Items>
                    </ej:dropdownlist>
                </div>
            </div> 
        </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .control_section {
            height: 600px;
            width: 100%;
            background-color: transparent;
        }

        .diagram_section {
            width: 100%;
            height: 100%;
            float: left;
        }
    </style>
</asp:Content>

