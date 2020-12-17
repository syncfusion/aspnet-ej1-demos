<%@ Page Title="Grid-Keyboard Interaction-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains the key combinations used to perform corresponding grid actions in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="KeyboardInteraction.aspx.cs" Inherits="WebSampleBrowser.Grid.KeyboardInteraction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Keyboard Interaction</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowSorting="true" AllowPaging="True" AllowGrouping="True" ClientIDMode="Static">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="100" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="110" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="100" TextAlign="Right" Format="{0:MM/dd/yyyy}" EditType="Datepicker" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
            </Columns>
            <GroupSettings GroupedColumns="EmployeeID"></GroupSettings>
            <EditSettings AllowAdding="True" AllowDeleting="True" AllowEditing="True"></EditSettings>
        </ej:Grid>
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
                    <b>Ctrl + Home</b>
                </div>
                <div class="col-md-3 colwidth">
                    <p>
                        First Row Selection
                    </p>
                </div>
                <div class="col-md-3 colwidth">
                    <b>Ctrl+End</b>
                </div>
                <div class="col-md-3 colwidth">
                    Last Row Selection
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>PgDn</b>
                </div>
                <div class="col-md-3 colwidth">
                    Next page
                </div>
                <div class="col-md-3 colwidth">
                    <b>PgUp</b>
                </div>
                <div class="col-md-3 colwidth">
                    Previous page
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>F2</b>
                </div>
                <div class="col-md-3 colwidth">
                    Edit
                </div>
                <div class="col-md-3 colwidth">
                    <b>Enter</b>
                </div>
                <div class="col-md-3 colwidth">
                    Save request
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 colwidth">
                    <b>Ctrl + Down Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Expand All
                </div>
                <div class="col-md-3 colwidth">
                    <b>Ctrl + Up Arrow</b>
                </div>
                <div class="col-md-3 colwidth">
                    Collapse All
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
            if (e.altKey && e.keyCode === 74) {
                $("#OrdersGrid").focus();
            }
        });
    </script>
</asp:Content>

