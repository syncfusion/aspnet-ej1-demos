<%@ Page Title="Diagram-Shapes Gallery-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the flowchart diagram of an order placed using credit card and its designed with ASP.NET WEB diagram's built-in flow shapes feature." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DiagramShapes.aspx.cs" Inherits="WebSampleBrowser.Diagram.DiagramShapes" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Shapes.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Diagram ClientIDMode="Static" ID="DiagramWebControl1" runat="server" Height="600px" Width="100%" EnableContextMenu="false">
            <PageSettings ScrollLimit="Diagram" />
            <SnapSettings SnapConstraints="None" />
        </ej:Diagram>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <b>Shapes</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop" style="margin-right: -25px;">
                    Shapes
                </div>
                <div class="col-md-6">
                    <input type="text" id="shapes" />
                </div>
            </div>
        </div>
    </div>
    <div id="list">
        <ul>
            <li value="basicshapes">Basic Shapes</li>
            <li value="flowshapes">Flow Shapes</li>
            <li value="bpmnshapes">BPMN Shapes</li>
        </ul>
    </div>
</asp:Content>



