<%@ Page Title="Grid-Cell Edit Type-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to set different edit types and how to define edit params for the datagrid columns in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CellEditType.aspx.cs" Inherits="WebSampleBrowser.Grid.CellEditType" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <link href="../Content/ejthemes/responsive-css/ejgrid.responsive.css" rel="stylesheet" />
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Cell Edit Type</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" OnServerEditRow="EditEvents_ServerEditRow" 
            OnServerAddRow="EditEvents_ServerAddRow" OnServerDeleteRow="EditEvents_ServerDeleteRow" IsResponsive="true" EnableResponsiveRow="true">
            <ClientSideEvents EndAdd="endAdd" EndDelete="endDelete" EndEdit="endEdit" ActionComplete="complete" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="minlength" Value="3" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="90" TextAlign="Right" Format="{0:MM/dd/yyyy HH:mm:ss}"
                    EditType="DateTimePicker" Priority="4" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="70" EditType="DropdownEdit" Priority="2"/>
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit" Priority="3">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" EditType="DropdownEdit" Priority="4"/>
                <ej:Column Field="Verified" HeaderText="Verified" Width="80" EditType="BooleanEdit" Priority="5"></ej:Column>
            </Columns>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">        
    <script type="text/javascript">
        function endAdd(args) {
            $("#OrdersGrid").ejWaitingPopup("show");
        }
        function endDelete(args) {
            $("#OrdersGrid").ejWaitingPopup("show");
        }
        function endEdit(args) {
            $("#OrdersGrid").ejWaitingPopup("show");
        }
        function complete(args) {
            if (args.requestType == "refresh" || args.requestType == "save") {
                $("#OrdersGrid").ejWaitingPopup("hide");
            }
        }
    </script>
</asp:Content>

