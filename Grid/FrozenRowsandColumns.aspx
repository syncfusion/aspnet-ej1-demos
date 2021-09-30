<%@ Page Title="Grid-Frozen Rows and Columns-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to freeze the required number of rows and columns when the content is scrolled using Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="FrozenRowsandColumns.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.FrozenRowsandColumns" %>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Frozen Rows and Columns</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowScrolling="True">
            <ScrollSettings Height="330" Width="700" FrozenRows="1"></ScrollSettings>
            <EditSettings AllowAdding="True" AllowDeleting="True" AllowEditing="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" IsFrozen="True" TextAlign="Right" Width="90" >
                <ValidationRule>
                    <ej:KeyValue Key="required" Value="true" />
                    <ej:KeyValue Key="number" Value="true" />
                </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" IsFrozen="True" Width="100">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="minlength" Value="3" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="100">
                    <ValidationRule>
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                    </ej:Column>
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="90" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110"/>
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="170">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="OrderDate" HeaderText="Order Date" TextAlign="Right" Width="100"
                    Format="{0:MM/dd/yyyy}" EditType="DatePicker" />
                <ej:Column Field="ShipPostalCode" HeaderText="Postal Code" TextAlign="Right" Width="140" />
                <ej:Column Field="Verified" HeaderText="Verified" EditType="BooleanEdit" Width="100" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Frozen Columns
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="frozenColumns" runat="server" MaxValue="5" MinValue="1" Value="2" Width="120px" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Frozen Rows
                </div>
                <div class="col-md-3">
                    <ej:NumericTextBox ID="frozenRows" runat="server" MaxValue="5" MinValue="1" Value="1" Width="120px" />
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <ej:Button ID="set" runat="server" Type="Button" Text="Set" ClientSideOnClick="onClick" Width="120px"></ej:Button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Edit Mode
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="editMode" runat="server" SelectedItemIndex="0" ClientSideOnChange="change" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Normal" Value="0" />
                            <ej:DropDownListItem Text="Dialog" Value="1" />
                            <ej:DropDownListItem Text="InlineForm" Value="2" />
                            <ej:DropDownListItem Text="ExternalForm" Value="3" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
			var gridObj = $("#<%= OrdersGrid.ClientID %>").ejGrid("instance");
            scrolWidth = gridObj.model.scrollSettings.width / $(".cols-sample-area").width();
            if (gridObj.element.width() > $(".cols-sample-area").width()) {
                var scrollerwidth = Math.floor($(".cols-sample-area").width())
                gridObj.option("model.scrollSettings", { width: scrollerwidth })
                scrolWidth = 1;
            }
            $("#sampleProperties").ejPropertiesPanel();
        });
        function change(args) {
            $('#<%= OrdersGrid.ClientID %>').ejGrid("refreshContent");
            var dropObj = $('#<%= editMode.ClientID %>').data("ejDropDownList");
            var gridObj = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance");
            gridObj.option("model.editSettings.editMode", dropObj.selectedTextValue)
            if (gridObj.model.isEdit)
                gridObj.cancelEdit();
        }
        function onClick() {
            var scrolling = {};
            scrolling = { frozenRows: parseInt($('#<%= frozenRows.ClientID %>').ejNumericTextbox("model.value"), 10), frozenColumns: parseInt($('#<%= frozenColumns.ClientID %>').ejNumericTextbox("model.value"), 10), height: 330 };
            $('#<%= OrdersGrid.ClientID %>').ejGrid("model.scrollSettings", scrolling);
        }
    </script>
</asp:Content>

