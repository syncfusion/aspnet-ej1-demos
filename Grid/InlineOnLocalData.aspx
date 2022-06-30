<%@ Page Title="Grid-Inline Editing-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to edit the records of datagrid in inline mode using Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="InlineOnLocalData.aspx.cs" Inherits="WebSampleBrowser.Grid.InlineOnLocalData" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Inline on local data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
     <div style="position:relative">
        <asp:UpdatePanel runat="server">
            <ContentTemplate>
                <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True"  AllowTextWrap="true" OnServerEditRow="EditEvents_ServerEditRow"
                    OnServerAddRow="EditEvents_ServerAddRow" OnServerDeleteRow="EditEvents_ServerDeleteRow">
                    <ClientSideEvents ActionComplete="complete" EndAdd="endAdd" EndDelete="endDelete" EndEdit="endEdit" />
                    <Columns>
                        <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="80">
                            <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                                <ej:KeyValue Key="number" Value="true" />
                            </ValidationRule>
                        </ej:Column>
                        <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80">
                            <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                                <ej:KeyValue Key="minlength" Value="3" />
                            </ValidationRule>
                        </ej:Column>
                        <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" EditType="DropdownEdit" Width="80" />
                        <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit">
                            <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                        </ej:Column>
                        <ej:Column Field="ShipCountry" HeaderText="ShipCountry" Width="90" EditType="DropdownEdit" />
                        <ej:Column Field="ShipName" HeaderText="ShipName" Width="180" />
                        
                    </Columns>
                    <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
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
                    Add New Row Position
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="rowPosition" runat="server" ClientSideOnChange="selectChange" SelectedItemIndex="0" Width="120px">
                        <Items>
                            <ej:DropDownListItem Text="Top" Value="top" />
                            <ej:DropDownListItem Text="Bottom" Value="bottom" />
                        </Items>
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        });
        function EndRequestHandler(e) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
			var dropObj = $('#<%= rowPosition.ClientID %>').data("ejDropDownList");
            if (dropObj.getValue() == "Top")
                gridObj.model.editSettings.rowPosition = "top";
            else
                gridObj.model.editSettings.rowPosition = "bottom";
        }
        function selectChange(args) {
	    $('#<%= OrdersGrid.ClientID %>').ejGrid("cancelEdit");
            $('#<%= OrdersGrid.ClientID %>').ejGrid("model.editSettings.rowPosition", args.value);
        }
    </script>
</asp:Content>



