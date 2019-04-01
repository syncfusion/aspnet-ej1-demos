<%@ Page Title="Grid-Lock Row-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to disable editing for specific rows dynamically in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LockRow.aspx.cs" Inherits="WebSampleBrowser.Grid.LockRow" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Lock Row</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" OnServerEditRow="EditEvents_ServerEditRow"> 
            <ClientSideEvents ActionComplete="complete" BeginEdit="beginEdit" EndEdit="endEdit" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75" />
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="120" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" EditType="NumericEdit" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="Verified" HeaderText="Verified" Width="70" EditType="BooleanEdit" />
            </Columns>
            <EditSettings AllowEditing="True"></EditSettings>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Disable Row
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="autoDefault" runat="server" DataTextField="OrderID" Width="120px"
                        ShowCheckbox="True">
                    </ej:DropDownList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
        function beginEdit(args) {
            var selectItems =$('#<%= autoDefault.ClientID %>').ejDropDownList("model.value");
			if(selectItems != null)
				selectItems = selectItems.split(',');
            if ($.inArray(args.primaryKeyValue[0].toString(), selectItems) != -1)
                args.cancel = true;
        }      
        function endEdit(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
        function complete(args) {
            if (args.requestType == "refresh") {
                $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("hide");
            }
        }
    </script>
</asp:Content>

