<%@ Page Title="Grid-Dialog Editing-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to edit a datagrid record in the Dialog mode using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DialogOnLocalData.aspx.cs" Inherits="WebSampleBrowser.Grid.DialogOnLocalData" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Dialog on local data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" OnServerEditRow="EditEvents_ServerEditRow" OnServerAddRow="EditEvents_ServerAddRow"
                    OnServerDeleteRow="EditEvents_ServerDeleteRow">
                    <ClientSideEvents ActionComplete="complete" EndAdd="endAdd" EndDelete="endDelete" EndEdit="endEdit" />
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
                                <ej:KeyValue Key="minlength" Value="3" />
                            </ValidationRule>
                        </ej:Column>
                        <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit">
                            <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                        </ej:Column>
                        <ej:Column Field="ShipName" HeaderText="ShipName" Width="110"></ej:Column>
                        <ej:Column Field="ShipCountry" HeaderText="ShipCountry" Width="90" EditType="DropdownEdit" />
                    </Columns>
                    <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True" EditMode="Dialog"></EditSettings>
                    <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
                </ej:Grid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Edit Mode
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="editMode" runat="server" ClientSideOnChange="selectChange"
                        SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Dialog Mode" Value="0" />
                            <ej:DropDownListItem Text="Template Mode" Value="1" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/template" id="template">
        <b>Order Details</b>
        <table cellspacing="10">
            <tr>
                <td style="text-align: right;">Order ID
                </td>
                <td style="text-align: left">
                    <input id="OrderID" name="OrderID" value="{{: OrderID}}" disabled="disabled"
                        class="e-field e-ejinputtext valid e-disable" style="text-align: right; width: 116px; height: 28px" />
                </td>
                <td style="text-align: right;">Customer ID
                </td>
                <td style="text-align: left">
                    <input id="CustomerID" name="CustomerID" value="{{: CustomerID}}" class="e-field e-ejinputtext valid"
                        style="width: 116px; height: 28px" />
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">Freight
                </td>
                <td style="text-align: left">
                    <input type="text" id="Freight" name="Freight" value="{{:Freight}}" />
                </td>
                <td style="text-align: right;">ShipCountry
                </td>
                <td style="text-align: left">
                    <select id="ShipCountry" name="ShipCountry">
                        <option value="Germany">Germany</option>
                        <option value="Mexico">Mexico</option>
                        <option value="UK">UK</option>
                        <option value="Sweden">Sweden</option>
                        <option value="France">France</option>
                        <option value="Italy">Italy</option>
                        <option value="Spain">Spain</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">ShipName
                </td>
                <td style="text-align: left">
                    <input id="ShipName" name="ShipName" class="e-field e-ejinputtext valid"
                        style="width: 116px; height: 28px" value="{{:ShipName}}" />
                </td>
                <td style="text-align: right;">EmployeeID
                </td>
                <td style="text-align: left">
                    <input id="EmployeeID" name="EmployeeID" class="e-field e-ejinputtext valid"
                        style="width: 116px; height: 28px" value="{{:EmployeeID}}" />
                </td>
            </tr>
        </table>
    </script>
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        });
        function EndRequestHandler(e) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
			var dropObj = $('#<%= editMode.ClientID %>').data("ejDropDownList");
            if (dropObj.getValue() == "Dialog Mode")
                $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { "editSettings": { editMode: "dialog" } });
            else
                $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { "editSettings": { editMode: "dialogtemplate", dialogEditorTemplateID: "#template" } });
        }
        function endAdd(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
        function endDelete(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
        function endEdit(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
        function selectChange(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            if (gridObj != undefined) {
                gridObj.clearSelection();
                if (gridObj.model.isEdit)
                    $('#<%= OrdersGrid.ClientID %>').ejGrid("cancelEdit");
                if (args.itemId == 1)
                    $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { "editSettings": { editMode: "dialogtemplate", dialogEditorTemplateID: "#template" } });
                else
                    $('#<%= OrdersGrid.ClientID %>').ejGrid("option", { "editSettings": { editMode: "dialog" } });
            }
        }
        function complete(args) {
            if (args.requestType == "refresh" || args.requestType == "save") {
                $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("hide");
            }
            if ((args.requestType == "beginedit" || args.requestType == "add") && args.model.editSettings.editMode == "dialogtemplate") {
                $("#Freight").ejNumericTextbox({ value: parseFloat($("#Freight").val()), width: "116px", height: "28px", decimalPlaces: 2 });
                $("#EmployeeID").ejNumericTextbox({ value: $("#EmployeeID").val(), width: "116px", height: "28px" });
                $("#ShipCountry").ejDropDownList({ width: '116px' });
                if (args.requestType == "beginedit") {
                    $("#OrderID").attr("disabled", "disabled");
                    $("#ShipCountry").ejDropDownList("setSelectedValue", args.row.children().eq(4).text());
                }
            }
        }
    </script>
</asp:Content>

