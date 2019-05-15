<%@ Page Title="Grid-Command Column-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to include CRUD action buttons as one of the columns in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CommandColumn.aspx.cs" Inherits="WebSampleBrowser.Grid.CommandColumn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Command Column</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" EnableAutoSaveOnSelectionChange="False" EnableRowHover="False" 
            OnServerEditRow="EditEvents_ServerEditRow" OnServerDeleteRow="EditEvents_ServerDeleteRow">
            <ClientSideEvents ActionComplete="complete" EndEdit="endEdit" EndDelete="endDelete" />
            <PageSettings PageSize="10"></PageSettings>
            <EditSettings AllowDeleting="True" AllowEditing="True" AllowEditOnDblClick="false"></EditSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75" />
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" EditType="NumericEdit" Width="90"/>
                <ej:Column Field="Freight" HeaderText="Freight" EditType="NumericEdit" TextAlign="Right" Width="75" Format="{0:C}" >
                <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>    
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="90" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="90" />
                <ej:Column HeaderText="Manage Column" IsUnbound="True" Width="130">
                    <Command>
                        <ej:Commands Type="edit">
                            <ButtonOptions Text="Edit"></ButtonOptions>
                        </ej:Commands>
                        <ej:Commands Type="delete">
                            <ButtonOptions Text="Delete"></ButtonOptions>
                        </ej:Commands>
                        <ej:Commands Type="save">
                            <ButtonOptions Text="Save"></ButtonOptions>
                        </ej:Commands>
                        <ej:Commands Type="cancel">
                            <ButtonOptions Text="Cancel"></ButtonOptions>
                        </ej:Commands>
                    </Command>
                </ej:Column>
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">        
    <script type="text/javascript">       
        function endDelete(args) {
            $("#OrdersGrid").ejWaitingPopup("show");
        }
        function endEdit(args) {
            $("#OrdersGrid").ejWaitingPopup("show");
        }
        function complete(args) {
            if (args.requestType == "refresh") {
                $("#OrdersGrid").ejWaitingPopup("hide");
            }
        }
    </script>
</asp:Content>

