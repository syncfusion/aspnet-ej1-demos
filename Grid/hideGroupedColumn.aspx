<%@ Page Title="Grid-Hide Grouped Columns-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to show or hide the grouped column from the list of columns displayed in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="HideGroupedColumn.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.hideGroupedColumn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Grouping / Hide Grouped Columns</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowGrouping="True" AllowPaging="True">
            <ClientSideEvents ColumnDragStart="dragHeader" />
            <GroupSettings ShowGroupedColumn="False" GroupedColumns="EmployeeID"></GroupSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right"
                    Width="75" AllowGrouping="False" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="110" />
            </Columns>
        </ej:Grid>
        <ej:Dialog ID="alertDialog" runat="server" Title="Alert" ShowOnInit="False">
            <DialogContent>
                <div>
                    Grouping is disabled for this column
                <br />
                    <ej:Button ID="ok" CssClass="e-btnok" runat="server" Text="OK"></ej:Button>
                </div>
            </DialogContent>
        </ej:Dialog>
    </div>
    <style>
    .e-btnok {
        position: relative;
        left: 168px;
    }
</style>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function dragHeader(args) {
            if (args.draggableType == "headercell" && $(args.target).text() == "Order ID") {
                $("#LayoutSection_ControlsSection_alertDialog").ejDialog("open");
                $("#LayoutSection_ControlsSection_alertDialog_ok").ejButton({ click: "close" });
            }
        }
        function close() {
            $("#LayoutSection_ControlsSection_alertDialog").ejDialog("close");
        }
    </script>
    

</asp:Content>       

