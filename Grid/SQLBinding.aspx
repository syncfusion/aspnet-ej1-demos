<%@ Page Title="Grid-SQL Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to bind the SQl datasource control as datasource to the Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="SQLBinding.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.SQLBinding" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <span class="sampleName">Grid / Data Binding / SQL Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowSorting="True" OnServerEditRow="EditEvents_ServerEditRow"
             OnServerAddRow="EditEvents_ServerAddRow" OnServerDeleteRow="EditEvents_ServerDeleteRow">
            <ClientSideEvents ActionComplete="complete" EndAdd="endAdd" EndDelete="endDelete" EndEdit="endEdit" 
                RecordDoubleClick="doubleClick" />
            <Columns>
                <ej:Column Field="OrderID" HeaderText=" Order ID" IsPrimaryKey="True" TextAlign="Right" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" > 
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                    </ej:Column>
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Format="{0:C}" Width="90" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                      <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                       
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="City" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        
                    </ValidationRule>
                    </ej:Column>
                <ej:Column Field="ShipCountry" HeaderText="Country" Width="80" EditType="DropdownEdit">
                </ej:Column>
            </Columns>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
        </ej:Grid>

        <asp:SqlDataSource ID="SqlData" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>"
            SelectCommand="SELECT * FROM [Orders]"></asp:SqlDataSource>
                 </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
   <script type="text/javascript">
       function endAdd(args) {
           $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
       }
       function endDelete(args) {
           $('#<%= OrdersGrid.ClientID %>').ejWaitingPopup("show");
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

