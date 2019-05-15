<%@ Page Title="Grid-Custom Validation-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to show custom validation message for a column when saving an added or edited record in Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomValidation.aspx.cs" Inherits="WebSampleBrowser.Grid.CustomValidation" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src="../Scripts/jquery.validate.min.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Editing / Custom Validation</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="OrdersGrid" runat="server" AllowPaging="True">
            <Columns>
                <ej:Column Field="OrderID" HeaderText="Order ID" IsPrimaryKey="true" TextAlign="Right" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="CustomerID" HeaderText="Customer ID" Width="80">
                    <ValidationRule>
                        <ej:KeyValue Key="customRegex" Value="5" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="EmployeeID" HeaderText="Employee ID" TextAlign="Right" Width="80" EditType="DropdownEdit" />
                <ej:Column Field="Freight" HeaderText="Freight" TextAlign="Right" Width="80" Format="{0:C}" EditType="NumericEdit">
                    <NumericEditOptions DecimalPlaces="2"></NumericEditOptions>
                    <ValidationRule>
                        <ej:KeyValue Key="customCompare" Value="[0,1000]" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="ShipName" HeaderText="ShipName" Width="150" />
                <ej:Column Field="ShipCountry" HeaderText="ShipCountry" Width="90" EditType="DropdownEdit" />
            </Columns>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings>
            <ToolbarSettings ShowToolbar="True" ToolbarItems="add,edit,delete,update,cancel"></ToolbarSettings>
        </ej:Grid>
    </div>
</asp:Content>
<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">

    <script type="text/javascript">
        $(function () {
            $.validator.addMethod("customCompare", function (value, element, params) {
                return element.value > params[0] && element.value < params[1];
            }, "Freight value must be between 0 and 1000");

            $.validator.addMethod("customRegex", function (value, element, params) {
                if (element.value.length == params)
                    return true;
                return false;
            }, "Customer ID must be 5 characters");
        });
        
    </script>
</asp:Content>

