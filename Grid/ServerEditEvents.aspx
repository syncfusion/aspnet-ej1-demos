<%@ Page Title="Grid-Edit Events-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains the basic functionalities of the Server Side Edit events that are available in the Syncfusion ASP.NET Web Forms DataGrid" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ServerEditEvents.aspx.cs" Inherits="WebSampleBrowser.Grid.ServerEditEvents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
     <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <span class="sampleName">Grid / Server Side Events / EditEvents</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" OnServerRecordDoubleClick="EditEvents_ServerRecordDoubleClick"
            OnServerEditRow="EditEvents_ServerEditRow" OnServerAddRow="EditEvents_ServerAddRow" OnServerDeleteRow="EditEvents_ServerDeleteRow">
            <ClientSideEvents ActionComplete="complete" EndAdd="endAdd" EndDelete="endDelete" EndEdit="endEdit" DataBound="onDataBound" />
            <EditSettings AllowEditing="True" AllowAdding="true" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75">
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
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="75" EditType="DropdownEdit" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="110" EditType="DropdownEdit" />
            </Columns>
        </ej:Grid>
                 </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="EventSection">
     <asp:UpdatePanel ID="UpdatePanel2" runat="server">
         <ContentTemplate>
    <div class="cols-prop-area event-tracer">
        <div>
            <div class="heading">
                <span>Event Trace</span>
            </div>
            <div class="prop-grid content">
                <div class="eventarea">
                    <div class="EventLog" id="EventLog">
                        <div id="serverEvent" class="sf-event-panel" runat="server">
                        </div>
                    </div>
                </div>
                <div class="evtbtn">
                    <ej:Button ID="Clear" runat="server" Type="Button" Text="Clear" OnClick="Clear_OnClick"></ej:Button>
                </div>
            </div>
        </div>
    </div>
                </ContentTemplate>
        </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function endAdd(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
        function endDelete(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
        }
        function endEdit(args) {
            $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
            localStorage.setItem("index", "null");
        }
        function onDataBound(args) {
            var gridObj = $('#<%= OrdersGrid.ClientID %>').data("ejGrid");
            index = localStorage.getItem("index");
            tr = gridObj.getContentTable().find("tr")[index];
            if (tr != undefined) {
                gridObj.startEdit($(tr));
                localStorage.setItem("index", "null");
            }
        }
        function complete(args) {
            if (args.requestType == "beginedit")
                localStorage.setItem("index", $('#<%= OrdersGrid.ClientID %>').find("tr.e-editedrow").index());            
        }
    </script>
</asp:Content>

