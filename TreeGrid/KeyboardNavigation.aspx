<%@ Page Title="TreeGrid-Keyboard Navigation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates interacting with the Syncfusion tree grid control using keyboard shortcuts." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="KeyboardNavigation.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.KeyboardNavigation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Keyboard Navigation</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ClientIDMode="Static" ID="TreeGridKeyboardNavigation" ChildMapping="Children" AllowKeyboardNavigation="true" AllowColumnResize="true" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="Task Id" Field="Id" Width="60" EditType="Numeric" />
                <ej:TreeGridColumn HeaderText="Task Name" Field="Name" EditType="String" />
                <ej:TreeGridColumn HeaderText="Start Date" Field="StartDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="End Date" Field="EndDate" EditType="Datepicker" />
                <ej:TreeGridColumn HeaderText="Progress" Field="PercentDone" EditType="Numeric" />
            </Columns>      
            <EditSettings AllowEditing="true" AllowAdding="true" AllowDeleting="true" EditMode="cellEditing" RowPosition="BelowSelectedRow" />      
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Keys</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Description</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Alt + j </b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Focus
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Home</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            <p>First row selection</p>
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>End</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Last row selection
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>F2</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Cell edit
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Enter</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Save request
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Delete</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Delete row
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Ctrl + Down arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Expand all
                        </div>
                        <div class="col-md-3 colwidth">
                            <b>Ctrl + Up arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Collapse all
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Left arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Collapse the selected row
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3 colwidth">
                            <b>Right arrow</b>
                        </div>
                        <div class="col-md-3 colwidth">
                            Expand the selected row
                        </div>
                    </div>
                </div>
    </div>
    <style>        
        *.colwidth{
            width: 32.9%;
        }
    </style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        $(document).on("keydown", function (e) {
            if (e.altKey && e.keyCode == 74) {
                $("#TreeGridKeyboardNavigation").focus();
            }
        });
    </script>
</asp:Content>

