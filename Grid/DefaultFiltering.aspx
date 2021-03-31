<%@ Page Title="Grid-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains the default functionalities of filtering and how to define the template for filter bar in Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFiltering.aspx.cs" Inherits="WebSampleBrowser.Grid.DefaultFiltering" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Filtering /Default Filtering</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowFiltering="True" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80" >
                    <FilterBarTemplate Create="autoComplete_create" Write="autoComplete_write" Read ="autoComplete_read" />
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75">
                    <FilterBarTemplate Write="dropdown_write" Read="dropdown_read" />
                </ej:Column>
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}">
                    <FilterBarTemplate Write="numeric_write" Read ="numeric_read" />
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" />                              
            </Columns>
            
        </ej:Grid>
    </div>
</asp:Content>


<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
      
        function autoComplete_create(args) {
            return "<input>"
        }

        function autoComplete_write(args) {
			var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            var data = ej.DataManager(gridObj.model.dataSource).executeLocal(new ej.Query().select("CustomerID"));
            args.element.ejAutocomplete({ width: "100%", dataSource: data, enableDistinct: true, focusOut: ej.proxy(args.column.filterBarTemplate.read, this, args) });
        }

        function autoComplete_read(args) {
            this.filterColumn(args.column.field, "equal", args.element.val(), "and", true)
        }

        function dropdown_write(args) {
            var data = [{ text: "clear", value: "clear" }, { text: "1", value: 1 }, { text: "2", value: 2 }, { text: "3", value: 3 }, { text: "4", value: 4 },
                                                            { text: "5", value: 5 }, { text: "6", value: 6 }, { text: "7", value: 7 }, { text: "8", value: 8 }, { text: "9", value: 9 }
            ]
            args.element.ejDropDownList({ width: "100%", dataSource: data, change: ej.proxy(args.column.filterBarTemplate.read, this, args) })
        }

        function dropdown_read(args) {
            if (args.element.val() == "clear") {
                this.clearFiltering(args.column.field);
                args.element.val("")
            }
            this.filterColumn(args.column.field, "equal", args.element.val(), "and", true)
        }
        function numeric_write(args) {
            args.element.ejNumericTextbox({ width: "100%",decimalPlaces: 2, focusOut: ej.proxy(args.column.filterBarTemplate.read, this, args) });
        }

        function numeric_read(args) {
            this.filterColumn(args.column.field, "equal", args.element.val(), "and", true)
        }
    </script>
</asp:Content>

