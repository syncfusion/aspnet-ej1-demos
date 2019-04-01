<%@ Page Title="Grid-Detail Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to provide detailed view or additional information for each row of datagrid using custom controls or HTML elements in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="DetailTemplate.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.DetailTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Rows / Detail Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="EmployeesGrid" runat="server" DetailsTemplate="#tabGridContents">
            <ClientSideEvents DetailsDataBound="detailGridData" />
            <Columns>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="FirstName" HeaderText="First Name" Width="100" />
                <ej:Column Field="Title" HeaderText="Title" Width="120" />
                <ej:Column Field="City" HeaderText="City" Width="100" />
                <ej:Column Field="Country" HeaderText="Country" Width="100" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src="../Scripts/jsondata.min.js"></script>
    <script id="tabGridContents" type="text/x-jsrender">
        <div class="tabcontrol">
            <ul>
                <li><a href="#detailChart{{:EmployeeID}}">Stock Chart</a>
                </li>
                <li><a href="#gridTab{{:EmployeeID}}">Stock Grid</a>
                </li>
            </ul>
            <div id="detailChart{{:EmployeeID}}"></div>
            <div id="gridTab{{:EmployeeID}}">
                <div id="detailGrid"></div>
            </div>
        </div>
    </script>
    <script type="text/javascript">
        function detailGridData(e) {
            var filteredData = e.data["EmployeeID"];
            // the datasource "window.ordersView" is referred from jsondata.min.js
            var data = ej.DataManager(window.ordersView).executeLocal(ej.Query().where("EmployeeID", "equal", parseInt(filteredData), true));
            e.detailsElement.find("#detailGrid").ejGrid({
                dataSource: data,
                allowSelection: false,
                columns: [
                    { field: "OrderID", key: true, headerText: "Order ID", width: 80, textAlign: ej.TextAlign.Right },
                    { field: "CustomerID", headerText: 'Customer ID', width: 80, textAlign: ej.TextAlign.Left },
                    { field: "CompanyName", headerText: 'Company Name', width: 120, textAlign: ej.TextAlign.Left },
                    { field: "ShipCity", headerText: 'City', width: 120, textAlign: ej.TextAlign.Left }
                ]
            });
            e.detailsElement.css("display", "");
            e.detailsElement.find("#detailChart" + filteredData).ejChart({
                chartArea: {
                    border: { width: 1 }
                },
                primaryXAxis:
                {
                    rangePadding: 'none',
                    labelRotation: 45,
                    title: { text: "City" }
                },

                primaryYAxis:
                 {
                     title: { text: "Sales in Millions" }
                 },

                series: [{
                    name: 'Country', type: 'column',
                    enableAnimation: true,
                    dataSource: data,
                    xName: "ShipCity",
                    yName: "Freight",
                    fill: "#69D2E7",
                    tooltip: { visible: true, format: "#point.x# : #point.y# millions <br/>" }

                }
                ],
                load: "loadTheme",
                title: { text: 'Sales Report Analysis ' },
                canResize: true,
                size: { height: "435", width: "860" },
                legend: { visible: false }
            });
            e.detailsElement.find(".tabcontrol").ejTab({ selectedItemIndex: 1 });
        }
    </script>
</asp:Content>

