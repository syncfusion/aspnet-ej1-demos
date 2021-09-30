<%@ Page Title="Diagram-HistoryManager-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates the history manager functionalities in the ASP.NET WEB diagram control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="HistoryManager.aspx.cs" Inherits="WebSampleBrowser.Diagram.HistoryManager" %>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">

    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/DiagramCommon.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Diagram/HistoryManager.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">

    <ej:Diagram ClientIDMode="Static" ID="DiagramContent" runat="server">
        <PageSettings ScrollLimit="Diagram" />
    </ej:Diagram>

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-6 aligntop">
                    <b>History Manager</b>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 aligntop">
                    Undo Stack
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ID="undoList" ClientIDMode="Static" Width="144px" WatermarkText="Select a action" ClientSideOnChange="undo" runat="server">
                    </ej:DropDownList>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 aligntop">
                    Redo Stack
                </div>
                <div class="col-md-6">
                    <ej:DropDownList ID="redoList" ClientIDMode="Static" Width="144px" WatermarkText="Select a action" ClientSideOnChange="redo" runat="server">
                    </ej:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    Stack Limit
                </div>
                <div class="col-md-6">
                    <ej:NumericTextBox ID="StackLimit" Width="120px" Value="3" MinValue="3" MaxValue="12" ClientSideOnChange="DiagramStack" Name="numeric" runat="server" />

                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                </div>
                <div class="col-md-6">
                    <ej:Button Text="Clear History" runat="server" ClientSideOnClick="clearHistory" Size="Mini" Width="110px" ShowRoundedCorner="true"></ej:Button>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="StyleSection">
    <style>
        .svg-rotate-ie:hover {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }

        .svg-rotate {
            cursor: url("../Content/ejthemes/common-images/diagram/Rotate.cur"),default;
        }
        
        .row .cols-sample-area {
            width: 67%;
        }

        .row .cols-prop-area {
            width: 31%;
        }
    </style>
</asp:Content>

