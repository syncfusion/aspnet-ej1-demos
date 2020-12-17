<%@ Page Title="Grid-Edit Template-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how create a custom editor control for the datagrid cells when a row is edited in Syncfusion ASP.NET Web Forms DataGrid" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="EditTemplate.aspx.cs" Inherits="WebSampleBrowser.Grid.EditTemplate" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Edit Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" >
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90">
					<ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                    <EditTemplate Create="create" Read="read" Write="write" />
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" EditType="DropdownEdit" TextAlign="Right"  Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="ShipName" HeaderText="ShipName" Width="150" />
                <ej:Column Field="ShipCountry" HeaderText="ShipCountry" Width="90" EditType="DropdownEdit" />
            </Columns>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">        
    <script type="text/javascript">       
        function create() {
            return $("<input>");
        }

        function write(args) {
            obj = $('#<%= OrdersGrid.ClientID %>').ejGrid('instance');
            var data = ej.DataManager(obj.model.dataSource).executeLocal(new ej.Query().select("CustomerID"));
            args.element.ejAutocomplete({ width: "100%", dataSource: data, enableDistinct: true, value: args.rowdata !== undefined ? args.rowdata["CustomerID"] : "" });
        }

        function read(args) {
            args.ejAutocomplete('suggestionList').css('display', 'none');
            return args.ejAutocomplete("getValue");
        }
        $(function () {
            $('#<%= OrdersGrid.ClientID %>').keyup(function (e) {
                if ( e.keyCode == 40 && $(e.target).hasClass("e-autocomplete")) {
                    var gridid = $('#<%= OrdersGrid.ClientID %>').attr("id");
                    var autocomp = $("#" + gridid + "CustomerID").ejAutocomplete("instance")
                    if (autocomp.getValue() != "" && autocomp.getActiveText() != "No suggestions")
                        $(e.target).val(autocomp.getActiveText());
                }
            });
        });
    </script>
</asp:Content>




