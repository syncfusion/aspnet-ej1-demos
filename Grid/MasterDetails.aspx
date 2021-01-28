<%@ Page Title="Grid-Master-Details-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to display master and detail grids in which the data of detail grid is changed based on the record selected in the master grid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="MasterDetails.aspx.cs" Inherits="WebSampleBrowser.Grid.MasterDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <script src="../Scripts/jsondata.min.js"></script>
    <span class="sampleName">Grid / Master-Details </span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        Master Grid
    </div>
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" AllowSelection="True">
            <Columns>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" IsPrimaryKey="true" TextAlign="Right" Width="100" />
                <ej:Column Field="FirstName" HeaderText="First Name" Width="100" />
                <ej:Column Field="LastName" HeaderText="Last Name" Width="100" />
                <ej:Column Field="Title" HeaderText="Title" Width="90" />
                <ej:Column Field="BirthDate" HeaderText="Birth Date" Width="100" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="Country" HeaderText="Country" Width="100" />
            </Columns>
        </ej:Grid>
    </div>
    <div>
        Details Grid
    </div>
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="False">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" />
                <ej:Column Field="OrderDate" HeaderText="Order Date" Width="80" TextAlign="Right" Format="{0:MM/dd/yyyy}" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            var $data = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance")._dataSource();
            $('#<%= EmployeesGrid.ClientID %>').ejGrid({
                selectedRowIndex: 0,
                rowSelected: function (args) {
                    var employeeId = args.data.EmployeeID;
                    var detaildata = ej.DataManager($data).executeLocal(ej.Query().where("EmployeeID", ej.FilterOperators.equal, employeeId, false).take(10));
                    var gridObj = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance");
                    gridObj.dataSource(ej.DataManager(detaildata.slice(0, 5)));
                }
            });
        });
    </script>
</asp:Content>

