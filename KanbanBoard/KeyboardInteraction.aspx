<%@ Page Title="KanbanBoard-Keyboard Interaction-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to access the Syncfusion ASP.NET Web Forms Kanban component functionalities using keyboard interactions." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardInteraction.aspx.cs" Inherits="WebSampleBrowser.Kanban.KeyboardInteraction" %>

<asp:Content ID="Content5" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">KanbanBoard / KeyboardInteraction</span>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ControlsSection">
    <ej:Kanban ID="KanbanBoard" runat="server" SelectionType="Multiple" AllowScrolling="true" AllowKeyboardNavigation="true" AllowTitle="true" KeyField="Status">
        <ScrollSettings Width="700" Height="500" />
        <Columns>
            <ej:KanbanColumn HeaderText="Backlog" Key="Open" />
            <ej:KanbanColumn HeaderText="In Progress" Key="InProgress" />
            <ej:KanbanColumn HeaderText="Testing" Key="Testing" />
            <ej:KanbanColumn HeaderText="Done" Key="Close" />
        </Columns>
        <Fields Content="Summary" ImageUrl="ImgUrl" PrimaryKey="Id" SwimlaneKey="Assignee" />
        <EditSettings AllowAdding="true" AllowEditing="true" EditMode="Dialog">
            <EditItems>
                <ej:KanbanEditItem EditType="String" Field="Id">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Status"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Dropdown" Field="Assignee"></ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="Numeric" Field="Estimate">
                    <NumericEditOptions DecimalPlaces="2" />
                    <ValidationRules>
                        <ej:KeyValue Key="range" Value="[0, 1000]" />
                    </ValidationRules>
                </ej:KanbanEditItem>
                <ej:KanbanEditItem EditType="TextArea" Field="Summary">
                    <ValidationRules>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRules>
                </ej:KanbanEditItem>
            </EditItems>
        </EditSettings>
    </ej:Kanban>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-kanban">
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Keys</b>
                </div>
                <div class="col-md-3 colwidth">
                    <b>Description</b>
                </div>
                <div class="col-md-3 colwidth">
                    <b>Alt + j</b>
                </div>
                <div class="col-md-3 colwidth">
                    <p>Focus</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Insert</b>
                </div>
                <div class="col-md-3 colwidth">
                    Insert Card
                </div>
                <div class="col-md-3 colwidth">
                    <b>Delete</b>
                </div>
                <div class="col-md-3 colwidth">
                    <p>Delete Card</p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Home</b>
                </div>
                <div class="col-md-3 colwidth">
                    First Card Selection
                </div>
                <div class="col-md-3 colwidth">
                    <b>End</b>
                </div>
                <div class="col-md-3 colwidth">
                    Last Card Selection
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Ctrl + Down Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Swimlane Expand All
                </div>
                <div class="col-md-3 colwidth">
                    <b>Ctrl + Up Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Swimlane Collapse All
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>F2</b>
                </div>
                <div class="col-md-3 colwidth">
                    Edit Card
                </div>
                <div class="col-md-3 colwidth">
                    <b>Enter</b>
                </div>
                <div class="col-md-3 colwidth">
                    Save Request
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Esc</b>
                </div>
                <div class="col-md-3 colwidth">
                    Cancel Request
                </div>
                <div class="col-md-3 colwidth">
                    <b>Shift + UpArrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Multi Selection By Up Arrow
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Shift + Down Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Multi Selection By Down Arrow
                </div>
                <div class="col-md-3 colwidth">
                    <b>Shift + Left Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Multi Selection By Left Arrow
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Shift + Right Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Multi Selection By Right Arrow
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        $(document).on("keydown", function (e) {
            if (e.altKey && e.keyCode === 74) { // j- key code.
                $("#LayoutSection_ControlsSection_KanbanBoard").focus();
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .cols-prop-area [class^="span"] {
            margin-bottom: 5px;
            margin-top: 5px;
        }
        .propertiesdiv {
            height: 626px;
        }
        .propertypanelcontent {
            height: 585px;
        }
        *.colwidth {
            width: 32.9%;
        }
    </style>
</asp:Content>

