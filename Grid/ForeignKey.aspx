<%@ Page Title="Grid-ForeignKey Adaptor-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to perform actions such as filtering, sorting, searching, etc. on a foreign key column using the foreign key adaptor of Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ForeignKey.aspx.cs" Inherits="WebSampleBrowser.Grid.ForeignKey" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Adaptors /Foreignkey Adaptor</span>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">

    <ej:DataManager runat="server" ID="ForeignAdaptor"
        InsertURL="ForeignKey.aspx/ForeignKeyInsert"
        UpdateURL="ForeignKey.aspx/ForeignKeyUpdate"
        RemoveURL="ForeignKey.aspx/ForeignKeyDelete"
        Adaptor="remoteSaveAdaptor" />

    <ej:Grid runat="server" ID="ForeignKeyGrid" DataManagerID="ForeignAdaptor" AllowFiltering="True" AllowPaging="True">
        <EditSettings AllowAdding="true" AllowEditing="true" AllowDeleting="true" />
        <ToolbarSettings ShowToolbar="true" ToolbarItems="add,edit,delete,update,cancel" />
        <Columns>
            <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="90">
                <ValidationRule>
                    <ej:KeyValue Key="required" Value="true" />
                    <ej:KeyValue Key="number" Value="true" />
                </ValidationRule>
            </ej:Column>
            <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="120">
                <ValidationRule>
                    <ej:KeyValue Key="required" Value="true" />
                    <ej:KeyValue Key="minlength" Value="3" />
                </ValidationRule>
            </ej:Column>
            <%--field name given in foreignkey object + _ + foreignKeyValue--%>
            <ej:Column Field="EmployeeID_FirstName" HeaderText="First Name" EditType="DropdownEdit" Width="130" />
            <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" EditType="NumericEdit" Width="90" Format="{0:C2}" >
                <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
            </ej:Column>
            <ej:Column Field="ShipCity" HeaderText="Ship City" Width="100" />
            <ej:Column Field="Verified" HeaderText="Verified" Width="100" EditType="BooleanEdit" />
        </Columns>
        <ClientSideEvents Load="onLoad" />
    </ej:Grid>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/javascript">
        var foreignData = JSON.parse('<%= new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(this.foreignData)%>');;

        var foreignObj = [
            {
                dataSource: foreignData,
                foreignKeyField: "EmployeeID", //Property in the Grid's main dataSource
                field: "EmployeeID", //Property in foreignkey dataSource
                foreignKeyValue: "FirstName" //Property in foreignkey dataSource
            }
        ];

        function onLoad(args) {
            this.model.dataSource.adaptor = new ej.ForeignKeyAdaptor(foreignObj, "remoteSaveAdaptor");
        }
    </script>
</asp:Content>


