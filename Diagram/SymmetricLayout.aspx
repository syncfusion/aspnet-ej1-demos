<%@ Page Title="Diagram-Symmetric Layout-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample visualizes a swimlane diagram of online purchase status and its designed with ASP.NET WEB diagram's built-in swimlane shapes." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SymmetricLayout.aspx.cs" Inherits="WebSampleBrowser.Diagram.SymmetricLayout" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script type="text/javascript">
        $(window).on("load", function () {
            $("#sampleProperties").ejPropertiesPanel();
        });


        function doLayout() {
            var diagram = $("#DiagramWebControl1").ejDiagram("instance");
            diagram.model.layout.margin.x = $("#marginX").ejNumericTextbox("instance").model.value
            diagram.model.layout.margin.y = $("#marginY").ejNumericTextbox("instance").model.value
            diagram.model.layout.maxIteration = $("#maximumiteration").ejNumericTextbox("instance").model.value
            diagram.model.layout.springFactor = $("#springfactor").ejNumericTextbox("instance").model.value
            diagram.model.layout.springLength = $("#springlength").ejNumericTextbox("instance").model.value
            diagram.layout();
        }
    </script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <ej:diagram clientidmode="Static" id="DiagramWebControl1" runat="server" height="550px" width="100%" enablecontextmenu="false">
        <SnapSettings SnapConstraints="None" />
    </ej:diagram>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>Layout Settings</b>
                </div>
            </div>
            <div class="row">
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Spring length
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox id="springlength" clientidmode="Static" width="100px" value="80" watermarktext="Horizontal Spacing" minvalue="1" maxvalue="10000" clientsideonchange="" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Spring Factor
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox id="springfactor" clientidmode="Static" width="100px" value="0.8" decimalplaces="1" incrementstep="0.1" watermarktext="Vertical Spacing" minvalue="0.1" maxvalue="3" clientsideonchange="" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Maximum Iteration
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox clientidmode="Static" id="maximumiteration" width="100px" value="500" watermarktext="Margin X" minvalue="1" maxvalue="1000" clientsideonchange="" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Margin X
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox clientidmode="Static" id="marginX" width="100px" value="0" watermarktext="Margin X" minvalue="-160" maxvalue="10000" clientsideonchange="" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Margin Y
                </div>
                <div class="col-md-6">
                    <ej:numerictextbox clientidmode="Static" id="marginY" width="100px" value="20" watermarktext="Margin Y" minvalue="-160" maxvalue="10000" clientsideonchange="marginYChange" name="numeric" runat="server" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                </div>
                <div class="col-md-6">
                    <ej:button id="ButtonNormal" runat="server" size="Normal" type="Reset" clientsideonclick="doLayout" showroundedcorner="true" text="Button"></ej:button>
                </div>
            </div>
            <div class="row">
            </div>
        </div>
    </div>
</asp:Content>


