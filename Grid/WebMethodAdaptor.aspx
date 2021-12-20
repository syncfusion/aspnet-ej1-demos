<%@ Page Title="Grid-WebMethod Adaptor-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to bind remote data to the datagrid and perform CRUD actions in server side using Syncfusion ASP.NET Web Forms DataGrid." AutoEventWireup="true" CodeBehind="WebMethodAdaptor.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.WebMethodAdaptor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / WebMethod Adaptor</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="FlatGrid" runat="server" AllowPaging="true" AllowGrouping="true" AllowFiltering="true" AllowSorting="true" ShowSummary="true" AllowSearching="true">
            <DataManager URL="WebMethodAdaptor.aspx/UrlDataSource" UpdateURL="WebMethodAdaptor.aspx/UrlUpdate" InsertURL="WebMethodAdaptor.aspx/UrlInsert" RemoveURL="WebMethodAdaptor.aspx/UrlDelete" Adaptor="WebMethodAdaptor" />
            <SummaryRows>
                <ej:SummaryRow Title="Sum" ShowGroupSummary="false">
                    <SummaryColumn>
                        <ej:SummaryColumn SummaryType="Sum" Format="{0:C}" DisplayColumn="Freight" DataMember="Freight" />
                    </SummaryColumn>
                </ej:SummaryRow>
            </SummaryRows>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel,search"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" EditType= "NumericEdit" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" EditType="Datepicker" Width="80" Format="{0:MM/dd/yyyy}">
                    <FilterBarTemplate Write="datepicker_write"/>
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110"/>
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        function datepicker_write(args) {
            args.element.ejDatePicker({ width: "100%"});
            args.element.keydown(function(e) {
            var datepickerObj = $(e.target).data("ejDatePicker");
            args.value = datepickerObj.model.value;
            if (e.keyCode == "13")  {
                var gridObj = $(".e-grid").data("ejGrid");
                gridObj.filterColumn(args.column.field, "equal", args.element.val(), "and", true)
            }
        });
    }
    </script>
</asp:Content>

