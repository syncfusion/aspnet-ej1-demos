<%@ Page Title="Grid-Real Time Binding-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to perform live updates of records in datagrid by different users in different networks using SignalR concept in Syncfusion ASP.NET Web Forms DataGrid." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RealTimeBinding.aspx.cs" Inherits="WebSampleBrowser.Grid.RealTimeBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Real Time Binding</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <EditSettings AllowAdding="True" AllowDeleting="True" AllowEditing="True" EditMode="Normal"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90" >
                    <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="90" >
                    </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" EditType="DropdownEdit" Width="90" >
                    <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                            </ValidationRule>
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" EditType="NumericEdit" Format="{0:C}">
                      <ValidationRule>
                                <ej:KeyValue Key="required" Value="true" />
                                <ej:KeyValue Key="number" Value="true" />
                            </ValidationRule>
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="ShipName" HeaderText="Ship Name" Width="150" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="90" EditType="DropdownEdit" />
            </Columns>
            <ClientSideEvents ActionBegin="actionBegin" />
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div>
                <strong>Recent Change Logs (Your User Name : <span id="userName">user8613</span>)</strong><br />
                <br />
                <ul id="log" style="background-color: White; display: block"></ul>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script src="../Scripts/jquery.signalR-1.1.4.min.js" type="text/javascript"></script>
    <script src='<%: ResolveClientUrl("~/signalr/hubs") %>' type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
            
            window.signal = $.connection.signalHub;
            window.signal.client.modify = function (userIp, action, details) {
                if (action == "delete") {
                    var gridObj = $('#<%= OrdersGrid.ClientID %>').ejGrid("instance");
                    var dm = ej.DataManager(gridObj.model.dataSource);
                    var data = dm.executeLocal(ej.Query().where("OrderID", ej.FilterOperators.equal, details.OrderID))
                    if (data.length)
                        $("#log").append("<li>" + ej.format(new Date(), "hh:mm:ss") + " : " + userIp + " has " + action + " a record with OrderID =" + details.OrderID + "</li>");
                }
                else
                    $("#log").append("<li>" + ej.format(new Date(), "hh:mm:ss") + " : " + userIp + " has " + action + " a record with OrderID =" + details.OrderID + "</li>");
                if (action == "add")
                    $('#<%= OrdersGrid.ClientID %>').ejGrid("addRecord", details);
                else if (action == "beginedit")
                    $('#<%= OrdersGrid.ClientID %>').ejGrid("updateRecord", "OrderID", details);
                else
                    $('#<%= OrdersGrid.ClientID %>').ejGrid("deleteRecord", "OrderID", details);
            };
            $.connection.hub.start().done(function () {
                window.actionBegin = function (args) {
                    if (args.requestType == "save" || args.requestType == "delete")
                        window.signal.server.modify($("#userName").text(), (args.requestType == "delete" ? args.requestType : window.previousAction), args.data);
                    if (args.requestType != "delete")
                        window.previousAction = args.requestType;
                };
            });
        });
    </script>
</asp:Content>


