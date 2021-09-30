<%@ Page Title="Diagram-BPMN Editor-ASP.NET-SYNCFUSION" Language="C#"  MetaDescription="This sample displays the ticket reservation system and its designed with ASP.NET WEB diagram’s built-in BPMN shapes feature." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="BPMNDiagram.aspx.cs" Inherits="WebSampleBrowser.Diagram.BPMNDiagram" %>

<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript" TagPrefix="ej" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src="../Scripts/ej.web.all.min.js" type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/Connectors.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/BPMNDiagram.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content runat="server" ID="ControlContent" ContentPlaceHolderID="ControlsSection">
    <div class="control_section">
        <div class="symPalette_section">
            <ej:SymbolPalette ClientIDMode="Static" ID="symbolpalette" runat="server">
            </ej:SymbolPalette>
        </div>
        <div class="middle_section"></div>
        <div class="diagram_section">
            <ej:Diagram ClientIDMode="Static" ID="DiagramContent" runat="server" Height="600px" Width="100%">
                <PageSettings ScrollLimit="Diagram" />
            </ej:Diagram>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">

            <div class="row" id="basic_shape1_prop">
                <div class="col-md-3 aligntop">
                    Shapes
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="basic_shape1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Event" Value="Event"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Gateway" Value="Gateway"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Message" Value="Message"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="BPMNEvents1_prop">
                <div class="col-md-3 aligntop">
                    BPMNEvents
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNEvents1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Start" Value="Start"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Intermediate" Value="Intermediate"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="End" Value="End"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="NonInterruptingStart" Value="NonInterruptingStart"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="NonInterruptingIntermediate" Value="NonInterruptingIntermediate"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ThrowingIntermediate" Value="ThrowingIntermediate"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="BPMNTriggers1_prop">
                <div class="col-md-3 aligntop">
                    BPMNTriggers
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNTriggers1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Message"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Timer"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Escalation"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Link"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Error"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Compensation"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Signal"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Multiple"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Parallel"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Cancel"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Conditional"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Terminate"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="BPMNGateways1_prop">
                <div class="col-md-3 aligntop">
                    BPMNGateway
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNGateways1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Exclusive"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Inclusive"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Parallel"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Complex"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="EventBased"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ExclusiveEventBased"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ParallelEventBased"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="BPMNDataObjects1_prop">
                <div class="col-md-3 aligntop">
                    DataObjects
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNDataObjects1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Input"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Output"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="CompensationShape1_prop">
                <div class="col-md-3 aligntop">
                    Compensation
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="CompensationShape1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Compensation"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="TaskCall1_prop">
                <div class="col-md-3 aligntop">
                    Call
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="TaskCall1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Call"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="AddHoc1_prop">
                <div class="col-md-3 aligntop">
                    AddHoc
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="AddHoc1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Ad-Hoc"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row" id="BPMNCollection1_prop">
                <div class="col-md-3 aligntop">
                    BPMNCollection
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNCollection1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Collection"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row" id="BPMNActivity1_prop">
                <div class="col-md-3 aligntop">
                    BPMNActivity
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNActivity1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Task"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="SubProcess"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row" id="BPMNLoops1_prop">
                <div class="col-md-3 aligntop">
                    BPMNLoops
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNLoops1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Standard"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="ParallelMultiInstance"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="SequenceMultiInstance"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row" id="BPMNTasks1_prop">
                <div class="col-md-3 aligntop">
                    BPMNTasks
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNTasks1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Service"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Receive"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Send"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="InstantiatingReceive"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Manual"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="BusinessRule"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="User"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Script"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Parallel"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row" id="BPMNSubProcess1_prop">
                <div class="col-md-3 aligntop">
                    SubProcess
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNSubProcess1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="None"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Transaction"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Event"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row" id="BPMNBoundary1_prop">
                <div class="col-md-3 aligntop">
                    Boundary
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNBoundary1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Default"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Call"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Event"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row" id="BPMNFlows1_prop">
                <div class="col-md-3 aligntop">
                    BPMNFlows
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="BPMNFlows1" SelectedItemIndex="0" ClientSideOnChange="dropDownChanged" Width="120px" ClientIDMode="Static" runat="server">
                        <Items>
                            <ej:DropDownListItem Text="Top"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Left"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Right"></ej:DropDownListItem>
                            <ej:DropDownListItem Text="Bottom"></ej:DropDownListItem>
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
</asp:Content>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
        .control_section {
            height: 600px;
            width: 100%;
            background-color: transparent;
        }

        .diagram_section {
            width: calc(100% - 235px);
            height: 600px;
            float: left;
        }

        .middle_section {
            float: left;
            width: 5px;
            height: 600px;
        }

        .symPalette_section {
            width: 230px;
            height: 600px;
            float: left;
        }
        .row .cols-prop-area {
            display: none;
        }

        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
    </style>
</asp:Content>

