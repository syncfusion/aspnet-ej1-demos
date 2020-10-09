<%@ Page Title="Grid-Foreign Key Column-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to bind look up dataSource for a column in Syncfusion ASP.NET Web Forms DataGrid control." AutoEventWireup="true" CodeBehind="ForeignKeyColumn.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.ForeignKeyColumn" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Columns / Foreign Key Column</span>
</asp:Content>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True" AllowGrouping="True" AllowFiltering="True">
            <FilterSettings FilterType="Menu"></FilterSettings>
            <EditSettings AllowAdding="True" AllowDeleting="True" AllowEditing="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="True" TextAlign="Right" Width="90">
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
                <ej:Column Field="EmployeeID" HeaderText="Employee Name" ForeignKeyField="EmployeeID"
                    ForeignKeyValue="FirstName" TextAlign="Left" Width="90" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="75" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                </ej:Column>
                <ej:Column Field="ShipCity" HeaderText="Ship City" Width="80" />
                <ej:Column Field="ShipCountry" HeaderText="Ship Country" Width="80" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>

